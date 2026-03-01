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