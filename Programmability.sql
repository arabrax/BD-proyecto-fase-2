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
GO

-- SP: Dashboard del Creador
CREATE PROCEDURE dbo.sp_dashboard_creador
    @idCreador INT,
    @fecha_inicio DATETIME,
    @fecha_fin DATETIME
AS
BEGIN
    --Evita mensajes molestos de "filas afectadas" en la consola para mayor velocidad
    SET NOCOUNT ON;

    -- ==========================================
    -- TABLA 1: Resumen de KPIs
    -- ==========================================
    SELECT 
        --Total Ganado: Suma de facturas en el rango de fechas
        (SELECT ISNULL(SUM(f.monto_total), 0)
         FROM Factura f
         INNER JOIN Suscripcion s ON f.idSuscripcion = s.id
         INNER JOIN NivelSuscripcion ns ON s.idNivel = ns.id
         WHERE ns.idCreador = @idCreador 
           AND f.fecha_emision BETWEEN @fecha_inicio AND @fecha_fin) AS [Total Ganado],
           
        --Total Nuevos Subs: Suscripciones iniciadas en el rango de fechas
        (SELECT COUNT(s.id)
         FROM Suscripcion s
         INNER JOIN NivelSuscripcion ns ON s.idNivel = ns.id
         WHERE ns.idCreador = @idCreador 
           AND s.fecha_inicio BETWEEN @fecha_inicio AND @fecha_fin) AS [Total Nuevos Subs];

    -- ==========================================
    -- TABLA 2: 5 Fans más activos (Comentarios + Likes)
    -- ==========================================
    --Usamos un CTE con UNION ALL para juntar todo el rastro de actividad
    WITH Interacciones AS (
        --Buscamos comentarios en el rango
        SELECT c.idUsuario
        FROM Comentario c
        INNER JOIN Publicacion p ON c.idPublicacion = p.id
        WHERE p.idCreador = @idCreador AND c.fecha BETWEEN @fecha_inicio AND @fecha_fin
        
        UNION ALL
        
        --Buscamos reacciones en el rango
        SELECT urp.idUsuario
        FROM UsuarioReaccionPublicacion urp
        INNER JOIN Publicacion p ON urp.idPublicacion = p.id
        WHERE p.idCreador = @idCreador AND urp.fecha_reaccion BETWEEN @fecha_inicio AND @fecha_fin
    )
    SELECT TOP 5
        u.nickname AS [Fan Destacado],
        COUNT(i.idUsuario) AS [Total Interacciones]
    FROM Interacciones i
    INNER JOIN Usuario u ON i.idUsuario = u.id
    GROUP BY u.nickname
    ORDER BY [Total Interacciones] DESC;

    -- ==========================================
    -- TABLA 3: Publicación con mejor rendimiento en el periodo
    -- ==========================================
    --Calculamos las interacciones que ocurrieron ESTRICTAMENTE en ese rango de fechas
    WITH ReaccionesPeriodo AS (
        SELECT idPublicacion, COUNT(idUsuario) AS TotalReacciones
        FROM UsuarioReaccionPublicacion
        WHERE fecha_reaccion BETWEEN @fecha_inicio AND @fecha_fin
        GROUP BY idPublicacion
    ),
    ComentariosPeriodo AS (
        SELECT idPublicacion, COUNT(id) AS TotalComentarios
        FROM Comentario
        WHERE fecha BETWEEN @fecha_inicio AND @fecha_fin
        GROUP BY idPublicacion
    )
    SELECT TOP 1
        p.titulo AS [Título Publicación],
        p.tipo_contenido AS [Tipo],
        --Reutilizamos la fórmula de viralidad del profesor: (Reacciones * 1.5) + (Comentarios * 3)
        (ISNULL(r.TotalReacciones, 0) * 1.5) + (ISNULL(c.TotalComentarios, 0) * 3.0) AS [Puntaje Rendimiento]
    FROM Publicacion p
    LEFT JOIN ReaccionesPeriodo r ON p.id = r.idPublicacion
    LEFT JOIN ComentariosPeriodo c ON p.id = c.idPublicacion
    WHERE p.idCreador = @idCreador
      --Filtramos para que solo evalúe posts que sí tuvieron movimiento en esos días
      AND (r.TotalReacciones > 0 OR c.TotalComentarios > 0)
    ORDER BY [Puntaje Rendimiento] DESC;

END;
GO

-- 3. sp_publicar_con_etiquetas: Recibe los datos de una publicación (título, tipo, etc.) y una cadena de texto con las etiquetas
-- separadas por comas (ej: "Gaming,RPG,Retro").
--     ○ Debe insertar la publicación en la tabla correspondiente (Video, Texto, etc.).
--     ○ Debe procesar las etiquetas: buscar si existen en la tabla Etiqueta (si no, crearlas) e insertar las relaciones en
--     PublicacionEtiqueta.
--     ○ Todo debe ocurrir dentro de una transacción atómica.

