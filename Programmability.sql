-- A. Procedimientos Almacenados (Stored Procedures o SPs)

-- 1. sp_crear_suscripcion: Recibe idUsuario, idNivel y idMetodoPago.
--     ○ Debe validar que el usuario no tenga ya una suscripción activa con ese creador.
--     ○ Debe insertar la suscripción con estado 'Activa' y precio_pactado igual al precio actual del nivel.
--     ○ Debe generar automáticamente la primera factura asociada.
--     ○ Manejar transacciones (BEGIN TRAN, COMMIT, ROLLBACK) para asegurar la integridad.

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

-- 4. sp_generar_factura_pago: Recibe idSuscripcion.
--     ○ Este procedimiento simula el ciclo de facturación mensual o renovación.
--     ○ Debe calcular los montos: El sub_total. El impuesto se calcula invocando a la función fn_calcular_impuesto. El total es la
--     suma de ambos.
--     ○ Debe generar el codigo_transaccion concatenando (separando con un guión cada cosa):
--     La fecha actual (formato YYYYMMDD) + ID Usuario + ID Suscripción + ID Nivel + ID Creador. Ej: 20260205-105-88-2-15
--     ○ Debe insertar el registro en la tabla Factura con la fecha y hora del sistema.

-- B. Funciones (UDF)

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

-- 2. Protección de Menores (NSFW): Antes de insertar una nueva Suscripcion, verificar si el creador destino tiene marcado es_nsfw = 1.
-- Si es así, verificar la fecha_nacimiento del usuario suscriptor. Si el usuario es menor de 18 años, cancelar la transacción y
-- levantar un error "Contenido restringido por edad".