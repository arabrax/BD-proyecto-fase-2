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

-- 1. Tabla Usuario
CREATE TABLE Usuario (
    id INT IDENTITY(1,1) PRIMARY KEY, -- (1,1) para que sea autoincremental
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    nickname VARCHAR(100) NOT NULL,
    fecha_registro DATETIME DEFAULT GETDATE(),
    fecha_nacimiento DATE NOT NULL,
    pais VARCHAR(100),
    esta_activo BIT NOT NULL DEFAULT 1, -- DEFAULT 1 para que por defecto el usuario nazca activo
    
    -- Restricción: Usuarios mayores de 13 años
    CONSTRAINT CHK_Usuario_Edad CHECK (fecha_nacimiento <= DATEADD(YEAR, -13, GETDATE()))
);

-- 2. Tabla Categoría
CREATE TABLE Categoria (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)
);

-- 3. Tabla Creador
CREATE TABLE Creador (
    idUsuario INT PRIMARY KEY, -- idUsuario es tanto PK como FK, no necesitamos un id autoincremental nuevo
    biografia VARCHAR(MAX), -- MAX porque el tipo de dato permite textos largos
    banco_nombre VARCHAR(100),
    banco_cuenta VARCHAR(50),
    es_nsfw BIT NOT NULL DEFAULT 0, 
    idCategoria INT,
    
    -- Relaciones 
    CONSTRAINT FK_Creador_Usuario FOREIGN KEY (idUsuario) REFERENCES Usuario(id),
    CONSTRAINT FK_Creador_Categoria FOREIGN KEY (idCategoria) REFERENCES Categoria(id)
);

-- 4. Tabla MetodoPago
CREATE TABLE MetodoPago (
    id INT IDENTITY(1,1) PRIMARY KEY,
    idUsuario INT NOT NULL,
    ultimos_4_digitos VARCHAR(4) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    titular VARCHAR(100) NOT NULL,
    fecha_expiracion DATE NOT NULL,
    es_predeterminado BIT NOT NULL DEFAULT 0,
    
    -- Relación
    CONSTRAINT FK_MetodoPago_Usuario FOREIGN KEY (idUsuario) REFERENCES Usuario(id)
);

-- 5. Tabla NivelSuscripcion
CREATE TABLE NivelSuscripcion (
    id INT IDENTITY(1,1) PRIMARY KEY,
    idCreador INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    precio_actual DECIMAL(10,2) NOT NULL,
    esta_activo BIT NOT NULL DEFAULT 1,
    orden INT NOT NULL,
    
    -- Relación
    CONSTRAINT FK_NivelSuscripcion_Creador FOREIGN KEY (idCreador) REFERENCES Creador(idUsuario),
    
    -- Restricción: Precios no pueden ser negativos
    CONSTRAINT CHK_NivelSuscripcion_Precio CHECK (precio_actual >= 0)
);

-- 6. Tabla Suscripcion
CREATE TABLE Suscripcion (
    id INT IDENTITY(1,1) PRIMARY KEY,
    idUsuario INT NOT NULL,
    idNivel INT NOT NULL,
    fecha_inicio DATETIME NOT NULL DEFAULT GETDATE(),
    fecha_renovacion DATETIME,
    fecha_fin DATETIME,
    estado VARCHAR(20) NOT NULL,
    precio_pactado DECIMAL(10,2) NOT NULL,
    
    -- Relaciones
    CONSTRAINT FK_Suscripcion_Usuario FOREIGN KEY (idUsuario) REFERENCES Usuario(id),
    CONSTRAINT FK_Suscripcion_Nivel FOREIGN KEY (idNivel) REFERENCES NivelSuscripcion(id),
    
    -- Restricción: Estados predefinidos
    CONSTRAINT CHK_Suscripcion_Estado CHECK (estado IN ('Activa', 'Cancelada', 'Vencida')),
    
    -- Restricción: Precio no negativo
    CONSTRAINT CHK_Suscripcion_Precio CHECK (precio_pactado >= 0)
);

-- 7. Tabla Factura
CREATE TABLE Factura (
    id INT IDENTITY(1,1) PRIMARY KEY,
    idSuscripcion INT NOT NULL,
    codigo_transaccion VARCHAR(100) NOT NULL UNIQUE,
    fecha_emision DATETIME NOT NULL DEFAULT GETDATE(),
    sub_total DECIMAL(10,2) NOT NULL,
    monto_impuesto DECIMAL(10,2) NOT NULL,
    monto_total DECIMAL(10,2) NOT NULL,
    
    -- Relación
    CONSTRAINT FK_Factura_Suscripcion FOREIGN KEY (idSuscripcion) REFERENCES Suscripcion(id),
    
    -- Restricción: Montos no negativos
    CONSTRAINT CHK_Factura_SubTotal CHECK (sub_total >= 0),
    CONSTRAINT CHK_Factura_Impuesto CHECK (monto_impuesto >= 0),
    CONSTRAINT CHK_Factura_Total CHECK (monto_total >= 0)
);

