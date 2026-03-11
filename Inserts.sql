-- No se permitirán datos "lorem ipsum" sin sentido. Dado que se permite e incentiva el uso de herramientas de IA para la
-- generación de datos, se exige un volumen suficiente para probar consultas complejas.

-- La materia suministrará un script SQL (Lookups.sql) con la carga inicial (seed) de las tablas Categoria y TipoReaccion.
-- Ustedes deben respetar estos datos y basar sus inserciones sobre ellos.

-- A. Usuarios: Al menos 250 usuarios. De estos, el 90% son solo Fans y el 10% son también Creadores.

-- B. Creadores: Mínimo 20 creadores distribuidos en todas las categorías suministradas. Al menos 5 deben estar marcados como NSFW.

-- C. Niveles: Cada creador debe tener entre 1 y 3 niveles de suscripción.

-- D. Contenido:
    -- * Mínimo 800 publicaciones totales.
    -- * Deben estar distribuidas equitativamente entre los 3 tipos.
    -- * Al menos el 30% del contenido debe ser exclusivo para suscriptores.

-- E. Suscripciones: Mínimo 500 suscripciones (mezcla de históricas y actuales). Es vital que existan usuarios con múltiples
-- suscripciones simultáneas para probar las consultas de intersección.

-- F. Interacciones:
    -- * Mínimo 1.500 reacciones variadas.
    -- * Mínimo 1.000 comentarios, incluyendo al menos 100 hilos de conversación.

-- G. Facturación: Generar facturas coherentes para todas las suscripciones activas y pasadas.

-- H. Etiquetas: Generar e insertar al menos 50 etiquetas distintas y asociarlas aleatoriamente a las publicaciones.


-- =============================================================================
-- PROYECTO FANHUB - FASE 2
-- BLOQUE 1: USUARIOS, CREADORES, NIVELES Y MÉTODOS DE PAGO
-- =============================================================================

USE [NombreDeSuBaseDeDatos]; -- CAMBIAR POR EL NOMBRE DE SU BD
GO

-- 1. INSERTAR 25 CREADORES (IDs 1 al 25)
SET IDENTITY_INSERT Usuario ON;

-- Creadores Variados (Mezcla de Generaciones y Categorías)
INSERT INTO Usuario (id, email, password_hash, nickname, fecha_registro, fecha_nacimiento, pais, esta_activo) VALUES
(1, 'tech_guru@gmail.com', 'hash_123', 'TechMaster', '2025-03-15', '1985-05-20', 'Venezuela', 1),
(2, 'fitness_val@outlook.com', 'hash_456', 'ValFit', '2025-03-20', '1998-11-02', 'Venezuela', 1),
(3, 'gamer_pro@fanhub.com', 'hash_789', 'ZeroDark', '2025-04-01', '2005-02-15', 'Colombia', 1),
(4, 'chef_marina@yahoo.com', 'hash_012', 'MarinaCocina', '2025-04-10', '1975-08-30', 'España', 1),
(5, 'art_digital@gmail.com', 'hash_345', 'PixelArt', '2025-04-15', '2002-12-12', 'Venezuela', 1),
-- 5 Creadores NSFW (Requisito: Mínimo 5 y mayores de 18 años)
(6, 'nsfw_model1@fanhub.com', 'hash_ns1', 'MidnightRose', '2025-05-01', '1995-01-01', 'Venezuela', 1),
(7, 'dark_vibes@fanhub.com', 'hash_ns2', 'ShadowV', '2025-05-05', '1990-06-15', 'México', 1),
(8, 'exclusive_cat@gmail.com', 'hash_ns3', 'WildCat', '2025-05-10', '1988-03-22', 'Venezuela', 1),
(9, 'noir_content@outlook.com', 'hash_ns4', 'NoirModel', '2025-05-15', '2000-09-30', 'Argentina', 1),
(10, 'spicy_dev@gmail.com', 'hash_ns5', 'HotCode', '2025-05-20', '1992-04-18', 'Venezuela', 1);

