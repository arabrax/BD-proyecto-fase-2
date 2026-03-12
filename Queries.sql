-- Deben entregar el script SQL para generar los siguientes reportes.
-- Importante: Se evaluará que el resultado coincida exactamente con las columnas solicitadas.

-- 1. Clasificación de Ganancias: Listar los creadores basándose en su facturación del último mes.
-- Deben utilizar la función fn_clasificar_ingreso para determinar la etiqueta del creador.
    -- ○ Columnas a mostrar: Nickname, Categoria, Total Suscriptores Activos, Monto Facturado, Clasificación (Retorno de la función).

-- 2. Viralidad por Categoría: Mostrar la publicación con mayor puntaje de viralidad dentro de cada Categoría.
-- Puntaje = (Reacciones * 1.5) + (Comentarios * 3).
    -- ○ Columnas a mostrar: Nombre Categoría, Título Publicación, Creador, Puntaje Máximo.

-- 3. Análisis de Dominios de Correo: Contar la frecuencia de proveedores de correo. Filtrar para mostrar solo los dominios con
-- más de 10 usuarios.
    -- ○ Columnas a mostrar: Dominio (ej: gmail.com), Cantidad Usuarios.

-- 4. Promedio de Retención (Churn): Para las suscripciones 'Canceladas', calcular el promedio de días de duración.
-- Ordenamiento: Agrupar por creador y ordenar los resultados según la jerarquía del nivel (campo orden) de menor a mayor.
    -- ○ Columnas a mostrar: Nickname Creador, Nombre Nivel, Promedio Días.

-- 5. Tiempo y Peso de Contenido (Gaming): Calcular la duración total de videos de creadores "Gaming" y estimar el almacenamiento
-- ocupado en GB. (Asumir: 1 min 4K = 0.5 GB, 1 min 1080p = 0.1 GB, Otros = 0.05 GB).
    -- ○ Columnas a mostrar: Nickname, Tiempo Total Formateado (ej: '12h 45m'), Estimación GB.

-- 6. Mapa de Calor Financiero: Calcular la facturación total por país y su participación de mercado global.
    -- ○ Columnas a mostrar: País, Total Facturado, Share % (ej: '15.5%').

-- 7. Intereses Cruzados: Listar usuarios con suscripciones en "Tecnología" Y "Fitness" (o dos categorías disjuntas) y un
-- gasto histórico > $140 USD.
    -- ○ Columnas a mostrar: Nickname Usuario, Gasto Total Histórico.

-- 8. Generaciones: Clasificar usuarios por año de nacimiento: 'Gen Z' (>2000), 'Millennials' (1981-2000), 'X' (<1981).
    -- ○ Columnas a mostrar: Generación, Cantidad Usuarios Activos, Gasto Promedio Mensual.

-- 9. Creadores Polémicos: Listar Creadores con un promedio de ratio (Comentarios / Reacciones) > 2.0.
    -- ○ Columnas a mostrar: Nickname, Cantidad Posts Evaluados, Ratio Promedio.

-- 10. Ranking de Creadores (Reputación): Listar creadores multimedia (VIDEO/IMAGEN) que nunca hayan subido contenido NSFW.
-- El listado debe estar ordenado descendentemente por su Reputación, calculada invocando a la función fn_calcular_reputacion.
    -- ○ Columnas a mostrar: Nickname, Total Suscriptores, Puntaje Reputación.

-- 11. Usuarios "Lurkers": Usuarios con suscripción activa pero sin ninguna interacción (comentario/reacción).
    -- ○ Columnas a mostrar: Nickname, Fecha Última Suscripción, Monto Gastado (Estimado).

-- 12. Tendencias (Tags): Top 3 etiquetas más usadas el último mes.
    -- ○ Columnas a mostrar: Nombre Etiqueta, Cantidad Publicaciones.

-- 13. Cobertura Total de Reacciones: Usuarios que han usado todos los tipos de reacción del catálogo.
    -- ○ Columnas a mostrar: Nickname, Total Reacciones Realizadas.