-- 8. Tabla Publicacion
CREATE TABLE Publicacion (
    id INT IDENTITY(1,1) PRIMARY KEY,
    idCreador INT NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    fecha_publicacion DATETIME NOT NULL DEFAULT GETDATE(),
    es_publica BIT NOT NULL DEFAULT 1,
    tipo_contenido VARCHAR(10) NOT NULL,
    
    -- Relación
    CONSTRAINT FK_Publicacion_Creador FOREIGN KEY (idCreador) REFERENCES Creador(idUsuario),
    
    -- Restricción: Tipos de contenido
    CONSTRAINT CHK_Publicacion_Tipo CHECK (tipo_contenido IN ('VIDEO', 'TEXTO', 'IMAGEN'))
);

-- 9. Tabla Video
CREATE TABLE Video (
    idPublicacion INT PRIMARY KEY,
    duracion_seg INT NOT NULL,
    resolucion VARCHAR(10) NOT NULL,
    url_stream VARCHAR(MAX) NOT NULL,
    
    -- Relación
    CONSTRAINT FK_Video_Publicacion FOREIGN KEY (idPublicacion) REFERENCES Publicacion(id),
    
    -- Restricción: Resoluciones permitidas
    CONSTRAINT CHK_Video_Resolucion CHECK (resolucion IN ('720p', '1080p', '4K'))
);

-- 10. Tabla Texto
CREATE TABLE Texto (
    idPublicacion INT PRIMARY KEY,
    contenido_html VARCHAR(MAX) NOT NULL,
    resumen_gratuito VARCHAR(500),
    
    -- Relación
    CONSTRAINT FK_Texto_Publicacion FOREIGN KEY (idPublicacion) REFERENCES Publicacion(id)
);

-- 11. Tabla Imagen
CREATE TABLE Imagen (
    idPublicacion INT PRIMARY KEY,
    ancho INT NOT NULL,
    alto INT NOT NULL,
    formato VARCHAR(20) NOT NULL,
    alt_text VARCHAR(255),
    url_imagen VARCHAR(MAX) NOT NULL,
    
    -- Relación
    CONSTRAINT FK_Imagen_Publicacion FOREIGN KEY (idPublicacion) REFERENCES Publicacion(id)
);

-- 12. Tabla Comentario
CREATE TABLE Comentario (
    id INT IDENTITY(1,1) PRIMARY KEY,
    idUsuario INT NOT NULL,
    idPublicacion INT NOT NULL,
    idComentarioPadre INT NULL,
    texto VARCHAR(MAX) NOT NULL,
    fecha DATETIME NOT NULL DEFAULT GETDATE(),
    
    -- Relaciones
    CONSTRAINT FK_Comentario_Usuario FOREIGN KEY (idUsuario) REFERENCES Usuario(id),
    CONSTRAINT FK_Comentario_Publicacion FOREIGN KEY (idPublicacion) REFERENCES Publicacion(id),
    
    -- FK Recursiva (Un comentario puede responder a otro comentario)
    CONSTRAINT FK_Comentario_Padre FOREIGN KEY (idComentarioPadre) REFERENCES Comentario(id)
);

-- 13. Tabla TipoReaccion
CREATE TABLE TipoReaccion (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    emoji_code VARCHAR(20) NOT NULL
);

-- 14. Tabla UsuarioReaccionPublicacion
CREATE TABLE UsuarioReaccionPublicacion (
    idUsuario INT NOT NULL,
    idPublicacion INT NOT NULL,
    idTipoReaccion INT NOT NULL,
    fecha_reaccion DATETIME NOT NULL DEFAULT GETDATE(),
    
    -- Clave Primaria Compuesta
    PRIMARY KEY (idUsuario, idPublicacion),
    
    -- Relaciones
    CONSTRAINT FK_URP_Usuario FOREIGN KEY (idUsuario) REFERENCES Usuario(id),
    CONSTRAINT FK_URP_Publicacion FOREIGN KEY (idPublicacion) REFERENCES Publicacion(id),
    CONSTRAINT FK_URP_TipoReaccion FOREIGN KEY (idTipoReaccion) REFERENCES TipoReaccion(id)
);

-- 15. Tabla Etiqueta
CREATE TABLE Etiqueta (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

-- 16. Tabla PublicacionEtiqueta
CREATE TABLE PublicacionEtiqueta (
    idPublicacion INT NOT NULL,
    idEtiqueta INT NOT NULL,
    
    -- Clave Primaria Compuesta
    PRIMARY KEY (idPublicacion, idEtiqueta),
    
    -- Relaciones
    CONSTRAINT FK_PE_Publicacion FOREIGN KEY (idPublicacion) REFERENCES Publicacion(id),
    CONSTRAINT FK_PE_Etiqueta FOREIGN KEY (idEtiqueta) REFERENCES Etiqueta(id)
);

GO


