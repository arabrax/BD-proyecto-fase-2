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

-- 1. fn_calcular_impuesto(monto): Recibe un monto decimal. Devuelve el impuesto calculado (asumir 16% o el valor que prefieran,
-- pero debe ser parametrizable o constante).

CREATE OR ALTER FUNCTION fn_calcular_impuesto
 (
  @monto DECIMAL(10,2)
 )
RETURNS NVARCHAR
AS
$$
DECLARE
    impuesto FLOAT;
    impuesto_porcentaje FLOAT FOR $16;
BEGIN

    impuesto := @monto * (impuesto_porcentaje / 100);

    RETURN CAST(impuesto);
END;
$$ LANGUAGE plpgsql;

-- 2. fn_clasificar_ingreso(monto): Devuelve un NVARCHAR. Lógica: Si el monto > $1000 retorna 'Diamante', entre $500 y $1000 'Oro',
-- y menor a $500 'Plata'.

CREATE FUNCTION fn_clasificar_ingreso
 (
  @monto DECIMAL(10,2)
 )
RETURNS NVARCHAR
AS
DECLARE
    string clasificacion;
BEGIN
    CASE
        WHEN @monto > 1000 THEN clasificacion := 'Diamante'
        WHEN @monto > 500 THEN clasificacion := 'Oro'
        ELSE clasificacion := 'Plata'
    END;

    RETURN clasificacion;
END;
$$ LANGUAGE plpgsql;

-- 3. fn_calcular_reputacion(idCreador): Devuelve un DECIMAL (0-100).
--     ○ Fórmula sugerida: (Total Suscriptores * 0.5) + (Total Reacciones Último Mes * 0.1) + (Antigüedad Meses * 2).
--     Tope máximo de 100 puntos.

CREATE FUNCTION fn_calcular_reputacion
 (
  @idCreador INT
 )
RETURNS NVARCHAR
AS $$
DECLARE
    suscriptorTotal INT;
    reaccionesTotalUltMes INT;
    antiguedadMeses INT;
    reputacion INT;
BEGIN

    -- Total Suscriptores
    SELECT COUNT(s.idUsuario) -- count o sum?
    INTO suscriptorTotal
    FROM Creador AS c
    LEFT JOIN NivelSuscripcion AS ns ON c.idUsuario = ns.idCreador
    LEFT JOIN Suscripcion AS s ON ns.id = s.idNivel
    WHERE c.idUsuario = @idCreador;

    -- Total Reacciones Último Mes
    SELECT COUNT(urp.idTipoReaccion)
    INTO reaccionesTotalUltMes
    FROM Creador AS c
    LEFT JOIN Publicacion AS p ON c.idUsuario = p.idCreador
    LEFT JOIN UsuarioReaccionPublicacion AS urp ON p.id = urp.idPublicacion
    WHERE c.idUsuario = @idCreador AND urp.fecha_reaccion > DATEDIFF(CURRENT_DATE,MONTH,-1);

    -- Antigüedad Meses
    SELECT DATEDIFF(u.fecha_registro, MONTH, CURRENT_DATE)
    INTO antiguedadMeses
    FROM Creador as c
    LEFT JOIN Usuario as u ON c.idUsuario = u.id
    WHERE c.idUsuario = @idCreador;

    reputacion := (suscriptorTotal * 0,5) + (reaccionesTotalUltMes * 0,1) + (antiguedadMeses * 2);
    
    IF(reputacion > 100)
        reputacion = 100;

    RETURN reputacion;
END;
$$ LANGUAGE plpgsql;

-- C. Triggers

-- 1. Auditoría de Precios (Safety): Al actualizar el precio de un NivelSuscripcion, impedir que el cambio sea mayor al 50% del
-- precio anterior (para evitar errores de dedo o fraudes). Si el cambio es brusco, cancelar la operación y levantar un error.

-- 2. Protección de Menores (NSFW): Antes de insertar una nueva Suscripcion, verificar si el creador destino tiene marcado es_nsfw = 1.
-- Si es así, verificar la fecha_nacimiento del usuario suscriptor. Si el usuario es menor de 18 años, cancelar la transacción y
-- levantar un error "Contenido restringido por edad".