-- 14. Reporte de Nómina (Liquidación): Generar el listado de pagos a realizar a los creadores correspondiente al mes actual.
-- La plataforma cobra una comisión del 20% sobre el total facturado.
    -- ○ Columnas a mostrar: Nombre Banco, Cuenta Bancaria, Beneficiario (Nickname), Total Facturado (Bruto), Comisión FanHub,
    -- Monto a Transferir (Neto).


    --1. Clasificación de Ganancias
SELECT 
    u.nickname AS [Nickname], 
    cat.nombre AS [Categoria], 
    COUNT(DISTINCT s.idUsuario) AS [Total Suscriptores Activos], 
    ISNULL(SUM(f.monto_total), 0) AS [Monto Facturado], 
    --Le pasamos el monto exacto facturado a la función para que evalúe si es Diamante, Oro o Plata
    dbo.fn_clasificar_ingreso(ISNULL(SUM(f.monto_total), 0)) AS [Clasificación]
FROM Creador AS c
--Agrega la tabla Usuario para sacar el nickname
INNER JOIN Usuario AS u ON c.idUsuario = u.id
LEFT JOIN Categoria AS cat ON c.idCategoria = cat.id
LEFT JOIN NivelSuscripcion AS ns ON c.idUsuario = ns.idCreador
--Filtra para que solo cuente las suscripciones activas
LEFT JOIN Suscripcion AS s ON ns.id = s.idNivel AND s.estado = 'Activa'
--Filtra para sumar solo las facturas del último mes exacto
LEFT JOIN Factura AS f ON s.id = f.idSuscripcion AND DATEDIFF(MONTH, f.fecha_emision, GETDATE()) = 1
GROUP BY 
    c.idUsuario, 
    u.nickname, 
    cat.nombre;

-- 2. Viralidad por Categoría
WITH ReaccionesPorPub AS (
    SELECT idPublicacion, COUNT(idUsuario) AS TotalReacciones
    FROM UsuarioReaccionPublicacion
    GROUP BY idPublicacion
),
ComentariosPorPub AS (
    SELECT idPublicacion, COUNT(id) AS TotalComentarios
    FROM Comentario
    GROUP BY idPublicacion
),
PuntajesCalculados AS (
    SELECT 
        cat.nombre AS Nombre_Categoria,
        p.titulo AS Titulo_Publicacion,
        u.nickname AS Creador,
        -- Calcula el puntaje. ISNULL para convertir nulos en 0 (si no tiene reacciones/comentarios)
        (ISNULL(r.TotalReacciones, 0) * 1.5) + (ISNULL(c.TotalComentarios, 0) * 3.0) AS Puntaje
    FROM Publicacion p
    -- Conecta la publicación con el creador, luego con el usuario para sacar su nickname, y luego con la categoría
    INNER JOIN Creador cr ON p.idCreador = cr.idUsuario
    INNER JOIN Usuario u ON cr.idUsuario = u.id
    INNER JOIN Categoria cat ON cr.idCategoria = cat.id
    -- LEFT JOIN para que no se borren las publicaciones que tienen 0 reacciones o 0 comentarios
    LEFT JOIN ReaccionesPorPub r ON p.id = r.idPublicacion
    LEFT JOIN ComentariosPorPub c ON p.id = c.idPublicacion
),
RankingPorCategoria AS (
    SELECT 
        Nombre_Categoria,
        Titulo_Publicacion,
        Creador,
        Puntaje AS Puntaje_Maximo,
        -- Esto numera las publicaciones 1, 2, 3... reiniciando la cuenta en cada categoría, ordenado por puntaje de mayor a menor
        ROW_NUMBER() OVER(PARTITION BY Nombre_Categoria ORDER BY Puntaje DESC) AS Ranking
    FROM PuntajesCalculados
)
-- Finalmente, muestara solo los que quedaron en el puesto 1 de su respectiva categoría
SELECT 
    Nombre_Categoria,
    Titulo_Publicacion,
    Creador,
    Puntaje_Maximo
FROM RankingPorCategoria
WHERE Ranking = 1;