-- Generar el resto de los 25 creadores (IDs 11-25) con un bucle para rapidez
DECLARE @i INT = 11;
WHILE @i <= 25
BEGIN
    INSERT INTO Usuario (id, email, password_hash, nickname, fecha_registro, fecha_nacimiento, pais, esta_activo)
    VALUES (@i, 'creador' + CAST(@i AS VARCHAR) + '@fanhub.com', 'hash_gen', 'Creador' + CAST(@i AS VARCHAR), 
            DATEADD(DAY, @i, '2025-03-10'), DATEADD(YEAR, -25, GETDATE()), 'Venezuela', 1);
    SET @i = @i + 1;
END

-- 2. INSERTAR 225 FANS (IDs 26 al 250)
DECLARE @j INT = 26;
WHILE @j <= 250
BEGIN
    DECLARE @nacimiento DATE = CASE 
        WHEN @j % 3 = 0 THEN '1978-01-01' -- Gen X
        WHEN @j % 3 = 1 THEN '1992-05-15' -- Millennial
        ELSE '2004-10-20' END;           -- Gen Z
        
    INSERT INTO Usuario (id, email, password_hash, nickname, fecha_registro, fecha_nacimiento, pais, esta_activo)
    VALUES (@j, 'fan' + CAST(@j AS VARCHAR) + '@gmail.com', 'pwd_fan', 'UserFan_' + CAST(@j AS VARCHAR), 
            DATEADD(DAY, @j % 300, '2025-03-10'), @nacimiento, 
            CASE WHEN @j % 5 = 0 THEN 'Colombia' ELSE 'Venezuela' END, 1);
    SET @j = @j + 1;
END

SET IDENTITY_INSERT Usuario OFF;

-- 3. VINCULAR CREADORES (Tabla Creador)
-- Usando bancos venezolanos y distribuyendo categorías de Lookups.sql
INSERT INTO Creador (idUsuario, biografia, banco_nombre, banco_cuenta, es_nsfw, idCategoria) VALUES
(1, 'Tutoriales de SQL y Python', 'Banesco', '01340001000100012345', 0, 3), -- Tecnología
(2, 'Entrena conmigo a diario', 'Banco de Venezuela', '01020002000200067890', 0, 2), -- Fitness
(3, 'Jugando RPGs clásicos', 'Mercantil', '01050003000300011223', 0, 1), -- Gaming
(4, 'Recetas criollas y gourmet', 'BBVA Provincial', '01080004000400044556', 0, 6), -- Cocina
(5, 'Ilustraciones y Speedpaints', 'Bancamiga', '01720005000500077889', 0, 4), -- Arte Digital
(6, 'Contenido exclusivo nocturno', 'Banesco', '01340001000100099999', 1, 9), -- ASMR (NSFW)
(7, 'Sesiones privadas', 'Banco de Venezuela', '01020002000200088888', 1, 22), -- Fotografía (NSFW)
(8, 'Vlogs sin censura', 'Mercantil', '01050003000300077777', 1, 7), -- Vlogs (NSFW)
(9, 'Modelaje alternativo', 'Bancamiga', '01720005000500066666', 1, 22), -- Fotografía (NSFW)
(10, 'Programación y algo más', 'BBVA Provincial', '01080004000400055555', 1, 3); -- Tecnología (NSFW)

-- Insertar el resto de creadores (11-25) mapeados a categorías restantes
DECLARE @c INT = 11;
WHILE @c <= 25
BEGIN
    INSERT INTO Creador (idUsuario, biografia, banco_nombre, banco_cuenta, es_nsfw, idCategoria)
    VALUES (@c, 'Biografía del creador ' + CAST(@c AS VARCHAR), 'Banesco', '0134' + CAST(1000000000 + @c AS VARCHAR), 0, @c);
    SET @c = @c + 1;
END

-- 4. NIVELES DE SUSCRIPCIÓN (2 por creador para balancear)
SET IDENTITY_INSERT NivelSuscripcion ON;

DECLARE @n INT = 1;
DECLARE @idCr INT = 1;
WHILE @idCr <= 25
BEGIN
    -- Nivel Básico
    INSERT INTO NivelSuscripcion (id, idCreador, nombre, descripcion, precio_actual, esta_activo, orden)
    VALUES (@n, @idCr, 'Bronce', 'Acceso básico', 5.00, 1, 1);
    SET @n = @n + 1;
    -- Nivel VIP
    INSERT INTO NivelSuscripcion (id, idCreador, nombre, descripcion, precio_actual, esta_activo, orden)
    VALUES (@n, @idCr, 'Oro', 'Contenido exclusivo y chat', 25.00, 1, 2);
    SET @n = @n + 1;
    
    SET @idCr = @idCr + 1;
