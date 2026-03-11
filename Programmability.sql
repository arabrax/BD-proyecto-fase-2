-- A. Procedimientos Almacenados (Stored Procedures o SPs)

-- 4. sp_generar_factura_pago: Recibe idSuscripcion.
--     ○ Este procedimiento simula el ciclo de facturación mensual o renovación.
--     ○ Debe calcular los montos: El sub_total. El impuesto se calcula invocando a la función fn_calcular_impuesto. El total es la
--     suma de ambos.
--     ○ Debe generar el codigo_transaccion concatenando (separando con un guión cada cosa):
--     La fecha actual (formato YYYYMMDD) + ID Usuario + ID Suscripción + ID Nivel + ID Creador. Ej: 20260205-105-88-2-15
--     ○ Debe insertar el registro en la tabla Factura con la fecha y hora del sistema.

CREATE OR ALTER PROCEDURE sp_generar_factura_pago
    @idSuscripcion int
AS
BEGIN

    INSERT INTO Factura (idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (
        @idSuscripcion,
        CONCAT( -- Codigo Transaccion
            CONVERT(char(10), CURRENT_DATE, 112)), '-', -- 112: Estándar ISO para fecha en formato YYYYMMDD
            (SELECT idUsuario FROM Suscripcion WHERE @idSuscripcion = id), '-',
            (SELECT id FROM Suscripcion WHERE @idSuscripcion = id), '-',
            (SELECT idNivel FROM Suscripcion WHERE @idSuscripcion = id), '-',
            (SELECT ns.idCreador FROM Suscripcion s LEFT JOIN NivelSuscripcion ns ON s.idNivel = ns.id WHERE @idSuscripcion = id),
        GETDATE(),
        (SELECT precio_pactado FROM Suscripcion WHERE @idSuscripcion = id),
        dbo.fn_calcular_impuesto((SELECT precio_pactado FROM Suscripcion WHERE @idSuscripcion = id)),
        (SELECT precio_pactado FROM Suscripcion WHERE @idSuscripcion = id)+dbo.fn_calcular_impuesto((SELECT precio_pactado FROM Suscripcion WHERE @idSuscripcion = id))
    )

    -- 5. NivelSuscripcion (id, idCreador, nombre, descripcion, precio_actual, esta_activo, orden)
    -- 6. Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado)
    -- 	○ Estados posibles: 'Activa', 'Cancelada', 'Vencida'.
-- 7. Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total)
END;

GO;

-- 1. sp_crear_suscripcion: Recibe idUsuario, idNivel y idMetodoPago.
--     ○ Debe validar que el usuario no tenga ya una suscripción activa con ese creador.
--     ○ Debe insertar la suscripción con estado 'Activa' y precio_pactado igual al precio actual del nivel.
--     ○ Debe generar automáticamente la primera factura asociada.
--     ○ Manejar transacciones (BEGIN TRAN, COMMIT, ROLLBACK) para asegurar la integridad.


CREATE OR ALTER PROCEDURE sp_crear_suscripcion
    @idUsuario INT,
    @idNivel INT,
    @idMetodoPago INT
AS
BEGIN

    -- Revisión de si existe una suscripción previa del usuario a ese creador
    IF EXISTS (
        SELECT *
        FROM Suscripcion s
        LEFT JOIN NivelSuscripcion AS ns ON s.idNivel = ns.id
        WHERE s.idUsuario = @idUsuario
            AND (IS NOT NULL (SELECT idCreador FROM NivelSuscripcion WHERE id = @idNivel))
        )
    END; -- En caso de haber, el procedimiento termina

    -- Inserción de la suscripción. Para la fecha de renovación, se toma la actual + 25 días.
        -- Para fecha de fin, es al mes exacto.
    INSERT INTO Suscripcion (idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado)
    VALUES
        (@idUsuario, @idNivel, CURRENT_DATE, DATEADD(DAY, 25, CURRENT_DATE), DATEADD(MONTH, 1, CURRENT_DATE), 'Activa', (SELECT precio_actual FROM NivelSuscripcion WHERE id = @idNivel));
    
    -- Generación de la primera factura a través del Stored Procedure 4.
    sp_generar_factura_pago(SELECT idSuscripcion FROM SUSCRIPCION WHERE @idUsuario = idUsuario AND @idNivel = idNivel);

END;
GO;


-- 2. sp_dashboard_creador: Recibe un idCreador y un rango de fechas. Devuelve tres resultados:
--     ○ Tabla 1: Resumen de KPIs (Total Ganado, Total Nuevos Subs).
--     ○ Tabla 2: Listado de sus 5 fans más activos (más comentarios/likes).
--     ○ Tabla 3: Publicación con mejor rendimiento en el periodo.

-- 3. sp_publicar_con_etiquetas: Recibe los datos de una publicación (título, tipo, etc.) y una cadena de texto con las etiquetas
-- separadas por comas (ej: "Gaming,RPG,Retro").
--     ○ Debe insertar la publicación en la tabla correspondiente (Video, Texto, etc.).
--     ○ Debe procesar las etiquetas: buscar si existen en la tabla Etiqueta (si no, crearlas) e insertar las relaciones en
--     PublicacionEtiqueta.
--     ○ Todo debe ocurrir dentro de una transacción atómica.

-- B. Funciones (UDF)