--3. Análisis de Dominios de Correo
SELECT 
    SUBSTRING(email, CHARINDEX('@', email) + 1, LEN(email)) AS Dominio,
    COUNT(id) AS [Cantidad Usuarios]
FROM Usuario
GROUP BY SUBSTRING(email, CHARINDEX('@', email) + 1, LEN(email))
HAVING COUNT(id) > 10;

-- 4. Promedio de Retención (Churn)
SELECT 
    u.nickname AS [Nickname Creador],
    ns.nombre AS [Nombre Nivel],
    AVG(DATEDIFF(DAY, s.fecha_inicio, s.fecha_fin)) AS [Promedio Días]
FROM Suscripcion s
INNER JOIN NivelSuscripcion ns ON s.idNivel = ns.id
INNER JOIN Usuario u ON ns.idCreador = u.id
WHERE s.estado = 'Cancelada'
GROUP BY 
    u.nickname,
    ns.nombre,
    ns.orden
ORDER BY 
    ns.orden ASC;

--5. Tiempo y Peso de Contenido (Gaming)
SELECT 
    u.nickname AS Nickname,
    
    --Calcula las horas (dividiendo entre 3600) y los minutos restantes (usando el módulo %)
    CAST(SUM(v.duracion_seg) / 3600 AS VARCHAR) + 'h ' + 
    CAST((SUM(v.duracion_seg) % 3600) / 60 AS VARCHAR) + 'm' AS [Tiempo Total Formateado],
    
    --Calcula el peso en GB usando CASE para evaluar la resolución de cada video
    CAST(SUM(
        CASE 
            WHEN v.resolucion = '4K' THEN (v.duracion_seg / 60.0) * 0.5
            WHEN v.resolucion = '1080p' THEN (v.duracion_seg / 60.0) * 0.1
            ELSE (v.duracion_seg / 60.0) * 0.05
        END
    ) AS DECIMAL(10,2)) AS [Estimación GB]
    
FROM Usuario u
INNER JOIN Creador c ON u.id = c.idUsuario
INNER JOIN Categoria cat ON c.idCategoria = cat.id
INNER JOIN Publicacion p ON c.idUsuario = p.idCreador
INNER JOIN Video v ON p.id = v.idPublicacion
WHERE cat.nombre = 'Gaming'
GROUP BY u.nickname;

-- 6. Mapa de Calor Financiero
SELECT 
    u.pais AS País,
    SUM(f.monto_total) AS [Total Facturado],
    
    -- Calcula el porcentaje: (Suma del país * 100) / Suma Global
    -- Usa OVER() para obtener el gran total sin perder la agrupación por país
    CAST(CAST((SUM(f.monto_total) * 100.0) / SUM(SUM(f.monto_total)) OVER() AS DECIMAL(5,2)) AS VARCHAR) + '%' AS [Share %]

FROM Factura f
INNER JOIN Suscripcion s ON f.idSuscripcion = s.id
INNER JOIN Usuario u ON s.idUsuario = u.id
WHERE u.pais IS NOT NULL
GROUP BY u.pais
ORDER BY [Total Facturado] DESC;

--7. Intereses Cruzados
WITH UsuariosIntereses AS (
    SELECT s.idUsuario
    FROM Suscripcion s
    INNER JOIN NivelSuscripcion ns ON s.idNivel = ns.id
    INNER JOIN Creador c ON ns.idCreador = c.idUsuario
    INNER JOIN Categoria cat ON c.idCategoria = cat.id
    WHERE cat.nombre IN ('Tecnología', 'Fitness')
    GROUP BY s.idUsuario
    --Asegura que el usuario tenga exactamente las 2 categorías distintas
    HAVING COUNT(DISTINCT cat.nombre) = 2
)
SELECT 
    u.nickname AS [Nickname Usuario],
    SUM(f.monto_total) AS [Gasto Total Histórico]
FROM Usuario u
INNER JOIN UsuariosIntereses ui ON u.id = ui.idUsuario
INNER JOIN Suscripcion s ON u.id = s.idUsuario
INNER JOIN Factura f ON s.id = f.idSuscripcion
GROUP BY u.nickname
--Filtra para que el gasto histórico supere los 140 USD
HAVING SUM(f.monto_total) > 140;