END
SET IDENTITY_INSERT NivelSuscripcion OFF;

-- 5. MÉTODOS DE PAGO (Asignar al menos uno a los primeros 150 usuarios para que puedan suscribirse)
SET IDENTITY_INSERT MetodoPago ON;
DECLARE @m INT = 1;
WHILE @m <= 150
BEGIN
    INSERT INTO MetodoPago (id, idUsuario, ultimos_4_digitos, marca, titular, fecha_expiracion, es_predeterminado)
    VALUES (@m, @m, '444' + CAST(@m % 10 AS VARCHAR), 
            CASE WHEN @m % 2 = 0 THEN 'VISA' ELSE 'MASTERCARD' END, 
            'Titular User ' + CAST(@m AS VARCHAR), '2028-12-01', 1);
    SET @m = @m + 1;
END
SET IDENTITY_INSERT MetodoPago OFF;

PRINT 'Bloque 1 cargado: 250 Usuarios (25 Creadores), Niveles y Métodos de Pago listos.'; -- control generado por la ia

-- =============================================================================
-- PROYECTO FANHUB - FASE 2
-- BLOQUE 2: ETIQUETAS Y 800 PUBLICACIONES (VIDEO, TEXTO, IMAGEN)
-- =============================================================================

USE [NombreDeSuBaseDeDatos];
GO

-- 1. INSERTAR 50 ETIQUETAS (Requisito: Mínimo 50)
SET IDENTITY_INSERT Etiqueta ON;
INSERT INTO Etiqueta (id, nombre) VALUES
(1, 'Gaming'), (2, 'SQL'), (3, 'Fitness'), (4, 'UCV'), (5, 'Caracas'),
(6, 'Programacion'), (7, 'Cocina'), (8, 'Vlog'), (9, 'Tutorial'), (10, 'Review'),
(11, 'Tecnologia'), (12, 'Deportes'), (13, 'Musica'), (14, 'Arte'), (15, 'Moda'),
(16, 'Viajes'), (17, 'Educacion'), (18, 'Finanzas'), (19, 'Mascotas'), (20, 'Anime'),
(21, 'React'), (22, 'Database Design'), (23, 'Cripto'), (24, 'Salud'), (25, 'Comedia'),
(26, 'ASMR'), (27, 'DIY'), (28, 'Fotografia'), (29, 'Cine'), (30, 'Literatura'),
(31, 'Noticias'), (32, 'Politica'), (33, 'Esoterismo'), (34, 'Cosplay'), (35, 'Modelaje'),
(36, 'Ciclismo'), (37, 'Yoga'), (38, 'Recetas'), (39, 'Python'), (40, 'JavaScript'),
(41, 'Hardware'), (42, 'E-Sports'), (43, 'Entrenamiento'), (44, 'Nutricion'), (45, 'Ventas'),
(46, 'Marketing'), (47, 'Inversion'), (48, 'Bienestar'), (49, 'Humor'), (50, 'Relajacion');
SET IDENTITY_INSERT Etiqueta OFF;

-- 2. GENERAR 800 PUBLICACIONES
PRINT 'Iniciando inserción de 800 publicaciones...';

SET IDENTITY_INSERT Publicacion ON;
DECLARE @p INT = 1;
DECLARE @tipo_actual VARCHAR(10);
DECLARE @es_privada BIT;
DECLARE @id_creador_p INT;
DECLARE @fecha_p DATETIME;

