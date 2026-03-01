-- Modelo Relacional
    -- 	Nota: PK indica Clave Primaria y FK indica Clave Foránea.
    --  Ningún campo monetario (precios, montos) puede ser negativo.
    --  Las fechas de nacimiento deben corresponder a usuarios mayores de 13 años.
    --  Los campos booleanos (como es_nsfw, es_publica, es_activo) deben implementarse con el tipo de dato BIT (1 o 0).
    --  El campo resolución en Video debe aceptar solo valores estándar ('720p', '1080p', '4K').
    --  Si no está seguro sobre algún tipo de dato, asuma el más apropiado justificándolo en su informe (ej: DECIMAL(10,2) para dinero).
    --  Deben realizar las restricciones necesarias para los atributos que tienen valores predefinidos en el modelo relacional
    --  (estados, tipos, resolución en video).

-- 1. Usuario (id, email, password_hash, nickname, fecha_registro, fecha_nacimiento, pais, esta_activo)



-- 2. Creador (idUsuario, biografia, banco_nombre, banco_cuenta, es_nsfw, idCategoria)
    -- 	Nota: idUsuario es PK y FK hacia Usuario.

-- 3. Categoria (id, nombre, descripcion)

-- 4. MetodoPago (id, idUsuario, ultimos_4_digitos, marca, titular, fecha_expiracion, es_predeterminado)

-- 5. NivelSuscripcion (id, idCreador, nombre, descripcion, precio_actual, esta_activo, orden)

-- 6. Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado)
    -- 	○ Estados posibles: 'Activa', 'Cancelada', 'Vencida'.

-- 7. Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total)

-- 8. Publicacion (id, idCreador, titulo, fecha_publicacion, es_publica, tipo_contenido)
    -- 	Tipos posibles: 'VIDEO', 'TEXTO', 'IMAGEN'.

-- 9. Video (idPublicacion, duracion_seg, resolucion, url_stream)

-- 10. Texto (idPublicacion, contenido_html, resumen_gratuito)

-- 11. Imagen (idPublicacion, ancho, alto, formato, alt_text, url_imagen)

-- 12. Comentario (id, idUsuario, idPublicacion, idComentarioPadre, texto, fecha)
    -- 	idComentarioPadre es FK recursiva (puede ser NULL).

-- 13. TipoReaccion (id, nombre, emoji_code)

-- 14. UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion)

-- 15. Etiqueta (id, nombre)

-- 16. PublicacionEtiqueta (idPublicacion, idEtiqueta)