GO
-- 1. fn_calcular_impuesto(monto): Asumimos 16%
CREATE FUNCTION dbo.fn_calcular_impuesto (@monto DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @impuesto DECIMAL(10,2);
    -- 16% se multiplica por 0.16
    SET @impuesto = @monto * 0.16;
    RETURN ISNULL(@impuesto, 0);
END;
GO

-- 2. fn_clasificar_ingreso(monto): Diamante, Oro o Plata
CREATE FUNCTION dbo.fn_clasificar_ingreso (@monto DECIMAL(10,2))
RETURNS NVARCHAR(50)
AS
BEGIN
    DECLARE @clasificacion NVARCHAR(50);

    IF @monto > 1000
        SET @clasificacion = 'Diamante';
    ELSE IF @monto > 500
        SET @clasificacion = 'Oro';
    ELSE
        SET @clasificacion = 'Plata';

    RETURN @clasificacion;
END;
GO

-- 3. fn_calcular_reputacion(idCreador): Fórmula con tope de 100
CREATE FUNCTION dbo.fn_calcular_reputacion (@idCreador INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @suscriptorTotal INT = 0;
    DECLARE @reaccionesTotalUltMes INT = 0;
    DECLARE @antiguedadMeses INT = 0;
    DECLARE @reputacion DECIMAL(10,2) = 0;

    -- Total Suscriptores (Contamos IDs distintos)
    SELECT @suscriptorTotal = COUNT(DISTINCT s.idUsuario)
    FROM NivelSuscripcion ns
    INNER JOIN Suscripcion s ON ns.id = s.idNivel
    WHERE ns.idCreador = @idCreador AND s.estado = 'Activa';

    -- Total Reacciones Último Mes
    SELECT @reaccionesTotalUltMes = COUNT(urp.idUsuario)
    FROM Publicacion p
    INNER JOIN UsuarioReaccionPublicacion urp ON p.id = urp.idPublicacion
    WHERE p.idCreador = @idCreador 
      AND DATEDIFF(MONTH, urp.fecha_reaccion, GETDATE()) = 0;

    -- Antigüedad Meses
    SELECT @antiguedadMeses = DATEDIFF(MONTH, u.fecha_registro, GETDATE())
    FROM Creador c
    INNER JOIN Usuario u ON c.idUsuario = u.id
    WHERE c.idUsuario = @idCreador;

    -- Fórmula matemática
    SET @reputacion = (@suscriptorTotal * 0.5) + (@reaccionesTotalUltMes * 0.1) + (@antiguedadMeses * 2.0);

    -- Tope máximo de 100 puntos
    IF @reputacion > 100.00
        SET @reputacion = 100.00;

    RETURN ISNULL(@reputacion, 0);
END;
GO

-- C. Triggers

-- 1. Auditoría de Precios (Safety): Al actualizar el precio de un NivelSuscripcion, impedir que el cambio sea mayor al 50% del
-- precio anterior (para evitar errores de dedo o fraudes). Si el cambio es brusco, cancelar la operación y levantar un error.
GO

CREATE TRIGGER trg_Auditoria_Precios
ON NivelSuscripcion
AFTER UPDATE
AS
BEGIN
    -- Si no se actualizó ninguna fila, no hace nada
    IF @@ROWCOUNT = 0 RETURN;

    -- Solo dispara la lógica si se intentó modificar la columna precio_actual
    IF UPDATE(precio_actual)
    BEGIN
        -- Verifica si existe algún registro donde la diferencia de precio supere el 50%
        IF EXISTS (
            SELECT 1
            FROM inserted i
            INNER JOIN deleted d ON i.id = d.id
            -- Matemática: El valor absoluto de (Nuevo - Viejo) es mayor que (Viejo * 0.50)
            WHERE ABS(i.precio_actual - d.precio_actual) > (d.precio_actual * 0.50)
        )
        BEGIN
            -- Levanta el error y cancela la transacción
            RAISERROR('El cambio de precio no puede ser mayor al 50%% del precio anterior para evitar fraudes.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END
    END
END;

-- 2. Protección de Menores (NSFW): Antes de insertar una nueva Suscripcion, verificar si el creador destino tiene marcado es_nsfw = 1.
-- Si es así, verificar la fecha_nacimiento del usuario suscriptor. Si el usuario es menor de 18 años, cancelar la transacción y
-- levantar un error "Contenido restringido por edad".
GO

CREATE TRIGGER trg_Proteccion_Menores
ON Suscripcion
AFTER INSERT
AS
BEGIN
    -- Si no se insertó ninguna fila, no hace nada
    IF @@ROWCOUNT = 0 RETURN;

    -- Verifica si el usuario que intenta suscribirse es menor de 18 y el creador es NSFW
    IF EXISTS (
        SELECT 1
        FROM inserted i
        INNER JOIN NivelSuscripcion ns ON i.idNivel = ns.id
        INNER JOIN Creador c ON ns.idCreador = c.idUsuario
        INNER JOIN Usuario u ON i.idUsuario = u.id
        WHERE c.es_nsfw = 1
          -- Lógica estricta de edad: Si le sumas 18 años a su fecha de nacimiento y esa fecha 
          -- aún es mayor al día de hoy, significa que todavía no ha cumplido los 18.
          AND DATEADD(YEAR, 18, u.fecha_nacimiento) > GETDATE()
    )
    BEGIN
        -- Levanta el error exacto que pide el profesor y cancela la inserción
        RAISERROR('Contenido restringido por edad.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;
GO