WHILE @p <= 800
BEGIN
    -- Rotar tipo de contenido para asegurar equidad (1/3 cada uno)
    SET @tipo_actual = CASE 
        WHEN @p % 3 = 1 THEN 'VIDEO' 
        WHEN @p % 3 = 2 THEN 'TEXTO' 
        ELSE 'IMAGEN' END;

    -- Al menos 30% exclusivo (es_publica = 0 si es divisible por 3)
    IF (@p % 3 = 0) SET @es_privada = 0; -- Privada
    ELSE SET @es_privada = 1; -- Pública

    -- Asignar a uno de los 25 creadores
    SET @id_creador_p = (@p % 25) + 1;
    
    -- Fecha aleatoria en el último año
    SET @fecha_p = DATEADD(MINUTE, @p * 10, '2025-03-10');

    INSERT INTO Publicacion (id, idCreador, titulo, fecha_publicacion, es_publica, tipo_contenido)
    VALUES (@p, @id_creador_p, 'Publicacion Nro ' + CAST(@p AS VARCHAR) + ' - ' + @tipo_actual, @fecha_p, @es_privada, @tipo_actual);

    -- Insertar en la tabla específica según el tipo
    IF @tipo_actual = 'VIDEO'
    BEGIN
        INSERT INTO Video (idPublicacion, duracion_seg, resolucion, url_stream)
        VALUES (@p, 300 + (@p % 600), 
                CASE WHEN @p % 4 = 0 THEN '4K' WHEN @p % 4 = 1 THEN '1080p' ELSE '720p' END, 
                'https://stream.fanhub.com/v/' + CAST(@p AS VARCHAR));
    END
    ELSE IF @tipo_actual = 'TEXTO'
    BEGIN
        INSERT INTO Texto (idPublicacion, contenido_html, resumen_gratuito)
        VALUES (@p, '<p>Este es el contenido detallado de la publicación ' + CAST(@p AS VARCHAR) + '...</p>', 
                'Resumen breve de la publicación ' + CAST(@p AS VARCHAR));
    END
    ELSE IF @tipo_actual = 'IMAGEN'
    BEGIN
        INSERT INTO Imagen (idPublicacion, ancho, alto, formato, alt_text, url_imagen)
        VALUES (@p, 1920, 1080, 'JPG', 'Imagen descriptiva ' + CAST(@p AS VARCHAR), 'https://cdn.fanhub.com/img/' + CAST(@p AS VARCHAR) + '.jpg');
    END

    -- 3. ASOCIAR ETIQUETAS (Relacionar cada post con 1 o 2 etiquetas)
    INSERT INTO PublicacionEtiqueta (idPublicacion, idEtiqueta)
    VALUES (@p, (@p % 50) + 1);
    
    IF (@p % 5 = 0) -- Algunas publicaciones tienen una segunda etiqueta
    BEGIN
        INSERT INTO PublicacionEtiqueta (idPublicacion, idEtiqueta)
        VALUES (@p, ((@p + 5) % 50) + 1);
    END

    SET @p = @p + 1;
END
SET IDENTITY_INSERT Publicacion OFF;

PRINT 'Bloque 2 cargado: 50 Etiquetas y 800 Publicaciones distribuidas correctamente.';  -- control generado por la ia

-- =============================================================================
-- PROYECTO FANHUB - FASE 2
-- BLOQUE 3: SUSCRIPCIONES, FACTURAS, REACCIONES Y COMENTARIOS
-- =============================================================================

USE [NombreDeSuBaseDeDatos];
GO

-- 1. GENERAR 500 SUSCRIPCIONES
PRINT 'Iniciando carga de 500 suscripciones...';
SET IDENTITY_INSERT Suscripcion ON;

DECLARE @s INT = 1;
DECLARE @id_fan_s INT;
DECLARE @id_nivel_s INT;
DECLARE @estado_s VARCHAR(20);
DECLARE @precio_s DECIMAL(10,2);
DECLARE @fecha_ini_s DATETIME;