-- 8. Generaciones
WITH GastosUsuarios AS (
    SELECT 
        u.id,
        u.fecha_nacimiento,
        u.esta_activo,
        ISNULL(SUM(f.monto_total), 0) AS TotalGastado,
        --Calcula cuántos meses lleva registrado el usuario. 
        --Si se registró este mismo mes (da 0), fuerza un 1 para evitar errores de división por cero.
        CASE 
            WHEN DATEDIFF(MONTH, u.fecha_registro, GETDATE()) = 0 THEN 1
            ELSE DATEDIFF(MONTH, u.fecha_registro, GETDATE())
        END AS MesesActivo
    FROM Usuario u
    LEFT JOIN Suscripcion s ON u.id = s.idUsuario
    LEFT JOIN Factura f ON s.id = f.idSuscripcion
    GROUP BY u.id, u.fecha_nacimiento, u.esta_activo, u.fecha_registro
),
UsuariosClasificados AS (
    SELECT 
        esta_activo,
        (TotalGastado / MesesActivo) AS GastoMensual,
        --Clasifica según el año de nacimiento
        CASE 
            WHEN YEAR(fecha_nacimiento) > 2000 THEN 'Gen Z'
            WHEN YEAR(fecha_nacimiento) BETWEEN 1981 AND 2000 THEN 'Millennials'
            ELSE 'X'
        END AS Generacion
    FROM GastosUsuarios
)
SELECT 
    Generacion,
    --Cuenta solo a los que tienen el bit esta_activo en 1
    SUM(CAST(esta_activo AS INT)) AS [Cantidad Usuarios Activos],
    CAST(AVG(GastoMensual) AS DECIMAL(10,2)) AS [Gasto Promedio Mensual]
FROM UsuariosClasificados
GROUP BY Generacion;

-- 9. Creadores Polémicos
WITH EstadisticasPost AS (
    SELECT 
        p.id AS idPublicacion,
        p.idCreador,
        -- Subconsultas para contar interacciones por post de forma exacta
        (SELECT COUNT(id) FROM Comentario c WHERE c.idPublicacion = p.id) AS TotalComentarios,
        (SELECT COUNT(idUsuario) FROM UsuarioReaccionPublicacion urp WHERE urp.idPublicacion = p.id) AS TotalReacciones
    FROM Publicacion p
),
RatioPorPost AS (
    SELECT 
        idCreador,
        idPublicacion,
        -- Si hay 0 reacciones, divide entre 1 para evitar error de división por cero
        CAST(TotalComentarios AS DECIMAL(10,2)) / CASE WHEN TotalReacciones = 0 THEN 1 ELSE TotalReacciones END AS Ratio
    FROM EstadisticasPost
    -- Solo evalua posts que tengan al menos alguna interacción
    WHERE TotalComentarios > 0 OR TotalReacciones > 0
)
SELECT 
    u.nickname AS Nickname,
    COUNT(rp.idPublicacion) AS [Cantidad Posts Evaluados],
    CAST(AVG(rp.Ratio) AS DECIMAL(10,2)) AS [Ratio Promedio]
FROM RatioPorPost rp
INNER JOIN Usuario u ON rp.idCreador = u.id
GROUP BY u.nickname
-- Filtra a los que superan el ratio de 2.0
HAVING AVG(rp.Ratio) > 2.0;

--10. Ranking de Creadores (Reputación)
SELECT 
    u.nickname AS [Nickname],
    COUNT(DISTINCT s.idUsuario) AS [Total Suscriptores],
    dbo.fn_calcular_reputacion(c.idUsuario) AS [Puntaje Reputación]
FROM Creador c
INNER JOIN Usuario u ON c.idUsuario = u.id
LEFT JOIN NivelSuscripcion ns ON c.idUsuario = ns.idCreador
LEFT JOIN Suscripcion s ON ns.id = s.idNivel
--Filtra a los creadores que son Family Friendly
WHERE c.es_nsfw = 0
  --Valida que tengan contenido multimedia
  AND EXISTS (
      SELECT 1 
      FROM Publicacion p 
      WHERE p.idCreador = c.idUsuario 
        AND p.tipo_contenido IN ('VIDEO', 'IMAGEN')
  )
