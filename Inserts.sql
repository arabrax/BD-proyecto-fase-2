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