WHILE @s <= 500
BEGIN
    -- Distribuir fans (IDs 26 a 250)
    SET @id_fan_s = 26 + (@s % 225);
    -- Asignar niveles (IDs 1 a 50). 
    -- Para forzar "Intereses Cruzados", los primeros fans se suscriben a Tech (Nivel 1-2) y Fitness (Nivel 3-4)
    IF @s <= 30 
        SET @id_nivel_s = CASE WHEN @s % 2 = 0 THEN 1 ELSE 3 END;
    ELSE
        SET @id_nivel_s = (@s % 50) + 1;

    SET @estado_s = CASE 
        WHEN @s % 10 = 0 THEN 'Cancelada' 
        WHEN @s % 10 = 1 THEN 'Vencida' 
        ELSE 'Activa' END;
        
    -- Precio pactado: $5 si el nivel es impar, $25 si es par (basado en Bloque 1)
    SET @precio_s = CASE WHEN @id_nivel_s % 2 = 1 THEN 5.00 ELSE 25.00 END;
    SET @fecha_ini_s = DATEADD(DAY, -(@s % 300), '2026-03-01');

    INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado)
    VALUES (@s, @id_fan_s, @id_nivel_s, @fecha_ini_s, 
            DATEADD(MONTH, 1, @fecha_ini_s), 
            CASE WHEN @estado_s <> 'Activa' THEN DATEADD(MONTH, 1, @fecha_ini_s) ELSE NULL END,
            @estado_s, @precio_s);

    -- 2. GENERAR FACTURA COHERENTE (1 por suscripción para el seed)
    -- Formato Codigo: YYYYMMDD-IDUser-IDSub-IDNivel-IDCreator
    -- Nota: idCreador se deriva de idNivel: ((idNivel-1)/2)+1
    DECLARE @id_cr_s INT = ((@id_nivel_s - 1) / 2) + 1;
    DECLARE @cod_t VARCHAR(100) = '2025' + REPLACE(CONVERT(VARCHAR, @fecha_ini_s, 102),'.','') + '-' + CAST(@id_fan_s AS VARCHAR) + '-' + CAST(@s AS VARCHAR) + '-' + CAST(@id_nivel_s AS VARCHAR) + '-' + CAST(@id_cr_s AS VARCHAR);
    
    DECLARE @sub_t DECIMAL(10,2) = @precio_s;
    DECLARE @imp DECIMAL(10,2) = @sub_t * 0.16; -- IVA 16% [cite: 137]

    INSERT INTO Factura (idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total)
    VALUES (@s, @cod_t, @fecha_ini_s, @sub_t, @imp, @sub_t + @imp);

    SET @s = @s + 1;
END
SET IDENTITY_INSERT Suscripcion OFF;

-- 3. GENERAR 1.500 REACCIONES VARIADAS
PRINT 'Insertando 1.500 reacciones...';
DECLARE @r INT = 1;
WHILE @r <= 1500
BEGIN
    -- Evitar duplicados en la PK (idUsuario, idPublicacion)
    -- Usamos un offset para que diferentes usuarios reaccionen a diferentes posts
    DECLARE @u_r INT = 26 + (@r % 225);
    DECLARE @p_r INT = 1 + ((@r * 7) % 800);
    
    IF NOT EXISTS (SELECT 1 FROM UsuarioReaccionPublicacion WHERE idUsuario = @u_r AND idPublicacion = @p_r)
    BEGIN
        INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion)
        VALUES (@u_r, @p_r, (@r % 7) + 1, DATEADD(HOUR, -@r, '2026-03-10'));
    END
    SET @r = @r + 1;
END

-- 4. GENERAR 1.000 COMENTARIOS (CON 100 HILOS)
PRINT 'Insertando 1.000 comentarios...';
SET IDENTITY_INSERT Comentario ON;
DECLARE @c INT = 1;
WHILE @c <= 1000
BEGIN
    DECLARE @u_c INT = 26 + (@c % 225);
    DECLARE @p_c INT = 1 + (@c % 800);
    DECLARE @padre INT = NULL;

    -- Crear hilos: Los comentarios del 101 al 200 responden a los comentarios 1 al 100
    IF @c > 100 AND @c <= 200 SET @padre = @c - 100;

    INSERT INTO Comentario (id, idUsuario, idPublicacion, idComentarioPadre, texto, fecha)
    VALUES (@c, @u_c, @p_c, @padre, 
            CASE WHEN @padre IS NULL THEN 'Excelente contenido post ' + CAST(@p_c AS VARCHAR)
            ELSE 'Respondiendo al comentario ' + CAST(@padre AS VARCHAR) END,
            DATEADD(MINUTE, -@c, '2026-03-10'));
    SET @c = @c + 1;
END
SET IDENTITY_INSERT Comentario OFF;

PRINT 'Bloque 3 completado exitosamente: FanHub está listo para pruebas de reporte.'; -- control generado por la ia