GROUP BY 
    c.idUsuario, 
    u.nickname
ORDER BY 
    [Puntaje Reputación] DESC;

-- 11. Usuarios "Lurkers" (Pagan pero no interactúan)
WITH UsuariosInteractivos AS (
    -- Une a todos los que han comentado o reaccionado alguna vez
    SELECT idUsuario FROM Comentario
    UNION
    SELECT idUsuario FROM UsuarioReaccionPublicacion
),
Lurkers AS (
    -- Busca usuarios con suscripciones activas que NO estén en la lista de interactivos
    SELECT DISTINCT s.idUsuario
    FROM Suscripcion s
    WHERE s.estado = 'Activa'
    AND s.idUsuario NOT IN (SELECT idUsuario FROM UsuariosInteractivos)
)
SELECT 
    u.nickname AS Nickname,
    MAX(s.fecha_inicio) AS [Fecha Última Suscripción],
    ISNULL(SUM(f.monto_total), 0) AS [Monto Gastado (Estimado)]
FROM Lurkers l
INNER JOIN Usuario u ON l.idUsuario = u.id
INNER JOIN Suscripcion s ON u.id = s.idUsuario
LEFT JOIN Factura f ON s.id = f.idSuscripcion
GROUP BY u.nickname;


-- 12. Tendencias (Tags más usados el último mes)
SELECT TOP 3
    e.nombre AS [Nombre Etiqueta],
    COUNT(pe.idPublicacion) AS [Cantidad Publicaciones]
FROM Etiqueta e
INNER JOIN PublicacionEtiqueta pe ON e.id = pe.idEtiqueta
INNER JOIN Publicacion p ON pe.idPublicacion = p.id
-- Filtra exactamente las publicaciones de hace 1 mes
WHERE DATEDIFF(MONTH, p.fecha_publicacion, GETDATE()) = 1
GROUP BY e.nombre
ORDER BY COUNT(pe.idPublicacion) DESC;


-- 13. Cobertura Total de Reacciones
SELECT 
    u.nickname AS Nickname,
    COUNT(urp.idTipoReaccion) AS [Total Reacciones Realizadas]
FROM Usuario u
INNER JOIN UsuarioReaccionPublicacion urp ON u.id = urp.idUsuario
GROUP BY u.nickname
-- Compara la cantidad de reacciones DISTINTAS del usuario contra el total que existe en el catálogo
HAVING COUNT(DISTINCT urp.idTipoReaccion) = (SELECT COUNT(*) FROM TipoReaccion);


-- 14. Nómina (Liquidación del mes actual)
SELECT 
    c.banco_nombre AS [Nombre Banco],
    c.banco_cuenta AS [Cuenta Bancaria],
    u.nickname AS [Beneficiario (Nickname)],
    SUM(f.monto_total) AS [Total Facturado (Bruto)],
    -- Multiplica por 0.20 para sacar la comisión y por 0.80 para lo que le toca al creador
    CAST(SUM(f.monto_total) * 0.20 AS DECIMAL(10,2)) AS [Comisión FanHub],
    CAST(SUM(f.monto_total) * 0.80 AS DECIMAL(10,2)) AS [Monto a Transferir (Neto)]
FROM Creador c
INNER JOIN Usuario u ON c.idUsuario = u.id
INNER JOIN NivelSuscripcion ns ON c.idUsuario = ns.idCreador
INNER JOIN Suscripcion s ON ns.id = s.idNivel
INNER JOIN Factura f ON s.id = f.idSuscripcion
-- Filtra para que solo sume las facturas del mes en curso (diferencia de 0 meses)
WHERE DATEDIFF(MONTH, f.fecha_emision, GETDATE()) = 0
GROUP BY 
    c.banco_nombre,
    c.banco_cuenta,
    u.nickname;