CREATE OR ALTER PROCEDURE sp_publicar_con_etiquetas
    @idCreador INT,
    @titulo VARCHAR(255),
    @es_publica BIT,
    @tipo_contenido VARCHAR(10),
    @etiquetas VARCHAR(MAX), -- Cadena de etiquetas (p.ej: "Gaming,RPG,Retro")
    
    -- Parámetros específicos (pueden ser nulos dependiendo del tipo de contenido elegido)
    @video_duracion_seg INT = NULL,
    @video_resolucion VARCHAR(10) = NULL,
    @video_url VARCHAR(MAX) = NULL,
    
    @texto_html VARCHAR(MAX) = NULL,
    @texto_resumen VARCHAR(500) = NULL,
    
    @imagen_ancho INT = NULL,
    @imagen_alto INT = NULL,
    @imagen_formato VARCHAR(20) = NULL,
    @imagen_alt VARCHAR(255) = NULL,
    @imagen_url VARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Declaramos variables internas a usar durante las transacciones
    DECLARE @idPublicacionInsertada INT;
    DECLARE @nombreEtiquetaActual VARCHAR(50);
    DECLARE @idEtiquetaActual INT;

    -- Inicio de Transacción Atómica
    BEGIN TRY
        BEGIN TRANSACTION;

        -- 1. Insertamos en la tabla padre: Publicacion
        INSERT INTO Publicacion (idCreador, titulo, es_publica, tipo_contenido, fecha_publicacion)
        VALUES (@idCreador, @titulo, @es_publica, @tipo_contenido, GETDATE());

        -- Obtenemos el ID de la publicación recién creada usando SCOPE_IDENTITY()
        SET @idPublicacionInsertada = SCOPE_IDENTITY();

        -- 2. Insertamos en las tablas hijas según el tipo de contenido
        IF @tipo_contenido = 'VIDEO'
        BEGIN
            INSERT INTO Video (idPublicacion, duracion_seg, resolucion, url_stream)
            VALUES (@idPublicacionInsertada, @video_duracion_seg, @video_resolucion, @video_url);
        END
        ELSE IF @tipo_contenido = 'TEXTO'
        BEGIN
            INSERT INTO Texto (idPublicacion, contenido_html, resumen_gratuito)
            VALUES (@idPublicacionInsertada, @texto_html, @texto_resumen);
        END
        ELSE IF @tipo_contenido = 'IMAGEN'
        BEGIN
            INSERT INTO Imagen (idPublicacion, ancho, alto, formato, alt_text, url_imagen)
            VALUES (@idPublicacionInsertada, @imagen_ancho, @imagen_alto, @imagen_formato, @imagen_alt, @imagen_url);
        END

        -- 3. Procesamiento de la cadena de Etiquetas divididas por comas
        IF LTRIM(RTRIM(@etiquetas)) <> ''
        BEGIN
            -- Se usa STRING_SPLIT (disponible en SQL Server 2016+) para convertir el string en filas
            -- Usamos un cursor para iterar por cada etiqueta de la lista
            DECLARE cur_Etiquetas CURSOR FOR 
            SELECT LTRIM(RTRIM(value)) FROM STRING_SPLIT(@etiquetas, ',');

            OPEN cur_Etiquetas;
            FETCH NEXT FROM cur_Etiquetas INTO @nombreEtiquetaActual;

            WHILE @@FETCH_STATUS = 0
            BEGIN
                -- Ignoramos etiquetas vacías que el usuario pudo haber dejado como p.ej "Gaming,,Retro"
                IF @nombreEtiquetaActual <> ''
                BEGIN
                    -- Reseteamos el ID a nulo por seguridad en el loop
                    SET @idEtiquetaActual = NULL;

                    -- Buscamos a ver si esta etiqueta ya existe en el catálogo general
                    SELECT @idEtiquetaActual = id FROM Etiqueta WHERE nombre = @nombreEtiquetaActual;

                    -- Si la etiqueta No existe (es la primera vez que la vemos), la creamos
                    IF @idEtiquetaActual IS NULL
                    BEGIN
                        INSERT INTO Etiqueta (nombre) VALUES (@nombreEtiquetaActual);
                        SET @idEtiquetaActual = SCOPE_IDENTITY();
                    END

                    -- Finalmente, amarramos la Publicación con la Etiqueta (que ya existía de antes o es nueva)
                    -- Validamos que no se intente insertar la misma etiqueta dos veces en un mismo post
                    IF NOT EXISTS (SELECT 1 FROM PublicacionEtiqueta WHERE idPublicacion = @idPublicacionInsertada AND idEtiqueta = @idEtiquetaActual)
                    BEGIN
                        INSERT INTO PublicacionEtiqueta (idPublicacion, idEtiqueta) 
                        VALUES (@idPublicacionInsertada, @idEtiquetaActual);
                    END
                END

                -- Siguiente palabra en la lista
                FETCH NEXT FROM cur_Etiquetas INTO @nombreEtiquetaActual;
            END

            -- Limpieza del Cursor de memoria
            CLOSE cur_Etiquetas;
            DEALLOCATE cur_Etiquetas;
        END

        -- Si no hubo ningún problema, el código llega hasta aquí para comprometer la transacción
        COMMIT TRANSACTION;

    END TRY
    BEGIN CATCH
        -- Si sucede CUALQUIER error en los pasos anteriores, se cancelan las inserciones de las 4 tablas a la vez. (Rolbback)
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        -- Lanzamos el error original pa' que el usuario lo vea
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;

GO;

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
