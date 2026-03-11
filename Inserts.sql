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


USE [NombreDeSuBaseDeDatos];
GO

SET IDENTITY_INSERT Usuario ON;

-- ============================================================
-- SECCIÓN 1: CREADORES (10% - IDs 1 al 25)
-- ============================================================
INSERT INTO Usuario (id, email, password_hash, nickname, fecha_registro, fecha_nacimiento, pais, esta_activo) VALUES
(1, 'carlos.mendoza@fanhub.com', 'hash_c1', 'CarlosMaster', '2025-03-10', '1990-05-15', 'Venezuela', 1),
(2, 'elena.rodriguez@fanhub.com', 'hash_e2', 'ElenaFit', '2025-03-11', '1995-08-22', 'Venezuela', 1),
(3, 'roberto.gomez@fanhub.com', 'hash_r3', 'RobGamer', '2025-03-12', '2002-11-01', 'México', 1),
(4, 'ana.vargas@fanhub.com', 'hash_a4', 'AnaCocinera', '2025-03-15', '1988-02-10', 'España', 1),
(5, 'luis.hernandez@fanhub.com', 'hash_l5', 'LuisTech', '2025-03-20', '1993-06-30', 'Venezuela', 1),
(6, 'sofia.martinez@fanhub.com', 'hash_s6', 'SofiVlogs', '2025-03-22', '1997-12-05', 'Argentina', 1),
(7, 'marcos.diaz@fanhub.com', 'hash_m7', 'MarcosPhoto', '2025-03-25', '1991-03-14', 'Venezuela', 1),
(8, 'clara.lopez@fanhub.com', 'hash_c8', 'ClaraASMR', '2025-03-28', '1999-07-20', 'Colombia', 1),
(9, 'diego.sanchez@fanhub.com', 'hash_d9', 'DiegoCoding', '2025-04-01', '2000-01-25', 'Venezuela', 1),
(10, 'patricia.ruiz@fanhub.com', 'hash_p10', 'PattyArte', '2025-04-05', '1994-10-10', 'Venezuela', 1),
(11, 'julio.castillo@fanhub.com', 'hash_j11', 'JulioCine', '2025-04-08', '1985-04-18', 'Chile', 1),
(12, 'laura.perez@fanhub.com', 'hash_l12', 'LauraModa', '2025-04-10', '1996-09-02', 'Venezuela', 1),
(13, 'victor.morales@fanhub.com', 'hash_v13', 'VictorGym', '2025-04-12', '1992-11-11', 'Venezuela', 1),
(14, 'monica.gonzalez@fanhub.com', 'hash_m14', 'MoniViajes', '2025-04-15', '1989-05-25', 'Perú', 1),
(15, 'raul.ramirez@fanhub.com', 'hash_r15', 'RaulFinanzas', '2025-04-20', '1982-08-14', 'Venezuela', 1),
(16, 'beatriz.torres@fanhub.com', 'hash_b16', 'BeaMakeup', '2025-04-22', '1998-03-30', 'Panamá', 1),
(17, 'hugo.flores@fanhub.com', 'hash_h17', 'HugoDIY', '2025-04-25', '1990-12-01', 'Venezuela', 1),
(18, 'irene.vasquez@fanhub.com', 'hash_i18', 'IreneNews', '2025-04-28', '1987-01-15', 'Venezuela', 1),
(19, 'oscar.garcia@fanhub.com', 'hash_o19', 'OscarMusic', '2025-05-01', '1993-02-28', 'Colombia', 1),
(20, 'teresa.blanco@fanhub.com', 'hash_t20', 'TereYoga', '2025-05-05', '1991-06-10', 'Venezuela', 1),
(21, 'felipe.mendez@fanhub.com', 'hash_f21', 'FelipePod', '2025-05-08', '1988-10-05', 'Venezuela', 1),
(22, 'gabriela.rios@fanhub.com', 'hash_g22', 'GabyCosplay', '2025-05-10', '2001-04-20', 'Venezuela', 1),
(23, 'miguel.sosa@fanhub.com', 'hash_m23', 'MiguelHistorias', '2025-05-12', '1995-11-15', 'México', 1),
(24, 'andrea.pino@fanhub.com', 'hash_a24', 'AndyMascotas', '2025-05-15', '1994-07-08', 'Venezuela', 1),
(25, 'ricardo.gil@fanhub.com', 'hash_r25', 'RickyMoto', '2025-05-20', '1992-09-25', 'Venezuela', 1);

-- ============================================================
-- SECCIÓN 2: FANS (90% - IDs 26 al 250)
-- ============================================================
INSERT INTO Usuario (id, email, password_hash, nickname, fecha_registro, fecha_nacimiento, pais, esta_activo) VALUES
(26, 'pedro.suarez@gmail.com', 'fan_p26', 'PedroS', '2025-06-01', '2004-03-12', 'Venezuela', 1),
(27, 'maria.vera@yahoo.com', 'fan_m27', 'MariV', '2025-06-02', '1998-05-30', 'Venezuela', 1),
(28, 'juan.lara@outlook.com', 'fan_j28', 'JuanL', '2025-06-03', '1992-01-15', 'Colombia', 1),
(29, 'jose.pinto@gmail.com', 'fan_j29', 'JoseP', '2025-06-05', '2005-07-20', 'Venezuela', 1),
(30, 'carmen.ortiz@gmail.com', 'fan_c30', 'CarmenO', '2025-06-06', '1985-09-10', 'Venezuela', 1),
(31, 'francisco.mendez@yahoo.com', 'fan_f31', 'FrankM', '2025-06-08', '1990-11-25', 'Venezuela', 1),
(32, 'adriana.soto@gmail.com', 'fan_a32', 'AdriS', '2025-06-10', '2003-02-14', 'México', 1),
(33, 'manuel.leon@outlook.com', 'fan_m33', 'ManuL', '2025-06-12', '1996-04-05', 'Venezuela', 1),
(34, 'isabel.vargas@gmail.com', 'fan_i34', 'IsaV', '2025-06-15', '2001-08-30', 'Venezuela', 1),
(35, 'luisa.rios@yahoo.com', 'fan_l35', 'LuisaR', '2025-06-18', '1989-12-12', 'Venezuela', 1),
(36, 'ramon.blanco@gmail.com', 'fan_r36', 'RamonB', '2025-06-20', '1982-03-03', 'Venezuela', 1),
(37, 'angelica.torres@outlook.com', 'fan_a37', 'AngyT', '2025-06-22', '1994-06-18', 'Colombia', 1),
(38, 'domingo.flores@gmail.com', 'fan_d38', 'DomiF', '2025-06-25', '1997-10-22', 'Venezuela', 1),
(39, 'estefania.ramirez@gmail.com', 'fan_e39', 'EstefiR', '2025-06-28', '2000-05-05', 'Venezuela', 1),
(40, 'javier.gonzalez@yahoo.com', 'fan_j40', 'JaviG', '2025-07-01', '1993-01-28', 'España', 1),
(41, 'gabriel.morales@gmail.com', 'fan_g41', 'GaboM', '2025-07-03', '2002-09-09', 'Venezuela', 1),
(42, 'daniela.perez@outlook.com', 'fan_d42', 'DaniP', '2025-07-05', '1995-12-25', 'Venezuela', 1),
(43, 'ignacio.castillo@gmail.com', 'fan_i43', 'NachoC', '2025-07-08', '1988-04-14', 'Venezuela', 1),
(44, 'valentina.ruiz@gmail.com', 'fan_v44', 'ValenR', '2025-07-10', '2004-11-20', 'Chile', 1),
(45, 'omar.sanchez@yahoo.com', 'fan_o45', 'OmarS', '2025-07-12', '1991-08-01', 'Venezuela', 1),
(46, 'claudia.lopez@gmail.com', 'fan_c46', 'ClauL', '2025-07-15', '1999-02-14', 'Venezuela', 1),
(47, 'fernando.diaz@outlook.com', 'fan_f47', 'FerD', '2025-07-18', '1986-07-07', 'Venezuela', 1),
(48, 'paola.martinez@gmail.com', 'fan_p48', 'PaolaM', '2025-07-20', '2001-05-19', 'Venezuela', 1),
(49, 'andres.gomez@gmail.com', 'fan_a49', 'AndresG', '2025-07-22', '1994-10-31', 'Colombia', 1),
(50, 'barbara.rodriguez@yahoo.com', 'fan_b50', 'BarbyR', '2025-07-25', '1997-03-24', 'Venezuela', 1),
(51, 'sergio.pena@gmail.com', 'fan_s51', 'SergioP', '2025-07-28', '1990-12-15', 'Venezuela', 1),
(52, 'lorena.arias@gmail.com', 'fan_l52', 'LoreA', '2025-07-30', '1996-02-28', 'Venezuela', 1),
(53, 'mateo.soler@yahoo.com', 'fan_m53', 'MateoS', '2025-08-01', '2005-04-10', 'España', 1),
(54, 'valeria.gil@gmail.com', 'fan_v54', 'ValGil', '2025-08-03', '2000-09-20', 'Venezuela', 1),
(55, 'fabiola.luna@outlook.com', 'fan_f55', 'FabiL', '2025-08-05', '1993-06-14', 'Venezuela', 1),
(56, 'ricardo.bello@gmail.com', 'fan_r56', 'RicBello', '2025-08-08', '1987-11-01', 'Venezuela', 1),
(57, 'camila.duque@gmail.com', 'fan_c57', 'CamiD', '2025-08-10', '2002-08-05', 'Colombia', 1),
(58, 'alejandro.vivas@yahoo.com', 'fan_a58', 'AleVivas', '2025-08-12', '1991-03-30', 'Venezuela', 1),
(59, 'tania.marcano@gmail.com', 'fan_t59', 'TaniaM', '2025-08-15', '1998-07-12', 'Venezuela', 1),
(60, 'german.pinto@outlook.com', 'fan_g60', 'GerPinto', '2025-08-18', '1984-12-25', 'Venezuela', 1),
(61, 'yolanda.salas@gmail.com', 'fan_y61', 'YoliS', '2025-08-20', '1995-10-18', 'Venezuela', 1),
(62, 'vicente.guillen@gmail.com', 'fan_v62', 'VicentG', '2025-08-22', '1989-05-05', 'Venezuela', 1),
(63, 'estela.brito@yahoo.com', 'fan_e63', 'EstelaB', '2025-08-25', '2001-01-22', 'Venezuela', 1),
(64, 'bruno.ojeda@gmail.com', 'fan_b64', 'BrunoO', '2025-08-28', '1997-09-09', 'Argentina', 1),
(65, 'elisa.nunez@outlook.com', 'fan_e65', 'EliNuez', '2025-09-01', '2003-04-30', 'Venezuela', 1),
(66, 'armando.rivas@gmail.com', 'fan_a66', 'ArmanR', '2025-09-03', '1992-02-14', 'Venezuela', 1),
(67, 'rebeca.colmenares@gmail.com', 'fan_r67', 'RebeC', '2025-09-05', '1988-11-11', 'Venezuela', 1),
(68, 'salvador.bravo@yahoo.com', 'fan_s68', 'SalvaB', '2025-09-08', '1981-06-30', 'Venezuela', 1),
(69, 'natalia.cordero@gmail.com', 'fan_n69', 'NatyC', '2025-09-10', '2004-08-14', 'México', 1),
(70, 'walter.marin@outlook.com', 'fan_w70', 'WalterM', '2025-09-12', '1990-03-03', 'Venezuela', 1),
(71, 'karina.ugalde@gmail.com', 'fan_k71', 'KariU', '2025-09-15', '1994-07-25', 'Venezuela', 1),
(72, 'leonardo.parra@gmail.com', 'fan_l72', 'LeoParra', '2025-09-18', '1996-10-05', 'Venezuela', 1),
(73, 'silvia.barrios@yahoo.com', 'fan_s73', 'SilviaB', '2025-09-20', '1983-12-12', 'Venezuela', 1),
(74, 'fabian.larez@gmail.com', 'fan_f74', 'FabiLarez', '2025-09-22', '2002-05-20', 'Venezuela', 1),
(75, 'miriam.ojeda@outlook.com', 'fan_m75', 'MiriamO', '2025-09-25', '1999-01-01', 'Venezuela', 1),
(76, 'nelson.perez@gmail.com', 'fan_n76', 'NelsonP', '2025-09-28', '1985-09-15', 'Venezuela', 1),
(77, 'tatiana.vivas@gmail.com', 'fan_t77', 'TatiV', '2025-10-01', '1993-04-10', 'Colombia', 1),
(78, 'humberto.roa@yahoo.com', 'fan_h78', 'HumberR', '2025-10-03', '1980-07-22', 'Venezuela', 1),
(79, 'giovanna.perez@gmail.com', 'fan_g79', 'GioP', '2025-10-05', '2000-11-30', 'Venezuela', 1),
(80, 'cristian.diaz@outlook.com', 'fan_c80', 'CrisD', '2025-10-08', '1991-02-14', 'Venezuela', 1),
(81, 'juliana.sosa@gmail.com', 'fan_j81', 'JuliSosa', '2025-10-10', '1997-06-06', 'Venezuela', 1),
(82, 'marcelo.vega@gmail.com', 'fan_m82', 'MarceV', '2025-10-12', '1994-08-28', 'Venezuela', 1),
(83, 'patricia.leon@yahoo.com', 'fan_p83', 'PattyL', '2025-10-15', '1989-10-10', 'Venezuela', 1),
(84, 'rodolfo.guzman@gmail.com', 'fan_r84', 'RodoG', '2025-10-18', '1982-12-25', 'Venezuela', 1),
(85, 'ximena.vargas@outlook.com', 'fan_x85', 'XimeV', '2025-10-20', '2001-03-03', 'Venezuela', 1),
(86, 'alfredo.prieto@gmail.com', 'fan_a86', 'AlfreP', '2025-10-22', '1987-05-05', 'Venezuela', 1),
(87, 'beatriz.marin@gmail.com', 'fan_b87', 'BeaMarin', '2025-10-25', '1995-11-15', 'Venezuela', 1),
(88, 'claudio.ruiz@yahoo.com', 'fan_c88', 'ClaudioR', '2025-10-28', '1986-09-09', 'Venezuela', 1),
(89, 'diana.martinez@gmail.com', 'fan_d89', 'DianaM', '2025-11-01', '2003-07-07', 'Venezuela', 1),
(90, 'enrique.pena@outlook.com', 'fan_e90', 'QuiqueP', '2025-11-03', '1990-10-20', 'Venezuela', 1),
(91, 'florencia.gil@gmail.com', 'fan_f91', 'FlorG', '2025-11-05', '1998-01-25', 'Venezuela', 1),
(92, 'gonzalo.ortiz@gmail.com', 'fan_g92', 'GonzaO', '2025-11-08', '1992-04-18', 'Venezuela', 1),
(93, 'helena.sanchez@yahoo.com', 'fan_h93', 'HeleS', '2025-11-10', '1984-06-30', 'Venezuela', 1),
(94, 'ivan.mendez@gmail.com', 'fan_i94', 'IvanM', '2025-11-12', '2002-09-02', 'Venezuela', 1),
(95, 'josefina.vasquez@outlook.com', 'fan_j95', 'JosefaV', '2025-11-15', '1996-12-12', 'Venezuela', 1),
(96, 'kevin.castillo@gmail.com', 'fan_k96', 'KevinC', '2025-11-18', '2004-03-24', 'Venezuela', 1),
(97, 'liliana.morales@gmail.com', 'fan_l97', 'LiliM', '2025-11-20', '1991-08-15', 'Venezuela', 1),
(98, 'mario.garcia@yahoo.com', 'fan_m98', 'MarioG', '2025-11-22', '1983-10-05', 'Venezuela', 1),
(99, 'norma.rodriguez@gmail.com', 'fan_n99', 'NormaR', '2025-11-25', '1988-05-20', 'Venezuela', 1),
(100, 'oliver.flores@outlook.com', 'fan_o100', 'OliF', '2025-11-28', '1999-02-14', 'Venezuela', 1),
-- IDs 101 al 150
(101, 'pablo.vera@gmail.com', 'fan_p101', 'PabloV', '2025-12-01', '1994-07-22', 'Venezuela', 1),
(102, 'quintin.rios@gmail.com', 'fan_q102', 'QuintR', '2025-12-03', '1980-09-30', 'Venezuela', 1),
(103, 'rosa.larez@yahoo.com', 'fan_r103', 'RositaL', '2025-12-05', '1992-11-11', 'Venezuela', 1),
(104, 'sergio.bello@gmail.com', 'fan_s104', 'SerBello', '2025-12-08', '2001-01-25', 'Venezuela', 1),
(105, 'teresa.mendez@outlook.com', 'fan_t105', 'TereM', '2025-12-10', '1987-03-03', 'Venezuela', 1),
(106, 'uriel.salazar@gmail.com', 'fan_u106', 'UriSal', '2025-12-12', '1995-05-15', 'Venezuela', 1),
(107, 'valeria.pinto@gmail.com', 'fan_v107', 'ValeP', '2025-12-15', '2003-08-08', 'Venezuela', 1),
(108, 'wilmer.ojeda@yahoo.com', 'fan_w108', 'WilmO', '2025-12-18', '1989-10-10', 'Venezuela', 1),
(109, 'ximena.blanco@gmail.com', 'fan_x109', 'XimeB', '2025-12-20', '1997-12-25', 'Venezuela', 1),
(110, 'yoel.guzman@outlook.com', 'fan_y110', 'YoelG', '2025-12-22', '1984-02-14', 'Venezuela', 1),
(111, 'zoila.rojas@gmail.com', 'fan_z111', 'ZoilaR', '2025-12-25', '1991-04-04', 'Venezuela', 1),
(112, 'abel.vargas@gmail.com', 'fan_a112', 'AbelV', '2025-12-28', '1998-06-18', 'Venezuela', 1),
(113, 'belen.torres@yahoo.com', 'fan_b113', 'BelenT', '2026-01-01', '1982-08-01', 'Venezuela', 1),
(114, 'cesar.perez@gmail.com', 'fan_c114', 'CesarP', '2026-01-03', '1996-10-10', 'Venezuela', 1),
(115, 'dora.marin@outlook.com', 'fan_d115', 'DoraM', '2026-01-05', '1985-12-12', 'Venezuela', 1),
(116, 'elias.ruiz@gmail.com', 'fan_e116', 'EliasR', '2026-01-08', '2002-02-22', 'Venezuela', 1),
(117, 'flora.gil@gmail.com', 'fan_f117', 'FloraG', '2026-01-10', '1993-01-15', 'Venezuela', 1),
(118, 'guido.ortiz@yahoo.com', 'fan_g118', 'GuidoO', '2026-01-12', '1988-03-30', 'Venezuela', 1),
(119, 'ilda.pinto@gmail.com', 'fan_i119', 'IldaP', '2026-01-15', '1990-05-05', 'Venezuela', 1),
(120, 'jorge.larez@outlook.com', 'fan_j120', 'JorgeL', '2026-01-18', '1981-07-07', 'Venezuela', 1),
(121, 'karla.soto@gmail.com', 'fan_k121', 'KarlaS', '2026-01-20', '2004-09-09', 'Venezuela', 1),
(122, 'lucas.pena@gmail.com', 'fan_l122', 'LucasP', '2026-01-22', '1997-11-20', 'Venezuela', 1),
(123, 'marta.vera@yahoo.com', 'fan_m123', 'MartaV', '2026-01-25', '1983-01-10', 'Venezuela', 1),
(124, 'noel.rios@gmail.com', 'fan_n124', 'NoelR', '2026-01-28', '1994-03-12', 'Venezuela', 1),
(125, 'olga.bello@outlook.com', 'fan_o125', 'OlgaB', '2026-02-01', '1986-05-15', 'Venezuela', 1),
(126, 'paco.arias@gmail.com', 'fan_p126', 'PacoA', '2026-02-03', '1992-07-20', 'Venezuela', 1),
(127, 'querubin.salas@gmail.com', 'fan_q127', 'QueruS', '2026-02-05', '1980-09-09', 'Venezuela', 1),
(128, 'rita.luna@yahoo.com', 'fan_r128', 'RitaL', '2026-02-08', '1999-11-30', 'Venezuela', 1),
(129, 'saul.ojeda@gmail.com', 'fan_s129', 'SaulO', '2026-02-10', '1991-01-25', 'Venezuela', 1),
(130, 'tulia.blanco@outlook.com', 'fan_t130', 'TuliaB', '2026-02-12', '1984-03-03', 'Venezuela', 1),
(131, 'ulises.vivas@gmail.com', 'fan_u131', 'UlisesV', '2026-02-15', '2005-05-05', 'Venezuela', 1),
(132, 'vania.roa@gmail.com', 'fan_v132', 'VaniaR', '2026-02-18', '1993-07-18', 'Venezuela', 1),
(133, 'wilfredo.diaz@yahoo.com', 'fan_w133', 'WilfD', '2026-02-20', '1988-09-09', 'Venezuela', 1),
(134, 'xandra.perez@gmail.com', 'fan_x134', 'XandraP', '2026-02-22', '1995-11-22', 'Venezuela', 1),
(135, 'yuri.marin@outlook.com', 'fan_y135', 'YuriM', '2026-02-25', '1982-12-12', 'Venezuela', 1),
(136, 'zenon.gil@gmail.com', 'fan_z136', 'ZenonG', '2026-02-28', '1990-01-01', 'Venezuela', 1),
(137, 'ada.ortiz@gmail.com', 'fan_a137', 'AdaO', '2026-03-01', '1998-02-14', 'Venezuela', 1),
(138, 'baldo.ruiz@yahoo.com', 'fan_b138', 'BaldoR', '2026-03-02', '1985-04-04', 'Venezuela', 1),
(139, 'cleo.pinto@gmail.com', 'fan_c139', 'CleoP', '2026-03-03', '1996-06-06', 'Venezuela', 1),
(140, 'duilio.soto@outlook.com', 'fan_d140', 'DuiS', '2026-03-04', '1987-08-08', 'Venezuela', 1),
(141, 'elba.larez@gmail.com', 'fan_e141', 'ElbaL', '2026-03-05', '2001-10-10', 'Venezuela', 1),
(142, 'fausto.vera@gmail.com', 'fan_f142', 'FausV', '2026-03-06', '1993-12-12', 'Venezuela', 1),
(143, 'gloria.ojeda@yahoo.com', 'fan_g143', 'GloO', '2026-03-07', '1989-01-20', 'Venezuela', 1),
(144, 'hector.roa@gmail.com', 'fan_h144', 'HecR', '2026-03-08', '1984-03-30', 'Venezuela', 1),
(145, 'irma.diaz@outlook.com', 'fan_i145', 'IrmaD', '2026-03-09', '2000-05-15', 'Venezuela', 1),
(146, 'jacobo.pena@gmail.com', 'fan_j146', 'JacoP', '2026-03-10', '1992-07-07', 'Venezuela', 1),
(147, 'lara.bello@gmail.com', 'fan_l147', 'LaraB', '2026-03-11', '1986-09-09', 'Venezuela', 1),
(148, 'mirko.arias@yahoo.com', 'fan_m148', 'MirkoA', '2026-03-11', '1999-11-11', 'Venezuela', 1),
(149, 'nina.salas@gmail.com', 'fan_n149', 'NinaS', '2026-03-11', '1991-01-01', 'Venezuela', 1),
(150, 'otto.luna@outlook.com', 'fan_o150', 'OttoL', '2026-03-11', '1983-02-28', 'Venezuela', 1),
-- IDs 151 al 200
(151, 'pepe.vivas@gmail.com', 'fan_p151', 'PepeV', '2026-03-11', '2005-04-12', 'Venezuela', 1),
(152, 'quana.ojeda@gmail.com', 'fan_q152', 'QuanaO', '2026-03-11', '1994-06-25', 'Venezuela', 1),
(153, 'raul.blanco@yahoo.com', 'fan_r153', 'RaulB', '2026-03-11', '1980-08-08', 'Venezuela', 1),
(154, 'sara.perez@gmail.com', 'fan_s154', 'SaraP', '2026-03-11', '1997-10-10', 'Venezuela', 1),
(155, 'tito.marin@outlook.com', 'fan_t155', 'TitoM', '2026-03-11', '1988-12-12', 'Venezuela', 1),
(156, 'una.gil@gmail.com', 'fan_u156', 'UnaG', '2026-03-11', '2002-02-14', 'Venezuela', 1),
(157, 'vito.ortiz@gmail.com', 'fan_v157', 'VitoO', '2026-03-11', '1993-04-20', 'Venezuela', 1),
(158, 'wendy.ruiz@yahoo.com', 'fan_w158', 'WendyR', '2026-03-11', '1985-06-06', 'Venezuela', 1),
(159, 'xavi.pinto@gmail.com', 'fan_x159', 'XaviP', '2026-03-11', '1996-08-15', 'Venezuela', 1),
(160, 'yara.soto@outlook.com', 'fan_y160', 'YaraS', '2026-03-11', '1989-10-10', 'Venezuela', 1),
(161, 'zia.larez@gmail.com', 'fan_z161', 'ZiaL', '2026-03-11', '1982-12-25', 'Venezuela', 1),
(162, 'alex.vera@gmail.com', 'fan_a162', 'AlexV', '2026-03-11', '2004-02-28', 'Venezuela', 1),
(163, 'bea.ojeda@yahoo.com', 'fan_b163', 'BeaO', '2026-03-11', '1991-04-04', 'Venezuela', 1),
(164, 'caio.roa@gmail.com', 'fan_c164', 'CaioR', '2026-03-11', '1986-06-06', 'Venezuela', 1),
(165, 'dina.diaz@outlook.com', 'fan_d165', 'DinaD', '2026-03-11', '1999-08-08', 'Venezuela', 1),
(166, 'enoz.pena@gmail.com', 'fan_e166', 'EnozP', '2026-03-11', '1984-10-10', 'Venezuela', 1),
(167, 'fina.bello@gmail.com', 'fan_f167', 'FinaB', '2026-03-11', '1995-12-12', 'Venezuela', 1),
(168, 'gaby.arias@yahoo.com', 'fan_g168', 'GabyA', '2026-03-11', '1987-02-14', 'Venezuela', 1),
(169, 'hiro.salas@gmail.com', 'fan_h169', 'HiroS', '2026-03-11', '2003-04-20', 'Venezuela', 1),
(170, 'iris.luna@outlook.com', 'fan_i170', 'IrisL', '2026-03-11', '1990-06-06', 'Venezuela', 1),
(171, 'javi.vivas@gmail.com', 'fan_j171', 'JaviV', '2026-03-11', '1983-08-08', 'Venezuela', 1),
(172, 'kira.ojeda@gmail.com', 'fan_k172', 'KiraO', '2026-03-11', '1996-10-10', 'Venezuela', 1),
(173, 'leo.roa@yahoo.com', 'fan_l173', 'LeoR', '2026-03-11', '1985-12-12', 'Venezuela', 1),
(174, 'mia.diaz@gmail.com', 'fan_m174', 'MiaD', '2026-03-11', '2001-02-14', 'Venezuela', 1),
(175, 'nico.pena@outlook.com', 'fan_n175', 'NicoP', '2026-03-11', '1994-04-20', 'Venezuela', 1),
(176, 'olai.bello@gmail.com', 'fan_o176', 'OlaiB', '2026-03-11', '1989-06-06', 'Venezuela', 1),
(177, 'pau.arias@gmail.com', 'fan_p177', 'PauA', '2026-03-11', '1982-08-08', 'Venezuela', 1),
(178, 'queo.salas@yahoo.com', 'fan_q178', 'QueoS', '2026-03-11', '1997-10-10', 'Venezuela', 1),
(179, 'roi.luna@gmail.com', 'fan_r179', 'RoiL', '2026-03-11', '1988-12-12', 'Venezuela', 1),
(180, 'sol.vivas@outlook.com', 'fan_s180', 'SolV', '2026-03-11', '2004-02-14', 'Venezuela', 1),
(181, 'tia.ojeda@gmail.com', 'fan_t181', 'TiaO', '2026-03-11', '1993-04-20', 'Venezuela', 1),
(182, 'uma.roa@gmail.com', 'fan_u182', 'UmaR', '2026-03-11', '1986-06-06', 'Venezuela', 1),
(183, 'val.diaz@yahoo.com', 'fan_v183', 'ValD', '2026-03-11', '1998-08-08', 'Venezuela', 1),
(184, 'wan.pena@gmail.com', 'fan_w184', 'WanP', '2026-03-11', '1981-10-10', 'Venezuela', 1),
(185, 'xia.bello@outlook.com', 'fan_x185', 'XiaB', '2026-03-11', '1995-12-12', 'Venezuela', 1),
(186, 'yan.arias@gmail.com', 'fan_y186', 'YanA', '2026-03-11', '1987-02-14', 'Venezuela', 1),
(187, 'zoe.salas@gmail.com', 'fan_z187', 'ZoeS', '2026-03-11', '2002-04-20', 'Venezuela', 1),
(188, 'ali.luna@yahoo.com', 'fan_a188', 'AliL', '2026-03-11', '1984-06-06', 'Venezuela', 1),
(189, 'ben.vivas@gmail.com', 'fan_b189', 'BenV', '2026-03-11', '1991-08-08', 'Venezuela', 1),
(190, 'cia.ojeda@outlook.com', 'fan_c190', 'CiaO', '2026-03-11', '1980-10-10', 'Venezuela', 1),
(191, 'don.roa@gmail.com', 'fan_d191', 'DonR', '2026-03-11', '1997-12-12', 'Venezuela', 1),
(192, 'eli.diaz@gmail.com', 'fan_e192', 'EliD', '2026-03-11', '1989-02-14', 'Venezuela', 1),
(193, 'fey.pena@yahoo.com', 'fan_f193', 'FeyP', '2026-03-11', '2000-04-20', 'Venezuela', 1),
(194, 'gus.bello@gmail.com', 'fan_g194', 'GusB', '2026-03-11', '1982-06-06', 'Venezuela', 1),
(195, 'hua.arias@outlook.com', 'fan_h195', 'HuaA', '2026-03-11', '1995-08-08', 'Venezuela', 1),
(196, 'ian.salas@gmail.com', 'fan_i196', 'IanS', '2026-03-11', '1986-10-10', 'Venezuela', 1),
(197, 'jia.luna@gmail.com', 'fan_j197', 'JiaL', '2026-03-11', '1999-12-12', 'Venezuela', 1),
(198, 'kay.vivas@yahoo.com', 'fan_k198', 'KayV', '2026-03-11', '1981-02-14', 'Venezuela', 1),
(199, 'lux.ojeda@gmail.com', 'fan_l199', 'LuxO', '2026-03-11', '1994-04-20', 'Venezuela', 1),
(200, 'may.roa@outlook.com', 'fan_m200', 'MayR', '2026-03-11', '1985-06-06', 'Venezuela', 1),
-- IDs 201 al 250
(201, 'neo.diaz@gmail.com', 'fan_n201', 'NeoD', '2026-03-11', '2001-08-08', 'Venezuela', 1),
(202, 'ora.pena@gmail.com', 'fan_o202', 'OraP', '2026-03-11', '1992-10-10', 'Venezuela', 1),
(203, 'pip.bello@yahoo.com', 'fan_p203', 'PipB', '2026-03-11', '1987-12-12', 'Venezuela', 1),
(204, 'quo.arias@gmail.com', 'fan_q204', 'QuoA', '2026-03-11', '1998-02-14', 'Venezuela', 1),
(205, 'ray.salas@outlook.com', 'fan_r205', 'RayS', '2026-03-11', '1980-04-20', 'Venezuela', 1),
(206, 'sky.luna@gmail.com', 'fan_s206', 'SkyL', '2026-03-11', '1995-06-06', 'Venezuela', 1),
(207, 'tex.vivas@gmail.com', 'fan_t207', 'TexV', '2026-03-11', '1986-08-08', 'Venezuela', 1),
(208, 'uma.ojeda@yahoo.com', 'fan_u208', 'UmaO', '2026-03-11', '1999-10-10', 'Venezuela', 1),
(209, 'val.roa@gmail.com', 'fan_v209', 'ValR', '2026-03-11', '1981-12-12', 'Venezuela', 1),
(210, 'wyn.diaz@outlook.com', 'fan_w210', 'WynD', '2026-03-11', '1994-02-14', 'Venezuela', 1),
(211, 'xia.pena@gmail.com', 'fan_x211', 'XiaP', '2026-03-11', '1985-04-20', 'Venezuela', 1),
(212, 'yan.bello@gmail.com', 'fan_y212', 'YanB', '2026-03-11', '2002-06-06', 'Venezuela', 1),
(213, 'zen.arias@yahoo.com', 'fan_z213', 'ZenA', '2026-03-11', '1988-08-08', 'Venezuela', 1),
(214, 'ade.salas@gmail.com', 'fan_a214', 'AdeS', '2026-03-11', '2003-10-10', 'Venezuela', 1),
(215, 'ben.luna@outlook.com', 'fan_b215', 'BenL', '2026-03-11', '1990-12-12', 'Venezuela', 1),
(216, 'cia.vivas@gmail.com', 'fan_c216', 'CiaV', '2026-03-11', '1983-02-14', 'Venezuela', 1),
(217, 'don.ojeda@gmail.com', 'fan_d217', 'DonO', '2026-03-11', '1996-04-20', 'Venezuela', 1),
(218, 'eli.roa@yahoo.com', 'fan_e218', 'EliR', '2026-03-11', '1984-06-06', 'Venezuela', 1),
(219, 'fey.diaz@gmail.com', 'fan_f219', 'FeyD', '2026-03-11', '2000-08-08', 'Venezuela', 1),
(220, 'gus.pena@outlook.com', 'fan_g220', 'GusP', '2026-03-11', '1982-10-10', 'Venezuela', 1),
(221, 'hua.bello@gmail.com', 'fan_h221', 'HuaB', '2026-03-11', '1995-12-12', 'Venezuela', 1),
(222, 'ian.arias@gmail.com', 'fan_i222', 'IanA', '2026-03-11', '1987-02-14', 'Venezuela', 1),
(223, 'jia.salas@yahoo.com', 'fan_j223', 'JiaS', '2026-03-11', '2004-04-20', 'Venezuela', 1),
(224, 'kay.luna@gmail.com', 'fan_k224', 'KayL', '2026-03-11', '1989-06-06', 'Venezuela', 1),
(225, 'lux.vivas@outlook.com', 'fan_l225', 'LuxV', '2026-03-11', '1980-08-08', 'Venezuela', 1),
(226, 'may.ojeda@gmail.com', 'fan_m226', 'MayO', '2026-03-11', '1997-10-10', 'Venezuela', 1),
(227, 'neo.roa@gmail.com', 'fan_n227', 'NeoR', '2026-03-11', '1988-12-12', 'Venezuela', 1),
(228, 'ora.diaz@yahoo.com', 'fan_o228', 'OraD', '2026-03-11', '2001-02-14', 'Venezuela', 1),
(229, 'pip.pena@gmail.com', 'fan_p229', 'PipP', '2026-03-11', '1992-04-20', 'Venezuela', 1),
(230, 'quo.bello@outlook.com', 'fan_q230', 'QuoB', '2026-03-11', '1984-06-06', 'Venezuela', 1),
(231, 'ray.arias@gmail.com', 'fan_r231', 'RayA', '2026-03-11', '1995-08-08', 'Venezuela', 1),
(232, 'sky.salas@gmail.com', 'fan_s232', 'SkyS', '2026-03-11', '1986-10-10', 'Venezuela', 1),
(233, 'tex.luna@yahoo.com', 'fan_t233', 'TexL', '2026-03-11', '1999-12-12', 'Venezuela', 1),
(234, 'uma.vivas@gmail.com', 'fan_u234', 'UmaV', '2026-03-11', '1981-02-14', 'Venezuela', 1),
(235, 'val.ojeda@outlook.com', 'fan_v235', 'ValO', '2026-03-11', '1994-04-20', 'Venezuela', 1),
(236, 'wyn.roa@gmail.com', 'fan_w236', 'WynR', '2026-03-11', '1985-06-06', 'Venezuela', 1),
(237, 'xia.diaz@gmail.com', 'fan_x237', 'XiaD', '2026-03-11', '2002-08-08', 'Venezuela', 1),
(238, 'yan.pena@yahoo.com', 'fan_y238', 'YanP', '2026-03-11', '1988-10-10', 'Venezuela', 1),
(239, 'zen.bello@gmail.com', 'fan_z239', 'ZenB', '2026-03-11', '2003-12-12', 'Venezuela', 1),
(240, 'ade.arias@outlook.com', 'fan_a240', 'AdeA', '2026-03-11', '1990-02-14', 'Venezuela', 1),
(241, 'ben.salas@gmail.com', 'fan_b241', 'BenS', '2026-03-11', '1983-04-20', 'Venezuela', 1),
(242, 'cia.luna@gmail.com', 'fan_c242', 'CiaL', '2026-03-11', '1996-06-06', 'Venezuela', 1),
(243, 'don.vivas@yahoo.com', 'fan_d243', 'DonV', '2026-03-11', '1984-08-08', 'Venezuela', 1),
(244, 'eli.ojeda@gmail.com', 'fan_e244', 'EliO', '2026-03-11', '2000-10-10', 'Venezuela', 1),
(245, 'fey.roa@outlook.com', 'fan_f245', 'FeyR', '2026-03-11', '1982-12-12', 'Venezuela', 1),
(246, 'gus.diaz@gmail.com', 'fan_g246', 'GusD', '2026-03-11', '1995-02-14', 'Venezuela', 1),
(247, 'hua.pena@gmail.com', 'fan_h247', 'HuaP', '2026-03-11', '1987-04-20', 'Venezuela', 1),
(248, 'ian.bello@yahoo.com', 'fan_i248', 'IanB', '2026-03-11', '2004-06-06', 'Venezuela', 1),
(249, 'jia.arias@gmail.com', 'fan_j249', 'JiaA', '2026-03-11', '1989-08-08', 'Venezuela', 1),
(250, 'kay.salas@outlook.com', 'fan_k250', 'KayS', '2026-03-11', '1980-10-10', 'Venezuela', 1);

SET IDENTITY_INSERT Usuario OFF;

-- ============================================================
-- TABLA: Creador (IDs 1 al 25)
-- Requisitos: 25 creadores, todas las categorías, 5 NSFW.
-- ============================================================
INSERT INTO Creador (idUsuario, biografia, banco_nombre, banco_cuenta, es_nsfw, idCategoria) VALUES
(1, 'Apasionado por los eSports y las transmisiones en vivo de RPGs clásicos.', 'Banesco', '01340001000123456789', 0, 1), -- Gaming
(2, 'Entrenadora certificada. Te ayudo a alcanzar tu mejor versión física con rutinas diarias.', 'Banco de Venezuela', '01020055001122334455', 0, 2), -- Fitness
(3, 'Review de hardware, setups y tutoriales de desarrollo de software moderno.', 'Mercantil', '01050012009988776655', 0, 3), -- Tecnología
(4, 'Ilustrador digital enfocado en concept art y modelado de personajes para videojuegos.', 'BBVA Provincial', '01080033005544332211', 0, 4), -- Arte Digital
(5, 'Compositor independiente. Comparto mis partituras y procesos de producción musical.', 'Bancamiga', '01720110006677889900', 0, 5), -- Música
(6, 'Chef profesional. Aprende conmigo los secretos de la gastronomía nacional e internacional.', 'Banesco', '01340001000111222333', 0, 6), -- Cocina
(7, 'Vlogs sobre viajes, estilo de vida y recomendaciones de destinos poco conocidos.', 'Banco de Venezuela', '01020055009998887776', 0, 7), -- Vlogs
(8, 'Divulgación científica y apoyo académico para estudiantes de ingeniería y computación.', 'Mercantil', '01050012001112223334', 0, 8), -- Educación
(9, 'Contenido auditivo relajante diseñado para ayudar a reducir el estrés y la ansiedad.', 'BBVA Provincial', '01080033008887776665', 0, 9), -- ASMR
(10, 'Stand-up y parodias sobre la vida cotidiana. Reír es la mejor medicina.', 'Bancamiga', '01720110003332221110', 0, 10), -- Comedia
(11, 'Consejos de maquillaje, cuidado de la piel y tendencias de moda para cada temporada.', 'Banesco', '01340001000777888999', 0, 11), -- Moda y Belleza
(12, 'Guía de turismo para mochileros. Cómo viajar por el mundo con bajo presupuesto.', 'Banco de Venezuela', '01020055004445556667', 0, 12), -- Viajes
(13, 'Educación financiera, consejos de ahorro y análisis del mercado de criptomonedas.', 'Mercantil', '01050012005554443332', 0, 13), -- Finanzas Personales
(14, 'Análisis profundo de la jornada deportiva, noticias y entrevistas exclusivas.', 'BBVA Provincial', '01080033002223334441', 0, 14), -- Deportes
(15, 'Reseñas de estrenos de cine, análisis de guiones y noticias de la industria.', 'Bancamiga', '01720110009990001112', 0, 15), -- Cine y TV
(16, 'Club de lectura digital. Reseñas de libros y consejos para escritores noveles.', 'Banesco', '01340001000222333444', 0, 16), -- Literatura
(17, 'Proyectos de carpintería y bricolaje paso a paso para mejorar tu hogar.', 'Banco de Venezuela', '01020055006667778889', 0, 17), -- Manualidades
(18, 'Análisis de actualidad y debates sobre los temas más relevantes de la semana.', 'Mercantil', '01050012008889990001', 0, 18), -- Política y Noticias
(19, 'Todo sobre el cuidado y entrenamiento de tus mascotas. Tips de veterinaria básica.', 'BBVA Provincial', '01080033001110009998', 0, 19), -- Mascotas
(20, 'Guía espiritual, lecturas de tarot y sesiones de meditación profunda.', 'Bancamiga', '01720110005556667774', 0, 20), -- Astrología y Esoterismo
(21, 'Creación de props y trajes épicos. Contenido detallado para la comunidad cosplay.', 'Banesco', '01340001000555444111', 1, 21), -- Cosplay (NSFW 1)
(22, 'Sesiones de modelaje profesional y detrás de cámara con contenido exclusivo.', 'Banco de Venezuela', '01020055001112224445', 1, 22), -- Fotografía y Modelaje (NSFW 2)
(23, 'Discusión sobre cultura otaku, análisis de mangas y teorías de anime.', 'Mercantil', '01050012003334445556', 1, 23), -- Anime y Manga (NSFW 3)
(24, 'Entrevistas y charlas en formato largo sobre temas de interés general.', 'BBVA Provincial', '01080033007776665554', 1, 24), -- Podcasts (NSFW 4)
(25, 'Torneos de videojuegos de alta competencia y contenido premium para fans.', 'Bancamiga', '01720110008884442221', 1, 1); -- Gaming (NSFW 5)

--- insert tabla nivelSubcripcion ---

SET IDENTITY_INSERT NivelSuscripcion ON;

-- Creador 1 (Gaming)
INSERT INTO NivelSuscripcion (id, idCreador, nombre, descripcion, precio_actual, esta_activo, orden) VALUES
(1, 1, 'Fan Bronce', 'Acceso al chat exclusivo y emblema de seguidor.', 4.99, 1, 1),
(2, 1, 'Pro Gamer', 'Acceso a partidas privadas y contenido detrás de cámaras.', 14.99, 1, 2);

-- Creador 2 (Fitness)
INSERT INTO NivelSuscripcion (id, idCreador, nombre, descripcion, precio_actual, esta_activo, orden) VALUES
(3, 2, 'Plan Principiante', 'Acceso a la biblioteca de ejercicios básicos.', 9.99, 1, 1),
(4, 2, 'Atleta Élite', 'Planes de alimentación personalizados y seguimiento semanal.', 24.99, 1, 2);

-- Creador 3 (Tecnología)
INSERT INTO NivelSuscripcion (id, idCreador, nombre, descripcion, precio_actual, esta_activo, orden) VALUES
(5, 3, 'Techie', 'Acceso anticipado a reviews de hardware.', 5.00, 1, 1),
(6, 3, 'Dev VIP', 'Código fuente de tutoriales y consultoría por chat.', 19.99, 1, 2);

-- Creador 4 (Arte Digital)
INSERT INTO NivelSuscripcion (id, idCreador, nombre, descripcion, precio_actual, esta_activo, orden) VALUES
(7, 4, 'Boceto', 'Acceso a archivos en baja resolución y pinceles.', 3.50, 1, 1),
(8, 4, 'Obra Maestra', 'Archivos PSD originales y videos del proceso completo.', 12.00, 1, 2);

-- Creador 5 (Música)
INSERT INTO NivelSuscripcion (id, idCreador, nombre, descripcion, precio_actual, esta_activo, orden) VALUES
(9, 5, 'Oyente', 'Versiones extendidas de mis tracks.', 4.00, 1, 1),
(10, 5, 'Músico', 'Partituras y sesiones de producción en vivo.', 15.00, 1, 2);

-- Creador 6 (Cocina)
INSERT INTO NivelSuscripcion (id, idCreador, nombre, descripcion, precio_actual, esta_activo, orden) VALUES
(11, 6, 'Comensal', 'Recetario mensual en PDF.', 6.99, 1, 1),
(12, 6, 'Sous Chef', 'Clases de cocina en vivo y sorteos de utensilios.', 20.00, 1, 2);

-- Creador 7 (Vlogs)
INSERT INTO NivelSuscripcion (id, idCreador, nombre, descripcion, precio_actual, esta_activo, orden) VALUES
(13, 7, 'Viajero', 'Postales digitales de mis viajes.', 2.99, 1, 1),
(14, 7, 'Explorador', 'Videos exclusivos de locaciones secretas.', 10.00, 1, 2);

-- Creador 8 (Educación)
INSERT INTO NivelSuscripcion (id, idCreador, nombre, descripcion, precio_actual, esta_activo, orden) VALUES
(15, 8, 'Estudiante', 'Guías de estudio y ejercicios resueltos.', 10.00, 1, 1),
(16, 8, 'Becado', 'Tutorías grupales y material avanzado.', 30.00, 1, 2);

-- Creador 9 (ASMR)
INSERT INTO NivelSuscripcion (id, idCreador, nombre, descripcion, precio_actual, esta_activo, orden) VALUES
(17, 9, 'Relax', 'Audios de alta fidelidad sin anuncios.', 5.00, 1, 1),
(18, 9, 'Zen', 'Videos personalizados de relajación.', 15.00, 1, 2);

-- Creador 10 (Comedia)
INSERT INTO NivelSuscripcion (id, idCreador, nombre, descripcion, precio_actual, esta_activo, orden) VALUES
(19, 10, 'Risa', 'Bloopers y tomas falsas.', 3.00, 1, 1),
(20, 10, 'VIP Comedy', 'Entradas VIP a shows y chat exclusivo.', 12.00, 1, 2);

-- Creador 11 (Moda)
INSERT INTO NivelSuscripcion (id, idCreador, nombre, descripcion, precio_actual, esta_activo, orden) VALUES
(21, 11, 'Chic', 'Lookbook exclusivo por temporada.', 7.50, 1, 1),
(22, 11, 'Icono', 'Asesoría de imagen personalizada.', 25.00, 1, 2);

-- Creador 12 (Viajes)
INSERT INTO NivelSuscripcion (id, idCreador, nombre, descripcion, precio_actual, esta_activo, orden) VALUES
(23, 12, 'Backpacker', 'Tips de ahorro exclusivos.', 4.00, 1, 1),
(24, 12, 'First Class', 'Itinerarios detallados y descuentos en hoteles.', 18.00, 1, 2);

-- Creador 13 (Finanzas)
INSERT INTO NivelSuscripcion (id, idCreador, nombre, descripcion, precio_actual, esta_activo, orden) VALUES
(25, 13, 'Ahorrador', 'Newsletter de noticias financieras.', 8.00, 1, 1),
(26, 13, 'Inversionista', 'Análisis de portafolio y señales de mercado.', 40.00, 1, 2);

-- Creador 14 (Deportes)
INSERT INTO NivelSuscripcion (id, idCreador, nombre, descripcion, precio_actual, esta_activo, orden) VALUES
(27, 14, 'Hincha', 'Estadísticas exclusivas post-partido.', 5.00, 1, 1),
(28, 14, 'MVP', 'Acceso a entrevistas sin censura.', 15.00, 1, 2);

-- Creador 15 (Cine)
INSERT INTO NivelSuscripcion (id, idCreador, nombre, descripcion, precio_actual, esta_activo, orden) VALUES
(29, 15, 'Cinéfilo', 'Recomendaciones ocultas de streaming.', 3.00, 1, 1),
(30, 15, 'Director', 'Análisis técnico de guiones y cinematografía.', 10.00, 1, 2);

-- Creador 16 (Literatura)
INSERT INTO NivelSuscripcion (id, idCreador, nombre, descripcion, precio_actual, esta_activo, orden) VALUES
(31, 16, 'Lector', 'Capítulos adelantados de mi próximo libro.', 5.00, 1, 1),
(32, 16, 'Escritor', 'Talleres de escritura creativa.', 20.00, 1, 2);

-- Creador 17 (Manualidades)
INSERT INTO NivelSuscripcion (id, idCreador, nombre, descripcion, precio_actual, esta_activo, orden) VALUES
(33, 17, 'Aprendiz', 'Planos de construcción básicos.', 6.00, 1, 1),
(34, 17, 'Maestro', 'Video-tutoriales detallados de proyectos grandes.', 15.00, 1, 2);

-- Creador 18 (Noticias)
INSERT INTO NivelSuscripcion (id, idCreador, nombre, descripcion, precio_actual, esta_activo, orden) VALUES
(35, 18, 'Informado', 'Reportajes especiales en texto.', 2.00, 1, 1),
(36, 18, 'Corresponsal', 'Acceso a debates privados y fuentes.', 10.00, 1, 2);

-- Creador 19 (Mascotas)
INSERT INTO NivelSuscripcion (id, idCreador, nombre, descripcion, precio_actual, esta_activo, orden) VALUES
(37, 19, 'Pet Lover', 'Tips de adiestramiento semanales.', 4.50, 1, 1),
(38, 19, 'Alpha', 'Consultas directas sobre salud animal.', 12.00, 1, 2);

-- Creador 20 (Astrología)
INSERT INTO NivelSuscripcion (id, idCreador, nombre, descripcion, precio_actual, esta_activo, orden) VALUES
(39, 20, 'Signo', 'Horóscopo detallado mensual.', 5.50, 1, 1),
(40, 20, 'Cosmos', 'Lectura de carta astral personalizada.', 30.00, 1, 2);

-- Creador 21 (Cosplay - NSFW)
INSERT INTO NivelSuscripcion (id, idCreador, nombre, descripcion, precio_actual, esta_activo, orden) VALUES
(41, 21, 'Socio', 'Galería de fotos de los trajes finales.', 10.00, 1, 1),
(42, 21, 'Premium NSFW', 'Sesiones exclusivas y set de fotos sin censura.', 35.00, 1, 2);

-- Creador 22 (Modelaje - NSFW)
INSERT INTO NivelSuscripcion (id, idCreador, nombre, descripcion, precio_actual, esta_activo, orden) VALUES
(43, 22, 'Cámara', 'Detrás de cámaras de las sesiones.', 15.00, 1, 1),
(44, 22, 'Censored OFF', 'Sets fotográficos completos de alto contenido.', 50.00, 1, 2);

-- Creador 23 (Anime - NSFW)
INSERT INTO NivelSuscripcion (id, idCreador, nombre, descripcion, precio_actual, esta_activo, orden) VALUES
(45, 23, 'Otaku', 'Acceso a mi servidor de Discord privado.', 5.00, 1, 1),
(46, 23, 'Hentai Art', 'Ilustraciones exclusivas NSFW.', 25.00, 1, 2);

-- Creador 24 (Podcasts - NSFW)
INSERT INTO NivelSuscripcion (id, idCreador, nombre, descripcion, precio_actual, esta_activo, orden) VALUES
(47, 24, 'Podcaster', 'Episodios sin cortes comerciales.', 4.00, 1, 1),
(48, 24, 'After Hours', 'Conversaciones explícitas y temas picantes.', 15.00, 1, 2);

-- Creador 25 (Gaming - NSFW)
INSERT INTO NivelSuscripcion (id, idCreador, nombre, descripcion, precio_actual, esta_activo, orden) VALUES
(49, 25, 'Player', 'Insignia de suscriptor en Twitch.', 5.00, 1, 1),
(50, 25, 'Uncut Gamer', 'Streams privados y contenido NSFW temático.', 20.00, 1, 2);

SET IDENTITY_INSERT NivelSuscripcion OFF;


------------metodos de pago------------

SET IDENTITY_INSERT MetodoPago ON;

-- ============================================================
-- SECCIÓN 1: MÉTODOS DE PAGO PARA CREADORES (IDs 1 - 25)
-- ============================================================
INSERT INTO MetodoPago (id, idUsuario, ultimos_4_digitos, marca, titular, fecha_expiracion, es_predeterminado) VALUES
(1, 1, '4521', 'Visa', 'Carlos Mendoza', '2028-05-01', 1),
(2, 2, '8832', 'Mastercard', 'Elena Rodriguez', '2027-11-01', 1),
(3, 3, '1002', 'American Express', 'Roberto Gomez', '2029-01-01', 1),
(4, 4, '5543', 'Visa', 'Ana Vargas', '2028-03-01', 1),
(5, 5, '2219', 'Mastercard', 'Luis Hernandez', '2027-08-01', 1),
(6, 6, '9910', 'Visa', 'Sofia Martinez', '2028-12-01', 1),
(7, 7, '3341', 'Mastercard', 'Marcos Diaz', '2027-06-01', 1),
(8, 8, '7722', 'Visa', 'Clara Lopez', '2029-04-01', 1),
(9, 9, '1155', 'American Express', 'Diego Sanchez', '2028-09-01', 1),
(10, 10, '6633', 'Visa', 'Patricia Ruiz', '2027-02-01', 1),
(11, 11, '8844', 'Mastercard', 'Julio Castillo', '2028-11-01', 1),
(12, 12, '2299', 'Visa', 'Laura Perez', '2029-07-01', 1),
(13, 13, '5566', 'Mastercard', 'Victor Morales', '2027-10-01', 1),
(14, 14, '7711', 'Visa', 'Monica Gonzalez', '2028-05-01', 1),
(15, 15, '4422', 'American Express', 'Raul Ramirez', '2029-01-01', 1),
(16, 16, '9933', 'Visa', 'Beatriz Torres', '2027-03-01', 1),
(17, 17, '3355', 'Mastercard', 'Hugo Flores', '2028-08-01', 1),
(18, 18, '6688', 'Visa', 'Irene Vasquez', '2029-12-01', 1),
(19, 19, '1122', 'Mastercard', 'Oscar Garcia', '2027-07-01', 1),
(20, 20, '5544', 'Visa', 'Teresa Blanco', '2028-04-01', 1),
(21, 21, '7799', 'American Express', 'Felipe Mendez', '2029-11-01', 1),
(22, 22, '2233', 'Visa', 'Gabriela Rios', '2027-09-01', 1),
(23, 23, '8811', 'Mastercard', 'Miguel Sosa', '2028-01-01', 1),
(24, 24, '4466', 'Visa', 'Andrea Pino', '2029-06-01', 1),
(25, 25, '9977', 'Mastercard', 'Ricardo Gil', '2027-05-01', 1);

-- ============================================================
-- SECCIÓN 2: MÉTODOS DE PAGO PARA FANS (IDs 26 - 250)
-- ============================================================
-- Registros 26 - 75
INSERT INTO MetodoPago (id, idUsuario, ultimos_4_digitos, marca, titular, fecha_expiracion, es_predeterminado) VALUES
(26, 26, '1234', 'Visa', 'Pedro Suarez', '2028-12-01', 1),
(27, 27, '5678', 'Mastercard', 'Maria Vera', '2027-06-01', 1),
(28, 28, '9012', 'Visa', 'Juan Lara', '2029-04-01', 1),
(29, 29, '3456', 'American Express', 'Jose Pinto', '2028-09-01', 1),
(30, 30, '7890', 'Visa', 'Carmen Ortiz', '2027-02-01', 1),
(31, 31, '1122', 'Mastercard', 'Francisco Mendez', '2028-11-01', 1),
(32, 32, '3344', 'Visa', 'Adriana Soto', '2029-07-01', 1),
(33, 33, '5566', 'Mastercard', 'Manuel Leon', '2027-10-01', 1),
(34, 34, '7788', 'Visa', 'Isabel Vargas', '2028-05-01', 1),
(35, 35, '9900', 'American Express', 'Luisa Rios', '2029-01-01', 1),
(36, 36, '1357', 'Visa', 'Ramon Blanco', '2027-03-01', 1),
(37, 37, '2468', 'Mastercard', 'Angelica Torres', '2028-08-01', 1),
(38, 38, '3691', 'Visa', 'Domingo Flores', '2029-12-01', 1),
(39, 39, '4823', 'Mastercard', 'Estefania Ramirez', '2027-07-01', 1),
(40, 40, '5934', 'Visa', 'Javier Gonzalez', '2028-04-01', 1),
(41, 41, '7145', 'American Express', 'Gabriel Morales', '2029-11-01', 1),
(42, 42, '8256', 'Visa', 'Daniela Perez', '2027-09-01', 1),
(43, 43, '9367', 'Mastercard', 'Ignacio Castillo', '2028-01-01', 1),
(44, 44, '1578', 'Visa', 'Valentina Ruiz', '2029-06-01', 1),
(45, 45, '2689', 'Mastercard', 'Omar Sanchez', '2027-05-01', 1),
(46, 46, '3790', 'Visa', 'Claudia Lopez', '2028-10-01', 1),
(47, 47, '4801', 'American Express', 'Fernando Diaz', '2029-03-01', 1),
(48, 48, '5912', 'Visa', 'Paola Martinez', '2027-12-01', 1),
(49, 49, '6023', 'Mastercard', 'Andres Gomez', '2028-02-01', 1),
(50, 50, '7134', 'Visa', 'Barbara Rodriguez', '2029-08-01', 1),
(51, 51, '1111', 'Visa', 'Sergio Pena', '2028-05-01', 1),
(52, 52, '2222', 'Mastercard', 'Lorena Arias', '2027-11-01', 1),
(53, 53, '3333', 'American Express', 'Mateo Soler', '2029-01-01', 1),
(54, 54, '4444', 'Visa', 'Valeria Gil', '2028-03-01', 1),
(55, 55, '5555', 'Mastercard', 'Fabiola Luna', '2027-08-01', 1),
(56, 56, '6666', 'Visa', 'Ricardo Bello', '2028-12-01', 1),
(57, 57, '7777', 'Mastercard', 'Camila Duque', '2027-06-01', 1),
(58, 58, '8888', 'Visa', 'Alejandro Vivas', '2029-04-01', 1),
(59, 59, '9999', 'American Express', 'Tania Marcano', '2028-09-01', 1),
(60, 60, '1010', 'Visa', 'German Pinto', '2027-02-01', 1),
(61, 61, '2020', 'Mastercard', 'Yolanda Salas', '2028-11-01', 1),
(62, 62, '3030', 'Visa', 'Vicente Guillen', '2029-07-01', 1),
(63, 63, '4040', 'Mastercard', 'Estela Brito', '2027-10-01', 1),
(64, 64, '5050', 'Visa', 'Bruno Ojeda', '2028-05-01', 1),
(65, 65, '6060', 'American Express', 'Elisa Nunez', '2029-01-01', 1),
(66, 66, '7070', 'Visa', 'Armando Rivas', '2027-03-01', 1),
(67, 67, '8080', 'Mastercard', 'Rebeca Colmenares', '2028-08-01', 1),
(68, 68, '9090', 'Visa', 'Salvador Bravo', '2029-12-01', 1),
(69, 69, '1212', 'Mastercard', 'Natalia Cordero', '2027-07-01', 1),
(70, 70, '2323', 'Visa', 'Walter Marin', '2028-04-01', 1),
(71, 71, '3434', 'American Express', 'Karina Ugalde', '2029-11-01', 1),
(72, 72, '4545', 'Visa', 'Leonardo Parra', '2027-09-01', 1),
(73, 73, '5656', 'Mastercard', 'Silvia Barrios', '2028-01-01', 1),
(74, 74, '6767', 'Visa', 'Fabian Larez', '2029-06-01', 1),
(75, 75, '7878', 'Mastercard', 'Miriam Ojeda', '2027-05-01', 1);

-- Registros 76 - 125
INSERT INTO MetodoPago (id, idUsuario, ultimos_4_digitos, marca, titular, fecha_expiracion, es_predeterminado) VALUES
(76, 76, '8989', 'Visa', 'Nelson Perez', '2028-10-01', 1),
(77, 77, '9091', 'American Express', 'Tatiana Vivas', '2029-03-01', 1),
(78, 78, '0101', 'Visa', 'Humberto Roa', '2027-12-01', 1),
(79, 79, '1213', 'Mastercard', 'Giovanna Perez', '2028-02-01', 1),
(80, 80, '2324', 'Visa', 'Cristian Diaz', '2029-08-01', 1),
(81, 81, '3435', 'Mastercard', 'Juliana Sosa', '2027-11-01', 1),
(82, 82, '4546', 'Visa', 'Marcelo Vega', '2028-07-01', 1),
(83, 83, '5657', 'American Express', 'Patricia Leon', '2029-04-01', 1),
(84, 84, '6768', 'Visa', 'Rodolfo Guzman', '2027-01-01', 1),
(85, 85, '7879', 'Mastercard', 'Ximena Vargas', '2028-06-01', 1),
(86, 86, '8990', 'Visa', 'Alfredo Prieto', '2029-10-01', 1),
(87, 87, '9092', 'Mastercard', 'Beatriz Marin', '2027-02-01', 1),
(88, 88, '0102', 'Visa', 'Claudio Ruiz', '2028-09-01', 1),
(89, 89, '1214', 'American Express', 'Diana Martinez', '2029-05-01', 1),
(90, 90, '2325', 'Visa', 'Enrique Pena', '2027-12-01', 1),
(91, 91, '3436', 'Mastercard', 'Florencia Gil', '2028-03-01', 1),
(92, 92, '4547', 'Visa', 'Gonzalo Ortiz', '2029-11-01', 1),
(93, 93, '5658', 'Mastercard', 'Helena Sanchez', '2027-08-01', 1),
(94, 94, '6769', 'Visa', 'Ivan Mendez', '2028-04-01', 1),
(95, 95, '7880', 'American Express', 'Josefina Vasquez', '2029-07-01', 1),
(96, 96, '8991', 'Visa', 'Kevin Castillo', '2027-01-01', 1),
(97, 97, '9093', 'Mastercard', 'Liliana Morales', '2028-05-01', 1),
(98, 98, '0103', 'Visa', 'Mario Garcia', '2029-09-01', 1),
(99, 99, '1215', 'Mastercard', 'Norma Rodriguez', '2027-03-01', 1),
(100, 100, '2326', 'Visa', 'Oliver Flores', '2028-12-01', 1),
(101, 101, '4441', 'Visa', 'Pablo Vera', '2028-05-01', 1),
(102, 102, '4442', 'Mastercard', 'Quintin Rios', '2027-11-01', 1),
(103, 103, '4443', 'American Express', 'Rosa Larez', '2029-01-01', 1),
(104, 104, '4444', 'Visa', 'Sergio Bello', '2028-03-01', 1),
(105, 105, '4445', 'Mastercard', 'Teresa Mendez', '2027-08-01', 1),
(106, 106, '4446', 'Visa', 'Uriel Salazar', '2028-12-01', 1),
(107, 107, '4447', 'Mastercard', 'Valeria Pinto', '2027-06-01', 1),
(108, 108, '4448', 'Visa', 'Wilmer Ojeda', '2029-04-01', 1),
(109, 109, '4449', 'American Express', 'Ximena Blanco', '2028-09-01', 1),
(110, 110, '4450', 'Visa', 'Yoel Guzman', '2027-02-01', 1),
(111, 111, '4451', 'Mastercard', 'Zoila Rojas', '2028-11-01', 1),
(112, 112, '4452', 'Visa', 'Abel Vargas', '2029-07-01', 1),
(113, 113, '4453', 'Mastercard', 'Belen Torres', '2027-10-01', 1),
(114, 114, '4454', 'Visa', 'Cesar Perez', '2028-05-01', 1),
(115, 115, '4455', 'American Express', 'Dora Marin', '2029-01-01', 1),
(116, 116, '4456', 'Visa', 'Elias Ruiz', '2027-03-01', 1),
(117, 117, '4457', 'Mastercard', 'Flora Gil', '2028-08-01', 1),
(118, 118, '4458', 'Visa', 'Guido Ortiz', '2029-12-01', 1),
(119, 119, '4459', 'Mastercard', 'Ilda Pinto', '2027-07-01', 1),
(120, 120, '4460', 'Visa', 'Jorge Larez', '2028-04-01', 1),
(121, 121, '4461', 'American Express', 'Karla Soto', '2029-11-01', 1),
(122, 122, '4462', 'Visa', 'Lucas Pena', '2027-09-01', 1),
(123, 123, '4463', 'Mastercard', 'Marta Vera', '2028-01-01', 1),
(124, 124, '4464', 'Visa', 'Noel Rios', '2029-06-01', 1),
(125, 125, '4465', 'Mastercard', 'Olga Bello', '2027-05-01', 1);

-- Registros 126 - 175
INSERT INTO MetodoPago (id, idUsuario, ultimos_4_digitos, marca, titular, fecha_expiracion, es_predeterminado) VALUES
(126, 126, '4466', 'Visa', 'Paco Arias', '2028-10-01', 1),
(127, 127, '4467', 'American Express', 'Querubin Salas', '2029-03-01', 1),
(128, 128, '4468', 'Visa', 'Rita Luna', '2027-12-01', 1),
(129, 129, '4469', 'Mastercard', 'Saul Ojeda', '2028-02-01', 1),
(130, 130, '4470', 'Visa', 'Tulia Blanco', '2029-08-01', 1),
(131, 131, '4471', 'Mastercard', 'Ulises Vivas', '2027-11-01', 1),
(132, 132, '4472', 'Visa', 'Vania Roa', '2028-07-01', 1),
(133, 133, '4473', 'American Express', 'Wilfredo Diaz', '2029-04-01', 1),
(134, 134, '4474', 'Visa', 'Xandra Perez', '2027-01-01', 1),
(135, 135, '4475', 'Mastercard', 'Yuri Marin', '2028-06-01', 1),
(136, 136, '4476', 'Visa', 'Zenon Gil', '2029-10-01', 1),
(137, 137, '4477', 'Mastercard', 'Ada Ortiz', '2027-02-01', 1),
(138, 138, '4478', 'Visa', 'Baldo Ruiz', '2028-09-01', 1),
(139, 139, '4479', 'American Express', 'Cleo Pinto', '2029-05-01', 1),
(140, 140, '4480', 'Visa', 'Duilio Soto', '2027-12-01', 1),
(141, 141, '4481', 'Mastercard', 'Elba Larez', '2028-03-01', 1),
(142, 142, '4482', 'Visa', 'Fausto Vera', '2029-11-01', 1),
(143, 143, '4483', 'Mastercard', 'Gloria Ojeda', '2027-08-01', 1),
(144, 144, '4484', 'Visa', 'Hector Roa', '2028-04-01', 1),
(145, 145, '4485', 'American Express', 'Irma Diaz', '2029-07-01', 1),
(146, 146, '4486', 'Visa', 'Jacobo Pena', '2027-01-01', 1),
(147, 147, '4487', 'Mastercard', 'Lara Bello', '2028-05-01', 1),
(148, 148, '4488', 'Visa', 'Mirko Arias', '2029-09-01', 1),
(149, 149, '4489', 'Mastercard', 'Nina Salas', '2027-03-01', 1),
(150, 150, '4490', 'Visa', 'Otto Luna', '2028-12-01', 1),
(151, 151, '5551', 'Visa', 'Pepe Vivas', '2028-05-01', 1),
(152, 152, '5552', 'Mastercard', 'Quana Ojeda', '2027-11-01', 1),
(153, 153, '5553', 'American Express', 'Raul Blanco', '2029-01-01', 1),
(154, 154, '5554', 'Visa', 'Sara Perez', '2028-03-01', 1),
(155, 155, '5555', 'Mastercard', 'Tito Marin', '2027-08-01', 1),
(156, 156, '5556', 'Visa', 'Una Gil', '2028-12-01', 1),
(157, 157, '5557', 'Mastercard', 'Vito Ortiz', '2027-06-01', 1),
(158, 158, '5558', 'Visa', 'Wendy Ruiz', '2029-04-01', 1),
(159, 159, '5559', 'American Express', 'Xavi Pinto', '2028-09-01', 1),
(160, 160, '5560', 'Visa', 'Yara Soto', '2027-02-01', 1),
(161, 161, '5561', 'Mastercard', 'Zia Larez', '2028-11-01', 1),
(162, 162, '5562', 'Visa', 'Alex Vera', '2029-07-01', 1),
(163, 163, '5563', 'Mastercard', 'Bea Ojeda', '2027-10-01', 1),
(164, 164, '5564', 'Visa', 'Caio Roa', '2028-05-01', 1),
(165, 165, '5565', 'American Express', 'Dina Diaz', '2029-01-01', 1),
(166, 166, '5566', 'Visa', 'Enoz Pena', '2027-03-01', 1),
(167, 167, '5567', 'Mastercard', 'Fina Bello', '2028-08-01', 1),
(168, 168, '5568', 'Visa', 'Gaby Arias', '2029-12-01', 1),
(169, 169, '5569', 'Mastercard', 'Hiro Salas', '2027-07-01', 1),
(170, 170, '5570', 'Visa', 'Iris Luna', '2028-04-01', 1),
(171, 171, '5571', 'American Express', 'Javi Vivas', '2029-11-01', 1),
(172, 172, '5572', 'Visa', 'Kira Ojeda', '2027-09-01', 1),
(173, 173, '5573', 'Mastercard', 'Leo Roa', '2028-01-01', 1),
(174, 174, '5574', 'Visa', 'Mia Diaz', '2029-06-01', 1),
(175, 175, '5575', 'Mastercard', 'Nico Pena', '2027-05-01', 1);

-- Registros 176 - 225
INSERT INTO MetodoPago (id, idUsuario, ultimos_4_digitos, marca, titular, fecha_expiracion, es_predeterminado) VALUES
(176, 176, '5576', 'Visa', 'Olai Bello', '2028-10-01', 1),
(177, 177, '5577', 'American Express', 'Pau Arias', '2029-03-01', 1),
(178, 178, '5578', 'Visa', 'Queo Salas', '2027-12-01', 1),
(179, 179, '5579', 'Mastercard', 'Roi Luna', '2028-02-01', 1),
(180, 180, '5580', 'Visa', 'Sol Vivas', '2029-08-01', 1),
(181, 181, '5581', 'Mastercard', 'Tia Ojeda', '2027-11-01', 1),
(182, 182, '5582', 'Visa', 'Uma Roa', '2028-07-01', 1),
(183, 183, '5583', 'American Express', 'Val Diaz', '2029-04-01', 1),
(184, 184, '5584', 'Visa', 'Wan Pena', '2027-01-01', 1),
(185, 185, '5585', 'Mastercard', 'Xia Bello', '2028-06-01', 1),
(186, 186, '5586', 'Visa', 'Yan Arias', '2029-10-01', 1),
(187, 187, '5587', 'Mastercard', 'Zoe Salas', '2027-02-01', 1),
(188, 188, '5588', 'Visa', 'Ali Luna', '2028-09-01', 1),
(189, 189, '5589', 'American Express', 'Ben Vivas', '2029-05-01', 1),
(190, 190, '5590', 'Visa', 'Cia Ojeda', '2027-12-01', 1),
(191, 191, '5591', 'Mastercard', 'Don Roa', '2028-03-01', 1),
(192, 192, '5592', 'Visa', 'Eli Diaz', '2029-11-01', 1),
(193, 193, '5593', 'Mastercard', 'Fey Pena', '2027-08-01', 1),
(194, 194, '5594', 'Visa', 'Gus Bello', '2028-04-01', 1),
(195, 195, '5595', 'American Express', 'Hua Arias', '2029-07-01', 1),
(196, 196, '5596', 'Visa', 'Ian Salas', '2027-01-01', 1),
(197, 197, '5597', 'Mastercard', 'Jia Luna', '2028-05-01', 1),
(198, 198, '5598', 'Visa', 'Kay Vivas', '2029-09-01', 1),
(199, 199, '5599', 'Mastercard', 'Lux Ojeda', '2027-03-01', 1),
(200, 200, '5600', 'Visa', 'May Roa', '2028-12-01', 1),
(201, 201, '6661', 'Visa', 'Neo Diaz', '2028-05-01', 1),
(202, 202, '6662', 'Mastercard', 'Ora Pena', '2027-11-01', 1),
(203, 203, '6663', 'American Express', 'Pip Bello', '2029-01-01', 1),
(204, 204, '6664', 'Visa', 'Quo Arias', '2028-03-01', 1),
(205, 205, '6665', 'Mastercard', 'Ray Salas', '2027-08-01', 1),
(206, 206, '6666', 'Visa', 'Sky Luna', '2028-12-01', 1),
(207, 207, '6667', 'Mastercard', 'Tex Vivas', '2027-06-01', 1),
(208, 208, '6668', 'Visa', 'Uma Ojeda', '2029-04-01', 1),
(209, 209, '6669', 'American Express', 'Val Roa', '2028-09-01', 1),
(210, 210, '6670', 'Visa', 'Wyn Diaz', '2027-02-01', 1),
(211, 211, '6671', 'Mastercard', 'Xia Pena', '2028-11-01', 1),
(212, 212, '6672', 'Visa', 'Yan Bello', '2029-07-01', 1),
(213, 213, '6673', 'Mastercard', 'Zen Arias', '2027-10-01', 1),
(214, 214, '6674', 'Visa', 'Ade Salas', '2028-05-01', 1),
(215, 215, '6675', 'American Express', 'Ben Luna', '2029-01-01', 1),
(216, 216, '6676', 'Visa', 'Cia Vivas', '2027-03-01', 1),
(217, 217, '6677', 'Mastercard', 'Don Ojeda', '2028-08-01', 1),
(218, 218, '6678', 'Visa', 'Eli Roa', '2029-12-01', 1),
(219, 219, '6679', 'Mastercard', 'Fey Diaz', '2027-07-01', 1),
(220, 220, '6680', 'Visa', 'Gus Pena', '2028-04-01', 1),
(221, 221, '6681', 'American Express', 'Hua Bello', '2029-11-01', 1),
(222, 222, '6682', 'Visa', 'Ian Arias', '2027-09-01', 1),
(223, 223, '6683', 'Mastercard', 'Jia Salas', '2028-01-01', 1),
(224, 224, '6684', 'Visa', 'Kay Luna', '2029-06-01', 1),
(225, 225, '6685', 'Mastercard', 'Lux Vivas', '2027-05-01', 1);

-- Registros 226 - 250
INSERT INTO MetodoPago (id, idUsuario, ultimos_4_digitos, marca, titular, fecha_expiracion, es_predeterminado) VALUES
(226, 226, '6686', 'Visa', 'May Ojeda', '2028-10-01', 1),
(227, 227, '6687', 'American Express', 'Neo Roa', '2029-03-01', 1),
(228, 228, '6688', 'Visa', 'Ora Diaz', '2027-12-01', 1),
(229, 229, '6689', 'Mastercard', 'Pip Pena', '2028-02-01', 1),
(230, 230, '6690', 'Visa', 'Quo Bello', '2029-08-01', 1),
(231, 231, '6691', 'Mastercard', 'Ray Arias', '2027-11-01', 1),
(232, 232, '6692', 'Visa', 'Sky Salas', '2028-07-01', 1),
(233, 233, '6693', 'American Express', 'Tex Luna', '2029-04-01', 1),
(234, 234, '6694', 'Visa', 'Uma Vivas', '2027-01-01', 1),
(235, 235, '6695', 'Mastercard', 'Val Ojeda', '2028-06-01', 1),
(236, 236, '6696', 'Visa', 'Wyn Roa', '2029-10-01', 1),
(237, 237, '6697', 'Mastercard', 'Xia Diaz', '2027-02-01', 1),
(238, 238, '6698', 'Visa', 'Yan Pena', '2028-09-01', 1),
(239, 239, '6699', 'American Express', 'Zen Bello', '2029-05-01', 1),
(240, 240, '6700', 'Visa', 'Ade Arias', '2027-12-01', 1),
(241, 241, '6701', 'Mastercard', 'Ben Salas', '2028-03-01', 1),
(242, 242, '6702', 'Visa', 'Cia Luna', '2029-11-01', 1),
(243, 243, '6703', 'Mastercard', 'Don Vivas', '2027-08-01', 1),
(244, 244, '6704', 'Visa', 'Eli Ojeda', '2028-04-01', 1),
(245, 245, '6705', 'American Express', 'Fey Roa', '2029-07-01', 1),
(246, 246, '6706', 'Visa', 'Gus Diaz', '2027-01-01', 1),
(247, 247, '6707', 'Mastercard', 'Hua Pena', '2028-05-01', 1),
(248, 248, '6708', 'Visa', 'Ian Bello', '2029-09-01', 1),
(249, 249, '6709', 'Mastercard', 'Jia Arias', '2027-03-01', 1),
(250, 250, '6710', 'Visa', 'Kay Salas', '2028-12-01', 1);

SET IDENTITY_INSERT MetodoPago OFF;


-------------subscripciones --------------

--------- 100 ususarios con 2 subcripciones activas ------------------

SET IDENTITY_INSERT Suscripcion ON;

-- Usuario 1 (Creador Gaming) -> Subs a Fitness (3) y Tech (5)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (1, 1, 3, '2026-02-10', '2026-03-10', NULL, 'Activa', 9.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (2, 1, 5, '2026-02-10', '2026-03-10', NULL, 'Activa', 5.00);
-- Usuario 2 (Creadora Fitness) -> Subs a Gaming (1) y Tech (5)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (3, 2, 1, '2026-01-15', '2026-02-15', NULL, 'Activa', 4.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (4, 2, 5, '2026-01-15', '2026-02-15', NULL, 'Activa', 5.00);
-- Usuario 3 (Creador Tech) -> Subs a Gaming (1) y Fitness (3)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (5, 3, 1, '2026-02-01', '2026-03-01', NULL, 'Activa', 4.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (6, 3, 3, '2026-02-01', '2026-03-01', NULL, 'Activa', 9.99);
-- Usuario 4 (Creadora Cocina) -> Subs a Fitness (3) y Tech (5)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (7, 4, 3, '2026-01-20', '2026-02-20', NULL, 'Activa', 9.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (8, 4, 5, '2026-01-20', '2026-02-20', NULL, 'Activa', 5.00);
-- Usuario 5 (Creador Tech) -> Subs a Gaming (1) y Fitness (3)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (9, 5, 1, '2026-02-05', '2026-03-05', NULL, 'Activa', 4.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (10, 5, 3, '2026-02-05', '2026-03-05', NULL, 'Activa', 9.99);
-- Usuario 6 -> Subs a Cocina (11) y Arte (7)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (11, 6, 11, '2026-01-10', '2026-02-10', NULL, 'Activa', 6.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (12, 6, 7, '2026-01-10', '2026-02-10', NULL, 'Activa', 3.50);
-- Usuario 7 -> Subs a Música (9) y Vlogs (13)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (13, 7, 9, '2026-02-12', '2026-03-12', NULL, 'Activa', 4.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (14, 7, 13, '2026-02-12', '2026-03-12', NULL, 'Activa', 2.99);
-- Usuario 8 -> Subs a Educación (15) y ASMR (17)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (15, 8, 15, '2026-01-18', '2026-02-18', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (16, 8, 17, '2026-01-18', '2026-02-18', NULL, 'Activa', 5.00);
-- Usuario 9 -> Subs a Comedia (19) y Moda (21)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (17, 9, 19, '2026-02-01', '2026-03-01', NULL, 'Activa', 3.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (18, 9, 21, '2026-02-01', '2026-03-01', NULL, 'Activa', 7.50);
-- Usuario 10 -> Subs a Viajes (23) y Finanzas (25)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (19, 10, 23, '2026-01-05', '2026-02-05', NULL, 'Activa', 4.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (20, 10, 25, '2026-01-05', '2026-02-05', NULL, 'Activa', 8.00);
-- Usuario 11 -> Subs a Deportes (27) y Cine (29)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (21, 11, 27, '2026-02-15', '2026-03-15', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (22, 11, 29, '2026-02-15', '2026-03-15', NULL, 'Activa', 3.00);
-- Usuario 12 -> Subs a Literatura (31) y Manualidades (33)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (23, 12, 31, '2026-01-20', '2026-02-20', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (24, 12, 33, '2026-01-20', '2026-02-20', NULL, 'Activa', 6.00);
-- Usuario 13 -> Subs a Noticias (35) y Mascotas (37)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (25, 13, 35, '2026-02-08', '2026-03-08', NULL, 'Activa', 2.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (26, 13, 37, '2026-02-08', '2026-03-08', NULL, 'Activa', 4.50);
-- Usuario 14 -> Subs a Astrología (39) y Gaming (1)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (27, 14, 39, '2026-01-12', '2026-02-12', NULL, 'Activa', 5.50);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (28, 14, 1, '2026-01-12', '2026-02-12', NULL, 'Activa', 4.99);
-- Usuario 15 -> Subs a Fitness (3) y Tech (5)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (29, 15, 3, '2026-02-20', '2026-03-20', NULL, 'Activa', 9.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (30, 15, 5, '2026-02-20', '2026-03-20', NULL, 'Activa', 5.00);
-- Usuario 16 -> Subs a Arte (7) y Cocina (11)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (31, 16, 7, '2026-01-25', '2026-02-25', NULL, 'Activa', 3.50);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (32, 16, 11, '2026-01-25', '2026-02-25', NULL, 'Activa', 6.99);
-- Usuario 17 -> Subs a Música (9) y Vlogs (13)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (33, 17, 9, '2026-02-05', '2026-03-05', NULL, 'Activa', 4.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (34, 17, 13, '2026-02-05', '2026-03-05', NULL, 'Activa', 2.99);
-- Usuario 18 -> Subs a Educación (15) y ASMR (17)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (35, 18, 15, '2026-01-10', '2026-02-10', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (36, 18, 17, '2026-01-10', '2026-02-10', NULL, 'Activa', 5.00);
-- Usuario 19 -> Subs a Comedia (19) y Moda (21)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (37, 19, 19, '2026-02-14', '2026-03-14', NULL, 'Activa', 3.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (38, 19, 21, '2026-02-14', '2026-03-14', NULL, 'Activa', 7.50);
-- Usuario 20 -> Subs a Viajes (23) y Finanzas (25)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (39, 20, 23, '2026-01-30', '2026-02-28', NULL, 'Activa', 4.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (40, 20, 25, '2026-01-30', '2026-02-28', NULL, 'Activa', 8.00);
-- Usuario 21 -> Subs a Deportes (27) y Cine (29)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (41, 21, 27, '2026-02-01', '2026-03-01', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (42, 21, 29, '2026-02-01', '2026-03-01', NULL, 'Activa', 3.00);
-- Usuario 22 -> Subs a Literatura (31) y Manualidades (33)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (43, 22, 31, '2026-01-05', '2026-02-05', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (44, 22, 33, '2026-01-05', '2026-02-05', NULL, 'Activa', 6.00);
-- Usuario 23 -> Subs a Noticias (35) y Mascotas (37)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (45, 23, 35, '2026-02-22', '2026-03-22', NULL, 'Activa', 2.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (46, 23, 37, '2026-02-22', '2026-03-22', NULL, 'Activa', 4.50);
-- Usuario 24 -> Subs a Astrología (39) y Gaming (1)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (47, 24, 39, '2026-01-18', '2026-02-18', NULL, 'Activa', 5.50);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (48, 24, 1, '2026-01-18', '2026-02-18', NULL, 'Activa', 4.99);
-- Usuario 25 -> Subs a Fitness (3) y Tech (5)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (49, 25, 3, '2026-02-10', '2026-03-10', NULL, 'Activa', 9.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (50, 25, 5, '2026-02-10', '2026-03-10', NULL, 'Activa', 5.00);
-- Usuario 26 -> Subs a Cocina (11) y Arte (7)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (51, 26, 11, '2026-01-15', '2026-02-15', NULL, 'Activa', 6.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (52, 26, 7, '2026-01-15', '2026-02-15', NULL, 'Activa', 3.50);
-- Usuario 27 -> Subs a Música (9) y Vlogs (13)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (53, 27, 9, '2026-02-01', '2026-03-01', NULL, 'Activa', 4.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (54, 27, 13, '2026-02-01', '2026-03-01', NULL, 'Activa', 2.99);
-- Usuario 28 -> Subs a Educación (15) y ASMR (17)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (55, 28, 15, '2026-01-20', '2026-02-20', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (56, 28, 17, '2026-01-20', '2026-02-20', NULL, 'Activa', 5.00);
-- Usuario 29 -> Subs a Comedia (19) y Moda (21)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (57, 29, 19, '2026-02-10', '2026-03-10', NULL, 'Activa', 3.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (58, 29, 21, '2026-02-10', '2026-03-10', NULL, 'Activa', 7.50);
-- Usuario 30 -> Subs a Viajes (23) y Finanzas (25)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (59, 30, 23, '2026-01-12', '2026-02-12', NULL, 'Activa', 4.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (60, 30, 25, '2026-01-12', '2026-02-12', NULL, 'Activa', 8.00);
-- Usuario 31 -> Subs a Deportes (27) y Cine (29)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (61, 31, 27, '2026-02-18', '2026-03-18', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (62, 31, 29, '2026-02-18', '2026-03-18', NULL, 'Activa', 3.00);
-- Usuario 32 -> Subs a Literatura (31) y Manualidades (33)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (63, 32, 31, '2026-01-30', '2026-02-28', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (64, 32, 33, '2026-01-30', '2026-02-28', NULL, 'Activa', 6.00);
-- Usuario 33 -> Subs a Noticias (35) y Mascotas (37)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (65, 33, 35, '2026-02-05', '2026-03-05', NULL, 'Activa', 2.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (66, 33, 37, '2026-02-05', '2026-03-05', NULL, 'Activa', 4.50);
-- Usuario 34 -> Subs a Astrología (39) y Gaming (1)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (67, 34, 39, '2026-01-22', '2026-02-22', NULL, 'Activa', 5.50);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (68, 34, 1, '2026-01-22', '2026-02-22', NULL, 'Activa', 4.99);
-- Usuario 35 -> Subs a Fitness (3) y Tech (5)
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (69, 35, 3, '2026-02-14', '2026-03-14', NULL, 'Activa', 9.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (70, 35, 5, '2026-02-14', '2026-03-14', NULL, 'Activa', 5.00);

-- ============================================================
-- INTERSECCIÓN CRÍTICA (Usuarios 36-40: Fitness + Tech)
-- Registros de 2025 para gasto histórico > $140
-- ============================================================
-- Usuario 36
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (71, 36, 4, '2025-06-10', '2026-03-10', NULL, 'Activa', 24.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (72, 36, 6, '2025-06-10', '2026-03-10', NULL, 'Activa', 19.99);
-- Usuario 37
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (73, 37, 4, '2025-06-15', '2026-03-15', NULL, 'Activa', 24.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (74, 37, 6, '2025-06-15', '2026-03-15', NULL, 'Activa', 19.99);
-- Usuario 38
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (75, 38, 4, '2025-07-01', '2026-03-01', NULL, 'Activa', 24.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (76, 38, 6, '2025-07-01', '2026-03-01', NULL, 'Activa', 19.99);
-- Usuario 39
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (77, 39, 4, '2025-07-10', '2026-03-10', NULL, 'Activa', 24.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (78, 39, 6, '2025-07-10', '2026-03-10', NULL, 'Activa', 19.99);
-- Usuario 40
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (79, 40, 4, '2025-08-01', '2026-03-01', NULL, 'Activa', 24.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (80, 40, 6, '2025-08-01', '2026-03-01', NULL, 'Activa', 19.99);

-- Usuarios 41 al 50 (2 subs activas c/u)
-- Usuario 41
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (81, 41, 15, '2026-01-05', '2026-02-05', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (82, 41, 17, '2026-01-05', '2026-02-05', NULL, 'Activa', 5.00);
-- Usuario 42
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (83, 42, 19, '2026-02-10', '2026-03-10', NULL, 'Activa', 3.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (84, 42, 21, '2026-02-10', '2026-03-10', NULL, 'Activa', 7.50);
-- Usuario 43
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (85, 43, 23, '2026-01-22', '2026-02-22', NULL, 'Activa', 4.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (86, 43, 25, '2026-01-22', '2026-02-22', NULL, 'Activa', 8.00);
-- Usuario 44
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (87, 44, 27, '2026-02-05', '2026-03-05', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (88, 44, 29, '2026-02-05', '2026-03-05', NULL, 'Activa', 3.00);
-- Usuario 45
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (89, 45, 31, '2026-01-15', '2026-02-15', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (90, 45, 33, '2026-01-15', '2026-02-15', NULL, 'Activa', 6.00);
-- Usuario 46
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (91, 46, 35, '2026-02-12', '2026-03-12', NULL, 'Activa', 2.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (92, 46, 37, '2026-02-12', '2026-03-12', NULL, 'Activa', 4.50);
-- Usuario 47
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (93, 47, 39, '2026-01-08', '2026-02-08', NULL, 'Activa', 5.50);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (94, 47, 41, '2026-01-08', '2026-02-08', NULL, 'Activa', 10.00);
-- Usuario 48
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (95, 48, 43, '2026-02-20', '2026-03-20', NULL, 'Activa', 15.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (96, 48, 45, '2026-02-20', '2026-03-20', NULL, 'Activa', 5.00);
-- Usuario 49
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (97, 49, 47, '2026-01-25', '2026-02-25', NULL, 'Activa', 4.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (98, 49, 49, '2026-01-25', '2026-02-25', NULL, 'Activa', 5.00);
-- Usuario 50
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (99, 50, 2, '2026-02-01', '2026-03-01', NULL, 'Activa', 14.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (100, 50, 4, '2026-02-01', '2026-03-01', NULL, 'Activa', 24.99);

-- Usuario 51
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (101, 51, 1, '2026-02-01', '2026-03-01', NULL, 'Activa', 4.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (102, 51, 3, '2026-02-05', '2026-03-05', NULL, 'Activa', 9.99);
-- Usuario 52
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (103, 52, 5, '2026-02-10', '2026-03-10', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (104, 52, 7, '2026-02-12', '2026-03-12', NULL, 'Activa', 3.50);
-- Usuario 53
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (105, 53, 9, '2026-02-15', '2026-03-15', NULL, 'Activa', 4.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (106, 53, 11, '2026-02-16', '2026-03-16', NULL, 'Activa', 6.99);
-- Usuario 54
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (107, 54, 13, '2026-02-02', '2026-03-02', NULL, 'Activa', 2.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (108, 54, 15, '2026-02-08', '2026-03-08', NULL, 'Activa', 10.00);
-- Usuario 55
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (109, 55, 17, '2026-02-18', '2026-03-18', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (110, 55, 19, '2026-02-20', '2026-03-20', NULL, 'Activa', 3.00);
-- Usuario 56
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (111, 56, 21, '2026-02-22', '2026-03-22', NULL, 'Activa', 7.50);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (112, 56, 23, '2026-02-25', '2026-03-25', NULL, 'Activa', 4.00);
-- Usuario 57
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (113, 57, 25, '2026-02-01', '2026-03-01', NULL, 'Activa', 8.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (114, 57, 27, '2026-02-05', '2026-03-05', NULL, 'Activa', 5.00);
-- Usuario 58
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (115, 58, 29, '2026-02-10', '2026-03-10', NULL, 'Activa', 3.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (116, 58, 31, '2026-02-15', '2026-03-15', NULL, 'Activa', 5.00);
-- Usuario 59
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (117, 59, 33, '2026-02-18', '2026-03-18', NULL, 'Activa', 6.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (118, 59, 35, '2026-02-20', '2026-03-20', NULL, 'Activa', 2.00);
-- Usuario 60
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (119, 60, 37, '2026-02-05', '2026-03-05', NULL, 'Activa', 4.50);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (120, 60, 39, '2026-02-10', '2026-03-10', NULL, 'Activa', 5.50);
-- Usuario 61
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (121, 61, 41, '2026-02-12', '2026-03-12', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (122, 61, 43, '2026-02-15', '2026-03-15', NULL, 'Activa', 15.00);
-- Usuario 62
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (123, 62, 45, '2026-02-02', '2026-03-02', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (124, 62, 47, '2026-02-08', '2026-03-08', NULL, 'Activa', 4.00);
-- Usuario 63
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (125, 63, 49, '2026-02-18', '2026-03-18', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (126, 63, 2, '2026-02-20', '2026-03-20', NULL, 'Activa', 14.99);
-- Usuario 64
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (127, 64, 4, '2026-02-22', '2026-03-22', NULL, 'Activa', 24.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (128, 64, 6, '2026-02-25', '2026-03-25', NULL, 'Activa', 19.99);
-- Usuario 65
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (129, 65, 8, '2026-02-01', '2026-03-01', NULL, 'Activa', 12.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (130, 65, 10, '2026-02-05', '2026-03-05', NULL, 'Activa', 15.00);
-- Usuario 66
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (131, 66, 12, '2026-02-10', '2026-03-10', NULL, 'Activa', 20.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (132, 66, 14, '2026-02-15', '2026-03-15', NULL, 'Activa', 10.00);
-- Usuario 67
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (133, 67, 16, '2026-02-18', '2026-03-18', NULL, 'Activa', 30.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (134, 67, 18, '2026-02-20', '2026-03-20', NULL, 'Activa', 15.00);
-- Usuario 68
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (135, 68, 20, '2026-02-05', '2026-03-05', NULL, 'Activa', 12.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (136, 68, 22, '2026-02-10', '2026-03-10', NULL, 'Activa', 25.00);
-- Usuario 69
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (137, 69, 24, '2026-02-12', '2026-03-12', NULL, 'Activa', 18.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (138, 69, 26, '2026-02-15', '2026-03-15', NULL, 'Activa', 40.00);
-- Usuario 70
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (139, 70, 28, '2026-02-02', '2026-03-02', NULL, 'Activa', 15.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (140, 70, 30, '2026-02-08', '2026-03-08', NULL, 'Activa', 10.00);
-- Usuario 71
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (141, 71, 32, '2026-02-18', '2026-03-18', NULL, 'Activa', 20.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (142, 71, 34, '2026-02-20', '2026-03-20', NULL, 'Activa', 15.00);
-- Usuario 72
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (143, 72, 36, '2026-02-22', '2026-03-22', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (144, 72, 38, '2026-02-25', '2026-03-25', NULL, 'Activa', 12.00);
-- Usuario 73
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (145, 73, 40, '2026-02-01', '2026-03-01', NULL, 'Activa', 30.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (146, 73, 42, '2026-02-05', '2026-03-05', NULL, 'Activa', 35.00);
-- Usuario 74
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (147, 74, 44, '2026-02-10', '2026-03-10', NULL, 'Activa', 50.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (148, 74, 46, '2026-02-15', '2026-03-15', NULL, 'Activa', 25.00);
-- Usuario 75
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (149, 75, 48, '2026-02-18', '2026-03-18', NULL, 'Activa', 15.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (150, 75, 50, '2026-02-20', '2026-03-20', NULL, 'Activa', 20.00);
-- Usuario 76
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (151, 76, 1, '2026-02-05', '2026-03-05', NULL, 'Activa', 4.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (152, 76, 4, '2026-02-10', '2026-03-10', NULL, 'Activa', 24.99);
-- Usuario 77
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (153, 77, 5, '2026-02-12', '2026-03-12', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (154, 77, 8, '2026-02-15', '2026-03-15', NULL, 'Activa', 12.00);
-- Usuario 78
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (155, 78, 9, '2026-02-02', '2026-03-02', NULL, 'Activa', 4.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (156, 78, 12, '2026-02-08', '2026-03-08', NULL, 'Activa', 20.00);
-- Usuario 79
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (157, 79, 13, '2026-02-18', '2026-03-18', NULL, 'Activa', 2.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (158, 79, 16, '2026-02-20', '2026-03-20', NULL, 'Activa', 30.00);
-- Usuario 80
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (159, 80, 17, '2026-02-22', '2026-03-22', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (160, 80, 20, '2026-02-25', '2026-03-25', NULL, 'Activa', 12.00);
-- Usuario 81
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (161, 81, 21, '2026-02-01', '2026-03-01', NULL, 'Activa', 7.50);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (162, 81, 24, '2026-02-05', '2026-03-05', NULL, 'Activa', 18.00);
-- Usuario 82
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (163, 82, 25, '2026-02-10', '2026-03-10', NULL, 'Activa', 8.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (164, 82, 28, '2026-02-15', '2026-03-15', NULL, 'Activa', 15.00);
-- Usuario 83
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (165, 83, 29, '2026-02-18', '2026-03-18', NULL, 'Activa', 3.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (166, 83, 32, '2026-02-20', '2026-03-20', NULL, 'Activa', 20.00);
-- Usuario 84
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (167, 84, 33, '2026-02-05', '2026-03-05', NULL, 'Activa', 6.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (168, 84, 36, '2026-02-10', '2026-03-10', NULL, 'Activa', 10.00);
-- Usuario 85
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (169, 85, 37, '2026-02-12', '2026-03-12', NULL, 'Activa', 4.50);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (170, 85, 40, '2026-02-15', '2026-03-15', NULL, 'Activa', 30.00);
-- Usuario 86
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (171, 86, 41, '2026-02-02', '2026-03-02', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (172, 86, 44, '2026-02-08', '2026-03-08', NULL, 'Activa', 50.00);
-- Usuario 87
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (173, 87, 45, '2026-02-18', '2026-03-18', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (174, 87, 48, '2026-02-20', '2026-03-20', NULL, 'Activa', 15.00);
-- Usuario 88
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (175, 88, 49, '2026-02-22', '2026-03-22', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (176, 88, 3, '2026-02-25', '2026-03-25', NULL, 'Activa', 9.99);
-- Usuario 89
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (177, 89, 7, '2026-02-01', '2026-03-01', NULL, 'Activa', 3.50);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (178, 89, 11, '2026-02-05', '2026-03-05', NULL, 'Activa', 6.99);
-- Usuario 90
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (179, 90, 15, '2026-02-10', '2026-03-10', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (180, 90, 19, '2026-02-15', '2026-03-15', NULL, 'Activa', 3.00);
-- Usuario 91
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (181, 91, 23, '2026-02-18', '2026-03-18', NULL, 'Activa', 4.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (182, 91, 27, '2026-02-20', '2026-03-20', NULL, 'Activa', 5.00);
-- Usuario 92
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (183, 92, 31, '2026-02-05', '2026-03-05', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (184, 92, 35, '2026-02-10', '2026-03-10', NULL, 'Activa', 2.00);
-- Usuario 93
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (185, 93, 39, '2026-02-12', '2026-03-12', NULL, 'Activa', 5.50);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (186, 93, 43, '2026-02-15', '2026-03-15', NULL, 'Activa', 15.00);
-- Usuario 94
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (187, 94, 47, '2026-02-02', '2026-03-02', NULL, 'Activa', 4.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (188, 94, 2, '2026-02-08', '2026-03-08', NULL, 'Activa', 14.99);
-- Usuario 95
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (189, 95, 6, '2026-02-18', '2026-03-18', NULL, 'Activa', 19.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (190, 95, 10, '2026-02-20', '2026-03-20', NULL, 'Activa', 15.00);
-- Usuario 96
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (191, 96, 14, '2026-02-22', '2026-03-22', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (192, 96, 18, '2026-02-25', '2026-03-25', NULL, 'Activa', 15.00);
-- Usuario 97
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (193, 97, 22, '2026-02-01', '2026-03-01', NULL, 'Activa', 25.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (194, 97, 26, '2026-02-05', '2026-03-05', NULL, 'Activa', 40.00);
-- Usuario 98
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (195, 98, 30, '2026-02-10', '2026-03-10', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (196, 98, 34, '2026-02-15', '2026-03-15', NULL, 'Activa', 15.00);
-- Usuario 99
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (197, 99, 38, '2026-02-18', '2026-03-18', NULL, 'Activa', 12.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (198, 99, 42, '2026-02-20', '2026-03-20', NULL, 'Activa', 35.00);
-- Usuario 100
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (199, 100, 46, '2026-02-05', '2026-03-05', NULL, 'Activa', 25.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (200, 100, 50, '2026-02-10', '2026-03-10', NULL, 'Activa', 20.00);



-------------Descripción: Usuarios del 101 al 133 con 3 suscripciones (2 Activas, 1 Histórica).
-------------IDs Suscripción: 201 al 299.

-- Usuario 101
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (201, 101, 1, '2026-02-05', '2026-03-05', NULL, 'Activa', 4.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (202, 101, 6, '2026-02-10', '2026-03-10', NULL, 'Activa', 19.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (203, 101, 3, '2025-06-15', '2025-07-15', '2025-07-15', 'Vencida', 9.99);

-- Usuario 102
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (204, 102, 2, '2026-02-12', '2026-03-12', NULL, 'Activa', 14.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (205, 102, 7, '2026-02-15', '2026-03-15', NULL, 'Activa', 3.50);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (206, 102, 5, '2025-08-01', '2025-09-01', '2025-08-20', 'Cancelada', 5.00);

-- Usuario 103
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (207, 103, 4, '2026-02-18', '2026-03-18', NULL, 'Activa', 24.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (208, 103, 9, '2026-02-20', '2026-03-20', NULL, 'Activa', 4.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (209, 103, 8, '2025-05-10', '2025-06-10', '2025-06-10', 'Vencida', 12.00);

-- Usuario 104
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (210, 104, 11, '2026-02-02', '2026-03-02', NULL, 'Activa', 6.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (211, 104, 14, '2026-02-08', '2026-03-08', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (212, 104, 10, '2025-09-15', '2025-10-15', '2025-09-25', 'Cancelada', 15.00);

-- Usuario 105
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (213, 105, 13, '2026-02-10', '2026-03-10', NULL, 'Activa', 2.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (214, 105, 16, '2026-02-14', '2026-03-14', NULL, 'Activa', 30.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (215, 105, 12, '2025-11-01', '2025-12-01', '2025-12-01', 'Vencida', 20.00);

-- Usuario 106
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (216, 106, 15, '2026-02-05', '2026-03-05', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (217, 106, 18, '2026-02-12', '2026-03-12', NULL, 'Activa', 15.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (218, 106, 17, '2025-10-10', '2025-11-10', '2025-11-10', 'Vencida', 5.00);

-- Usuario 107
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (219, 107, 19, '2026-02-01', '2026-03-01', NULL, 'Activa', 3.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (220, 107, 22, '2026-02-08', '2026-03-08', NULL, 'Activa', 25.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (221, 107, 20, '2025-07-20', '2025-08-20', '2025-08-05', 'Cancelada', 12.00);

-- Usuario 108
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (222, 108, 21, '2026-02-15', '2026-03-15', NULL, 'Activa', 7.50);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (223, 108, 24, '2026-02-20', '2026-03-20', NULL, 'Activa', 18.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (224, 108, 23, '2025-04-15', '2025-05-15', '2025-05-15', 'Vencida', 4.00);

-- Usuario 109
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (225, 109, 25, '2026-02-05', '2026-03-05', NULL, 'Activa', 8.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (226, 109, 28, '2026-02-10', '2026-03-10', NULL, 'Activa', 15.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (227, 109, 26, '2025-12-01', '2026-01-01', '2026-01-01', 'Vencida', 40.00);

-- Usuario 110
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (228, 110, 27, '2026-02-12', '2026-03-12', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (229, 110, 30, '2026-02-18', '2026-03-18', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (230, 110, 29, '2025-08-10', '2025-09-10', '2025-09-10', 'Vencida', 3.00);

-- Usuario 111
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (231, 111, 31, '2026-02-02', '2026-03-02', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (232, 111, 34, '2026-02-08', '2026-03-08', NULL, 'Activa', 15.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (233, 111, 32, '2025-11-20', '2025-12-20', '2025-12-05', 'Cancelada', 20.00);

-- Usuario 112
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (234, 112, 33, '2026-02-10', '2026-03-10', NULL, 'Activa', 6.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (235, 112, 36, '2026-02-15', '2026-03-15', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (236, 112, 35, '2025-06-05', '2025-07-05', '2025-07-05', 'Vencida', 2.00);

-- Usuario 113
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (237, 113, 37, '2026-02-20', '2026-03-20', NULL, 'Activa', 4.50);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (238, 113, 40, '2026-02-25', '2026-03-25', NULL, 'Activa', 30.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (239, 113, 39, '2025-09-01', '2025-10-01', '2025-10-01', 'Vencida', 5.50);

-- Usuario 114
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (240, 114, 41, '2026-02-01', '2026-03-01', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (241, 114, 44, '2026-02-05', '2026-03-05', NULL, 'Activa', 50.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (242, 114, 43, '2025-04-20', '2025-05-20', '2025-05-01', 'Cancelada', 15.00);

-- Usuario 115
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (243, 115, 45, '2026-02-12', '2026-03-12', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (244, 115, 48, '2026-02-18', '2026-03-18', NULL, 'Activa', 15.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (245, 115, 47, '2025-12-10', '2026-01-10', '2026-01-10', 'Vencida', 4.00);

-- Usuario 116
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (246, 116, 49, '2026-02-05', '2026-03-05', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (247, 116, 2, '2026-02-10', '2026-03-10', NULL, 'Activa', 14.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (248, 116, 1, '2025-08-15', '2025-09-15', '2025-09-15', 'Vencida', 4.99);

-- Usuario 117
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (249, 117, 3, '2026-02-15', '2026-03-15', NULL, 'Activa', 9.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (250, 117, 6, '2026-02-20', '2026-03-20', NULL, 'Activa', 19.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (251, 117, 4, '2025-07-05', '2025-08-05', '2025-07-25', 'Cancelada', 24.99);

-- Usuario 118
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (252, 118, 5, '2026-02-01', '2026-03-01', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (253, 118, 8, '2026-02-08', '2026-03-08', NULL, 'Activa', 12.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (254, 118, 7, '2025-10-15', '2025-11-15', '2025-11-15', 'Vencida', 3.50);

-- Usuario 119
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (255, 119, 9, '2026-02-10', '2026-03-10', NULL, 'Activa', 4.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (256, 119, 12, '2026-02-15', '2026-03-15', NULL, 'Activa', 20.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (257, 119, 10, '2025-11-20', '2025-12-20', '2025-12-20', 'Vencida', 15.00);

-- Usuario 120
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (258, 120, 11, '2026-02-05', '2026-03-05', NULL, 'Activa', 6.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (259, 120, 14, '2026-02-12', '2026-03-12', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (260, 120, 13, '2025-05-25', '2025-06-25', '2025-06-10', 'Cancelada', 2.99);

-- Usuario 121
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (261, 121, 15, '2026-02-18', '2026-03-18', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (262, 121, 18, '2026-02-22', '2026-03-22', NULL, 'Activa', 15.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (263, 121, 16, '2025-09-05', '2025-10-05', '2025-10-05', 'Vencida', 30.00);

-- Usuario 122
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (264, 122, 17, '2026-02-01', '2026-03-01', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (265, 122, 20, '2026-02-08', '2026-03-08', NULL, 'Activa', 12.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (266, 122, 19, '2025-06-12', '2025-07-12', '2025-07-12', 'Vencida', 3.00);

-- Usuario 123
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (267, 123, 21, '2026-02-10', '2026-03-10', NULL, 'Activa', 7.50);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (268, 123, 24, '2026-02-15', '2026-03-15', NULL, 'Activa', 18.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (269, 123, 22, '2025-08-20', '2025-09-20', '2025-09-05', 'Cancelada', 25.00);

-- Usuario 124
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (270, 124, 23, '2026-02-05', '2026-03-05', NULL, 'Activa', 4.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (271, 124, 26, '2026-02-12', '2026-03-12', NULL, 'Activa', 40.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (272, 124, 25, '2025-10-01', '2025-11-01', '2025-11-01', 'Vencida', 8.00);

-- Usuario 125
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (273, 125, 27, '2026-02-18', '2026-03-18', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (274, 125, 30, '2026-02-22', '2026-03-22', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (275, 125, 28, '2025-12-15', '2026-01-15', '2026-01-15', 'Vencida', 15.00);

-- Usuario 126
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (276, 126, 29, '2026-02-01', '2026-03-01', NULL, 'Activa', 3.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (277, 126, 32, '2026-02-08', '2026-03-08', NULL, 'Activa', 20.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (278, 126, 31, '2025-07-10', '2025-08-10', '2025-07-25', 'Cancelada', 5.00);

-- Usuario 127
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (279, 127, 33, '2026-02-10', '2026-03-10', NULL, 'Activa', 6.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (280, 127, 36, '2026-02-15', '2026-03-15', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (281, 127, 34, '2025-09-18', '2025-10-18', '2025-10-18', 'Vencida', 15.00);

-- Usuario 128
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (282, 128, 35, '2026-02-05', '2026-03-05', NULL, 'Activa', 2.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (283, 128, 38, '2026-02-12', '2026-03-12', NULL, 'Activa', 12.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (284, 128, 37, '2025-11-05', '2025-12-05', '2025-12-05', 'Vencida', 4.50);

-- Usuario 129
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (285, 129, 39, '2026-02-18', '2026-03-18', NULL, 'Activa', 5.50);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (286, 129, 42, '2026-02-22', '2026-03-22', NULL, 'Activa', 35.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (287, 129, 40, '2025-08-15', '2025-09-15', '2025-09-01', 'Cancelada', 30.00);

-- Usuario 130
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (288, 130, 41, '2026-02-01', '2026-03-01', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (289, 130, 44, '2026-02-08', '2026-03-08', NULL, 'Activa', 50.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (290, 130, 43, '2025-10-10', '2025-11-10', '2025-11-10', 'Vencida', 15.00);

-- Usuario 131
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (291, 131, 45, '2026-02-10', '2026-03-10', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (292, 131, 48, '2026-02-15', '2026-03-15', NULL, 'Activa', 15.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (293, 131, 46, '2025-12-20', '2026-01-20', '2026-01-20', 'Vencida', 25.00);

-- Usuario 132
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (294, 132, 47, '2026-02-05', '2026-03-05', NULL, 'Activa', 4.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (295, 132, 50, '2026-02-12', '2026-03-12', NULL, 'Activa', 20.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (296, 132, 49, '2025-06-05', '2025-07-05', '2025-06-25', 'Cancelada', 5.00);

-- Usuario 133
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (297, 133, 1, '2026-02-18', '2026-03-18', NULL, 'Activa', 4.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (298, 133, 4, '2026-02-22', '2026-03-22', NULL, 'Activa', 24.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (299, 133, 2, '2025-09-12', '2025-10-12', '2025-10-12', 'Vencida', 14.99);


------------Descripción: Usuarios del 134 al 166 con 3 suscripciones (2 Activas, 1 Histórica).
------------IDs Suscripción: 300 al 398.

-- Usuario 134
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (300, 134, 3, '2026-02-05', '2026-03-05', NULL, 'Activa', 9.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (301, 134, 6, '2026-02-10', '2026-03-10', NULL, 'Activa', 19.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (302, 134, 1, '2025-06-15', '2025-07-15', '2025-07-15', 'Vencida', 4.99);

-- Usuario 135
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (303, 135, 5, '2026-02-12', '2026-03-12', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (304, 135, 8, '2026-02-15', '2026-03-15', NULL, 'Activa', 12.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (305, 135, 3, '2025-08-01', '2025-09-01', '2025-08-20', 'Cancelada', 9.99);

-- Usuario 136
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (306, 136, 7, '2026-02-18', '2026-03-18', NULL, 'Activa', 3.50);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (307, 136, 10, '2026-02-20', '2026-03-20', NULL, 'Activa', 15.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (308, 136, 5, '2025-05-10', '2025-06-10', '2025-06-10', 'Vencida', 5.00);

-- Usuario 137
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (309, 137, 9, '2026-02-02', '2026-03-02', NULL, 'Activa', 4.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (310, 137, 12, '2026-02-08', '2026-03-08', NULL, 'Activa', 20.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (311, 137, 7, '2025-09-15', '2025-10-15', '2025-09-25', 'Cancelada', 3.50);

-- Usuario 138
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (312, 138, 11, '2026-02-10', '2026-03-10', NULL, 'Activa', 6.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (313, 138, 14, '2026-02-14', '2026-03-14', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (314, 138, 9, '2025-11-01', '2025-12-01', '2025-12-01', 'Vencida', 4.00);

-- Usuario 139
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (315, 139, 13, '2026-02-05', '2026-03-05', NULL, 'Activa', 2.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (316, 139, 16, '2026-02-12', '2026-03-12', NULL, 'Activa', 30.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (317, 139, 11, '2025-10-10', '2025-11-10', '2025-11-10', 'Vencida', 6.99);

-- Usuario 140
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (318, 140, 15, '2026-02-01', '2026-03-01', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (319, 140, 18, '2026-02-08', '2026-03-08', NULL, 'Activa', 15.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (320, 140, 13, '2025-07-20', '2025-08-20', '2025-08-05', 'Cancelada', 2.99);

-- Usuario 141
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (321, 141, 17, '2026-02-15', '2026-03-15', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (322, 141, 20, '2026-02-20', '2026-03-20', NULL, 'Activa', 12.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (323, 141, 15, '2025-04-15', '2025-05-15', '2025-05-15', 'Vencida', 10.00);

-- Usuario 142
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (324, 142, 19, '2026-02-05', '2026-03-05', NULL, 'Activa', 3.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (325, 142, 22, '2026-02-10', '2026-03-10', NULL, 'Activa', 25.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (326, 142, 17, '2025-12-01', '2026-01-01', '2026-01-01', 'Vencida', 5.00);

-- Usuario 143
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (327, 143, 21, '2026-02-12', '2026-03-12', NULL, 'Activa', 7.50);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (328, 143, 24, '2026-02-18', '2026-03-18', NULL, 'Activa', 18.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (329, 143, 19, '2025-08-10', '2025-09-10', '2025-09-10', 'Vencida', 3.00);

-- Usuario 144
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (330, 144, 23, '2026-02-02', '2026-03-02', NULL, 'Activa', 4.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (331, 144, 26, '2026-02-08', '2026-03-08', NULL, 'Activa', 40.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (332, 144, 21, '2025-11-20', '2025-12-20', '2025-12-05', 'Cancelada', 7.50);

-- Usuario 145
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (333, 145, 25, '2026-02-10', '2026-03-10', NULL, 'Activa', 8.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (334, 145, 28, '2026-02-15', '2026-03-15', NULL, 'Activa', 15.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (335, 145, 23, '2025-06-05', '2025-07-05', '2025-07-05', 'Vencida', 4.00);

-- Usuario 146
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (336, 146, 27, '2026-02-20', '2026-03-20', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (337, 146, 30, '2026-02-25', '2026-03-25', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (338, 146, 25, '2025-09-01', '2025-10-01', '2025-10-01', 'Vencida', 8.00);

-- Usuario 147
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (339, 147, 29, '2026-02-01', '2026-03-01', NULL, 'Activa', 3.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (340, 147, 32, '2026-02-05', '2026-03-05', NULL, 'Activa', 20.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (341, 147, 27, '2025-04-20', '2025-05-20', '2025-05-01', 'Cancelada', 5.00);

-- Usuario 148
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (342, 148, 31, '2026-02-12', '2026-03-12', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (343, 148, 34, '2026-02-18', '2026-03-18', NULL, 'Activa', 15.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (344, 148, 29, '2025-12-10', '2026-01-10', '2026-01-10', 'Vencida', 3.00);

-- Usuario 149
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (345, 149, 33, '2026-02-05', '2026-03-05', NULL, 'Activa', 6.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (346, 149, 36, '2026-02-10', '2026-03-10', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (347, 149, 31, '2025-08-15', '2025-09-15', '2025-09-15', 'Vencida', 5.00);

-- Usuario 150
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (348, 150, 35, '2026-02-15', '2026-03-15', NULL, 'Activa', 2.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (349, 150, 38, '2026-02-20', '2026-03-20', NULL, 'Activa', 12.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (350, 150, 33, '2025-07-05', '2025-08-05', '2025-07-25', 'Cancelada', 6.00);

-- Usuario 151
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (351, 151, 37, '2026-02-01', '2026-03-01', NULL, 'Activa', 4.50);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (352, 151, 40, '2026-02-08', '2026-03-08', NULL, 'Activa', 30.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (353, 151, 35, '2025-10-15', '2025-11-15', '2025-11-15', 'Vencida', 2.00);

-- Usuario 152
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (354, 152, 39, '2026-02-10', '2026-03-10', NULL, 'Activa', 5.50);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (355, 152, 42, '2026-02-15', '2026-03-15', NULL, 'Activa', 35.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (356, 152, 37, '2025-11-20', '2025-12-20', '2025-12-20', 'Vencida', 4.50);

-- Usuario 153
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (357, 153, 41, '2026-02-05', '2026-03-05', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (358, 153, 44, '2026-02-12', '2026-03-12', NULL, 'Activa', 50.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (359, 153, 39, '2025-05-25', '2025-06-25', '2025-06-10', 'Cancelada', 5.50);

-- Usuario 154
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (360, 154, 43, '2026-02-18', '2026-03-18', NULL, 'Activa', 15.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (361, 154, 46, '2026-02-22', '2026-03-22', NULL, 'Activa', 25.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (362, 154, 41, '2025-09-05', '2025-10-05', '2025-10-05', 'Vencida', 10.00);

-- Usuario 155
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (363, 155, 45, '2026-02-01', '2026-03-01', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (364, 155, 48, '2026-02-08', '2026-03-08', NULL, 'Activa', 15.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (365, 155, 43, '2025-06-12', '2025-07-12', '2025-07-12', 'Vencida', 15.00);

-- Usuario 156
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (366, 156, 47, '2026-02-10', '2026-03-10', NULL, 'Activa', 4.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (367, 156, 50, '2026-02-15', '2026-03-15', NULL, 'Activa', 20.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (368, 156, 45, '2025-08-20', '2025-09-20', '2025-09-05', 'Cancelada', 5.00);

-- Usuario 157
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (369, 157, 49, '2026-02-05', '2026-03-05', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (370, 157, 2, '2026-02-12', '2026-03-12', NULL, 'Activa', 14.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (371, 157, 47, '2025-10-01', '2025-11-01', '2025-11-01', 'Vencida', 4.00);

-- Usuario 158
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (372, 158, 1, '2026-02-18', '2026-03-18', NULL, 'Activa', 4.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (373, 158, 4, '2026-02-22', '2026-03-22', NULL, 'Activa', 24.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (374, 158, 49, '2025-12-15', '2026-01-15', '2026-01-15', 'Vencida', 5.00);

-- Usuario 159
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (375, 159, 3, '2026-02-01', '2026-03-01', NULL, 'Activa', 9.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (376, 159, 6, '2026-02-08', '2026-03-08', NULL, 'Activa', 19.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (377, 159, 1, '2025-07-10', '2025-08-10', '2025-07-25', 'Cancelada', 4.99);

-- Usuario 160
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (378, 160, 5, '2026-02-10', '2026-03-10', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (379, 160, 8, '2026-02-15', '2026-03-15', NULL, 'Activa', 12.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (380, 160, 3, '2025-09-18', '2025-10-18', '2025-10-18', 'Vencida', 9.99);

-- Usuario 161
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (381, 161, 7, '2026-02-05', '2026-03-05', NULL, 'Activa', 3.50);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (382, 161, 10, '2026-02-12', '2026-03-12', NULL, 'Activa', 15.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (383, 161, 5, '2025-11-05', '2025-12-05', '2025-12-05', 'Vencida', 5.00);

-- Usuario 162
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (384, 162, 9, '2026-02-18', '2026-03-18', NULL, 'Activa', 4.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (385, 162, 12, '2026-02-22', '2026-03-22', NULL, 'Activa', 20.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (386, 162, 7, '2025-08-15', '2025-09-15', '2025-09-01', 'Cancelada', 3.50);

-- Usuario 163
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (387, 163, 11, '2026-02-01', '2026-03-01', NULL, 'Activa', 6.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (388, 163, 14, '2026-02-08', '2026-03-08', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (389, 163, 9, '2025-10-10', '2025-11-10', '2025-11-10', 'Vencida', 4.00);

-- Usuario 164
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (390, 164, 13, '2026-02-10', '2026-03-10', NULL, 'Activa', 2.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (391, 164, 16, '2026-02-15', '2026-03-15', NULL, 'Activa', 30.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (392, 164, 11, '2025-12-20', '2026-01-20', '2026-01-20', 'Vencida', 6.99);

-- Usuario 165
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (393, 165, 15, '2026-02-05', '2026-03-05', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (394, 165, 18, '2026-02-12', '2026-03-12', NULL, 'Activa', 15.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (395, 165, 13, '2025-06-05', '2025-07-05', '2025-06-25', 'Cancelada', 2.99);

-- Usuario 166
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (396, 166, 17, '2026-02-18', '2026-03-18', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (397, 166, 20, '2026-02-22', '2026-03-22', NULL, 'Activa', 12.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (398, 166, 15, '2025-09-12', '2025-10-12', '2025-10-12', 'Vencida', 10.00);


-----------Descripción: Usuarios del 167 al 200 con 3 suscripciones (2 Activas, 1 Histórica).
-----------IDs Suscripción: 399 al 500


-- Usuario 167
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (399, 167, 19, '2026-02-01', '2026-03-01', NULL, 'Activa', 3.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (400, 167, 22, '2026-02-05', '2026-03-05', NULL, 'Activa', 25.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (401, 167, 17, '2025-11-10', '2025-12-10', '2025-12-10', 'Vencida', 5.00);

-- Usuario 168
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (402, 168, 21, '2026-02-08', '2026-03-08', NULL, 'Activa', 7.50);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (403, 168, 24, '2026-02-12', '2026-03-12', NULL, 'Activa', 18.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (404, 168, 19, '2025-06-15', '2025-07-15', '2025-07-01', 'Cancelada', 3.00);

-- Usuario 169
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (405, 169, 23, '2026-02-15', '2026-03-15', NULL, 'Activa', 4.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (406, 169, 26, '2026-02-20', '2026-03-20', NULL, 'Activa', 40.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (407, 169, 21, '2025-09-20', '2025-10-20', '2025-10-20', 'Vencida', 7.50);

-- Usuario 170
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (408, 170, 25, '2026-02-22', '2026-03-22', NULL, 'Activa', 8.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (409, 170, 28, '2026-02-25', '2026-03-25', NULL, 'Activa', 15.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (410, 170, 23, '2025-05-05', '2025-06-05', '2025-06-05', 'Vencida', 4.00);

-- Usuario 171
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (411, 171, 27, '2026-02-01', '2026-03-01', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (412, 171, 30, '2026-02-10', '2026-03-10', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (413, 171, 25, '2025-10-12', '2025-11-12', '2025-10-25', 'Cancelada', 8.00);

-- Usuario 172
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (414, 172, 29, '2026-02-08', '2026-03-08', NULL, 'Activa', 3.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (415, 172, 32, '2026-02-12', '2026-03-12', NULL, 'Activa', 20.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (416, 172, 27, '2025-08-18', '2025-09-18', '2025-09-18', 'Vencida', 5.00);

-- Usuario 173
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (417, 173, 31, '2026-02-15', '2026-03-15', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (418, 173, 34, '2026-02-20', '2026-03-20', NULL, 'Activa', 15.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (419, 173, 29, '2025-12-05', '2026-01-05', '2026-01-05', 'Vencida', 3.00);

-- Usuario 174
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (420, 174, 33, '2026-02-22', '2026-03-22', NULL, 'Activa', 6.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (421, 174, 36, '2026-02-25', '2026-03-25', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (422, 174, 31, '2025-07-10', '2025-08-10', '2025-07-20', 'Cancelada', 5.00);

-- Usuario 175
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (423, 175, 35, '2026-02-01', '2026-03-01', NULL, 'Activa', 2.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (424, 175, 38, '2026-02-10', '2026-03-10', NULL, 'Activa', 12.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (425, 175, 33, '2025-11-15', '2025-12-15', '2025-12-15', 'Vencida', 6.00);

-- Usuario 176
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (426, 176, 37, '2026-02-08', '2026-03-08', NULL, 'Activa', 4.50);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (427, 176, 40, '2026-02-12', '2026-03-12', NULL, 'Activa', 30.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (428, 176, 35, '2025-04-20', '2025-05-20', '2025-05-20', 'Vencida', 2.00);

-- Usuario 177
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (429, 177, 39, '2026-02-15', '2026-03-15', NULL, 'Activa', 5.50);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (430, 177, 42, '2026-02-20', '2026-03-20', NULL, 'Activa', 35.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (431, 177, 37, '2025-09-05', '2025-10-05', '2025-09-15', 'Cancelada', 4.50);

-- Usuario 178
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (432, 178, 41, '2026-02-22', '2026-03-22', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (433, 178, 44, '2026-02-25', '2026-03-25', NULL, 'Activa', 50.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (434, 178, 39, '2025-12-10', '2026-01-10', '2026-01-10', 'Vencida', 5.50);

-- Usuario 179
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (435, 179, 43, '2026-02-01', '2026-03-01', NULL, 'Activa', 15.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (436, 179, 46, '2026-02-10', '2026-03-10', NULL, 'Activa', 25.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (437, 179, 41, '2025-08-25', '2025-09-25', '2025-09-25', 'Vencida', 10.00);

-- Usuario 180
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (438, 180, 45, '2026-02-08', '2026-03-08', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (439, 180, 48, '2026-02-12', '2026-03-12', NULL, 'Activa', 15.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (440, 180, 43, '2025-11-01', '2025-12-01', '2025-11-15', 'Cancelada', 15.00);

-- Usuario 181
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (441, 181, 47, '2026-02-15', '2026-03-15', NULL, 'Activa', 4.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (442, 181, 50, '2026-02-20', '2026-03-20', NULL, 'Activa', 20.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (443, 181, 45, '2025-05-18', '2025-06-18', '2025-06-18', 'Vencida', 5.00);

-- Usuario 182
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (444, 182, 49, '2026-02-22', '2026-03-22', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (445, 182, 2, '2026-02-25', '2026-03-25', NULL, 'Activa', 14.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (446, 182, 47, '2025-10-22', '2025-11-22', '2025-11-22', 'Vencida', 4.00);

-- Usuario 183
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (447, 183, 1, '2026-02-01', '2026-03-01', NULL, 'Activa', 4.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (448, 183, 4, '2026-02-10', '2026-03-10', NULL, 'Activa', 24.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (449, 183, 49, '2025-07-05', '2025-08-05', '2025-07-15', 'Cancelada', 5.00);

-- Usuario 184
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (450, 184, 3, '2026-02-08', '2026-03-08', NULL, 'Activa', 9.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (451, 184, 6, '2026-02-12', '2026-03-12', NULL, 'Activa', 19.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (452, 184, 1, '2025-12-15', '2026-01-15', '2026-01-15', 'Vencida', 4.99);

-- Usuario 185
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (453, 185, 5, '2026-02-15', '2026-03-15', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (454, 185, 8, '2026-02-20', '2026-03-20', NULL, 'Activa', 12.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (455, 185, 3, '2025-06-20', '2025-07-20', '2025-07-20', 'Vencida', 9.99);

-- Usuario 186
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (456, 186, 7, '2026-02-22', '2026-03-22', NULL, 'Activa', 3.50);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (457, 186, 10, '2026-02-25', '2026-03-25', NULL, 'Activa', 15.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (458, 186, 5, '2025-09-10', '2025-10-10', '2025-09-25', 'Cancelada', 5.00);

-- Usuario 187
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (459, 187, 9, '2026-02-01', '2026-03-01', NULL, 'Activa', 4.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (460, 187, 12, '2026-02-10', '2026-03-10', NULL, 'Activa', 20.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (461, 187, 7, '2025-11-25', '2025-12-25', '2025-12-25', 'Vencida', 3.50);

-- Usuario 188
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (462, 188, 11, '2026-02-08', '2026-03-08', NULL, 'Activa', 6.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (463, 188, 14, '2026-02-12', '2026-03-12', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (464, 188, 9, '2025-08-05', '2025-09-05', '2025-09-05', 'Vencida', 4.00);

-- Usuario 189
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (465, 189, 13, '2026-02-15', '2026-03-15', NULL, 'Activa', 2.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (466, 189, 16, '2026-02-20', '2026-03-20', NULL, 'Activa', 30.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (467, 189, 11, '2025-05-12', '2025-06-12', '2025-05-25', 'Cancelada', 6.99);

-- Usuario 190
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (468, 190, 15, '2026-02-22', '2026-03-22', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (469, 190, 18, '2026-02-25', '2026-03-25', NULL, 'Activa', 15.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (470, 190, 13, '2025-10-18', '2025-11-18', '2025-11-18', 'Vencida', 2.99);

-- Usuario 191
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (471, 191, 17, '2026-02-01', '2026-03-01', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (472, 191, 20, '2026-02-10', '2026-03-10', NULL, 'Activa', 12.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (473, 191, 15, '2025-07-22', '2025-08-22', '2025-08-22', 'Vencida', 10.00);

-- Usuario 192
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (474, 192, 19, '2026-02-08', '2026-03-08', NULL, 'Activa', 3.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (475, 192, 22, '2026-02-12', '2026-03-12', NULL, 'Activa', 25.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (476, 192, 17, '2025-12-05', '2026-01-05', '2025-12-20', 'Cancelada', 5.00);

-- Usuario 193
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (477, 193, 21, '2026-02-15', '2026-03-15', NULL, 'Activa', 7.50);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (478, 193, 24, '2026-02-20', '2026-03-20', NULL, 'Activa', 18.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (479, 193, 19, '2025-09-12', '2025-10-12', '2025-10-12', 'Vencida', 3.00);

-- Usuario 194
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (480, 194, 23, '2026-02-22', '2026-03-22', NULL, 'Activa', 4.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (481, 194, 26, '2026-02-25', '2026-03-25', NULL, 'Activa', 40.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (482, 194, 21, '2025-06-01', '2025-07-01', '2025-07-01', 'Vencida', 7.50);

-- Usuario 195
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (483, 195, 25, '2026-02-01', '2026-03-01', NULL, 'Activa', 8.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (484, 195, 28, '2026-02-10', '2026-03-10', NULL, 'Activa', 15.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (485, 195, 23, '2025-11-10', '2025-12-10', '2025-11-25', 'Cancelada', 4.00);

-- Usuario 196
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (486, 196, 27, '2026-02-08', '2026-03-08', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (487, 196, 30, '2026-02-12', '2026-03-12', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (488, 196, 25, '2025-08-08', '2025-09-08', '2025-09-08', 'Vencida', 8.00);

-- Usuario 197
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (489, 197, 29, '2026-02-15', '2026-03-15', NULL, 'Activa', 3.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (490, 197, 32, '2026-02-20', '2026-03-20', NULL, 'Activa', 20.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (491, 197, 27, '2025-10-18', '2025-11-18', '2025-11-18', 'Vencida', 5.00);

-- Usuario 198
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (492, 198, 31, '2026-02-22', '2026-03-22', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (493, 198, 34, '2026-02-25', '2026-03-25', NULL, 'Activa', 15.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (494, 198, 29, '2025-05-20', '2025-06-20', '2025-06-01', 'Cancelada', 3.00);

-- Usuario 199
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (495, 199, 33, '2026-02-01', '2026-03-01', NULL, 'Activa', 6.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (496, 199, 36, '2026-02-10', '2026-03-10', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (497, 199, 31, '2025-12-15', '2026-01-15', '2026-01-15', 'Vencida', 5.00);

-- Usuario 200
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (498, 200, 35, '2026-02-08', '2026-03-08', NULL, 'Activa', 2.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (499, 200, 38, '2026-02-12', '2026-03-12', NULL, 'Activa', 12.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (500, 200, 33, '2025-07-25', '2025-08-25', '2025-08-25', 'Vencida', 6.00);


------------Descripción: 50 usuarios con 1 suscripción Activa y 1 Histórica (Vencida/Cancelada).
------------IDs Suscripción: 501 al 600.

-- Usuario 201
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (501, 201, 1, '2026-02-05', '2026-03-05', NULL, 'Activa', 4.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (502, 201, 2, '2025-06-10', '2025-07-10', '2025-07-10', 'Vencida', 14.99);

-- Usuario 202
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (503, 202, 3, '2026-02-12', '2026-03-12', NULL, 'Activa', 9.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (504, 202, 4, '2025-08-15', '2025-09-15', '2025-08-25', 'Cancelada', 24.99);

-- Usuario 203
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (505, 203, 5, '2026-02-01', '2026-03-01', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (506, 203, 6, '2025-05-20', '2025-06-20', '2025-06-20', 'Vencida', 19.99);

-- Usuario 204
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (507, 204, 7, '2026-02-18', '2026-03-18', NULL, 'Activa', 3.50);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (508, 204, 8, '2025-09-10', '2025-10-10', '2025-09-15', 'Cancelada', 12.00);

-- Usuario 205
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (509, 205, 9, '2026-02-22', '2026-03-22', NULL, 'Activa', 4.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (510, 205, 10, '2025-11-05', '2025-12-05', '2025-12-05', 'Vencida', 15.00);

-- Usuario 206
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (511, 206, 11, '2026-02-08', '2026-03-08', NULL, 'Activa', 6.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (512, 206, 12, '2025-07-12', '2025-08-12', '2025-08-01', 'Cancelada', 20.00);

-- Usuario 207
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (513, 207, 13, '2026-02-15', '2026-03-15', NULL, 'Activa', 2.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (514, 207, 14, '2025-10-18', '2025-11-18', '2025-11-18', 'Vencida', 10.00);

-- Usuario 208
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (515, 208, 15, '2026-02-05', '2026-03-05', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (516, 208, 16, '2025-04-20', '2025-05-20', '2025-05-05', 'Cancelada', 30.00);

-- Usuario 209
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (517, 209, 17, '2026-02-10', '2026-03-10', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (518, 209, 18, '2025-12-01', '2026-01-01', '2026-01-01', 'Vencida', 15.00);

-- Usuario 210
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (519, 210, 19, '2026-02-20', '2026-03-20', NULL, 'Activa', 3.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (520, 210, 20, '2025-08-25', '2025-09-25', '2025-09-10', 'Cancelada', 12.00);

-- Usuario 211
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (521, 211, 21, '2026-02-01', '2026-03-01', NULL, 'Activa', 7.50);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (522, 211, 22, '2025-06-05', '2025-07-05', '2025-07-05', 'Vencida', 25.00);

-- Usuario 212
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (523, 212, 23, '2026-02-12', '2026-03-12', NULL, 'Activa', 4.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (524, 212, 24, '2025-11-15', '2025-12-15', '2025-12-01', 'Cancelada', 18.00);

-- Usuario 213
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (525, 213, 25, '2026-02-18', '2026-03-18', NULL, 'Activa', 8.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (526, 213, 26, '2025-09-22', '2025-10-22', '2025-10-22', 'Vencida', 40.00);

-- Usuario 214
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (527, 214, 27, '2026-02-05', '2026-03-05', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (528, 214, 28, '2025-05-10', '2025-06-10', '2025-05-25', 'Cancelada', 15.00);

-- Usuario 215
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (529, 215, 29, '2026-02-22', '2026-03-22', NULL, 'Activa', 3.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (530, 215, 30, '2025-10-08', '2025-11-08', '2025-11-08', 'Vencida', 10.00);

-- Usuario 216
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (531, 216, 31, '2026-02-08', '2026-03-08', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (532, 216, 32, '2025-07-18', '2025-08-18', '2025-08-01', 'Cancelada', 20.00);

-- Usuario 217
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (533, 217, 33, '2026-02-15', '2026-03-15', NULL, 'Activa', 6.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (534, 217, 34, '2025-12-12', '2026-01-12', '2026-01-12', 'Vencida', 15.00);

-- Usuario 218
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (535, 218, 35, '2026-02-01', '2026-03-01', NULL, 'Activa', 2.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (536, 218, 36, '2025-08-05', '2025-09-05', '2025-08-20', 'Cancelada', 10.00);

-- Usuario 219
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (537, 219, 37, '2026-02-10', '2026-03-10', NULL, 'Activa', 4.50);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (538, 219, 38, '2025-06-22', '2025-07-22', '2025-07-22', 'Vencida', 12.00);

-- Usuario 220
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (539, 220, 39, '2026-02-20', '2026-03-20', NULL, 'Activa', 5.50);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (540, 220, 40, '2025-11-25', '2025-12-25', '2025-12-10', 'Cancelada', 30.00);

-- Usuario 221
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (541, 221, 41, '2026-02-05', '2026-03-05', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (542, 221, 42, '2025-09-08', '2025-10-08', '2025-10-08', 'Vencida', 35.00);

-- Usuario 222
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (543, 222, 43, '2026-02-18', '2026-03-18', NULL, 'Activa', 15.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (544, 222, 44, '2025-04-12', '2025-05-12', '2025-05-01', 'Cancelada', 50.00);

-- Usuario 223
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (545, 223, 45, '2026-02-12', '2026-03-12', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (546, 223, 46, '2025-10-20', '2025-11-20', '2025-11-20', 'Vencida', 25.00);

-- Usuario 224
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (547, 224, 47, '2026-02-22', '2026-03-22', NULL, 'Activa', 4.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (548, 224, 48, '2025-07-02', '2025-08-02', '2025-07-15', 'Cancelada', 15.00);

-- Usuario 225
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (549, 225, 49, '2026-02-08', '2026-03-08', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (550, 225, 50, '2025-12-18', '2026-01-18', '2026-01-18', 'Vencida', 20.00);

-- Usuario 226
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (551, 226, 1, '2026-02-01', '2026-03-01', NULL, 'Activa', 4.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (552, 226, 2, '2025-08-10', '2025-09-10', '2025-08-25', 'Cancelada', 14.99);

-- Usuario 227
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (553, 227, 3, '2026-02-15', '2026-03-15', NULL, 'Activa', 9.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (554, 227, 4, '2025-05-05', '2025-06-05', '2025-06-05', 'Vencida', 24.99);

-- Usuario 228
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (555, 228, 5, '2026-02-10', '2026-03-10', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (556, 228, 6, '2025-11-22', '2025-12-22', '2025-12-10', 'Cancelada', 19.99);

-- Usuario 229
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (557, 229, 7, '2026-02-20', '2026-03-20', NULL, 'Activa', 3.50);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (558, 229, 8, '2025-09-15', '2025-10-15', '2025-10-15', 'Vencida', 12.00);

-- Usuario 230
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (559, 230, 9, '2026-02-05', '2026-03-05', NULL, 'Activa', 4.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (560, 230, 10, '2025-06-25', '2025-07-25', '2025-07-10', 'Cancelada', 15.00);

-- Usuario 231
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (561, 231, 11, '2026-02-18', '2026-03-18', NULL, 'Activa', 6.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (562, 231, 12, '2025-12-08', '2026-01-08', '2026-01-08', 'Vencida', 20.00);

-- Usuario 232
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (563, 232, 13, '2026-02-12', '2026-03-12', NULL, 'Activa', 2.99);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (564, 232, 14, '2025-08-20', '2025-09-20', '2025-09-05', 'Cancelada', 10.00);

-- Usuario 233
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (565, 233, 15, '2026-02-22', '2026-03-22', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (566, 233, 16, '2025-10-02', '2025-11-02', '2025-11-02', 'Vencida', 30.00);

-- Usuario 234
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (567, 234, 17, '2026-02-08', '2026-03-08', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (568, 234, 18, '2025-05-15', '2025-06-15', '2025-06-01', 'Cancelada', 15.00);

-- Usuario 235
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (569, 235, 19, '2026-02-15', '2026-03-15', NULL, 'Activa', 3.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (570, 235, 20, '2025-11-10', '2025-12-10', '2025-12-10', 'Vencida', 12.00);

-- Usuario 236
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (571, 236, 21, '2026-02-01', '2026-03-01', NULL, 'Activa', 7.50);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (572, 236, 22, '2025-09-05', '2025-10-05', '2025-09-20', 'Cancelada', 25.00);

-- Usuario 237
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (573, 237, 23, '2026-02-20', '2026-03-20', NULL, 'Activa', 4.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (574, 237, 24, '2025-06-18', '2025-07-18', '2025-07-18', 'Vencida', 18.00);

-- Usuario 238
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (575, 238, 25, '2026-02-10', '2026-03-10', NULL, 'Activa', 8.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (576, 238, 26, '2025-12-22', '2026-01-22', '2026-01-10', 'Cancelada', 40.00);

-- Usuario 239
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (577, 239, 27, '2026-02-05', '2026-03-05', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (578, 239, 28, '2025-08-25', '2025-09-25', '2025-09-25', 'Vencida', 15.00);

-- Usuario 240
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (579, 240, 29, '2026-02-12', '2026-03-12', NULL, 'Activa', 3.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (580, 240, 30, '2025-05-02', '2025-06-02', '2025-05-15', 'Cancelada', 10.00);

-- Usuario 241
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (581, 241, 31, '2026-02-18', '2026-03-18', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (582, 241, 32, '2025-10-15', '2025-11-15', '2025-11-15', 'Vencida', 20.00);

-- Usuario 242
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (583, 242, 33, '2026-02-22', '2026-03-22', NULL, 'Activa', 6.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (584, 242, 34, '2025-07-08', '2025-08-08', '2025-07-25', 'Cancelada', 15.00);

-- Usuario 243
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (585, 243, 35, '2026-02-08', '2026-03-08', NULL, 'Activa', 2.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (586, 243, 36, '2025-12-05', '2026-01-05', '2026-01-05', 'Vencida', 10.00);

-- Usuario 244
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (587, 244, 37, '2026-02-15', '2026-03-15', NULL, 'Activa', 4.50);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (588, 244, 38, '2025-09-12', '2025-10-12', '2025-09-25', 'Cancelada', 12.00);

-- Usuario 245
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (589, 245, 39, '2026-02-01', '2026-03-01', NULL, 'Activa', 5.50);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (590, 245, 40, '2025-06-25', '2025-07-25', '2025-07-25', 'Vencida', 30.00);

-- Usuario 246
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (591, 246, 41, '2026-02-10', '2026-03-10', NULL, 'Activa', 10.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (592, 246, 42, '2025-11-20', '2025-12-20', '2025-12-05', 'Cancelada', 35.00);

-- Usuario 247
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (593, 247, 43, '2026-02-20', '2026-03-20', NULL, 'Activa', 15.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (594, 247, 44, '2025-08-10', '2025-09-10', '2025-09-10', 'Vencida', 50.00);

-- Usuario 248
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (595, 248, 45, '2026-02-05', '2026-03-05', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (596, 248, 46, '2025-05-18', '2025-06-18', '2025-06-01', 'Cancelada', 25.00);

-- Usuario 249
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (597, 249, 47, '2026-02-12', '2026-03-12', NULL, 'Activa', 4.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (598, 249, 48, '2025-10-05', '2025-11-05', '2025-11-05', 'Vencida', 15.00);

-- Usuario 250
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (599, 250, 49, '2026-02-18', '2026-03-18', NULL, 'Activa', 5.00);
INSERT INTO Suscripcion (id, idUsuario, idNivel, fecha_inicio, fecha_renovacion, fecha_fin, estado, precio_pactado) VALUES (600, 250, 50, '2025-07-15', '2025-08-15', '2025-07-28', 'Cancelada', 20.00);

SET IDENTITY_INSERT Suscripcion OFF;

---------factura------------


SET IDENTITY_INSERT Factura ON;

-- Facturas correspondientes a las Suscripciones 1 al 10
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (1, 1, 'FAC-20260210-SUB1', '2026-02-10', 9.99, 1.60, 11.59);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (2, 2, 'FAC-20260210-SUB2', '2026-02-10', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (3, 3, 'FAC-20260115-SUB3', '2026-01-15', 4.99, 0.80, 5.79);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (4, 4, 'FAC-20260115-SUB4', '2026-01-15', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (5, 5, 'FAC-20260201-SUB5', '2026-02-01', 4.99, 0.80, 5.79);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (6, 6, 'FAC-20260201-SUB6', '2026-02-01', 9.99, 1.60, 11.59);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (7, 7, 'FAC-20260120-SUB7', '2026-01-20', 9.99, 1.60, 11.59);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (8, 8, 'FAC-20260120-SUB8', '2026-01-20', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (9, 9, 'FAC-20260205-SUB9', '2026-02-05', 4.99, 0.80, 5.79);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (10, 10, 'FAC-20260205-SUB10', '2026-02-05', 9.99, 1.60, 11.59);

-- Facturas correspondientes a las Suscripciones 11 al 20
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (11, 11, 'FAC-20260110-SUB11', '2026-01-10', 6.99, 1.12, 8.11);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (12, 12, 'FAC-20260110-SUB12', '2026-01-10', 3.50, 0.56, 4.06);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (13, 13, 'FAC-20260212-SUB13', '2026-02-12', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (14, 14, 'FAC-20260212-SUB14', '2026-02-12', 2.99, 0.48, 3.47);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (15, 15, 'FAC-20260118-SUB15', '2026-01-18', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (16, 16, 'FAC-20260118-SUB16', '2026-01-18', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (17, 17, 'FAC-20260201-SUB17', '2026-02-01', 3.00, 0.48, 3.48);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (18, 18, 'FAC-20260201-SUB18', '2026-02-01', 7.50, 1.20, 8.70);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (19, 19, 'FAC-20260105-SUB19', '2026-01-05', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (20, 20, 'FAC-20260105-SUB20', '2026-01-05', 8.00, 1.28, 9.28);

-- Facturas correspondientes a las Suscripciones 21 al 30
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (21, 21, 'FAC-20260215-SUB21', '2026-02-15', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (22, 22, 'FAC-20260215-SUB22', '2026-02-15', 3.00, 0.48, 3.48);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (23, 23, 'FAC-20260120-SUB23', '2026-01-20', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (24, 24, 'FAC-20260120-SUB24', '2026-01-20', 6.00, 0.96, 6.96);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (25, 25, 'FAC-20260208-SUB25', '2026-02-08', 2.00, 0.32, 2.32);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (26, 26, 'FAC-20260208-SUB26', '2026-02-08', 4.50, 0.72, 5.22);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (27, 27, 'FAC-20260112-SUB27', '2026-01-12', 5.50, 0.88, 6.38);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (28, 28, 'FAC-20260112-SUB28', '2026-01-12', 4.99, 0.80, 5.79);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (29, 29, 'FAC-20260220-SUB29', '2026-02-20', 9.99, 1.60, 11.59);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (30, 30, 'FAC-20260220-SUB30', '2026-02-20', 5.00, 0.80, 5.80);

-- Facturas correspondientes a las Suscripciones 31 al 40
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (31, 31, 'FAC-20260125-SUB31', '2026-01-25', 3.50, 0.56, 4.06);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (32, 32, 'FAC-20260125-SUB32', '2026-01-25', 6.99, 1.12, 8.11);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (33, 33, 'FAC-20260205-SUB33', '2026-02-05', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (34, 34, 'FAC-20260205-SUB34', '2026-02-05', 2.99, 0.48, 3.47);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (35, 35, 'FAC-20260110-SUB35', '2026-01-10', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (36, 36, 'FAC-20260110-SUB36', '2026-01-10', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (37, 37, 'FAC-20260214-SUB37', '2026-02-14', 3.00, 0.48, 3.48);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (38, 38, 'FAC-20260214-SUB38', '2026-02-14', 7.50, 1.20, 8.70);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (39, 39, 'FAC-20260130-SUB39', '2026-01-30', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (40, 40, 'FAC-20260130-SUB40', '2026-01-30', 8.00, 1.28, 9.28);

-- Facturas correspondientes a las Suscripciones 41 al 50
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (41, 41, 'FAC-20260201-SUB41', '2026-02-01', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (42, 42, 'FAC-20260201-SUB42', '2026-02-01', 3.00, 0.48, 3.48);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (43, 43, 'FAC-20260105-SUB43', '2026-01-05', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (44, 44, 'FAC-20260105-SUB44', '2026-01-05', 6.00, 0.96, 6.96);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (45, 45, 'FAC-20260222-SUB45', '2026-02-22', 2.00, 0.32, 2.32);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (46, 46, 'FAC-20260222-SUB46', '2026-02-22', 4.50, 0.72, 5.22);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (47, 47, 'FAC-20260118-SUB47', '2026-01-18', 5.50, 0.88, 6.38);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (48, 48, 'FAC-20260118-SUB48', '2026-01-18', 4.99, 0.80, 5.79);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (49, 49, 'FAC-20260210-SUB49', '2026-02-10', 9.99, 1.60, 11.59);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (50, 50, 'FAC-20260210-SUB50', '2026-02-10', 5.00, 0.80, 5.80);

-- Facturas correspondientes a las Suscripciones 51 al 60
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (51, 51, 'FAC-20260115-SUB51', '2026-01-15', 6.99, 1.12, 8.11);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (52, 52, 'FAC-20260115-SUB52', '2026-01-15', 3.50, 0.56, 4.06);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (53, 53, 'FAC-20260201-SUB53', '2026-02-01', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (54, 54, 'FAC-20260201-SUB54', '2026-02-01', 2.99, 0.48, 3.47);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (55, 55, 'FAC-20260120-SUB55', '2026-01-20', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (56, 56, 'FAC-20260120-SUB56', '2026-01-20', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (57, 57, 'FAC-20260210-SUB57', '2026-02-10', 3.00, 0.48, 3.48);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (58, 58, 'FAC-20260210-SUB58', '2026-02-10', 7.50, 1.20, 8.70);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (59, 59, 'FAC-20260112-SUB59', '2026-01-12', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (60, 60, 'FAC-20260112-SUB60', '2026-01-12', 8.00, 1.28, 9.28);

-- Facturas correspondientes a las Suscripciones 61 al 70
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (61, 61, 'FAC-20260218-SUB61', '2026-02-18', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (62, 62, 'FAC-20260218-SUB62', '2026-02-18', 3.00, 0.48, 3.48);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (63, 63, 'FAC-20260130-SUB63', '2026-01-30', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (64, 64, 'FAC-20260130-SUB64', '2026-01-30', 6.00, 0.96, 6.96);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (65, 65, 'FAC-20260205-SUB65', '2026-02-05', 2.00, 0.32, 2.32);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (66, 66, 'FAC-20260205-SUB66', '2026-02-05', 4.50, 0.72, 5.22);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (67, 67, 'FAC-20260122-SUB67', '2026-01-22', 5.50, 0.88, 6.38);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (68, 68, 'FAC-20260122-SUB68', '2026-01-22', 4.99, 0.80, 5.79);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (69, 69, 'FAC-20260214-SUB69', '2026-02-14', 9.99, 1.60, 11.59);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (70, 70, 'FAC-20260214-SUB70', '2026-02-14', 5.00, 0.80, 5.80);

-- =========================================================================
-- IMPORTANTE: Facturas 71 a 80 (Suscripciones de intersección Históricas)
-- Estas aseguran que los usuarios superen los $140 gastados en la Consulta 7
-- =========================================================================
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (71, 71, 'FAC-20250610-SUB71', '2025-06-10', 24.99, 4.00, 28.99);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (72, 72, 'FAC-20250610-SUB72', '2025-06-10', 19.99, 3.20, 23.19);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (73, 73, 'FAC-20250615-SUB73', '2025-06-15', 24.99, 4.00, 28.99);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (74, 74, 'FAC-20250615-SUB74', '2025-06-15', 19.99, 3.20, 23.19);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (75, 75, 'FAC-20250701-SUB75', '2025-07-01', 24.99, 4.00, 28.99);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (76, 76, 'FAC-20250701-SUB76', '2025-07-01', 19.99, 3.20, 23.19);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (77, 77, 'FAC-20250710-SUB77', '2025-07-10', 24.99, 4.00, 28.99);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (78, 78, 'FAC-20250710-SUB78', '2025-07-10', 19.99, 3.20, 23.19);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (79, 79, 'FAC-20250801-SUB79', '2025-08-01', 24.99, 4.00, 28.99);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (80, 80, 'FAC-20250801-SUB80', '2025-08-01', 19.99, 3.20, 23.19);

-- Facturas correspondientes a las Suscripciones 81 al 100
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (81, 81, 'FAC-20260105-SUB81', '2026-01-05', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (82, 82, 'FAC-20260105-SUB82', '2026-01-05', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (83, 83, 'FAC-20260210-SUB83', '2026-02-10', 3.00, 0.48, 3.48);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (84, 84, 'FAC-20260210-SUB84', '2026-02-10', 7.50, 1.20, 8.70);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (85, 85, 'FAC-20260122-SUB85', '2026-01-22', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (86, 86, 'FAC-20260122-SUB86', '2026-01-22', 8.00, 1.28, 9.28);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (87, 87, 'FAC-20260205-SUB87', '2026-02-05', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (88, 88, 'FAC-20260205-SUB88', '2026-02-05', 3.00, 0.48, 3.48);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (89, 89, 'FAC-20260115-SUB89', '2026-01-15', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (90, 90, 'FAC-20260115-SUB90', '2026-01-15', 6.00, 0.96, 6.96);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (91, 91, 'FAC-20260212-SUB91', '2026-02-12', 2.00, 0.32, 2.32);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (92, 92, 'FAC-20260212-SUB92', '2026-02-12', 4.50, 0.72, 5.22);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (93, 93, 'FAC-20260108-SUB93', '2026-01-08', 5.50, 0.88, 6.38);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (94, 94, 'FAC-20260108-SUB94', '2026-01-08', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (95, 95, 'FAC-20260220-SUB95', '2026-02-20', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (96, 96, 'FAC-20260220-SUB96', '2026-02-20', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (97, 97, 'FAC-20260125-SUB97', '2026-01-25', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (98, 98, 'FAC-20260125-SUB98', '2026-01-25', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (99, 99, 'FAC-20260201-SUB99', '2026-02-01', 14.99, 2.40, 17.39);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (100, 100, 'FAC-20260201-SUB100', '2026-02-01', 24.99, 4.00, 28.99);


-- Facturas correspondientes a las Suscripciones 101 al 110
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (101, 101, 'FAC-20260201-SUB101', '2026-02-01', 4.99, 0.80, 5.79);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (102, 102, 'FAC-20260205-SUB102', '2026-02-05', 9.99, 1.60, 11.59);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (103, 103, 'FAC-20260210-SUB103', '2026-02-10', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (104, 104, 'FAC-20260212-SUB104', '2026-02-12', 3.50, 0.56, 4.06);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (105, 105, 'FAC-20260215-SUB105', '2026-02-15', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (106, 106, 'FAC-20260216-SUB106', '2026-02-16', 6.99, 1.12, 8.11);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (107, 107, 'FAC-20260202-SUB107', '2026-02-02', 2.99, 0.48, 3.47);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (108, 108, 'FAC-20260208-SUB108', '2026-02-08', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (109, 109, 'FAC-20260218-SUB109', '2026-02-18', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (110, 110, 'FAC-20260220-SUB110', '2026-02-20', 3.00, 0.48, 3.48);

-- Facturas correspondientes a las Suscripciones 111 al 120
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (111, 111, 'FAC-20260222-SUB111', '2026-02-22', 7.50, 1.20, 8.70);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (112, 112, 'FAC-20260225-SUB112', '2026-02-25', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (113, 113, 'FAC-20260201-SUB113', '2026-02-01', 8.00, 1.28, 9.28);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (114, 114, 'FAC-20260205-SUB114', '2026-02-05', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (115, 115, 'FAC-20260210-SUB115', '2026-02-10', 3.00, 0.48, 3.48);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (116, 116, 'FAC-20260215-SUB116', '2026-02-15', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (117, 117, 'FAC-20260218-SUB117', '2026-02-18', 6.00, 0.96, 6.96);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (118, 118, 'FAC-20260220-SUB118', '2026-02-20', 2.00, 0.32, 2.32);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (119, 119, 'FAC-20260205-SUB119', '2026-02-05', 4.50, 0.72, 5.22);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (120, 120, 'FAC-20260210-SUB120', '2026-02-10', 5.50, 0.88, 6.38);

-- Facturas correspondientes a las Suscripciones 121 al 130
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (121, 121, 'FAC-20260212-SUB121', '2026-02-12', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (122, 122, 'FAC-20260215-SUB122', '2026-02-15', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (123, 123, 'FAC-20260202-SUB123', '2026-02-02', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (124, 124, 'FAC-20260208-SUB124', '2026-02-08', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (125, 125, 'FAC-20260218-SUB125', '2026-02-18', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (126, 126, 'FAC-20260220-SUB126', '2026-02-20', 14.99, 2.40, 17.39);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (127, 127, 'FAC-20260222-SUB127', '2026-02-22', 24.99, 4.00, 28.99);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (128, 128, 'FAC-20260225-SUB128', '2026-02-25', 19.99, 3.20, 23.19);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (129, 129, 'FAC-20260201-SUB129', '2026-02-01', 12.00, 1.92, 13.92);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (130, 130, 'FAC-20260205-SUB130', '2026-02-05', 15.00, 2.40, 17.40);

-- Facturas correspondientes a las Suscripciones 131 al 140
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (131, 131, 'FAC-20260210-SUB131', '2026-02-10', 20.00, 3.20, 23.20);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (132, 132, 'FAC-20260215-SUB132', '2026-02-15', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (133, 133, 'FAC-20260218-SUB133', '2026-02-18', 30.00, 4.80, 34.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (134, 134, 'FAC-20260220-SUB134', '2026-02-20', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (135, 135, 'FAC-20260205-SUB135', '2026-02-05', 12.00, 1.92, 13.92);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (136, 136, 'FAC-20260210-SUB136', '2026-02-10', 25.00, 4.00, 29.00);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (137, 137, 'FAC-20260212-SUB137', '2026-02-12', 18.00, 2.88, 20.88);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (138, 138, 'FAC-20260215-SUB138', '2026-02-15', 40.00, 6.40, 46.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (139, 139, 'FAC-20260202-SUB139', '2026-02-02', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (140, 140, 'FAC-20260208-SUB140', '2026-02-08', 10.00, 1.60, 11.60);

-- Facturas correspondientes a las Suscripciones 141 al 150
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (141, 141, 'FAC-20260218-SUB141', '2026-02-18', 20.00, 3.20, 23.20);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (142, 142, 'FAC-20260220-SUB142', '2026-02-20', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (143, 143, 'FAC-20260222-SUB143', '2026-02-22', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (144, 144, 'FAC-20260225-SUB144', '2026-02-25', 12.00, 1.92, 13.92);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (145, 145, 'FAC-20260201-SUB145', '2026-02-01', 30.00, 4.80, 34.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (146, 146, 'FAC-20260205-SUB146', '2026-02-05', 35.00, 5.60, 40.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (147, 147, 'FAC-20260210-SUB147', '2026-02-10', 50.00, 8.00, 58.00);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (148, 148, 'FAC-20260215-SUB148', '2026-02-15', 25.00, 4.00, 29.00);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (149, 149, 'FAC-20260218-SUB149', '2026-02-18', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (150, 150, 'FAC-20260220-SUB150', '2026-02-20', 20.00, 3.20, 23.20);

-- Facturas correspondientes a las Suscripciones 151 al 160
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (151, 151, 'FAC-20260205-SUB151', '2026-02-05', 4.99, 0.80, 5.79);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (152, 152, 'FAC-20260210-SUB152', '2026-02-10', 24.99, 4.00, 28.99);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (153, 153, 'FAC-20260212-SUB153', '2026-02-12', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (154, 154, 'FAC-20260215-SUB154', '2026-02-15', 12.00, 1.92, 13.92);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (155, 155, 'FAC-20260202-SUB155', '2026-02-02', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (156, 156, 'FAC-20260208-SUB156', '2026-02-08', 20.00, 3.20, 23.20);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (157, 157, 'FAC-20260218-SUB157', '2026-02-18', 2.99, 0.48, 3.47);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (158, 158, 'FAC-20260220-SUB158', '2026-02-20', 30.00, 4.80, 34.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (159, 159, 'FAC-20260222-SUB159', '2026-02-22', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (160, 160, 'FAC-20260225-SUB160', '2026-02-25', 12.00, 1.92, 13.92);

-- Facturas correspondientes a las Suscripciones 161 al 170
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (161, 161, 'FAC-20260201-SUB161', '2026-02-01', 7.50, 1.20, 8.70);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (162, 162, 'FAC-20260205-SUB162', '2026-02-05', 18.00, 2.88, 20.88);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (163, 163, 'FAC-20260210-SUB163', '2026-02-10', 8.00, 1.28, 9.28);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (164, 164, 'FAC-20260215-SUB164', '2026-02-15', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (165, 165, 'FAC-20260218-SUB165', '2026-02-18', 3.00, 0.48, 3.48);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (166, 166, 'FAC-20260220-SUB166', '2026-02-20', 20.00, 3.20, 23.20);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (167, 167, 'FAC-20260205-SUB167', '2026-02-05', 6.00, 0.96, 6.96);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (168, 168, 'FAC-20260210-SUB168', '2026-02-10', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (169, 169, 'FAC-20260212-SUB169', '2026-02-12', 4.50, 0.72, 5.22);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (170, 170, 'FAC-20260215-SUB170', '2026-02-15', 30.00, 4.80, 34.80);

-- Facturas correspondientes a las Suscripciones 171 al 180
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (171, 171, 'FAC-20260202-SUB171', '2026-02-02', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (172, 172, 'FAC-20260208-SUB172', '2026-02-08', 50.00, 8.00, 58.00);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (173, 173, 'FAC-20260218-SUB173', '2026-02-18', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (174, 174, 'FAC-20260220-SUB174', '2026-02-20', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (175, 175, 'FAC-20260222-SUB175', '2026-02-22', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (176, 176, 'FAC-20260225-SUB176', '2026-02-25', 9.99, 1.60, 11.59);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (177, 177, 'FAC-20260201-SUB177', '2026-02-01', 3.50, 0.56, 4.06);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (178, 178, 'FAC-20260205-SUB178', '2026-02-05', 6.99, 1.12, 8.11);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (179, 179, 'FAC-20260210-SUB179', '2026-02-10', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (180, 180, 'FAC-20260215-SUB180', '2026-02-15', 3.00, 0.48, 3.48);

-- Facturas correspondientes a las Suscripciones 181 al 190
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (181, 181, 'FAC-20260218-SUB181', '2026-02-18', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (182, 182, 'FAC-20260220-SUB182', '2026-02-20', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (183, 183, 'FAC-20260205-SUB183', '2026-02-05', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (184, 184, 'FAC-20260210-SUB184', '2026-02-10', 2.00, 0.32, 2.32);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (185, 185, 'FAC-20260212-SUB185', '2026-02-12', 5.50, 0.88, 6.38);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (186, 186, 'FAC-20260215-SUB186', '2026-02-15', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (187, 187, 'FAC-20260202-SUB187', '2026-02-02', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (188, 188, 'FAC-20260208-SUB188', '2026-02-08', 14.99, 2.40, 17.39);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (189, 189, 'FAC-20260218-SUB189', '2026-02-18', 19.99, 3.20, 23.19);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (190, 190, 'FAC-20260220-SUB190', '2026-02-20', 15.00, 2.40, 17.40);

-- Facturas correspondientes a las Suscripciones 191 al 200
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (191, 191, 'FAC-20260222-SUB191', '2026-02-22', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (192, 192, 'FAC-20260225-SUB192', '2026-02-25', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (193, 193, 'FAC-20260201-SUB193', '2026-02-01', 25.00, 4.00, 29.00);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (194, 194, 'FAC-20260205-SUB194', '2026-02-05', 40.00, 6.40, 46.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (195, 195, 'FAC-20260210-SUB195', '2026-02-10', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (196, 196, 'FAC-20260215-SUB196', '2026-02-15', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (197, 197, 'FAC-20260218-SUB197', '2026-02-18', 12.00, 1.92, 13.92);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (198, 198, 'FAC-20260220-SUB198', '2026-02-20', 35.00, 5.60, 40.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (199, 199, 'FAC-20260205-SUB199', '2026-02-05', 25.00, 4.00, 29.00);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (200, 200, 'FAC-20260210-SUB200', '2026-02-10', 20.00, 3.20, 23.20);


-- Facturas correspondientes a las Suscripciones 201 al 210
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (201, 201, 'FAC-20260205-SUB201', '2026-02-05', 4.99, 0.80, 5.79);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (202, 202, 'FAC-20260210-SUB202', '2026-02-10', 19.99, 3.20, 23.19);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (203, 203, 'FAC-20250615-SUB203', '2025-06-15', 9.99, 1.60, 11.59);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (204, 204, 'FAC-20260212-SUB204', '2026-02-12', 14.99, 2.40, 17.39);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (205, 205, 'FAC-20260215-SUB205', '2026-02-15', 3.50, 0.56, 4.06);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (206, 206, 'FAC-20250801-SUB206', '2025-08-01', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (207, 207, 'FAC-20260218-SUB207', '2026-02-18', 24.99, 4.00, 28.99);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (208, 208, 'FAC-20260220-SUB208', '2026-02-20', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (209, 209, 'FAC-20250510-SUB209', '2025-05-10', 12.00, 1.92, 13.92);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (210, 210, 'FAC-20260202-SUB210', '2026-02-02', 6.99, 1.12, 8.11);

-- Facturas correspondientes a las Suscripciones 211 al 220
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (211, 211, 'FAC-20260208-SUB211', '2026-02-08', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (212, 212, 'FAC-20250915-SUB212', '2025-09-15', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (213, 213, 'FAC-20260210-SUB213', '2026-02-10', 2.99, 0.48, 3.47);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (214, 214, 'FAC-20260214-SUB214', '2026-02-14', 30.00, 4.80, 34.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (215, 215, 'FAC-20251101-SUB215', '2025-11-01', 20.00, 3.20, 23.20);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (216, 216, 'FAC-20260205-SUB216', '2026-02-05', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (217, 217, 'FAC-20260212-SUB217', '2026-02-12', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (218, 218, 'FAC-20251010-SUB218', '2025-10-10', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (219, 219, 'FAC-20260201-SUB219', '2026-02-01', 3.00, 0.48, 3.48);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (220, 220, 'FAC-20260208-SUB220', '2026-02-08', 25.00, 4.00, 29.00);

-- Facturas correspondientes a las Suscripciones 221 al 230
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (221, 221, 'FAC-20250720-SUB221', '2025-07-20', 12.00, 1.92, 13.92);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (222, 222, 'FAC-20260215-SUB222', '2026-02-15', 7.50, 1.20, 8.70);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (223, 223, 'FAC-20260220-SUB223', '2026-02-20', 18.00, 2.88, 20.88);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (224, 224, 'FAC-20250415-SUB224', '2025-04-15', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (225, 225, 'FAC-20260205-SUB225', '2026-02-05', 8.00, 1.28, 9.28);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (226, 226, 'FAC-20260210-SUB226', '2026-02-10', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (227, 227, 'FAC-20251201-SUB227', '2025-12-01', 40.00, 6.40, 46.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (228, 228, 'FAC-20260212-SUB228', '2026-02-12', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (229, 229, 'FAC-20260218-SUB229', '2026-02-18', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (230, 230, 'FAC-20250810-SUB230', '2025-08-10', 3.00, 0.48, 3.48);

-- Facturas correspondientes a las Suscripciones 231 al 240
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (231, 231, 'FAC-20260202-SUB231', '2026-02-02', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (232, 232, 'FAC-20260208-SUB232', '2026-02-08', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (233, 233, 'FAC-20251120-SUB233', '2025-11-20', 20.00, 3.20, 23.20);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (234, 234, 'FAC-20260210-SUB234', '2026-02-10', 6.00, 0.96, 6.96);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (235, 235, 'FAC-20260215-SUB235', '2026-02-15', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (236, 236, 'FAC-20250605-SUB236', '2025-06-05', 2.00, 0.32, 2.32);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (237, 237, 'FAC-20260220-SUB237', '2026-02-20', 4.50, 0.72, 5.22);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (238, 238, 'FAC-20260225-SUB238', '2026-02-25', 30.00, 4.80, 34.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (239, 239, 'FAC-20250901-SUB239', '2025-09-01', 5.50, 0.88, 6.38);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (240, 240, 'FAC-20260201-SUB240', '2026-02-01', 10.00, 1.60, 11.60);

-- Facturas correspondientes a las Suscripciones 241 al 250
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (241, 241, 'FAC-20260205-SUB241', '2026-02-05', 50.00, 8.00, 58.00);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (242, 242, 'FAC-20250420-SUB242', '2025-04-20', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (243, 243, 'FAC-20260212-SUB243', '2026-02-12', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (244, 244, 'FAC-20260218-SUB244', '2026-02-18', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (245, 245, 'FAC-20251210-SUB245', '2025-12-10', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (246, 246, 'FAC-20260205-SUB246', '2026-02-05', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (247, 247, 'FAC-20260210-SUB247', '2026-02-10', 14.99, 2.40, 17.39);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (248, 248, 'FAC-20250815-SUB248', '2025-08-15', 4.99, 0.80, 5.79);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (249, 249, 'FAC-20260215-SUB249', '2026-02-15', 9.99, 1.60, 11.59);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (250, 250, 'FAC-20260220-SUB250', '2026-02-20', 19.99, 3.20, 23.19);

-- Facturas correspondientes a las Suscripciones 251 al 260
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (251, 251, 'FAC-20250705-SUB251', '2025-07-05', 24.99, 4.00, 28.99);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (252, 252, 'FAC-20260201-SUB252', '2026-02-01', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (253, 253, 'FAC-20260208-SUB253', '2026-02-08', 12.00, 1.92, 13.92);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (254, 254, 'FAC-20251015-SUB254', '2025-10-15', 3.50, 0.56, 4.06);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (255, 255, 'FAC-20260210-SUB255', '2026-02-10', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (256, 256, 'FAC-20260215-SUB256', '2026-02-15', 20.00, 3.20, 23.20);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (257, 257, 'FAC-20251120-SUB257', '2025-11-20', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (258, 258, 'FAC-20260205-SUB258', '2026-02-05', 6.99, 1.12, 8.11);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (259, 259, 'FAC-20260212-SUB259', '2026-02-12', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (260, 260, 'FAC-20250525-SUB260', '2025-05-25', 2.99, 0.48, 3.47);

-- Facturas correspondientes a las Suscripciones 261 al 270
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (261, 261, 'FAC-20260218-SUB261', '2026-02-18', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (262, 262, 'FAC-20260222-SUB262', '2026-02-22', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (263, 263, 'FAC-20250905-SUB263', '2025-09-05', 30.00, 4.80, 34.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (264, 264, 'FAC-20260201-SUB264', '2026-02-01', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (265, 265, 'FAC-20260208-SUB265', '2026-02-08', 12.00, 1.92, 13.92);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (266, 266, 'FAC-20250612-SUB266', '2025-06-12', 3.00, 0.48, 3.48);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (267, 267, 'FAC-20260210-SUB267', '2026-02-10', 7.50, 1.20, 8.70);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (268, 268, 'FAC-20260215-SUB268', '2026-02-15', 18.00, 2.88, 20.88);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (269, 269, 'FAC-20250820-SUB269', '2025-08-20', 25.00, 4.00, 29.00);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (270, 270, 'FAC-20260205-SUB270', '2026-02-05', 4.00, 0.64, 4.64);

-- Facturas correspondientes a las Suscripciones 271 al 280
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (271, 271, 'FAC-20260212-SUB271', '2026-02-12', 40.00, 6.40, 46.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (272, 272, 'FAC-20251001-SUB272', '2025-10-01', 8.00, 1.28, 9.28);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (273, 273, 'FAC-20260218-SUB273', '2026-02-18', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (274, 274, 'FAC-20260222-SUB274', '2026-02-22', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (275, 275, 'FAC-20251215-SUB275', '2025-12-15', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (276, 276, 'FAC-20260201-SUB276', '2026-02-01', 3.00, 0.48, 3.48);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (277, 277, 'FAC-20260208-SUB277', '2026-02-08', 20.00, 3.20, 23.20);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (278, 278, 'FAC-20250710-SUB278', '2025-07-10', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (279, 279, 'FAC-20260210-SUB279', '2026-02-10', 6.00, 0.96, 6.96);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (280, 280, 'FAC-20260215-SUB280', '2026-02-15', 10.00, 1.60, 11.60);

-- Facturas correspondientes a las Suscripciones 281 al 290
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (281, 281, 'FAC-20250918-SUB281', '2025-09-18', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (282, 282, 'FAC-20260205-SUB282', '2026-02-05', 2.00, 0.32, 2.32);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (283, 283, 'FAC-20260212-SUB283', '2026-02-12', 12.00, 1.92, 13.92);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (284, 284, 'FAC-20251105-SUB284', '2025-11-05', 4.50, 0.72, 5.22);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (285, 285, 'FAC-20260218-SUB285', '2026-02-18', 5.50, 0.88, 6.38);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (286, 286, 'FAC-20260222-SUB286', '2026-02-22', 35.00, 5.60, 40.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (287, 287, 'FAC-20250815-SUB287', '2025-08-15', 30.00, 4.80, 34.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (288, 288, 'FAC-20260201-SUB288', '2026-02-01', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (289, 289, 'FAC-20260208-SUB289', '2026-02-08', 50.00, 8.00, 58.00);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (290, 290, 'FAC-20251010-SUB290', '2025-10-10', 15.00, 2.40, 17.40);

-- Facturas correspondientes a las Suscripciones 291 al 300
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (291, 291, 'FAC-20260210-SUB291', '2026-02-10', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (292, 292, 'FAC-20260215-SUB292', '2026-02-15', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (293, 293, 'FAC-20251220-SUB293', '2025-12-20', 25.00, 4.00, 29.00);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (294, 294, 'FAC-20260205-SUB294', '2026-02-05', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (295, 295, 'FAC-20260212-SUB295', '2026-02-12', 20.00, 3.20, 23.20);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (296, 296, 'FAC-20250605-SUB296', '2025-06-05', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (297, 297, 'FAC-20260218-SUB297', '2026-02-18', 4.99, 0.80, 5.79);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (298, 298, 'FAC-20260222-SUB298', '2026-02-22', 24.99, 4.00, 28.99);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (299, 299, 'FAC-20250912-SUB299', '2025-09-12', 14.99, 2.40, 17.39);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (300, 300, 'FAC-20260205-SUB300', '2026-02-05', 9.99, 1.60, 11.59);

-- Facturas correspondientes a las Suscripciones 301 al 310
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (301, 301, 'FAC-20260210-SUB301', '2026-02-10', 19.99, 3.20, 23.19);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (302, 302, 'FAC-20250615-SUB302', '2025-06-15', 4.99, 0.80, 5.79);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (303, 303, 'FAC-20260212-SUB303', '2026-02-12', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (304, 304, 'FAC-20260215-SUB304', '2026-02-15', 12.00, 1.92, 13.92);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (305, 305, 'FAC-20250801-SUB305', '2025-08-01', 9.99, 1.60, 11.59);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (306, 306, 'FAC-20260218-SUB306', '2026-02-18', 3.50, 0.56, 4.06);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (307, 307, 'FAC-20260220-SUB307', '2026-02-20', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (308, 308, 'FAC-20250510-SUB308', '2025-05-10', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (309, 309, 'FAC-20260202-SUB309', '2026-02-02', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (310, 310, 'FAC-20260208-SUB310', '2026-02-08', 20.00, 3.20, 23.20);

-- Facturas correspondientes a las Suscripciones 311 al 320
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (311, 311, 'FAC-20250915-SUB311', '2025-09-15', 3.50, 0.56, 4.06);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (312, 312, 'FAC-20260210-SUB312', '2026-02-10', 6.99, 1.12, 8.11);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (313, 313, 'FAC-20260214-SUB313', '2026-02-14', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (314, 314, 'FAC-20251101-SUB314', '2025-11-01', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (315, 315, 'FAC-20260205-SUB315', '2026-02-05', 2.99, 0.48, 3.47);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (316, 316, 'FAC-20260212-SUB316', '2026-02-12', 30.00, 4.80, 34.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (317, 317, 'FAC-20251010-SUB317', '2025-10-10', 6.99, 1.12, 8.11);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (318, 318, 'FAC-20260201-SUB318', '2026-02-01', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (319, 319, 'FAC-20260208-SUB319', '2026-02-08', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (320, 320, 'FAC-20250720-SUB320', '2025-07-20', 2.99, 0.48, 3.47);

-- Facturas correspondientes a las Suscripciones 321 al 330
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (321, 321, 'FAC-20260215-SUB321', '2026-02-15', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (322, 322, 'FAC-20260220-SUB322', '2026-02-20', 12.00, 1.92, 13.92);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (323, 323, 'FAC-20250415-SUB323', '2025-04-15', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (324, 324, 'FAC-20260205-SUB324', '2026-02-05', 3.00, 0.48, 3.48);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (325, 325, 'FAC-20260210-SUB325', '2026-02-10', 25.00, 4.00, 29.00);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (326, 326, 'FAC-20251201-SUB326', '2025-12-01', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (327, 327, 'FAC-20260212-SUB327', '2026-02-12', 7.50, 1.20, 8.70);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (328, 328, 'FAC-20260218-SUB328', '2026-02-18', 18.00, 2.88, 20.88);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (329, 329, 'FAC-20250810-SUB329', '2025-08-10', 3.00, 0.48, 3.48);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (330, 330, 'FAC-20260202-SUB330', '2026-02-02', 4.00, 0.64, 4.64);

-- Facturas correspondientes a las Suscripciones 331 al 340
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (331, 331, 'FAC-20260208-SUB331', '2026-02-08', 40.00, 6.40, 46.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (332, 332, 'FAC-20251120-SUB332', '2025-11-20', 7.50, 1.20, 8.70);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (333, 333, 'FAC-20260210-SUB333', '2026-02-10', 8.00, 1.28, 9.28);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (334, 334, 'FAC-20260215-SUB334', '2026-02-15', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (335, 335, 'FAC-20250605-SUB335', '2025-06-05', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (336, 336, 'FAC-20260220-SUB336', '2026-02-20', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (337, 337, 'FAC-20260225-SUB337', '2026-02-25', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (338, 338, 'FAC-20250901-SUB338', '2025-09-01', 8.00, 1.28, 9.28);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (339, 339, 'FAC-20260201-SUB339', '2026-02-01', 3.00, 0.48, 3.48);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (340, 340, 'FAC-20260205-SUB340', '2026-02-05', 20.00, 3.20, 23.20);

-- Facturas correspondientes a las Suscripciones 341 al 350
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (341, 341, 'FAC-20250420-SUB341', '2025-04-20', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (342, 342, 'FAC-20260212-SUB342', '2026-02-12', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (343, 343, 'FAC-20260218-SUB343', '2026-02-18', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (344, 344, 'FAC-20251210-SUB344', '2025-12-10', 3.00, 0.48, 3.48);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (345, 345, 'FAC-20260205-SUB345', '2026-02-05', 6.00, 0.96, 6.96);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (346, 346, 'FAC-20260210-SUB346', '2026-02-10', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (347, 347, 'FAC-20250815-SUB347', '2025-08-15', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (348, 348, 'FAC-20260215-SUB348', '2026-02-15', 2.00, 0.32, 2.32);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (349, 349, 'FAC-20260220-SUB349', '2026-02-20', 12.00, 1.92, 13.92);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (350, 350, 'FAC-20250705-SUB350', '2025-07-05', 6.00, 0.96, 6.96);

-- Facturas correspondientes a las Suscripciones 351 al 360
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (351, 351, 'FAC-20260201-SUB351', '2026-02-01', 4.50, 0.72, 5.22);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (352, 352, 'FAC-20260208-SUB352', '2026-02-08', 30.00, 4.80, 34.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (353, 353, 'FAC-20251015-SUB353', '2025-10-15', 2.00, 0.32, 2.32);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (354, 354, 'FAC-20260210-SUB354', '2026-02-10', 5.50, 0.88, 6.38);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (355, 355, 'FAC-20260215-SUB355', '2026-02-15', 35.00, 5.60, 40.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (356, 356, 'FAC-20251120-SUB356', '2025-11-20', 4.50, 0.72, 5.22);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (357, 357, 'FAC-20260205-SUB357', '2026-02-05', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (358, 358, 'FAC-20260212-SUB358', '2026-02-12', 50.00, 8.00, 58.00);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (359, 359, 'FAC-20250525-SUB359', '2025-05-25', 5.50, 0.88, 6.38);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (360, 360, 'FAC-20260218-SUB360', '2026-02-18', 15.00, 2.40, 17.40);

-- Facturas correspondientes a las Suscripciones 361 al 370
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (361, 361, 'FAC-20260222-SUB361', '2026-02-22', 25.00, 4.00, 29.00);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (362, 362, 'FAC-20250905-SUB362', '2025-09-05', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (363, 363, 'FAC-20260201-SUB363', '2026-02-01', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (364, 364, 'FAC-20260208-SUB364', '2026-02-08', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (365, 365, 'FAC-20250612-SUB365', '2025-06-12', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (366, 366, 'FAC-20260210-SUB366', '2026-02-10', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (367, 367, 'FAC-20260215-SUB367', '2026-02-15', 20.00, 3.20, 23.20);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (368, 368, 'FAC-20250820-SUB368', '2025-08-20', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (369, 369, 'FAC-20260205-SUB369', '2026-02-05', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (370, 370, 'FAC-20260212-SUB370', '2026-02-12', 14.99, 2.40, 17.39);

-- Facturas correspondientes a las Suscripciones 371 al 380
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (371, 371, 'FAC-20251001-SUB371', '2025-10-01', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (372, 372, 'FAC-20260218-SUB372', '2026-02-18', 4.99, 0.80, 5.79);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (373, 373, 'FAC-20260222-SUB373', '2026-02-22', 24.99, 4.00, 28.99);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (374, 374, 'FAC-20251215-SUB374', '2025-12-15', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (375, 375, 'FAC-20260201-SUB375', '2026-02-01', 9.99, 1.60, 11.59);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (376, 376, 'FAC-20260208-SUB376', '2026-02-08', 19.99, 3.20, 23.19);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (377, 377, 'FAC-20250710-SUB377', '2025-07-10', 4.99, 0.80, 5.79);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (378, 378, 'FAC-20260210-SUB378', '2026-02-10', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (379, 379, 'FAC-20260215-SUB379', '2026-02-15', 12.00, 1.92, 13.92);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (380, 380, 'FAC-20250918-SUB380', '2025-09-18', 9.99, 1.60, 11.59);

-- Facturas correspondientes a las Suscripciones 381 al 390
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (381, 381, 'FAC-20260205-SUB381', '2026-02-05', 3.50, 0.56, 4.06);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (382, 382, 'FAC-20260212-SUB382', '2026-02-12', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (383, 383, 'FAC-20251105-SUB383', '2025-11-05', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (384, 384, 'FAC-20260218-SUB384', '2026-02-18', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (385, 385, 'FAC-20260222-SUB385', '2026-02-22', 20.00, 3.20, 23.20);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (386, 386, 'FAC-20250815-SUB386', '2025-08-15', 3.50, 0.56, 4.06);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (387, 387, 'FAC-20260201-SUB387', '2026-02-01', 6.99, 1.12, 8.11);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (388, 388, 'FAC-20260208-SUB388', '2026-02-08', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (389, 389, 'FAC-20251010-SUB389', '2025-10-10', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (390, 390, 'FAC-20260210-SUB390', '2026-02-10', 2.99, 0.48, 3.47);

-- Facturas correspondientes a las Suscripciones 391 al 400
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (391, 391, 'FAC-20260215-SUB391', '2026-02-15', 30.00, 4.80, 34.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (392, 392, 'FAC-20251220-SUB392', '2025-12-20', 6.99, 1.12, 8.11);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (393, 393, 'FAC-20260205-SUB393', '2026-02-05', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (394, 394, 'FAC-20260212-SUB394', '2026-02-12', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (395, 395, 'FAC-20250605-SUB395', '2025-06-05', 2.99, 0.48, 3.47);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (396, 396, 'FAC-20260218-SUB396', '2026-02-18', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (397, 397, 'FAC-20260222-SUB397', '2026-02-22', 12.00, 1.92, 13.92);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (398, 398, 'FAC-20250912-SUB398', '2025-09-12', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (399, 399, 'FAC-20260201-SUB399', '2026-02-01', 3.00, 0.48, 3.48);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (400, 400, 'FAC-20260205-SUB400', '2026-02-05', 25.00, 4.00, 29.00);


-- Facturas correspondientes a las Suscripciones 401 al 410
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (401, 401, 'FAC-20251110-SUB401', '2025-11-10', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (402, 402, 'FAC-20260208-SUB402', '2026-02-08', 7.50, 1.20, 8.70);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (403, 403, 'FAC-20260212-SUB403', '2026-02-12', 18.00, 2.88, 20.88);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (404, 404, 'FAC-20250615-SUB404', '2025-06-15', 3.00, 0.48, 3.48);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (405, 405, 'FAC-20260215-SUB405', '2026-02-15', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (406, 406, 'FAC-20260220-SUB406', '2026-02-20', 40.00, 6.40, 46.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (407, 407, 'FAC-20250920-SUB407', '2025-09-20', 7.50, 1.20, 8.70);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (408, 408, 'FAC-20260222-SUB408', '2026-02-22', 8.00, 1.28, 9.28);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (409, 409, 'FAC-20260225-SUB409', '2026-02-25', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (410, 410, 'FAC-20250505-SUB410', '2025-05-05', 4.00, 0.64, 4.64);

-- Facturas correspondientes a las Suscripciones 411 al 420
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (411, 411, 'FAC-20260201-SUB411', '2026-02-01', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (412, 412, 'FAC-20260210-SUB412', '2026-02-10', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (413, 413, 'FAC-20251012-SUB413', '2025-10-12', 8.00, 1.28, 9.28);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (414, 414, 'FAC-20260208-SUB414', '2026-02-08', 3.00, 0.48, 3.48);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (415, 415, 'FAC-20260212-SUB415', '2026-02-12', 20.00, 3.20, 23.20);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (416, 416, 'FAC-20250818-SUB416', '2025-08-18', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (417, 417, 'FAC-20260215-SUB417', '2026-02-15', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (418, 418, 'FAC-20260220-SUB418', '2026-02-20', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (419, 419, 'FAC-20251205-SUB419', '2025-12-05', 3.00, 0.48, 3.48);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (420, 420, 'FAC-20260222-SUB420', '2026-02-22', 6.00, 0.96, 6.96);

-- Facturas correspondientes a las Suscripciones 421 al 430
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (421, 421, 'FAC-20260225-SUB421', '2026-02-25', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (422, 422, 'FAC-20250710-SUB422', '2025-07-10', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (423, 423, 'FAC-20260201-SUB423', '2026-02-01', 2.00, 0.32, 2.32);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (424, 424, 'FAC-20260210-SUB424', '2026-02-10', 12.00, 1.92, 13.92);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (425, 425, 'FAC-20251115-SUB425', '2025-11-15', 6.00, 0.96, 6.96);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (426, 426, 'FAC-20260208-SUB426', '2026-02-08', 4.50, 0.72, 5.22);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (427, 427, 'FAC-20260212-SUB427', '2026-02-12', 30.00, 4.80, 34.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (428, 428, 'FAC-20250420-SUB428', '2025-04-20', 2.00, 0.32, 2.32);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (429, 429, 'FAC-20260215-SUB429', '2026-02-15', 5.50, 0.88, 6.38);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (430, 430, 'FAC-20260220-SUB430', '2026-02-20', 35.00, 5.60, 40.60);

-- Facturas correspondientes a las Suscripciones 431 al 440
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (431, 431, 'FAC-20250905-SUB431', '2025-09-05', 4.50, 0.72, 5.22);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (432, 432, 'FAC-20260222-SUB432', '2026-02-22', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (433, 433, 'FAC-20260225-SUB433', '2026-02-25', 50.00, 8.00, 58.00);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (434, 434, 'FAC-20251210-SUB434', '2025-12-10', 5.50, 0.88, 6.38);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (435, 435, 'FAC-20260201-SUB435', '2026-02-01', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (436, 436, 'FAC-20260210-SUB436', '2026-02-10', 25.00, 4.00, 29.00);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (437, 437, 'FAC-20250825-SUB437', '2025-08-25', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (438, 438, 'FAC-20260208-SUB438', '2026-02-08', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (439, 439, 'FAC-20260212-SUB439', '2026-02-12', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (440, 440, 'FAC-20251101-SUB440', '2025-11-01', 15.00, 2.40, 17.40);

-- Facturas correspondientes a las Suscripciones 441 al 450
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (441, 441, 'FAC-20260215-SUB441', '2026-02-15', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (442, 442, 'FAC-20260220-SUB442', '2026-02-20', 20.00, 3.20, 23.20);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (443, 443, 'FAC-20250518-SUB443', '2025-05-18', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (444, 444, 'FAC-20260222-SUB444', '2026-02-22', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (445, 445, 'FAC-20260225-SUB445', '2026-02-25', 14.99, 2.40, 17.39);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (446, 446, 'FAC-20251022-SUB446', '2025-10-22', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (447, 447, 'FAC-20260201-SUB447', '2026-02-01', 4.99, 0.80, 5.79);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (448, 448, 'FAC-20260210-SUB448', '2026-02-10', 24.99, 4.00, 28.99);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (449, 449, 'FAC-20250705-SUB449', '2025-07-05', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (450, 450, 'FAC-20260208-SUB450', '2026-02-08', 9.99, 1.60, 11.59);

-- Facturas correspondientes a las Suscripciones 451 al 460
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (451, 451, 'FAC-20260212-SUB451', '2026-02-12', 19.99, 3.20, 23.19);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (452, 452, 'FAC-20251215-SUB452', '2025-12-15', 4.99, 0.80, 5.79);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (453, 453, 'FAC-20260215-SUB453', '2026-02-15', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (454, 454, 'FAC-20260220-SUB454', '2026-02-20', 12.00, 1.92, 13.92);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (455, 455, 'FAC-20250620-SUB455', '2025-06-20', 9.99, 1.60, 11.59);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (456, 456, 'FAC-20260222-SUB456', '2026-02-22', 3.50, 0.56, 4.06);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (457, 457, 'FAC-20260225-SUB457', '2026-02-25', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (458, 458, 'FAC-20250910-SUB458', '2025-09-10', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (459, 459, 'FAC-20260201-SUB459', '2026-02-01', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (460, 460, 'FAC-20260210-SUB460', '2026-02-10', 20.00, 3.20, 23.20);

-- Facturas correspondientes a las Suscripciones 461 al 470
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (461, 461, 'FAC-20251125-SUB461', '2025-11-25', 3.50, 0.56, 4.06);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (462, 462, 'FAC-20260208-SUB462', '2026-02-08', 6.99, 1.12, 8.11);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (463, 463, 'FAC-20260212-SUB463', '2026-02-12', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (464, 464, 'FAC-20250805-SUB464', '2025-08-05', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (465, 465, 'FAC-20260215-SUB465', '2026-02-15', 2.99, 0.48, 3.47);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (466, 466, 'FAC-20260220-SUB466', '2026-02-20', 30.00, 4.80, 34.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (467, 467, 'FAC-20250512-SUB467', '2025-05-12', 6.99, 1.12, 8.11);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (468, 468, 'FAC-20260222-SUB468', '2026-02-22', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (469, 469, 'FAC-20260225-SUB469', '2026-02-25', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (470, 470, 'FAC-20251018-SUB470', '2025-10-18', 2.99, 0.48, 3.47);

-- Facturas correspondientes a las Suscripciones 471 al 480
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (471, 471, 'FAC-20260201-SUB471', '2026-02-01', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (472, 472, 'FAC-20260210-SUB472', '2026-02-10', 12.00, 1.92, 13.92);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (473, 473, 'FAC-20250722-SUB473', '2025-07-22', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (474, 474, 'FAC-20260208-SUB474', '2026-02-08', 3.00, 0.48, 3.48);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (475, 475, 'FAC-20260212-SUB475', '2026-02-12', 25.00, 4.00, 29.00);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (476, 476, 'FAC-20251205-SUB476', '2025-12-05', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (477, 477, 'FAC-20260215-SUB477', '2026-02-15', 7.50, 1.20, 8.70);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (478, 478, 'FAC-20260220-SUB478', '2026-02-20', 18.00, 2.88, 20.88);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (479, 479, 'FAC-20250912-SUB479', '2025-09-12', 3.00, 0.48, 3.48);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (480, 480, 'FAC-20260222-SUB480', '2026-02-22', 4.00, 0.64, 4.64);

-- Facturas correspondientes a las Suscripciones 481 al 490
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (481, 481, 'FAC-20260225-SUB481', '2026-02-25', 40.00, 6.40, 46.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (482, 482, 'FAC-20250601-SUB482', '2025-06-01', 7.50, 1.20, 8.70);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (483, 483, 'FAC-20260201-SUB483', '2026-02-01', 8.00, 1.28, 9.28);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (484, 484, 'FAC-20260210-SUB484', '2026-02-10', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (485, 485, 'FAC-20251110-SUB485', '2025-11-10', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (486, 486, 'FAC-20260208-SUB486', '2026-02-08', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (487, 487, 'FAC-20260212-SUB487', '2026-02-12', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (488, 488, 'FAC-20250808-SUB488', '2025-08-08', 8.00, 1.28, 9.28);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (489, 489, 'FAC-20260215-SUB489', '2026-02-15', 3.00, 0.48, 3.48);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (490, 490, 'FAC-20260220-SUB490', '2026-02-20', 20.00, 3.20, 23.20);

-- Facturas correspondientes a las Suscripciones 491 al 500
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (491, 491, 'FAC-20251018-SUB491', '2025-10-18', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (492, 492, 'FAC-20260222-SUB492', '2026-02-22', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (493, 493, 'FAC-20260225-SUB493', '2026-02-25', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (494, 494, 'FAC-20250520-SUB494', '2025-05-20', 3.00, 0.48, 3.48);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (495, 495, 'FAC-20260201-SUB495', '2026-02-01', 6.00, 0.96, 6.96);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (496, 496, 'FAC-20260210-SUB496', '2026-02-10', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (497, 497, 'FAC-20251215-SUB497', '2025-12-15', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (498, 498, 'FAC-20260208-SUB498', '2026-02-08', 2.00, 0.32, 2.32);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (499, 499, 'FAC-20260212-SUB499', '2026-02-12', 12.00, 1.92, 13.92);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (500, 500, 'FAC-20250725-SUB500', '2025-07-25', 6.00, 0.96, 6.96);

-- Facturas correspondientes a las Suscripciones 501 al 510
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (501, 501, 'FAC-20260205-SUB501', '2026-02-05', 4.99, 0.80, 5.79);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (502, 502, 'FAC-20250610-SUB502', '2025-06-10', 14.99, 2.40, 17.39);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (503, 503, 'FAC-20260212-SUB503', '2026-02-12', 9.99, 1.60, 11.59);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (504, 504, 'FAC-20250815-SUB504', '2025-08-15', 24.99, 4.00, 28.99);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (505, 505, 'FAC-20260201-SUB505', '2026-02-01', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (506, 506, 'FAC-20250520-SUB506', '2025-05-20', 19.99, 3.20, 23.19);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (507, 507, 'FAC-20260218-SUB507', '2026-02-18', 3.50, 0.56, 4.06);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (508, 508, 'FAC-20250910-SUB508', '2025-09-10', 12.00, 1.92, 13.92);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (509, 509, 'FAC-20260222-SUB509', '2026-02-22', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (510, 510, 'FAC-20251105-SUB510', '2025-11-05', 15.00, 2.40, 17.40);

-- Facturas correspondientes a las Suscripciones 511 al 520
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (511, 511, 'FAC-20260208-SUB511', '2026-02-08', 6.99, 1.12, 8.11);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (512, 512, 'FAC-20250712-SUB512', '2025-07-12', 20.00, 3.20, 23.20);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (513, 513, 'FAC-20260215-SUB513', '2026-02-15', 2.99, 0.48, 3.47);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (514, 514, 'FAC-20251018-SUB514', '2025-10-18', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (515, 515, 'FAC-20260205-SUB515', '2026-02-05', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (516, 516, 'FAC-20250420-SUB516', '2025-04-20', 30.00, 4.80, 34.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (517, 517, 'FAC-20260210-SUB517', '2026-02-10', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (518, 518, 'FAC-20251201-SUB518', '2025-12-01', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (519, 519, 'FAC-20260220-SUB519', '2026-02-20', 3.00, 0.48, 3.48);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (520, 520, 'FAC-20250825-SUB520', '2025-08-25', 12.00, 1.92, 13.92);

-- Facturas correspondientes a las Suscripciones 521 al 530
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (521, 521, 'FAC-20260201-SUB521', '2026-02-01', 7.50, 1.20, 8.70);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (522, 522, 'FAC-20250605-SUB522', '2025-06-05', 25.00, 4.00, 29.00);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (523, 523, 'FAC-20260212-SUB523', '2026-02-12', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (524, 524, 'FAC-20251115-SUB524', '2025-11-15', 18.00, 2.88, 20.88);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (525, 525, 'FAC-20260218-SUB525', '2026-02-18', 8.00, 1.28, 9.28);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (526, 526, 'FAC-20250922-SUB526', '2025-09-22', 40.00, 6.40, 46.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (527, 527, 'FAC-20260205-SUB527', '2026-02-05', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (528, 528, 'FAC-20250510-SUB528', '2025-05-10', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (529, 529, 'FAC-20260222-SUB529', '2026-02-22', 3.00, 0.48, 3.48);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (530, 530, 'FAC-20251008-SUB530', '2025-10-08', 10.00, 1.60, 11.60);

-- Facturas correspondientes a las Suscripciones 531 al 540
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (531, 531, 'FAC-20260208-SUB531', '2026-02-08', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (532, 532, 'FAC-20250718-SUB532', '2025-07-18', 20.00, 3.20, 23.20);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (533, 533, 'FAC-20260215-SUB533', '2026-02-15', 6.00, 0.96, 6.96);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (534, 534, 'FAC-20251212-SUB534', '2025-12-12', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (535, 535, 'FAC-20260201-SUB535', '2026-02-01', 2.00, 0.32, 2.32);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (536, 536, 'FAC-20250805-SUB536', '2025-08-05', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (537, 537, 'FAC-20260210-SUB537', '2026-02-10', 4.50, 0.72, 5.22);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (538, 538, 'FAC-20250622-SUB538', '2025-06-22', 12.00, 1.92, 13.92);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (539, 539, 'FAC-20260220-SUB539', '2026-02-20', 5.50, 0.88, 6.38);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (540, 540, 'FAC-20251125-SUB540', '2025-11-25', 30.00, 4.80, 34.80);

-- Facturas correspondientes a las Suscripciones 541 al 550
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (541, 541, 'FAC-20260205-SUB541', '2026-02-05', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (542, 542, 'FAC-20250908-SUB542', '2025-09-08', 35.00, 5.60, 40.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (543, 543, 'FAC-20260218-SUB543', '2026-02-18', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (544, 544, 'FAC-20250412-SUB544', '2025-04-12', 50.00, 8.00, 58.00);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (545, 545, 'FAC-20260212-SUB545', '2026-02-12', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (546, 546, 'FAC-20251020-SUB546', '2025-10-20', 25.00, 4.00, 29.00);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (547, 547, 'FAC-20260222-SUB547', '2026-02-22', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (548, 548, 'FAC-20250702-SUB548', '2025-07-02', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (549, 549, 'FAC-20260208-SUB549', '2026-02-08', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (550, 550, 'FAC-20251218-SUB550', '2025-12-18', 20.00, 3.20, 23.20);

-- Facturas correspondientes a las Suscripciones 551 al 560
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (551, 551, 'FAC-20260201-SUB551', '2026-02-01', 4.99, 0.80, 5.79);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (552, 552, 'FAC-20250810-SUB552', '2025-08-10', 14.99, 2.40, 17.39);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (553, 553, 'FAC-20260215-SUB553', '2026-02-15', 9.99, 1.60, 11.59);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (554, 554, 'FAC-20250505-SUB554', '2025-05-05', 24.99, 4.00, 28.99);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (555, 555, 'FAC-20260210-SUB555', '2026-02-10', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (556, 556, 'FAC-20251122-SUB556', '2025-11-22', 19.99, 3.20, 23.19);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (557, 557, 'FAC-20260220-SUB557', '2026-02-20', 3.50, 0.56, 4.06);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (558, 558, 'FAC-20250915-SUB558', '2025-09-15', 12.00, 1.92, 13.92);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (559, 559, 'FAC-20260205-SUB559', '2026-02-05', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (560, 560, 'FAC-20250625-SUB560', '2025-06-25', 15.00, 2.40, 17.40);

-- Facturas correspondientes a las Suscripciones 561 al 570
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (561, 561, 'FAC-20260218-SUB561', '2026-02-18', 6.99, 1.12, 8.11);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (562, 562, 'FAC-20251208-SUB562', '2025-12-08', 20.00, 3.20, 23.20);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (563, 563, 'FAC-20260212-SUB563', '2026-02-12', 2.99, 0.48, 3.47);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (564, 564, 'FAC-20250820-SUB564', '2025-08-20', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (565, 565, 'FAC-20260222-SUB565', '2026-02-22', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (566, 566, 'FAC-20251002-SUB566', '2025-10-02', 30.00, 4.80, 34.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (567, 567, 'FAC-20260208-SUB567', '2026-02-08', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (568, 568, 'FAC-20250515-SUB568', '2025-05-15', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (569, 569, 'FAC-20260215-SUB569', '2026-02-15', 3.00, 0.48, 3.48);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (570, 570, 'FAC-20251110-SUB570', '2025-11-10', 12.00, 1.92, 13.92);

-- Facturas correspondientes a las Suscripciones 571 al 580
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (571, 571, 'FAC-20260201-SUB571', '2026-02-01', 7.50, 1.20, 8.70);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (572, 572, 'FAC-20250905-SUB572', '2025-09-05', 25.00, 4.00, 29.00);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (573, 573, 'FAC-20260220-SUB573', '2026-02-20', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (574, 574, 'FAC-20250618-SUB574', '2025-06-18', 18.00, 2.88, 20.88);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (575, 575, 'FAC-20260210-SUB575', '2026-02-10', 8.00, 1.28, 9.28);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (576, 576, 'FAC-20251222-SUB576', '2025-12-22', 40.00, 6.40, 46.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (577, 577, 'FAC-20260205-SUB577', '2026-02-05', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (578, 578, 'FAC-20250825-SUB578', '2025-08-25', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (579, 579, 'FAC-20260212-SUB579', '2026-02-12', 3.00, 0.48, 3.48);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (580, 580, 'FAC-20250502-SUB580', '2025-05-02', 10.00, 1.60, 11.60);

-- Facturas correspondientes a las Suscripciones 581 al 590
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (581, 581, 'FAC-20260218-SUB581', '2026-02-18', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (582, 582, 'FAC-20251015-SUB582', '2025-10-15', 20.00, 3.20, 23.20);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (583, 583, 'FAC-20260222-SUB583', '2026-02-22', 6.00, 0.96, 6.96);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (584, 584, 'FAC-20250708-SUB584', '2025-07-08', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (585, 585, 'FAC-20260208-SUB585', '2026-02-08', 2.00, 0.32, 2.32);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (586, 586, 'FAC-20251205-SUB586', '2025-12-05', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (587, 587, 'FAC-20260215-SUB587', '2026-02-15', 4.50, 0.72, 5.22);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (588, 588, 'FAC-20250912-SUB588', '2025-09-12', 12.00, 1.92, 13.92);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (589, 589, 'FAC-20260201-SUB589', '2026-02-01', 5.50, 0.88, 6.38);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (590, 590, 'FAC-20250625-SUB590', '2025-06-25', 30.00, 4.80, 34.80);

-- Facturas correspondientes a las Suscripciones 591 al 600
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (591, 591, 'FAC-20260210-SUB591', '2026-02-10', 10.00, 1.60, 11.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (592, 592, 'FAC-20251120-SUB592', '2025-11-20', 35.00, 5.60, 40.60);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (593, 593, 'FAC-20260220-SUB593', '2026-02-20', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (594, 594, 'FAC-20250810-SUB594', '2025-08-10', 50.00, 8.00, 58.00);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (595, 595, 'FAC-20260205-SUB595', '2026-02-05', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (596, 596, 'FAC-20250518-SUB596', '2025-05-18', 25.00, 4.00, 29.00);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (597, 597, 'FAC-20260212-SUB597', '2026-02-12', 4.00, 0.64, 4.64);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (598, 598, 'FAC-20251005-SUB598', '2025-10-05', 15.00, 2.40, 17.40);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (599, 599, 'FAC-20260218-SUB599', '2026-02-18', 5.00, 0.80, 5.80);
INSERT INTO Factura (id, idSuscripcion, codigo_transaccion, fecha_emision, sub_total, monto_impuesto, monto_total) VALUES (600, 600, 'FAC-20250715-SUB600', '2025-07-15', 20.00, 3.20, 23.20);

SET IDENTITY_INSERT Factura OFF;

----------- publicacion--------------

SET IDENTITY_INSERT Publicacion ON;

-- ============================================================
-- CREADOR 1 (Categoría: Gaming) - IDs 1 al 32
-- ============================================================
INSERT INTO Publicacion (id, idCreador, titulo, fecha_publicacion, es_publica, tipo_contenido) VALUES 
(1, 1, 'Top 10 RPGs de la década', '2025-03-15', 1, 'VIDEO'),
(2, 1, 'Mi Setup para Streaming 2025', '2025-03-25', 1, 'IMAGEN'),
(3, 1, 'Guía de farmeo avanzado (Parte 1)', '2025-04-05', 0, 'TEXTO'),
(4, 1, 'Análisis de la última actualización', '2025-04-15', 0, 'VIDEO'),
(5, 1, 'Mejores momentos del torneo local', '2025-04-25', 1, 'VIDEO'),
(6, 1, 'Tier List de personajes', '2025-05-05', 1, 'IMAGEN'),
(7, 1, 'Historia oculta del jefe final', '2025-05-15', 0, 'TEXTO'),
(8, 1, 'Estrategia competitiva en equipo', '2025-05-25', 0, 'VIDEO'),
(9, 1, 'Unboxing de mis nuevos periféricos', '2025-06-05', 1, 'VIDEO'),
(10, 1, 'Capturas 4K del nuevo mapa', '2025-06-15', 1, 'IMAGEN'),
(11, 1, 'Cómo configurar tus macros', '2025-06-25', 0, 'TEXTO'),
(12, 1, 'Gameplay sin comentarios (No hit)', '2025-07-05', 0, 'VIDEO'),
(13, 1, 'Reseña: El juego más esperado', '2025-07-15', 1, 'VIDEO'),
(14, 1, 'Foto con los fans en el evento', '2025-07-25', 1, 'IMAGEN'),
(15, 1, 'Filtraciones del próximo parche', '2025-08-05', 0, 'TEXTO'),
(16, 1, 'Tutorial de combos avanzados', '2025-08-15', 0, 'VIDEO'),
(17, 1, 'Mis peores derrotas en directo', '2025-08-25', 1, 'VIDEO'),
(18, 1, 'Wallpapers exclusivos para PC', '2025-09-05', 1, 'IMAGEN'),
(19, 1, 'Diario de desarrollo: Modding', '2025-09-15', 0, 'TEXTO'),
(20, 1, 'Speedrun World Record attempt', '2025-09-25', 0, 'VIDEO'),
(21, 1, 'Probando juegos indies raros', '2025-10-05', 1, 'VIDEO'),
(22, 1, 'Arte conceptual filtrado', '2025-10-15', 1, 'IMAGEN'),
(23, 1, 'Reflexiones sobre la industria', '2025-10-25', 0, 'TEXTO'),
(24, 1, 'Entrevista al creador del juego', '2025-11-05', 0, 'VIDEO'),
(25, 1, 'Guía para principiantes', '2025-11-15', 1, 'TEXTO'),
(26, 1, 'El peor bug que he visto', '2025-11-25', 1, 'IMAGEN'),
(27, 1, 'Configuración secreta de video', '2025-12-05', 0, 'TEXTO'),
(28, 1, 'Especial de Navidad: Sorteo', '2025-12-15', 0, 'VIDEO'),
(29, 1, 'Mis resoluciones para 2026', '2026-01-10', 1, 'TEXTO'),
(30, 1, 'Meme del mes en la comunidad', '2026-01-20', 1, 'IMAGEN'),
(31, 1, 'Discord privado: Reglas', '2026-02-10', 0, 'TEXTO'),
(32, 1, 'Reacción al nuevo trailer', '2026-02-28', 0, 'VIDEO');

-- ============================================================
-- CREADOR 2 (Categoría: Fitness) - IDs 33 al 64
-- ============================================================
INSERT INTO Publicacion (id, idCreador, titulo, fecha_publicacion, es_publica, tipo_contenido) VALUES 
(33, 2, 'Mitos sobre la pérdida de grasa', '2025-03-12', 1, 'TEXTO'),
(34, 2, 'Cambio físico de mis clientes', '2025-03-22', 1, 'IMAGEN'),
(35, 2, 'Rutina de Hipertrofia en Casa', '2025-04-02', 0, 'VIDEO'),
(36, 2, 'Infografía: Macros ideales', '2025-04-12', 0, 'IMAGEN'),
(37, 2, 'Vlog: Un día en mi dieta', '2025-04-22', 1, 'VIDEO'),
(38, 2, 'Antes y después en 3 meses', '2025-05-02', 1, 'IMAGEN'),
(39, 2, 'Plan de suplementación', '2025-05-12', 0, 'TEXTO'),
(40, 2, 'Técnica correcta de Sentadilla', '2025-05-22', 0, 'VIDEO'),
(41, 2, 'Por qué no ganas masa muscular', '2025-06-02', 1, 'TEXTO'),
(42, 2, 'Mi compra semanal del súper', '2025-06-12', 1, 'IMAGEN'),
(43, 2, 'Rutina HIIT para quemar calorías', '2025-06-22', 0, 'VIDEO'),
(44, 2, 'Recetario: Postres Fit PDF', '2025-07-02', 0, 'TEXTO'),
(45, 2, 'Entrenando con suscriptores', '2025-07-12', 1, 'VIDEO'),
(46, 2, 'Errores comunes en el gimnasio', '2025-07-22', 1, 'IMAGEN'),
(47, 2, 'Podcast: Motivación diaria', '2025-08-02', 0, 'VIDEO'),
(48, 2, 'Guía de calentamiento articular', '2025-08-12', 0, 'TEXTO'),
(49, 2, 'Beneficios del ayuno intermitente', '2025-08-22', 1, 'TEXTO'),
(50, 2, 'Progreso de fuerza en Peso Muerto', '2025-09-02', 1, 'IMAGEN'),
(51, 2, 'Sesión de estiramientos', '2025-09-12', 0, 'VIDEO'),
(52, 2, 'Check-in semanal: Medidas', '2025-09-22', 0, 'IMAGEN'),
(53, 2, '5 ejercicios de core', '2025-10-02', 1, 'VIDEO'),
(54, 2, 'Outfit de entrenamiento', '2025-10-12', 1, 'IMAGEN'),
(55, 2, 'Cómo calcular tu déficit calórico', '2025-10-22', 0, 'TEXTO'),
(56, 2, 'Clase de movilidad en vivo', '2025-11-02', 0, 'VIDEO'),
(57, 2, 'La importancia de dormir bien', '2025-11-12', 1, 'TEXTO'),
(58, 2, 'Mi batido pre-entreno', '2025-11-22', 1, 'IMAGEN'),
(59, 2, 'Rutina de glúteos de acero', '2025-12-02', 0, 'VIDEO'),
(60, 2, 'Plan de comidas de Diciembre', '2025-12-12', 0, 'TEXTO'),
(61, 2, 'Sobreviviendo las fiestas', '2026-01-05', 1, 'VIDEO'),
(62, 2, 'Mi nuevo gym casero', '2026-01-15', 1, 'IMAGEN'),
(63, 2, 'Seguimiento 1 a 1', '2026-02-05', 0, 'TEXTO'),
(64, 2, 'Desafío de 30 días VIP', '2026-02-20', 0, 'VIDEO');

-- ============================================================
-- CREADOR 3 (Categoría: Tecnología) - IDs 65 al 96
-- ============================================================
INSERT INTO Publicacion (id, idCreador, titulo, fecha_publicacion, es_publica, tipo_contenido) VALUES 
(65, 3, 'Reseña Escrita: Nuevo procesador', '2025-03-18', 1, 'TEXTO'),
(66, 3, 'Unboxing del teclado mecánico', '2025-03-28', 1, 'VIDEO'),
(67, 3, 'Diagrama de flujo de mi último código', '2025-04-08', 0, 'IMAGEN'),
(68, 3, 'Tutorial de Clean Code en Python', '2025-04-18', 0, 'TEXTO'),
(69, 3, 'Top 5 portátiles calidad-precio', '2025-04-28', 1, 'VIDEO'),
(70, 3, 'Mi escritorio de trabajo', '2025-05-08', 1, 'IMAGEN'),
(71, 3, 'Scripts útiles para automatizar', '2025-05-18', 0, 'TEXTO'),
(72, 3, 'Curso intensivo de SQL (Parte 1)', '2025-05-28', 0, 'VIDEO'),
(73, 3, 'Opinión: El futuro de la IA', '2025-06-08', 1, 'TEXTO'),
(74, 3, 'Test de rendimiento GPU', '2025-06-18', 1, 'IMAGEN'),
(75, 3, 'Cómo armar tu PC paso a paso', '2025-06-28', 0, 'VIDEO'),
(76, 3, 'Estructuras de datos explicadas', '2025-07-08', 0, 'TEXTO'),
(77, 3, 'Noticias Tech de la semana', '2025-07-18', 1, 'VIDEO'),
(78, 3, 'Comparativa visual de monitores', '2025-07-28', 1, 'IMAGEN'),
(79, 3, 'Vulnerabilidades de ciberseguridad', '2025-08-08', 0, 'TEXTO'),
(80, 3, 'Hackeando una red (Ético)', '2025-08-18', 0, 'VIDEO'),
(81, 3, 'Guía de compra de smartphones', '2025-08-28', 1, 'TEXTO'),
(82, 3, 'Limpieza profunda de mi PC', '2025-09-08', 1, 'IMAGEN'),
(83, 3, 'Introducción a Docker', '2025-09-18', 0, 'VIDEO'),
(84, 3, 'Hoja de trucos (Cheat sheet) Git', '2025-09-28', 0, 'IMAGEN'),
(85, 3, 'Mi experiencia trabajando remoto', '2025-10-08', 1, 'VIDEO'),
(86, 3, 'Fotos de la convención Tech', '2025-10-18', 1, 'IMAGEN'),
(87, 3, 'Arquitectura de software', '2025-10-28', 0, 'TEXTO'),
(88, 3, 'Deploy en AWS', '2025-11-08', 0, 'VIDEO'),
(89, 3, 'Por qué dejé mi antiguo trabajo', '2025-11-18', 1, 'TEXTO'),
(90, 3, 'Cables ordenados nivel Dios', '2025-11-28', 1, 'IMAGEN'),
(91, 3, 'Entrevista a ingeniero Senior', '2025-12-08', 0, 'VIDEO'),
(92, 3, 'Mi roadmap para desarrolladores', '2025-12-18', 0, 'TEXTO'),
(93, 3, 'Analizando código de suscriptores', '2026-01-08', 1, 'VIDEO'),
(94, 3, 'Setup de viaje', '2026-01-18', 1, 'IMAGEN'),
(95, 3, 'Código fuente del proyecto final', '2026-02-08', 0, 'TEXTO'),
(96, 3, 'Consultoría técnica en vivo', '2026-02-25', 0, 'VIDEO');

-- ============================================================
-- CREADOR 4 (Categoría: Arte Digital) - IDs 97 al 128
-- ============================================================
INSERT INTO Publicacion (id, idCreador, titulo, fecha_publicacion, es_publica, tipo_contenido) VALUES 
(97, 4, 'Speedpaint de mi último concepto', '2025-03-10', 1, 'VIDEO'),
(98, 4, 'Boceto finalizado del héroe', '2025-03-21', 1, 'IMAGEN'),
(99, 4, 'Técnicas de sombreado digital', '2025-04-01', 0, 'TEXTO'),
(100, 4, 'Clase: Anatomía básica', '2025-04-12', 0, 'VIDEO'),
(101, 4, 'Redibujando arte de seguidores', '2025-04-23', 1, 'VIDEO'),
(102, 4, 'Mi paleta de colores favorita', '2025-05-04', 1, 'IMAGEN'),
(103, 4, 'Cómo encontrar tu estilo', '2025-05-15', 0, 'TEXTO'),
(104, 4, 'Clase: Perspectiva y puntos de fuga', '2025-05-26', 0, 'VIDEO'),
(105, 4, 'Materiales que uso para dibujar', '2025-06-06', 1, 'TEXTO'),
(106, 4, 'Fanart del anime del momento', '2025-06-17', 1, 'IMAGEN'),
(107, 4, 'Pinceles exclusivos para Photoshop', '2025-06-28', 0, 'TEXTO'),
(108, 4, 'Proceso completo sin cortes (4 horas)', '2025-07-09', 0, 'VIDEO'),
(109, 4, 'Consejos para superar el bloqueo', '2025-07-20', 1, 'TEXTO'),
(110, 4, 'Diseño de fondos sci-fi', '2025-07-31', 1, 'IMAGEN'),
(111, 4, 'Archivo PSD original descargable', '2025-08-11', 0, 'IMAGEN'),
(112, 4, 'Q&A sobre concept art', '2025-08-22', 0, 'VIDEO'),
(113, 4, 'Reto: Dibujar con la mano izquierda', '2025-09-02', 1, 'VIDEO'),
(114, 4, 'Ilustración terminada "Cyber City"', '2025-09-13', 1, 'IMAGEN'),
(115, 4, 'Guía para cobrar por comisiones', '2025-09-24', 0, 'TEXTO'),
(116, 4, 'Entintado digital nivel avanzado', '2025-10-05', 0, 'VIDEO'),
(117, 4, 'Probando una nueva tableta', '2025-10-16', 1, 'VIDEO'),
(118, 4, 'Sketches rápidos en la cafetería', '2025-10-27', 1, 'IMAGEN'),
(119, 4, 'Referencias fotográficas exclusivas', '2025-11-07', 0, 'TEXTO'),
(120, 4, 'Renderizando metales y texturas', '2025-11-18', 0, 'VIDEO'),
(121, 4, 'Reseña de nuevo software 2D', '2025-11-29', 1, 'TEXTO'),
(122, 4, 'Mi primer dibujo vs El último', '2025-12-10', 1, 'IMAGEN'),
(123, 4, 'Feedback en vivo de sus portafolios', '2025-12-21', 0, 'TEXTO'),
(124, 4, 'Animación 2D paso a paso', '2026-01-02', 0, 'VIDEO'),
(125, 4, 'Historia de mi viaje artístico', '2026-01-13', 1, 'TEXTO'),
(126, 4, 'Concept art para juego indie', '2026-01-24', 1, 'IMAGEN'),
(127, 4, 'Wallpapers en alta resolución', '2026-02-04', 0, 'IMAGEN'),
(128, 4, 'Capas separadas del proyecto', '2026-02-15', 0, 'IMAGEN');

-- ============================================================
-- CREADOR 5 (Categoría: Música) - IDs 129 al 160
-- ============================================================
INSERT INTO Publicacion (id, idCreador, titulo, fecha_publicacion, es_publica, tipo_contenido) VALUES 
(129, 5, 'Cover de rock clásico', '2025-03-11', 1, 'VIDEO'),
(130, 5, 'Mi nuevo estudio de grabación', '2025-03-22', 1, 'IMAGEN'),
(131, 5, 'Teoría musical: Escalas modales', '2025-04-02', 0, 'TEXTO'),
(132, 5, 'Sesión de mezcla en vivo', '2025-04-13', 0, 'VIDEO'),
(133, 5, 'Escribiendo un tema en 10 minutos', '2025-04-24', 1, 'VIDEO'),
(134, 5, 'Mi colección de guitarras', '2025-05-05', 1, 'IMAGEN'),
(135, 5, 'Partituras de mi último tema', '2025-05-16', 0, 'TEXTO'),
(136, 5, 'Masterización paso a paso', '2025-05-27', 0, 'VIDEO'),
(137, 5, 'Equipo necesario para producir', '2025-06-07', 1, 'TEXTO'),
(138, 5, 'Foto del concierto acústico', '2025-06-18', 1, 'IMAGEN'),
(139, 5, 'Progresiones de acordes jazz', '2025-06-29', 0, 'TEXTO'),
(140, 5, 'Analizando pista vocal aislada', '2025-07-10', 0, 'VIDEO'),
(141, 5, 'Reseña: Mi nuevo sintetizador', '2025-07-21', 1, 'TEXTO'),
(142, 5, 'Setup de pedales de efectos', '2025-08-01', 1, 'IMAGEN'),
(143, 5, 'Stems de percusión descargables', '2025-08-12', 0, 'IMAGEN'),
(144, 5, 'Vlog de producción: Día 1', '2025-08-23', 0, 'VIDEO'),
(145, 5, 'Colaboración con otro artista', '2025-09-03', 1, 'VIDEO'),
(146, 5, 'Portada oficial del nuevo EP', '2025-09-14', 1, 'IMAGEN'),
(147, 5, 'Distribución digital en Spotify', '2025-09-25', 0, 'TEXTO'),
(148, 5, 'Diseño de sonido desde cero', '2025-10-06', 0, 'VIDEO'),
(149, 5, 'Q&A Musical', '2025-10-17', 1, 'VIDEO'),
(150, 5, 'Trabajando hasta tarde en el DAW', '2025-10-28', 1, 'IMAGEN'),
(151, 5, 'Preset de ecualización vocal', '2025-11-08', 0, 'TEXTO'),
(152, 5, 'Componiendo la línea de bajo', '2025-11-19', 0, 'VIDEO'),
(153, 5, 'Mi experiencia en la industria', '2025-11-30', 1, 'TEXTO'),
(154, 5, 'Disco de vinilo edición limitada', '2025-12-11', 1, 'IMAGEN'),
(155, 5, 'Letras de canciones inéditas', '2025-12-22', 0, 'TEXTO'),
(156, 5, 'Entrevista a ingeniero de sonido', '2026-01-03', 0, 'VIDEO'),
(157, 5, 'Mejores plugins VST gratuitos', '2026-01-14', 1, 'TEXTO'),
(158, 5, 'Setlist del próximo show', '2026-01-25', 1, 'IMAGEN'),
(159, 5, 'Samples exclusivos de batería', '2026-02-05', 0, 'IMAGEN'),
(160, 5, 'Track instrumental sin royalties', '2026-02-16', 0, 'IMAGEN');

-- ============================================================
-- CREADOR 6 (Categoría: Cocina) - IDs 161 al 192
-- ============================================================
INSERT INTO Publicacion (id, idCreador, titulo, fecha_publicacion, es_publica, tipo_contenido) VALUES 
(161, 6, 'Receta fácil: Pasta al pesto', '2025-03-12', 1, 'VIDEO'),
(162, 6, 'El emplatado de la cena', '2025-03-23', 1, 'IMAGEN'),
(163, 6, 'Receta detallada: Masa madre', '2025-04-03', 0, 'TEXTO'),
(164, 6, 'Secretos de chefs franceses', '2025-04-14', 0, 'VIDEO'),
(165, 6, 'Reto: Cocinando con 5 dólares', '2025-04-25', 1, 'VIDEO'),
(166, 6, 'Mis cuchillos profesionales', '2025-05-06', 1, 'IMAGEN'),
(167, 6, 'Guía de temperaturas para carnes', '2025-05-17', 0, 'TEXTO'),
(168, 6, 'Clase magistral: Salsas madre', '2025-05-28', 0, 'VIDEO'),
(169, 6, 'Ingredientes para tu despensa', '2025-06-08', 1, 'TEXTO'),
(170, 6, 'El asado perfecto de domingo', '2025-06-19', 1, 'IMAGEN'),
(171, 6, 'Lista de compras semanal', '2025-06-30', 0, 'TEXTO'),
(172, 6, 'Fileteando un pescado entero', '2025-07-11', 0, 'VIDEO'),
(173, 6, 'Tips para no llorar con cebolla', '2025-07-22', 1, 'TEXTO'),
(174, 6, 'Mi jardín de especias frescas', '2025-08-02', 1, 'IMAGEN'),
(175, 6, 'Menú imprimible del mes', '2025-08-13', 0, 'IMAGEN'),
(176, 6, 'Taller de panadería artesanal', '2025-08-24', 0, 'VIDEO'),
(177, 6, 'Postres rápidos sin horno', '2025-09-04', 1, 'VIDEO'),
(178, 6, 'Tarta de chocolate negro intenso', '2025-09-15', 1, 'IMAGEN'),
(179, 6, 'Sustitución de ingredientes', '2025-09-26', 0, 'TEXTO'),
(180, 6, 'Cocinando alta gastronomía', '2025-10-07', 0, 'VIDEO'),
(181, 6, 'Probando comida callejera', '2025-10-18', 1, 'VIDEO'),
(182, 6, 'Desayuno de campeones', '2025-10-29', 1, 'IMAGEN'),
(183, 6, 'Conservación de alimentos', '2025-11-09', 0, 'TEXTO'),
(184, 6, 'Clase: Cortes de vegetales', '2025-11-20', 0, 'VIDEO'),
(185, 6, 'Cómo afilar tus cuchillos', '2025-12-01', 1, 'TEXTO'),
(186, 6, 'Paella valenciana tradicional', '2025-12-12', 1, 'IMAGEN'),
(187, 6, 'Maridaje de vinos y quesos', '2025-12-23', 0, 'TEXTO'),
(188, 6, 'Detrás de cámaras en cocina', '2026-01-04', 0, 'VIDEO'),
(189, 6, 'Utensilios que no valen la pena', '2026-01-15', 1, 'TEXTO'),
(190, 6, 'Mise en place listo', '2026-01-26', 1, 'IMAGEN'),
(191, 6, 'Recetario VIP en PDF', '2026-02-06', 0, 'IMAGEN'),
(192, 6, 'Infografía de tiempos cocción', '2026-02-17', 0, 'IMAGEN');

-- ============================================================
-- CREADOR 7 (Categoría: Vlogs) - IDs 193 al 224
-- ============================================================
INSERT INTO Publicacion (id, idCreador, titulo, fecha_publicacion, es_publica, tipo_contenido) VALUES 
(193, 7, 'Paseando por el centro histórico', '2025-03-14', 1, 'VIDEO'),
(194, 7, 'Mi outfit para el fin de semana', '2025-03-24', 1, 'IMAGEN'),
(195, 7, 'Anécdotas que no conté en video', '2025-04-04', 0, 'TEXTO'),
(196, 7, 'Detrás de cámaras del último viaje', '2025-04-14', 0, 'VIDEO'),
(197, 7, 'Un día en mi vida: Edición domingo', '2025-04-24', 1, 'VIDEO'),
(198, 7, 'Paisaje desde mi ventana hoy', '2025-05-04', 1, 'IMAGEN'),
(199, 7, 'Diario: Mis miedos al empezar YouTube', '2025-05-14', 0, 'TEXTO'),
(200, 7, 'Vlog exclusivo: Mi fiesta de cumpleaños', '2025-05-24', 0, 'VIDEO'),
(201, 7, '10 cosas que no sabías de mí', '2025-06-04', 1, 'TEXTO'),
(202, 7, 'Mi nueva cámara para vlogging', '2025-06-14', 1, 'IMAGEN'),
(203, 7, 'Lugares secretos que visito para pensar', '2025-06-24', 0, 'TEXTO'),
(204, 7, 'Room tour completo sin censura', '2025-07-04', 0, 'VIDEO'),
(205, 7, 'Mis resoluciones para este año', '2025-07-14', 1, 'TEXTO'),
(206, 7, 'Mi perro haciendo destrozos', '2025-07-24', 1, 'IMAGEN'),
(207, 7, 'Álbum de fotos de la infancia', '2025-08-04', 0, 'IMAGEN'),
(208, 7, 'Charla íntima: Cómo manejo el hate', '2025-08-14', 0, 'VIDEO'),
(209, 7, 'Reto: 24 horas sin tecnología', '2025-08-24', 1, 'VIDEO'),
(210, 7, 'Preparando la maleta para Europa', '2025-09-04', 1, 'IMAGEN'),
(211, 7, 'Guía detallada de mi itinerario', '2025-09-14', 0, 'TEXTO'),
(212, 7, 'Errores divertidos al grabar (Bloopers)', '2025-09-24', 0, 'VIDEO'),
(213, 7, 'Probando comida callejera extraña', '2025-10-04', 1, 'VIDEO'),
(214, 7, 'Selfie con seguidores en la plaza', '2025-10-14', 1, 'IMAGEN'),
(215, 7, 'Carta a mis primeros suscriptores', '2025-10-24', 0, 'TEXTO'),
(216, 7, 'Preguntas y respuestas picantes', '2025-11-04', 0, 'VIDEO'),
(217, 7, 'Mi rutina de mañana productiva', '2025-11-14', 1, 'TEXTO'),
(218, 7, 'Antes y después de arreglar mi cuarto', '2025-11-24', 1, 'IMAGEN'),
(219, 7, 'Poema que escribí anoche', '2025-12-04', 0, 'TEXTO'),
(220, 7, 'Vlog de madrugada y reflexiones', '2025-12-14', 0, 'VIDEO'),
(221, 7, 'Cómo edito mis vlogs (Lista de apps)', '2026-01-08', 1, 'TEXTO'),
(222, 7, 'Miniatura descartada del video', '2026-01-18', 1, 'IMAGEN'),
(223, 7, 'Fondo de pantalla oficial del canal', '2026-02-08', 0, 'IMAGEN'),
(224, 7, 'Collage de fotos inéditas de 2025', '2026-02-18', 0, 'IMAGEN');

-- ============================================================
-- CREADOR 8 (Categoría: Educación) - IDs 225 al 256
-- ============================================================
INSERT INTO Publicacion (id, idCreador, titulo, fecha_publicacion, es_publica, tipo_contenido) VALUES 
(225, 8, 'Clase abierta: Introducción a la Física', '2025-03-16', 1, 'VIDEO'),
(226, 8, 'Infografía: Leyes de Newton', '2025-03-26', 1, 'IMAGEN'),
(227, 8, 'Guía de ejercicios resueltos (PDF)', '2025-04-06', 0, 'TEXTO'),
(228, 8, 'Clase intensiva de Cálculo Integral', '2025-04-16', 0, 'VIDEO'),
(229, 8, 'Cómo tomar apuntes efectivos', '2025-04-26', 1, 'VIDEO'),
(230, 8, 'Esquema: Revolución Francesa', '2025-05-06', 1, 'IMAGEN'),
(231, 8, 'Tips para superar ansiedad en exámenes', '2025-05-16', 0, 'TEXTO'),
(232, 8, 'Tutoría en vivo: Resolución de dudas', '2025-05-26', 0, 'VIDEO'),
(233, 8, '5 métodos de estudio comprobados', '2025-06-06', 1, 'TEXTO'),
(234, 8, 'Mi setup de escritorio para estudiar', '2025-06-16', 1, 'IMAGEN'),
(235, 8, 'Banco de exámenes de semestres pasados', '2025-06-26', 0, 'TEXTO'),
(236, 8, 'Resolviendo el examen de admisión UCV', '2025-07-06', 0, 'VIDEO'),
(237, 8, 'Lista de libros recomendados', '2025-07-16', 1, 'TEXTO'),
(238, 8, 'Tabla periódica interactiva', '2025-07-26', 1, 'IMAGEN'),
(239, 8, 'Resúmenes gráficos de química', '2025-08-06', 0, 'IMAGEN'),
(240, 8, 'Laboratorio virtual: Reacciones', '2025-08-16', 0, 'VIDEO'),
(241, 8, 'Aprende a programar en Python', '2025-08-26', 1, 'VIDEO'),
(242, 8, 'Diagrama de flujo de algoritmos', '2025-09-06', 1, 'IMAGEN'),
(243, 8, 'Código fuente y notas del proyecto 1', '2025-09-16', 0, 'TEXTO'),
(244, 8, 'Seminario Privado: Inteligencia Artificial', '2025-09-26', 0, 'VIDEO'),
(245, 8, 'El método Pomodoro explicado', '2025-10-06', 1, 'VIDEO'),
(246, 8, 'Fotos de mi graduación', '2025-10-16', 1, 'IMAGEN'),
(247, 8, 'Ensayo sobre historia contemporánea', '2025-10-26', 0, 'TEXTO'),
(248, 8, 'Asesoría vocacional personalizada', '2025-11-06', 0, 'VIDEO'),
(249, 8, 'Cómo usar Notion para la universidad', '2025-11-16', 1, 'TEXTO'),
(250, 8, 'Plantilla de Notion descargable', '2025-11-26', 1, 'IMAGEN'),
(251, 8, 'Guía para armar tu horario', '2025-12-06', 0, 'TEXTO'),
(252, 8, 'Clase de repaso de Álgebra Lineal', '2025-12-16', 0, 'VIDEO'),
(253, 8, 'Mis notas de la facultad de ciencias', '2026-01-12', 1, 'TEXTO'),
(254, 8, 'Mapa conceptual del cerebro', '2026-01-22', 1, 'IMAGEN'),
(255, 8, 'Flashcards para Biología', '2026-02-12', 0, 'IMAGEN'),
(256, 8, 'Diagramas de estructuras celulares', '2026-02-22', 0, 'IMAGEN');

-- ============================================================
-- CREADOR 9 (Categoría: ASMR) - IDs 257 al 288
-- ============================================================
INSERT INTO Publicacion (id, idCreador, titulo, fecha_publicacion, es_publica, tipo_contenido) VALUES 
(257, 9, 'Sonidos relajantes con madera', '2025-03-18', 1, 'VIDEO'),
(258, 9, 'Mi nuevo micrófono binaural', '2025-03-28', 1, 'IMAGEN'),
(259, 9, 'Reflexiones sobre la ansiedad', '2025-04-08', 0, 'TEXTO'),
(260, 9, 'ASMR para dormir en 10 minutos', '2025-04-18', 0, 'VIDEO'),
(261, 9, 'Roleplay: Visita al oftalmólogo', '2025-04-28', 1, 'VIDEO'),
(262, 9, 'Set de grabación con luces tenues', '2025-05-08', 1, 'IMAGEN'),
(263, 9, 'Diario de afirmaciones positivas', '2025-05-18', 0, 'TEXTO'),
(264, 9, 'Masaje capilar virtual sin hablar', '2025-05-28', 0, 'VIDEO'),
(265, 9, '10 triggers que debes probar', '2025-06-08', 1, 'TEXTO'),
(266, 9, 'Foto de los props de hoy', '2025-06-18', 1, 'IMAGEN'),
(267, 9, 'Guión del roleplay de mañana', '2025-06-28', 0, 'TEXTO'),
(268, 9, 'Sonidos de boca (Mouth sounds)', '2025-07-08', 0, 'VIDEO'),
(269, 9, 'Beneficios del ASMR para la salud', '2025-07-18', 1, 'TEXTO'),
(270, 9, 'Velas aromáticas que recomiendo', '2025-07-28', 1, 'IMAGEN'),
(271, 9, 'Fondo de pantalla relajante', '2025-08-08', 0, 'IMAGEN'),
(272, 9, 'Roleplay exclusivo: Spa de lujo', '2025-08-18', 0, 'VIDEO'),
(273, 9, 'Tapping en objetos de vidrio', '2025-08-28', 1, 'VIDEO'),
(274, 9, 'Boceto de mi avatar animado', '2025-09-08', 1, 'IMAGEN'),
(275, 9, 'Mensaje de buenas noches', '2025-09-18', 0, 'TEXTO'),
(276, 9, 'Atención personal intensiva', '2025-09-28', 0, 'VIDEO'),
(277, 9, 'Susurros inaudibles (Inaudible)', '2025-10-08', 1, 'VIDEO'),
(278, 9, 'Mi colección de cepillos', '2025-10-18', 1, 'IMAGEN'),
(279, 9, 'Carta para días difíciles', '2025-10-28', 0, 'TEXTO'),
(280, 9, 'ASMR agresivo y rápido', '2025-11-08', 0, 'VIDEO'),
(281, 9, 'Cómo cuidar tu higiene del sueño', '2025-11-18', 1, 'TEXTO'),
(282, 9, 'Captura de las ondas de audio', '2025-11-28', 1, 'IMAGEN'),
(283, 9, 'Poesía leída en voz baja', '2025-12-08', 0, 'TEXTO'),
(284, 9, 'Limpiando tus oídos', '2025-12-18', 0, 'VIDEO'),
(285, 9, 'Mi rutina de relajación personal', '2026-01-14', 1, 'TEXTO'),
(286, 9, 'Preview visual del próximo video', '2026-01-24', 1, 'IMAGEN'),
(287, 9, 'Audio puro: Lluvia y truenos', '2026-02-14', 0, 'IMAGEN'),
(288, 9, 'Stickers tiernos del canal', '2026-02-24', 0, 'IMAGEN');

-- ============================================================
-- CREADOR 10 (Categoría: Comedia) - IDs 289 al 320
-- ============================================================
INSERT INTO Publicacion (id, idCreador, titulo, fecha_publicacion, es_publica, tipo_contenido) VALUES 
(289, 10, 'Sketch: Lunes por la mañana', '2025-03-12', 1, 'VIDEO'),
(290, 10, 'Meme de la semana', '2025-03-22', 1, 'IMAGEN'),
(291, 10, 'Borradores de mis chistes malos', '2025-04-02', 0, 'TEXTO'),
(292, 10, 'Bloopers de la última grabación', '2025-04-12', 0, 'VIDEO'),
(293, 10, 'Anécdota: Mi primer show', '2025-04-22', 1, 'TEXTO'),
(294, 10, 'Foto del teatro lleno', '2025-05-02', 1, 'IMAGEN'),
(295, 10, 'Guion del próximo monólogo', '2025-05-12', 0, 'TEXTO'),
(296, 10, 'Show completo en Caracas', '2025-05-22', 0, 'VIDEO'),
(297, 10, 'Parodia de las telenovelas', '2025-06-02', 1, 'VIDEO'),
(298, 10, 'Caricatura hecha por un fan', '2025-06-12', 1, 'IMAGEN'),
(299, 10, 'Chistes descartados y censurados', '2025-06-22', 0, 'TEXTO'),
(300, 10, 'Entrevista incómoda en la calle', '2025-07-02', 0, 'VIDEO'),
(301, 10, 'Por qué la comedia salva vidas', '2025-07-12', 1, 'TEXTO'),
(302, 10, 'Selfie con otros comediantes', '2025-07-22', 1, 'IMAGEN'),
(303, 10, 'Póster oficial firmado (Hi-Res)', '2025-08-02', 0, 'IMAGEN'),
(304, 10, 'Improvisando con el público', '2025-08-12', 0, 'VIDEO'),
(305, 10, 'Tipos de amigos en las fiestas', '2025-08-22', 1, 'VIDEO'),
(306, 10, 'Reacción facial a un meme', '2025-09-02', 1, 'IMAGEN'),
(307, 10, 'Fotos vergonzosas de mi juventud', '2025-09-12', 0, 'IMAGEN'),
(308, 10, 'Rutina de Stand Up exclusiva', '2025-09-22', 0, 'VIDEO'),
(309, 10, 'Reseñando comedias clásicas', '2025-10-02', 1, 'TEXTO'),
(310, 10, 'Mi outfit para el show de hoy', '2025-10-12', 1, 'IMAGEN'),
(311, 10, 'Pase VIP backstage (Fotos)', '2025-10-22', 0, 'IMAGEN'),
(312, 10, 'Vlog de gira por el país', '2025-11-02', 0, 'VIDEO'),
(313, 10, 'Cuando te toca pagar la cuenta', '2025-11-12', 1, 'VIDEO'),
(314, 10, 'Reflexión post-show', '2025-11-22', 1, 'TEXTO'),
(315, 10, 'Fondos de pantalla graciosos', '2025-12-02', 0, 'IMAGEN'),
(316, 10, 'Cómo escribo mi material', '2025-12-12', 0, 'TEXTO'),
(317, 10, 'Mi peor cita (Storytime)', '2026-01-05', 1, 'VIDEO'),
(318, 10, 'Lista de mis comediantes favoritos', '2026-01-15', 1, 'TEXTO'),
(319, 10, 'Diseño de merch exclusivo', '2026-02-05', 0, 'IMAGEN'),
(320, 10, 'Diario de gira: Día 1', '2026-02-20', 0, 'TEXTO');

-- ============================================================
-- CREADOR 11 (Categoría: Moda y Belleza) - IDs 321 al 352
-- ============================================================
INSERT INTO Publicacion (id, idCreador, titulo, fecha_publicacion, es_publica, tipo_contenido) VALUES 
(321, 11, 'Haul de ropa de temporada', '2025-03-14', 1, 'VIDEO'),
(322, 11, 'Outfit of the Day (OOTD)', '2025-03-24', 1, 'IMAGEN'),
(323, 11, 'Análisis de tendencias 2026', '2025-04-04', 0, 'TEXTO'),
(324, 11, 'Tutorial de maquillaje de noche', '2025-04-14', 0, 'VIDEO'),
(325, 11, 'Cómo combinar colores neutros', '2025-04-24', 1, 'TEXTO'),
(326, 11, 'Mis labiales favoritos', '2025-05-04', 1, 'IMAGEN'),
(327, 11, 'Lista de compras para skincare', '2025-05-14', 0, 'TEXTO'),
(328, 11, 'Rutina de cuidado facial nocturna', '2025-05-24', 0, 'VIDEO'),
(329, 11, 'Probando ropa de marcas económicas', '2025-06-04', 1, 'VIDEO'),
(330, 11, 'Accesorios imprescindibles del mes', '2025-06-14', 1, 'IMAGEN'),
(331, 11, 'Guía de colorimetría personal', '2025-06-24', 0, 'TEXTO'),
(332, 11, 'Vístete conmigo (Edición evento VIP)', '2025-07-04', 0, 'VIDEO'),
(333, 11, 'Errores comunes de maquillaje', '2025-07-14', 1, 'TEXTO'),
(334, 11, 'Manicura de la semana', '2025-07-24', 1, 'IMAGEN'),
(335, 11, 'Lookbook exclusivo en PDF', '2025-08-04', 0, 'IMAGEN'),
(336, 11, 'Organizando mi armario en vivo', '2025-08-14', 0, 'VIDEO'),
(337, 11, '5 peinados fáciles y rápidos', '2025-08-24', 1, 'VIDEO'),
(338, 11, 'Swatches de la nueva paleta', '2025-09-04', 1, 'IMAGEN'),
(339, 11, 'Galería de fotos editorial', '2025-09-14', 0, 'IMAGEN'),
(340, 11, 'Asesoría de imagen a suscriptor', '2025-09-24', 0, 'VIDEO'),
(341, 11, 'Marcas sustentables que recomiendo', '2025-10-04', 1, 'TEXTO'),
(342, 11, 'Mi colección de perfumes', '2025-10-14', 1, 'IMAGEN'),
(343, 11, 'Moodboard de inspiración Otoño', '2025-10-24', 0, 'IMAGEN'),
(344, 11, 'Compras de lujo justificadas', '2025-11-04', 0, 'VIDEO'),
(345, 11, 'Recreando looks de los 90s', '2025-11-14', 1, 'VIDEO'),
(346, 11, 'Historia detrás de mis tatuajes', '2025-11-24', 1, 'TEXTO'),
(347, 11, 'Wallpapers de texturas y telas', '2025-12-04', 0, 'IMAGEN'),
(348, 11, 'Pasos para encontrar tu estilo', '2025-12-14', 0, 'TEXTO'),
(349, 11, 'Reto: Maquillaje en 5 minutos', '2026-01-08', 1, 'VIDEO'),
(350, 11, 'Qué llevo en mi bolso diario', '2026-01-18', 1, 'TEXTO'),
(351, 11, 'Patrones de diseño descargables', '2026-02-08', 0, 'IMAGEN'),
(352, 11, 'Secretos de la industria de belleza', '2026-02-18', 0, 'TEXTO');

-- ============================================================
-- CREADOR 12 (Categoría: Viajes) - IDs 353 al 384
-- ============================================================
INSERT INTO Publicacion (id, idCreador, titulo, fecha_publicacion, es_publica, tipo_contenido) VALUES 
(353, 12, 'Explorando las playas de Margarita', '2025-03-16', 1, 'VIDEO'),
(354, 12, 'Atardecer perfecto en los Roques', '2025-03-26', 1, 'IMAGEN'),
(355, 12, 'Presupuesto real del viaje', '2025-04-06', 0, 'TEXTO'),
(356, 12, 'Itinerario secreto de 5 días', '2025-04-16', 0, 'VIDEO'),
(357, 12, '10 tips para armar tu mochila', '2025-04-26', 1, 'TEXTO'),
(358, 12, 'Mi pasaporte lleno de sellos', '2025-05-06', 1, 'IMAGEN'),
(359, 12, 'Contactos de guías turísticos locales', '2025-05-16', 0, 'TEXTO'),
(360, 12, 'Tour por mi hospedaje', '2025-05-26', 0, 'VIDEO'),
(361, 12, 'Probando comida típica de la región', '2025-06-06', 1, 'VIDEO'),
(362, 12, 'Paisaje de montaña espectacular', '2025-06-16', 1, 'IMAGEN'),
(363, 12, 'Cómo conseguir vuelos muy baratos', '2025-06-26', 0, 'TEXTO'),
(364, 12, 'Vlog sin cortes en el aeropuerto', '2025-07-06', 0, 'VIDEO'),
(365, 12, 'Errores que cometí al viajar solo', '2025-07-16', 1, 'TEXTO'),
(366, 12, 'Equipo de fotografía que llevo', '2025-07-26', 1, 'IMAGEN'),
(367, 12, 'Mapa interactivo con pines ocultos', '2025-08-06', 0, 'IMAGEN'),
(368, 12, 'Caminata por ruta poco conocida', '2025-08-16', 0, 'VIDEO'),
(369, 12, 'Sobreviviendo a un clima extremo', '2025-08-26', 1, 'VIDEO'),
(370, 12, 'Conociendo a la gente local', '2025-09-06', 1, 'IMAGEN'),
(371, 12, 'Álbum de fotos HD descargable', '2025-09-16', 0, 'IMAGEN'),
(372, 12, 'Diario de viaje: Reflexiones', '2025-09-26', 0, 'VIDEO'),
(373, 12, 'Visas y papeleos necesarios', '2025-10-06', 1, 'TEXTO'),
(374, 12, 'La mejor pizza que probé en Roma', '2025-10-16', 1, 'IMAGEN'),
(375, 12, 'Postales digitales exclusivas', '2025-10-26', 0, 'IMAGEN'),
(376, 12, 'Grabación de dron panorámica 4K', '2025-11-06', 0, 'VIDEO'),
(377, 12, 'Qué hacer en 24 horas en Bogotá', '2025-11-16', 1, 'VIDEO'),
(378, 12, 'Apps imprescindibles para viajeros', '2025-11-26', 1, 'TEXTO'),
(379, 12, 'Filtros de Lightroom (Presets viaje)', '2025-12-06', 0, 'IMAGEN'),
(380, 12, 'Lista de packing para el frío extremo', '2025-12-16', 0, 'TEXTO'),
(381, 12, 'Aventuras en el transporte público', '2026-01-12', 1, 'VIDEO'),
(382, 12, 'Mi próximo destino revelado', '2026-01-22', 1, 'TEXTO'),
(383, 12, 'Diapositivas de planificación', '2026-02-12', 0, 'IMAGEN'),
(384, 12, 'Seguro de viaje: Lo que debes saber', '2026-02-22', 0, 'TEXTO');

-- ============================================================
-- CREADOR 13 (Categoría: Finanzas Personales) - IDs 385 al 416
-- ============================================================
INSERT INTO Publicacion (id, idCreador, titulo, fecha_publicacion, es_publica, tipo_contenido) VALUES 
(385, 13, 'Análisis semanal del mercado', '2025-03-12', 1, 'VIDEO'),
(386, 13, 'Gráfico de inflación histórica', '2025-03-22', 1, 'IMAGEN'),
(387, 13, 'Guía para armar tu presupuesto', '2025-04-02', 0, 'TEXTO'),
(388, 13, 'Dashboard de inversiones en Excel', '2025-04-12', 0, 'VIDEO'),
(389, 13, 'Errores financieros a los 20s', '2025-04-22', 1, 'TEXTO'),
(390, 13, 'Plantilla de control de gastos', '2025-05-02', 1, 'IMAGEN'),
(391, 13, 'Portafolio de criptos actualizado', '2025-05-12', 0, 'TEXTO'),
(392, 13, 'Clase en vivo: Interés compuesto', '2025-05-22', 0, 'VIDEO'),
(393, 13, 'Cómo empezar a invertir con 100$', '2025-06-02', 1, 'VIDEO'),
(394, 13, 'Infografía: Tipos de crédito', '2025-06-12', 1, 'IMAGEN'),
(395, 13, 'Resumen libro: Padre Rico Padre Pobre', '2025-06-22', 0, 'TEXTO'),
(396, 13, 'Estrategias fiscales para freelancers', '2025-07-02', 0, 'VIDEO'),
(397, 13, 'Opinión sobre las nuevas tasas', '2025-07-12', 1, 'TEXTO'),
(398, 13, 'Mapa mental de diversificación', '2025-07-22', 1, 'IMAGEN'),
(399, 13, 'Plantilla Excel de Jubilación', '2025-08-02', 0, 'IMAGEN'),
(400, 13, 'Q&A: Respondiendo dudas de deudas', '2025-08-12', 0, 'VIDEO'),
(401, 13, 'Noticias económicas de la semana', '2025-08-22', 1, 'VIDEO'),
(402, 13, 'Mi escritorio trabajando desde casa', '2025-09-02', 1, 'IMAGEN'),
(403, 13, 'Reporte mensual de mercado PDF', '2025-09-12', 0, 'IMAGEN'),
(404, 13, 'Análisis de empresas del SP500', '2025-09-22', 0, 'VIDEO'),
(405, 13, '5 hábitos que te empobrecen', '2025-10-02', 1, 'TEXTO'),
(406, 13, 'Entrevista con experto inmobiliario', '2025-10-12', 1, 'VIDEO'),
(407, 13, 'Gráficas exclusivas de dividendos', '2025-10-22', 0, 'IMAGEN'),
(408, 13, 'Señales de trading de este mes', '2025-11-02', 0, 'TEXTO'),
(409, 13, 'Mi historia: Cómo salí de deudas', '2025-11-12', 1, 'VIDEO'),
(410, 13, 'Glosario de términos financieros', '2025-11-22', 1, 'TEXTO'),
(411, 13, 'Hoja de ruta financiera 2026', '2025-12-02', 0, 'IMAGEN'),
(412, 13, 'Calculadora de hipotecas interactiva', '2025-12-12', 0, 'IMAGEN'),
(413, 13, 'Reto de ahorro de 30 días', '2026-01-08', 1, 'VIDEO'),
(414, 13, 'Cómo negociar un aumento de sueldo', '2026-01-18', 1, 'TEXTO'),
(415, 13, 'Diploma de mi último curso online', '2026-02-08', 0, 'IMAGEN'),
(416, 13, 'Análisis profundo de bonos del tesoro', '2026-02-18', 0, 'TEXTO');

-- ============================================================
-- CREADOR 14 (Categoría: Deportes) - IDs 417 al 448
-- ============================================================
INSERT INTO Publicacion (id, idCreador, titulo, fecha_publicacion, es_publica, tipo_contenido) VALUES 
(417, 14, 'Resumen de la jornada de Champions', '2025-03-14', 1, 'VIDEO'),
(418, 14, 'Estadísticas clave del partido', '2025-03-24', 1, 'IMAGEN'),
(419, 14, 'Análisis táctico: El falso 9', '2025-04-04', 0, 'TEXTO'),
(420, 14, 'Clase en pizarra: Presión alta', '2025-04-14', 0, 'VIDEO'),
(421, 14, 'Opinión: El MVP de la temporada', '2025-04-24', 1, 'TEXTO'),
(422, 14, 'Alineación ideal de la semana', '2025-05-04', 1, 'IMAGEN'),
(423, 14, 'Predicciones exclusivas del clásico', '2025-05-14', 0, 'TEXTO'),
(424, 14, 'Entrevista sin filtros a ex-jugador', '2025-05-24', 0, 'VIDEO'),
(425, 14, 'Los peores fichajes del mercado', '2025-06-04', 1, 'VIDEO'),
(426, 14, 'Evolución del récord de 100m lisos', '2025-06-14', 1, 'IMAGEN'),
(427, 14, 'Mi sistema para pronósticos', '2025-06-24', 0, 'TEXTO'),
(428, 14, 'Reaccionando a jugadas polémicas (VAR)', '2025-07-04', 0, 'VIDEO'),
(429, 14, 'Historia de los mundiales de fútbol', '2025-07-14', 1, 'TEXTO'),
(430, 14, 'Fotos en el estadio Monumental', '2025-07-24', 1, 'IMAGEN'),
(431, 14, 'Fondos de pantalla de estadios', '2025-08-04', 0, 'IMAGEN'),
(432, 14, 'Debate en vivo post-partido', '2025-08-14', 0, 'VIDEO'),
(433, 14, 'Vlog: Viajando a ver la final', '2025-08-24', 1, 'VIDEO'),
(434, 14, 'Mi colección de camisetas retro', '2025-09-04', 1, 'IMAGEN'),
(435, 14, 'Esquemas tácticos en alta resolución', '2025-09-14', 0, 'IMAGEN'),
(436, 14, 'Desglose del entrenamiento de élite', '2025-09-24', 0, 'VIDEO'),
(437, 14, 'Qué necesita el equipo para mejorar', '2025-10-04', 1, 'TEXTO'),
(438, 14, 'Top 5 goles del mes de octubre', '2025-10-14', 1, 'VIDEO'),
(439, 14, 'Data cruda de posesión y pases', '2025-10-24', 0, 'IMAGEN'),
(440, 14, 'Columna de opinión: La crisis del club', '2025-11-04', 0, 'TEXTO'),
(441, 14, 'Reglas extrañas de otros deportes', '2025-11-14', 1, 'VIDEO'),
(442, 14, 'El impacto económico del deporte', '2025-11-24', 1, 'TEXTO'),
(443, 14, 'Cuadro del torneo interactivo', '2025-12-04', 0, 'IMAGEN'),
(444, 14, 'Diseño filtrado de la nueva copa', '2025-12-14', 0, 'IMAGEN'),
(445, 14, 'Documental corto: Leyenda olvidada', '2026-01-05', 1, 'VIDEO'),
(446, 14, 'Guía para entender el fútbol americano', '2026-01-15', 1, 'TEXTO'),
(447, 14, 'Ranking de salarios filtrados', '2026-02-05', 0, 'IMAGEN'),
(448, 14, 'Diario de la temporada: Cierre anual', '2026-02-20', 0, 'TEXTO');

-- ============================================================
-- CREADOR 15 (Categoría: Cine y TV) - IDs 449 al 480
-- ============================================================
INSERT INTO Publicacion (id, idCreador, titulo, fecha_publicacion, es_publica, tipo_contenido) VALUES 
(449, 15, 'Review sin spoilers del estreno', '2025-03-16', 1, 'VIDEO'),
(450, 15, 'Póster oficial vs Mi versión', '2025-03-26', 1, 'IMAGEN'),
(451, 15, 'Guion desglosado de la escena final', '2025-04-06', 0, 'TEXTO'),
(452, 15, 'Análisis del final explicado', '2025-04-16', 0, 'VIDEO'),
(453, 15, 'Noticias de casting y rumores', '2025-04-26', 1, 'TEXTO'),
(454, 15, 'Línea temporal del universo', '2025-05-06', 1, 'IMAGEN'),
(455, 15, 'Teorías locas para la próxima temporada', '2025-05-16', 0, 'TEXTO'),
(456, 15, 'Video-Ensayo de cinematografía', '2025-05-26', 0, 'VIDEO'),
(457, 15, 'Top 10 películas infravaloradas', '2025-06-06', 1, 'VIDEO'),
(458, 15, 'Mi foto en la alfombra roja', '2025-06-16', 1, 'IMAGEN'),
(459, 15, 'Entrevista filtrada del director', '2025-06-26', 0, 'TEXTO'),
(460, 15, 'Clase: Escribir un cortometraje', '2025-07-06', 0, 'VIDEO'),
(461, 15, 'Crítica de la actuación principal', '2025-07-16', 1, 'TEXTO'),
(462, 15, 'Comparativa visual del CGI', '2025-07-26', 1, 'IMAGEN'),
(463, 15, 'Storyboards originales descargables', '2025-08-06', 0, 'IMAGEN'),
(464, 15, 'Reacción al tráiler (Solo VIP)', '2025-08-16', 0, 'VIDEO'),
(465, 15, 'Evolución del género de terror', '2025-08-26', 1, 'VIDEO'),
(466, 15, 'Mi colección de boletos de cine', '2025-09-06', 1, 'IMAGEN'),
(467, 15, 'Wallpapers de escenas épicas 4K', '2025-09-16', 0, 'IMAGEN'),
(468, 15, 'Podcast de cine: Debate de 2 horas', '2025-09-26', 0, 'VIDEO'),
(469, 15, 'Recomendaciones ocultas en streaming', '2025-10-06', 1, 'TEXTO'),
(470, 15, 'Por qué el 3D está empeorando', '2025-10-16', 1, 'VIDEO'),
(471, 15, 'Paleta de colores de la película', '2025-10-26', 0, 'IMAGEN'),
(472, 15, 'Traducción del libreto original', '2025-11-06', 0, 'TEXTO'),
(473, 15, 'Resumen de los premios Oscar', '2025-11-16', 1, 'VIDEO'),
(474, 15, 'El arco de redención del villano', '2025-11-26', 1, 'TEXTO'),
(475, 15, 'Arte conceptual de vestuario', '2025-12-06', 0, 'IMAGEN'),
(476, 15, 'Diagrama de iluminación de set', '2025-12-16', 0, 'IMAGEN'),
(477, 15, 'Cine independiente que debes ver', '2026-01-12', 1, 'VIDEO'),
(478, 15, 'Guía para armar tu home theater', '2026-01-22', 1, 'TEXTO'),
(479, 15, 'Pase de prensa virtual (Acreditación)', '2026-02-12', 0, 'IMAGEN'),
(480, 15, 'Mi crítica completa (Con Spoilers)', '2026-02-22', 0, 'TEXTO');

-- ============================================================
-- CREADOR 16 (Categoría: Literatura) - IDs 481 al 512
-- ============================================================
INSERT INTO Publicacion (id, idCreador, titulo, fecha_publicacion, es_publica, tipo_contenido) VALUES 
(481, 16, 'Por qué leer a los clásicos', '2025-03-12', 1, 'VIDEO'),
(482, 16, 'Foto de mi estantería organizada', '2025-03-22', 1, 'IMAGEN'),
(483, 16, 'Capítulo 1 de mi nueva novela', '2025-04-02', 0, 'TEXTO'),
(484, 16, 'Taller: Creación de personajes', '2025-04-12', 0, 'VIDEO'),
(485, 16, 'Reseña literaria sin spoilers', '2025-04-22', 1, 'TEXTO'),
(486, 16, 'Infografía: Autores del boom', '2025-05-02', 1, 'IMAGEN'),
(487, 16, 'Diario de escritura (Semana 1)', '2025-05-12', 0, 'TEXTO'),
(488, 16, 'Q&A sobre edición de libros', '2025-05-22', 0, 'VIDEO'),
(489, 16, 'Vlog visitando librerías antiguas', '2025-06-02', 1, 'VIDEO'),
(490, 16, 'Mi nuevo marcapáginas', '2025-06-12', 1, 'IMAGEN'),
(491, 16, 'Borrador descartado del final', '2025-06-22', 0, 'TEXTO'),
(492, 16, 'Masterclass: Estructura narrativa', '2025-07-02', 0, 'VIDEO'),
(493, 16, 'Cómo lidiar con el bloqueo', '2025-07-12', 1, 'TEXTO'),
(494, 16, 'Tapa revelada de mi libro', '2025-07-22', 1, 'IMAGEN'),
(495, 16, 'Esquema de la trama (Arco 2)', '2025-08-02', 0, 'IMAGEN'),
(496, 16, 'Lectura conjunta en vivo', '2025-08-12', 0, 'VIDEO'),
(497, 16, 'Libros que no pude terminar', '2025-08-22', 1, 'VIDEO'),
(498, 16, 'Aesthetics de los protagonistas', '2025-09-02', 1, 'IMAGEN'),
(499, 16, 'Lista de agentes literarios', '2025-09-12', 0, 'TEXTO'),
(500, 16, 'Mi proceso de investigación', '2025-09-22', 0, 'VIDEO'),
(501, 16, 'Top 5 autores de ficción', '2025-10-02', 1, 'TEXTO'),
(502, 16, 'Unboxing de libros recibidos', '2025-10-12', 1, 'VIDEO'),
(503, 16, 'Mapa del mundo de mi novela', '2025-10-22', 0, 'IMAGEN'),
(504, 16, 'Poemas que nunca publiqué', '2025-11-02', 0, 'TEXTO'),
(505, 16, 'Debate: Libro vs Película', '2025-11-12', 1, 'VIDEO'),
(506, 16, 'Mi rutina de lectura diaria', '2025-11-22', 1, 'TEXTO'),
(507, 16, 'Bocetos originales del ilustrador', '2025-12-02', 0, 'IMAGEN'),
(508, 16, 'Páginas escaneadas con notas', '2025-12-12', 0, 'IMAGEN'),
(509, 16, 'Mis objetivos literarios 2026', '2026-01-05', 1, 'VIDEO'),
(510, 16, '10 frases que me marcaron', '2026-01-15', 1, 'TEXTO'),
(511, 16, 'Árbol genealógico de personajes', '2026-02-05', 0, 'IMAGEN'),
(512, 16, 'Fondos de pantalla con citas', '2026-02-20', 0, 'IMAGEN');

-- ============================================================
-- CREADOR 17 (Categoría: Manualidades) - IDs 513 al 544
-- ============================================================
INSERT INTO Publicacion (id, idCreador, titulo, fecha_publicacion, es_publica, tipo_contenido) VALUES 
(513, 17, 'Transforma tu cuarto con poco', '2025-03-14', 1, 'VIDEO'),
(514, 17, 'Foto de la mesa terminada', '2025-03-24', 1, 'IMAGEN'),
(515, 17, 'Lista de herramientas básicas', '2025-04-04', 0, 'TEXTO'),
(516, 17, 'Tutorial: Ensamblaje avanzado', '2025-04-14', 0, 'VIDEO'),
(517, 17, 'Guía para elegir maderas', '2025-04-24', 1, 'TEXTO'),
(518, 17, 'El antes y después del sillón', '2025-05-04', 1, 'IMAGEN'),
(519, 17, 'Proveedores secretos de materiales', '2025-05-14', 0, 'TEXTO'),
(520, 17, 'Taller en vivo: Resina epóxica', '2025-05-24', 0, 'VIDEO'),
(521, 17, 'Errores comunes al pintar', '2025-06-04', 1, 'VIDEO'),
(522, 17, 'Mis nuevos pinceles de detalle', '2025-06-14', 1, 'IMAGEN'),
(523, 17, 'Cálculo de presupuestos de obra', '2025-06-24', 0, 'TEXTO'),
(524, 17, 'Restauración completa 4 horas', '2025-07-04', 0, 'VIDEO'),
(525, 17, 'Cómo organizar tu taller', '2025-07-14', 1, 'TEXTO'),
(526, 17, 'Moodboard de inspiración', '2025-07-24', 1, 'IMAGEN'),
(527, 17, 'Planos de la repisa flotante', '2025-08-04', 0, 'IMAGEN'),
(528, 17, 'Soldadura para principiantes', '2025-08-14', 0, 'VIDEO'),
(529, 17, 'Construyendo una lámpara LED', '2025-08-24', 1, 'VIDEO'),
(530, 17, 'Captura del circuito impreso', '2025-09-04', 1, 'IMAGEN'),
(531, 17, 'Fórmulas para mezcla de barniz', '2025-09-14', 0, 'TEXTO'),
(532, 17, 'Q&A: Peligros en el taller', '2025-09-24', 0, 'VIDEO'),
(533, 17, 'Ideas para reciclar palets', '2025-10-04', 1, 'TEXTO'),
(534, 17, 'Probando la sierra circular', '2025-10-14', 1, 'VIDEO'),
(535, 17, 'Plantilla de corte descargable', '2025-10-24', 0, 'IMAGEN'),
(536, 17, 'Instrucciones paso a paso en PDF', '2025-11-04', 0, 'TEXTO'),
(537, 17, 'Reto: Manualidad en 10 minutos', '2025-11-14', 1, 'VIDEO'),
(538, 17, 'Cuidados de tus herramientas', '2025-11-24', 1, 'TEXTO'),
(539, 17, 'Esquemas eléctricos del proyecto', '2025-12-04', 0, 'IMAGEN'),
(540, 17, 'Fotos en macro de texturas', '2025-12-14', 0, 'IMAGEN'),
(541, 17, 'Vlog visitando la ferretería', '2026-01-08', 1, 'VIDEO'),
(542, 17, 'Respondiendo comentarios', '2026-01-18', 1, 'TEXTO'),
(543, 17, 'Diagrama 3D del escritorio', '2026-02-08', 0, 'IMAGEN'),
(544, 17, 'Diseños de moldes exclusivos', '2026-02-18', 0, 'IMAGEN');

-- ============================================================
-- CREADOR 18 (Categoría: Política y Noticias) - IDs 545 al 576
-- ============================================================
INSERT INTO Publicacion (id, idCreador, titulo, fecha_publicacion, es_publica, tipo_contenido) VALUES 
(545, 18, 'Resumen de la semana en 5 min', '2025-03-16', 1, 'VIDEO'),
(546, 18, 'Titulares del día en portada', '2025-03-26', 1, 'IMAGEN'),
(547, 18, 'Análisis de la nueva ley', '2025-04-06', 0, 'TEXTO'),
(548, 18, 'Entrevista completa al candidato', '2025-04-16', 0, 'VIDEO'),
(549, 18, 'Columna de opinión dominical', '2025-04-26', 1, 'TEXTO'),
(550, 18, 'Gráfico de evolución electoral', '2025-05-06', 1, 'IMAGEN'),
(551, 18, 'Documentos filtrados del caso', '2025-05-16', 0, 'TEXTO'),
(552, 18, 'Debate en vivo (Acceso VIP)', '2025-05-26', 0, 'VIDEO'),
(553, 18, 'Impacto de la economía global', '2025-06-06', 1, 'VIDEO'),
(554, 18, 'Mapa de alianzas geopolíticas', '2025-06-16', 1, 'IMAGEN'),
(555, 18, 'Resumen de acuerdos internacionales', '2025-06-26', 0, 'TEXTO'),
(556, 18, 'Clase: Cómo entender el senado', '2025-07-06', 0, 'VIDEO'),
(557, 18, 'El rol de los medios hoy', '2025-07-16', 1, 'TEXTO'),
(558, 18, 'Caricatura política del mes', '2025-07-26', 1, 'IMAGEN'),
(559, 18, 'Encuestas detalladas por región', '2025-08-06', 0, 'IMAGEN'),
(560, 18, 'Podcast: Discusión profunda', '2025-08-16', 0, 'VIDEO'),
(561, 18, 'Desmintiendo Fake News', '2025-08-26', 1, 'VIDEO'),
(562, 18, 'Foto en la rueda de prensa', '2025-09-06', 1, 'IMAGEN'),
(563, 18, 'Trascripción del discurso', '2025-09-16', 0, 'TEXTO'),
(564, 18, 'Vlog cubriendo las elecciones', '2025-09-26', 0, 'VIDEO'),
(565, 18, 'Biografía de figuras históricas', '2025-10-06', 1, 'TEXTO'),
(566, 18, 'Entrevista a ciudadano en la calle', '2025-10-16', 1, 'VIDEO'),
(567, 18, 'Data cruda de inversión pública', '2025-10-26', 0, 'IMAGEN'),
(568, 18, 'Análisis comparativo de propuestas', '2025-11-06', 0, 'TEXTO'),
(569, 18, 'Qué esperar del próximo trimestre', '2025-11-16', 1, 'VIDEO'),
(570, 18, 'Glosario de términos políticos', '2025-11-26', 1, 'TEXTO'),
(571, 18, 'Infografía de ramas del poder', '2025-12-06', 0, 'IMAGEN'),
(572, 18, 'Archivos desclasificados escaneados', '2025-12-16', 0, 'IMAGEN'),
(573, 18, 'Reflexiones de fin de año', '2026-01-12', 1, 'VIDEO'),
(574, 18, 'Mis libros recomendados de historia', '2026-01-22', 1, 'TEXTO'),
(575, 18, 'Estadísticas de participación', '2026-02-12', 0, 'IMAGEN'),
(576, 18, 'Galería de fotos sin publicar', '2026-02-22', 0, 'IMAGEN');

-- ============================================================
-- CREADOR 19 (Categoría: Mascotas) - IDs 577 al 608
-- ============================================================
INSERT INTO Publicacion (id, idCreador, titulo, fecha_publicacion, es_publica, tipo_contenido) VALUES 
(577, 19, 'Adoptando a Max', '2025-03-14', 1, 'VIDEO'),
(578, 19, 'Max durmiendo la siesta', '2025-03-24', 1, 'IMAGEN'),
(579, 19, 'Dieta BARF: Mi experiencia', '2025-04-04', 0, 'TEXTO'),
(580, 19, 'Entrenamiento de obediencia VIP', '2025-04-14', 0, 'VIDEO'),
(581, 19, 'Tips para cachorros ansiosos', '2025-04-24', 1, 'TEXTO'),
(582, 19, 'Juguetes favoritos del mes', '2025-05-04', 1, 'IMAGEN'),
(583, 19, 'Lista de alimentos prohibidos', '2025-05-14', 0, 'TEXTO'),
(584, 19, 'Corte de uñas paso a paso', '2025-05-24', 0, 'VIDEO'),
(585, 19, 'Vlog en el parque de perros', '2025-06-04', 1, 'VIDEO'),
(586, 19, 'Foto familiar con las mascotas', '2025-06-14', 1, 'IMAGEN'),
(587, 19, 'Guía de primeros auxilios caninos', '2025-06-24', 0, 'TEXTO'),
(588, 19, 'Resolviendo problemas de conducta', '2025-07-04', 0, 'VIDEO'),
(589, 19, 'Beneficios de tener un gato', '2025-07-14', 1, 'TEXTO'),
(590, 19, 'Antes y después del baño', '2025-07-24', 1, 'IMAGEN'),
(591, 19, 'Calendario de vacunas ideal PDF', '2025-08-04', 0, 'IMAGEN'),
(592, 19, 'Masajes relajantes para perros', '2025-08-14', 0, 'VIDEO'),
(593, 19, 'Probando snacks virales', '2025-08-24', 1, 'VIDEO'),
(594, 19, 'Outfit de invierno para Max', '2025-09-04', 1, 'IMAGEN'),
(595, 19, 'Entendiendo el lenguaje corporal', '2025-09-14', 0, 'TEXTO'),
(596, 19, 'Detrás de cámaras de fotos', '2025-09-24', 0, 'VIDEO'),
(597, 19, 'Reseña de arena para gatos', '2025-10-04', 1, 'TEXTO'),
(598, 19, 'Haciendo trucos en vivo', '2025-10-14', 1, 'VIDEO'),
(599, 19, 'Plantilla de rutina diaria', '2025-10-24', 0, 'IMAGEN'),
(600, 19, 'Cómo presentar dos mascotas', '2025-11-04', 0, 'TEXTO'),
(601, 19, 'Rescatando a un gatito callejero', '2025-11-14', 1, 'VIDEO'),
(602, 19, 'Mi opinión sobre correas', '2025-11-24', 1, 'TEXTO'),
(603, 19, 'Infografía de razas', '2025-12-04', 0, 'IMAGEN'),
(604, 19, 'Fondos de pantalla de patitas', '2025-12-14', 0, 'IMAGEN'),
(605, 19, 'Fiesta de cumpleaños perruna', '2026-01-08', 1, 'VIDEO'),
(606, 19, 'Preguntas frecuentes del canal', '2026-01-18', 1, 'TEXTO'),
(607, 19, 'Fotos exclusivas de Max bebé', '2026-02-08', 0, 'IMAGEN'),
(608, 19, 'Memes internos de la comunidad', '2026-02-18', 0, 'IMAGEN');

-- ============================================================
-- CREADOR 20 (Categoría: Astrología y Esoterismo) - IDs 609 al 640
-- ============================================================
INSERT INTO Publicacion (id, idCreador, titulo, fecha_publicacion, es_publica, tipo_contenido) VALUES 
(609, 20, 'Significado de tu luna', '2025-03-12', 1, 'VIDEO'),
(610, 20, 'Infografía: Mercurio Retrógrado', '2025-03-22', 1, 'IMAGEN'),
(611, 20, 'Ritual completo de luna llena', '2025-04-02', 0, 'TEXTO'),
(612, 20, 'Tirada de Tarot interactiva VIP', '2025-04-12', 0, 'VIDEO'),
(613, 20, 'Horóscopo mensual general', '2025-04-22', 1, 'TEXTO'),
(614, 20, 'Mi altar personal', '2025-05-02', 1, 'IMAGEN'),
(615, 20, 'Limpieza energética paso a paso', '2025-05-12', 0, 'TEXTO'),
(616, 20, 'Meditación guiada para la ansiedad', '2025-05-22', 0, 'VIDEO'),
(617, 20, 'Explicando las casas astrológicas', '2025-06-02', 1, 'VIDEO'),
(618, 20, 'Cristales recomendados para el amor', '2025-06-12', 1, 'IMAGEN'),
(619, 20, 'Hechizos de protección diaria', '2025-06-22', 0, 'TEXTO'),
(620, 20, 'Lectura de carta astral a suscriptor', '2025-07-02', 0, 'VIDEO'),
(621, 20, 'Compatibilidad de signos de fuego', '2025-07-12', 1, 'TEXTO'),
(622, 20, 'Tarjeta de la carta del tonto', '2025-07-22', 1, 'IMAGEN'),
(623, 20, 'Plantilla para tu diario lunar', '2025-08-02', 0, 'IMAGEN'),
(624, 20, 'Ritual de abundancia en vivo', '2025-08-12', 0, 'VIDEO'),
(625, 20, 'Vlog visitando tienda esotérica', '2025-08-22', 1, 'VIDEO'),
(626, 20, 'Foto de mi nueva baraja', '2025-09-02', 1, 'IMAGEN'),
(627, 20, 'Ebook: Introducción a la astrología', '2025-09-12', 0, 'TEXTO'),
(628, 20, 'Cómo limpiar tus cartas', '2025-09-22', 0, 'VIDEO'),
(629, 20, 'El impacto de los eclipses', '2025-10-02', 1, 'TEXTO'),
(630, 20, 'Preguntas y respuestas místicas', '2025-10-12', 1, 'VIDEO'),
(631, 20, 'Mapas estelares en alta resolución', '2025-10-22', 0, 'IMAGEN'),
(632, 20, 'Mantras para decretar éxito', '2025-11-02', 0, 'TEXTO'),
(633, 20, 'Analizando la carta astral de famosos', '2025-11-12', 1, 'VIDEO'),
(634, 20, 'Signo solar vs ascendente', '2025-11-22', 1, 'TEXTO'),
(635, 20, 'Gráfico de tránsitos planetarios 2026', '2025-12-02', 0, 'IMAGEN'),
(636, 20, 'Fondos de pantalla del zodiaco', '2025-12-12', 0, 'IMAGEN'),
(637, 20, 'Predicciones para el nuevo año', '2026-01-05', 1, 'VIDEO'),
(638, 20, 'Recomendaciones de libros de magia', '2026-01-15', 1, 'TEXTO'),
(639, 20, 'Fotos macro de mis cuarzos', '2026-02-05', 0, 'IMAGEN'),
(640, 20, 'Talismanes exclusivos de diseño propio', '2026-02-20', 0, 'IMAGEN');

-- ============================================================
-- CREADOR 21 (Categoría: Cosplay - NSFW) - IDs 641 al 672
-- ============================================================
INSERT INTO Publicacion (id, idCreador, titulo, fecha_publicacion, es_publica, tipo_contenido) VALUES 
(641, 21, 'Proceso de la armadura (Parte 1)', '2025-03-16', 1, 'VIDEO'),
(642, 21, 'Selfie en la convención de anime', '2025-03-26', 1, 'IMAGEN'),
(643, 21, 'Patrones de costura descargables', '2025-04-06', 0, 'TEXTO'),
(644, 21, 'Detrás de cámaras sesión Boudoir', '2025-04-16', 0, 'VIDEO'),
(645, 21, 'Materiales baratos para props', '2025-04-26', 1, 'TEXTO'),
(646, 21, 'Prueba de maquillaje de Elfa', '2025-05-06', 1, 'IMAGEN'),
(647, 21, 'Guía de poses para fotos sugerentes', '2025-05-16', 0, 'TEXTO'),
(648, 21, 'Set de fotos en video sin censura', '2025-05-26', 0, 'VIDEO'),
(649, 21, 'Vlog del viaje al evento', '2025-06-06', 1, 'VIDEO'),
(650, 21, 'Resultado final del traje de combate', '2025-06-16', 1, 'IMAGEN'),
(651, 21, 'Lista de compras secretas de lencería', '2025-06-26', 0, 'TEXTO'),
(652, 21, 'Bailando con el traje de conejita', '2025-07-06', 0, 'VIDEO'),
(653, 21, 'Cómo fijar pelucas pesadas', '2025-07-16', 1, 'TEXTO'),
(654, 21, 'Antes y después del photoshop', '2025-07-26', 1, 'IMAGEN'),
(655, 21, 'Galería exclusiva "Succubus"', '2025-08-06', 0, 'IMAGEN'),
(656, 21, 'POV: Cita conmigo en cosplay', '2025-08-16', 0, 'VIDEO'),
(657, 21, 'Reto de transformación en 1 minuto', '2025-08-26', 1, 'VIDEO'),
(658, 21, 'Teaser del próximo set secreto', '2025-09-06', 1, 'IMAGEN'),
(659, 21, 'Archivos RAW para edición de fans', '2025-09-16', 0, 'TEXTO'),
(660, 21, 'Probándome bikinis de anime', '2025-09-26', 0, 'VIDEO'),
(661, 21, 'Respondiendo el hate con humor', '2025-10-06', 1, 'TEXTO'),
(662, 21, 'Tour por mi cuarto de costura', '2025-10-16', 1, 'VIDEO'),
(663, 21, 'Álbum completo "Maid" 4K', '2025-10-26', 0, 'IMAGEN'),
(664, 21, 'Votación para el próximo personaje', '2025-11-06', 0, 'TEXTO'),
(665, 21, 'Tutorial de armas de goma eva', '2025-11-16', 1, 'VIDEO'),
(666, 21, 'Mi cuidado de piel para fotos', '2025-11-26', 1, 'TEXTO'),
(667, 21, 'Polaroids firmadas escaneadas', '2025-12-06', 0, 'IMAGEN'),
(668, 21, 'Wallpapers verticales NSFW', '2025-12-16', 0, 'IMAGEN'),
(669, 21, 'Reaccionando a mis primeros cosplays', '2026-01-12', 1, 'VIDEO'),
(670, 21, 'Presupuesto de mi traje más caro', '2026-01-22', 1, 'TEXTO'),
(671, 21, 'Set de enfermera completo (+30 fotos)', '2026-02-12', 0, 'IMAGEN'),
(672, 21, 'Fotos descartadas muy reveladoras', '2026-02-22', 0, 'IMAGEN');

-- ============================================================
-- CREADOR 22 (Categoría: Fotografía y Modelaje - NSFW) - IDs 673 al 704
-- ============================================================
INSERT INTO Publicacion (id, idCreador, titulo, fecha_publicacion, es_publica, tipo_contenido) VALUES 
(673, 22, 'Preview de la sesión en la playa', '2025-03-12', 1, 'VIDEO'),
(674, 22, 'Retrato artístico blanco y negro', '2025-03-22', 1, 'IMAGEN'),
(675, 22, 'Mi rutina antes de una sesión', '2025-04-02', 0, 'TEXTO'),
(676, 22, 'Set en lencería roja (Video)', '2025-04-12', 0, 'VIDEO'),
(677, 22, 'Tips para posar frente a la cámara', '2025-04-22', 1, 'TEXTO'),
(678, 22, 'Selfie casual de buenos días', '2025-05-02', 1, 'IMAGEN'),
(679, 22, 'Anécdotas de mi primer desnudo', '2025-05-12', 0, 'TEXTO'),
(680, 22, 'Detrás de cámaras sin censura', '2025-05-22', 0, 'VIDEO'),
(681, 22, 'Vlog de viaje a la locación secreta', '2025-06-02', 1, 'VIDEO'),
(682, 22, 'Outfit del día: Estilo urbano', '2025-06-12', 1, 'IMAGEN'),
(683, 22, 'Lista de mis juguetes favoritos', '2025-06-22', 0, 'TEXTO'),
(684, 22, 'Baile privado en la habitación', '2025-07-02', 0, 'VIDEO'),
(685, 22, 'Equipo fotográfico que utilizamos', '2025-07-12', 1, 'TEXTO'),
(686, 22, 'Teaser visual del mes', '2025-07-22', 1, 'IMAGEN'),
(687, 22, 'Galería "Ángel Caído" (+40 fotos)', '2025-08-02', 0, 'IMAGEN'),
(688, 22, 'POV: Despertando a tu lado', '2025-08-12', 0, 'VIDEO'),
(689, 22, 'Probándome ropa nueva (SFW)', '2025-08-22', 1, 'VIDEO'),
(690, 22, 'Atardecer desde mi balcón', '2025-09-02', 1, 'IMAGEN'),
(691, 22, 'Set fotográfico en la ducha HD', '2025-09-12', 0, 'IMAGEN'),
(692, 22, 'Respondiendo fantasías de fans', '2025-09-22', 0, 'VIDEO'),
(693, 22, 'Cómo cuido mi figura', '2025-10-02', 1, 'TEXTO'),
(694, 22, 'Q&A: Preguntas de suscriptores', '2025-10-12', 1, 'VIDEO'),
(695, 22, 'Archivos RAW exclusivos para edición', '2025-10-22', 0, 'IMAGEN'),
(696, 22, 'Diario íntimo: Entrada #14', '2025-11-02', 0, 'TEXTO'),
(697, 22, 'Tour por mi vestidor', '2025-11-12', 1, 'VIDEO'),
(698, 22, 'Planes para el próximo año', '2025-11-22', 1, 'TEXTO'),
(699, 22, 'Colección Polaroid firmada', '2025-12-02', 0, 'IMAGEN'),
(700, 22, 'Wallpapers para móvil (NSFW)', '2025-12-12', 0, 'IMAGEN'),
(701, 22, 'Agradecimiento por este gran año', '2026-01-05', 1, 'VIDEO'),
(702, 22, 'Mis resoluciones y promesas', '2026-01-15', 1, 'TEXTO'),
(703, 22, 'Calendario digital exclusivo 2026', '2026-02-05', 0, 'IMAGEN'),
(704, 22, 'Set "Neon Lights" completo', '2026-02-20', 0, 'IMAGEN');

-- ============================================================
-- CREADOR 23 (Categoría: Anime y Manga - NSFW) - IDs 705 al 736
-- ============================================================
INSERT INTO Publicacion (id, idCreador, titulo, fecha_publicacion, es_publica, tipo_contenido) VALUES 
(705, 23, 'Speedpaint de ilustración SFW', '2025-03-14', 1, 'VIDEO'),
(706, 23, 'Boceto limpio de la protagonista', '2025-03-24', 1, 'IMAGEN'),
(707, 23, 'Análisis de anatomía exagerada', '2025-04-04', 0, 'TEXTO'),
(708, 23, 'Animación Hentai exclusiva (WIP)', '2025-04-14', 0, 'VIDEO'),
(709, 23, 'Reseña de animes de la temporada', '2025-04-24', 1, 'TEXTO'),
(710, 23, 'Mi estudio de dibujo', '2025-05-04', 1, 'IMAGEN'),
(711, 23, 'Guion del Doujinshi cap 2', '2025-05-14', 0, 'TEXTO'),
(712, 23, 'Proceso de entintado y sombras', '2025-05-24', 0, 'VIDEO'),
(713, 23, 'Mejores tabletas para dibujar', '2025-06-04', 1, 'VIDEO'),
(714, 23, 'Fanart crossover (Censurado)', '2025-06-14', 1, 'IMAGEN'),
(715, 23, 'Tutorial de expresiones faciales', '2025-06-24', 0, 'TEXTO'),
(716, 23, 'Animación: Ciclo de caminata', '2025-07-04', 0, 'VIDEO'),
(717, 23, 'Cómo publico mi arte online', '2025-07-14', 1, 'TEXTO'),
(718, 23, 'Paletas de colores cálidas', '2025-07-24', 1, 'IMAGEN'),
(719, 23, 'Archivos PSD del cómic', '2025-08-04', 0, 'IMAGEN'),
(720, 23, 'Clase: Renderizado de piel', '2025-08-14', 0, 'VIDEO'),
(721, 23, 'Vlog en evento de cómics', '2025-08-24', 1, 'VIDEO'),
(722, 23, 'Mi mercancía oficial', '2025-09-04', 1, 'IMAGEN'),
(723, 23, 'Páginas sin diálogos en alta resolución', '2025-09-14', 0, 'IMAGEN'),
(724, 23, 'Time-lapse de arte comisionado', '2025-09-24', 0, 'VIDEO'),
(725, 23, 'Recomendaciones de manga Seinen', '2025-10-04', 1, 'TEXTO'),
(726, 23, 'Haciendo bocetos en vivo', '2025-10-14', 1, 'VIDEO'),
(727, 23, 'Galería de monstruos y tentáculos', '2025-10-24', 0, 'IMAGEN'),
(728, 23, 'Votación para el próximo doujin', '2025-11-04', 0, 'TEXTO'),
(729, 23, 'Dibujando con una mano atada', '2025-11-14', 1, 'VIDEO'),
(730, 23, 'Mis referentes artísticos', '2025-11-24', 1, 'TEXTO'),
(731, 23, 'Ilustración final "Succubus" 4K', '2025-12-04', 0, 'IMAGEN'),
(732, 23, 'Set de pinceles descargables', '2025-12-14', 0, 'IMAGEN'),
(733, 23, 'Resumen de mi crecimiento este año', '2026-01-08', 1, 'VIDEO'),
(734, 23, 'Metas de dibujo para 2026', '2026-01-18', 1, 'TEXTO'),
(735, 23, 'Doujinshi Volumen 1 PDF completo', '2026-02-08', 0, 'IMAGEN'),
(736, 23, 'Avance exclusivo de la novela visual', '2026-02-18', 0, 'TEXTO');

-- ============================================================
-- CREADOR 24 (Categoría: Podcasts - NSFW) - IDs 737 al 768
-- ============================================================
INSERT INTO Publicacion (id, idCreador, titulo, fecha_publicacion, es_publica, tipo_contenido) VALUES 
(737, 24, 'Tema de hoy: Fantasías y tabúes', '2025-03-16', 1, 'VIDEO'),
(738, 24, 'Nuestros nuevos micrófonos', '2025-03-26', 1, 'IMAGEN'),
(739, 24, 'Confesiones anónimas de fans', '2025-04-06', 0, 'TEXTO'),
(740, 24, 'Episodio completo sin censura #4', '2025-04-16', 0, 'VIDEO'),
(741, 24, 'Consejos de pareja en 5 minutos', '2025-04-26', 1, 'TEXTO'),
(742, 24, 'El invitado sorpresa de hoy', '2025-05-06', 1, 'IMAGEN'),
(743, 24, 'Historias que no pudimos emitir', '2025-05-16', 0, 'TEXTO'),
(744, 24, 'Debate acalorado (Corte del director)', '2025-05-26', 0, 'VIDEO'),
(745, 24, 'Clip viral: El peor error en una cita', '2025-06-06', 1, 'VIDEO'),
(746, 24, 'Póster de la segunda temporada', '2025-06-16', 1, 'IMAGEN'),
(747, 24, 'Guía de comunicación asertiva', '2025-06-26', 0, 'TEXTO'),
(748, 24, 'Audio inmersivo 3D del podcast', '2025-07-06', 0, 'VIDEO'),
(749, 24, 'Por qué creamos este programa', '2025-07-16', 1, 'TEXTO'),
(750, 24, 'Foto en la cabina de radio', '2025-07-26', 1, 'IMAGEN'),
(751, 24, 'Fondos virtuales del estudio', '2025-08-06', 0, 'IMAGEN'),
(752, 24, 'Bloopers y ataques de risa', '2025-08-16', 0, 'VIDEO'),
(753, 24, 'Entrevistando a sexóloga experta', '2025-08-26', 1, 'VIDEO'),
(754, 24, 'Estadísticas divertidas de la app', '2025-09-06', 1, 'IMAGEN'),
(755, 24, 'Transcripción del episodio prohibido', '2025-09-16', 0, 'TEXTO'),
(756, 24, 'Preguntas y respuestas con alcohol', '2025-09-26', 0, 'VIDEO'),
(757, 24, 'Anécdotas graciosas de oyentes', '2025-10-06', 1, 'TEXTO'),
(758, 24, 'Detrás del cristal insonorizado', '2025-10-16', 1, 'VIDEO'),
(759, 24, 'Galería de fotos de la fiesta podcast', '2025-10-26', 0, 'IMAGEN'),
(760, 24, 'Los peores consejos que hemos dado', '2025-11-06', 0, 'TEXTO'),
(761, 24, 'Tour por las nuevas oficinas', '2025-11-16', 1, 'VIDEO'),
(762, 24, 'Cómo mandar tu nota de voz', '2025-11-26', 1, 'TEXTO'),
(763, 24, 'Stickers de WhatsApp del equipo', '2025-12-06', 0, 'IMAGEN'),
(764, 24, 'Meme oficial de la temporada', '2025-12-16', 0, 'IMAGEN'),
(765, 24, 'Especial de Navidad: Historias locas', '2026-01-12', 1, 'VIDEO'),
(766, 24, 'Temas que abordaremos en 2026', '2026-01-22', 1, 'TEXTO'),
(767, 24, 'Invitación VIP al show en vivo', '2026-02-12', 0, 'IMAGEN'),
(768, 24, 'Episodio secreto #40', '2026-02-22', 0, 'TEXTO');

-- ============================================================
-- CREADOR 25 (Categoría: Gaming - NSFW) - IDs 769 al 800
-- ============================================================
INSERT INTO Publicacion (id, idCreador, titulo, fecha_publicacion, es_publica, tipo_contenido) VALUES 
(769, 25, 'Jugando Skyrim con 100 mods', '2025-03-18', 1, 'VIDEO'),
(770, 25, 'Captura épica del paisaje (SFW)', '2025-03-28', 1, 'IMAGEN'),
(771, 25, 'Guía para instalar parches +18', '2025-04-08', 0, 'TEXTO'),
(772, 25, 'Gameplay de juego erótico indie', '2025-04-18', 0, 'VIDEO'),
(773, 25, 'Mi PC y especificaciones', '2025-04-28', 1, 'TEXTO'),
(774, 25, 'Foto de mis nuevos auriculares', '2025-05-08', 1, 'IMAGEN'),
(775, 25, 'Lista de mis mods visuales favoritos', '2025-05-18', 0, 'TEXTO'),
(776, 25, 'Review del simulador de citas', '2025-05-28', 0, 'VIDEO'),
(777, 25, 'Susto tremendo en juego de terror', '2025-06-08', 1, 'VIDEO'),
(778, 25, 'Mi personaje en el creador', '2025-06-18', 1, 'IMAGEN'),
(779, 25, 'Trucos para desbloquear las escenas', '2025-06-28', 0, 'TEXTO'),
(780, 25, 'Video completo sin censura en Twitch', '2025-07-08', 0, 'VIDEO'),
(781, 25, 'La historia oculta de este RPG', '2025-07-18', 1, 'TEXTO'),
(782, 25, 'Meme del bug gracioso de hoy', '2025-07-28', 1, 'IMAGEN'),
(783, 25, 'Pack de texturas 8K para adultos', '2025-08-08', 0, 'IMAGEN'),
(784, 25, 'Vlog interactuando en VR Chat', '2025-08-18', 0, 'VIDEO'),
(785, 25, 'Probando teclado de una sola mano', '2025-08-28', 1, 'VIDEO'),
(786, 25, 'Diseño de la portada de mi stream', '2025-09-08', 1, 'IMAGEN'),
(787, 25, 'Galería de avatares VR exclusivos', '2025-09-18', 0, 'IMAGEN'),
(788, 25, 'Reto: Pasarme el juego en 2 horas', '2025-09-28', 0, 'VIDEO'),
(789, 25, 'Opinión sobre la censura en los juegos', '2025-10-08', 1, 'TEXTO'),
(790, 25, 'Directo especial jugando con fans', '2025-10-18', 1, 'VIDEO'),
(791, 25, 'Arte 3D del personaje principal', '2025-10-28', 0, 'IMAGEN'),
(792, 25, 'Configuración de físicas extremas', '2025-11-08', 0, 'TEXTO'),
(793, 25, 'Cómo configurar OBS para streams', '2025-11-18', 1, 'VIDEO'),
(794, 25, 'Agradecimiento a mis moderadores', '2025-11-28', 1, 'TEXTO'),
(795, 25, 'Wallpapers HD de mi avatar', '2025-12-08', 0, 'IMAGEN'),
(796, 25, 'Save file con todo al 100%', '2025-12-18', 0, 'TEXTO'),
(797, 25, 'Mis juegos favoritos del año', '2026-01-14', 1, 'VIDEO'),
(798, 25, 'Qué esperar del canal en 2026', '2026-01-24', 1, 'TEXTO'),
(799, 25, 'Colección de escenas finales 4K', '2026-02-14', 0, 'IMAGEN'),
(800, 25, 'Modding avanzado paso a paso', '2026-02-24', 0, 'TEXTO');

SET IDENTITY_INSERT Publicacion OFF;


-- =========================================================================
-- TABLA VIDEO: Solo IDs correspondientes a 'tipo_contenido' = 'VIDEO'
-- Relación 1 a 1 estricta con la tabla Publicacion
-- =========================================================================

INSERT INTO Video (idPublicacion, duracion_seg, resolucion, url_stream) VALUES 
-- Creador 1
(1, 1500, '1080p', 'https://cdn.plataforma.com/vid/1.mp4'),
(4, 960, '1080p', 'https://cdn.plataforma.com/vid/4.mp4'),
(5, 4500, '4K', 'https://cdn.plataforma.com/vid/5.mp4'),
(8, 1200, '1080p', 'https://cdn.plataforma.com/vid/8.mp4'),
(9, 600, '720p', 'https://cdn.plataforma.com/vid/9.mp4'),
(12, 3600, '4K', 'https://cdn.plataforma.com/vid/12.mp4'),
(13, 850, '1080p', 'https://cdn.plataforma.com/vid/13.mp4'),
(16, 2100, '1080p', 'https://cdn.plataforma.com/vid/16.mp4'),
(17, 340, '720p', 'https://cdn.plataforma.com/vid/17.mp4'),
(20, 5400, '4K', 'https://cdn.plataforma.com/vid/20.mp4'),
(21, 1100, '1080p', 'https://cdn.plataforma.com/vid/21.mp4'),
(24, 2500, '1080p', 'https://cdn.plataforma.com/vid/24.mp4'),
(28, 480, '1080p', 'https://cdn.plataforma.com/vid/28.mp4'),
(32, 620, '4K', 'https://cdn.plataforma.com/vid/32.mp4'),

-- Creador 2
(35, 1800, '1080p', 'https://cdn.plataforma.com/vid/35.mp4'),
(37, 2400, '1080p', 'https://cdn.plataforma.com/vid/37.mp4'),
(40, 300, '720p', 'https://cdn.plataforma.com/vid/40.mp4'),
(43, 900, '1080p', 'https://cdn.plataforma.com/vid/43.mp4'),
(45, 3600, '4K', 'https://cdn.plataforma.com/vid/45.mp4'),
(47, 5400, '1080p', 'https://cdn.plataforma.com/vid/47.mp4'),
(51, 1200, '1080p', 'https://cdn.plataforma.com/vid/51.mp4'),
(53, 450, '720p', 'https://cdn.plataforma.com/vid/53.mp4'),
(56, 3200, '1080p', 'https://cdn.plataforma.com/vid/56.mp4'),
(59, 1500, '4K', 'https://cdn.plataforma.com/vid/59.mp4'),
(61, 800, '1080p', 'https://cdn.plataforma.com/vid/61.mp4'),
(64, 2100, '1080p', 'https://cdn.plataforma.com/vid/64.mp4'),

-- Creador 3
(66, 600, '4K', 'https://cdn.plataforma.com/vid/66.mp4'),
(69, 1100, '1080p', 'https://cdn.plataforma.com/vid/69.mp4'),
(72, 7200, '1080p', 'https://cdn.plataforma.com/vid/72.mp4'),
(75, 2400, '4K', 'https://cdn.plataforma.com/vid/75.mp4'),
(77, 900, '1080p', 'https://cdn.plataforma.com/vid/77.mp4'),
(80, 4500, '1080p', 'https://cdn.plataforma.com/vid/80.mp4'),
(83, 3000, '1080p', 'https://cdn.plataforma.com/vid/83.mp4'),
(85, 1200, '720p', 'https://cdn.plataforma.com/vid/85.mp4'),
(88, 5400, '4K', 'https://cdn.plataforma.com/vid/88.mp4'),
(91, 1800, '1080p', 'https://cdn.plataforma.com/vid/91.mp4'),
(93, 2600, '1080p', 'https://cdn.plataforma.com/vid/93.mp4'),
(96, 7200, '1080p', 'https://cdn.plataforma.com/vid/96.mp4'),

-- Creador 4
(97, 14400, '1080p', 'https://cdn.plataforma.com/vid/97.mp4'),
(100, 3600, '1080p', 'https://cdn.plataforma.com/vid/100.mp4'),
(101, 7200, '4K', 'https://cdn.plataforma.com/vid/101.mp4'),
(104, 2700, '1080p', 'https://cdn.plataforma.com/vid/104.mp4'),
(108, 14400, '1080p', 'https://cdn.plataforma.com/vid/108.mp4'),
(112, 4500, '720p', 'https://cdn.plataforma.com/vid/112.mp4'),
(113, 1800, '1080p', 'https://cdn.plataforma.com/vid/113.mp4'),
(116, 5400, '1080p', 'https://cdn.plataforma.com/vid/116.mp4'),
(117, 900, '4K', 'https://cdn.plataforma.com/vid/117.mp4'),
(120, 3600, '1080p', 'https://cdn.plataforma.com/vid/120.mp4'),
(124, 7200, '1080p', 'https://cdn.plataforma.com/vid/124.mp4'),

-- Creador 5
(129, 240, '1080p', 'https://cdn.plataforma.com/vid/129.mp4'),
(132, 7200, '1080p', 'https://cdn.plataforma.com/vid/132.mp4'),
(133, 600, '1080p', 'https://cdn.plataforma.com/vid/133.mp4'),
(136, 5400, '1080p', 'https://cdn.plataforma.com/vid/136.mp4'),
(140, 1200, '720p', 'https://cdn.plataforma.com/vid/140.mp4'),
(144, 2400, '1080p', 'https://cdn.plataforma.com/vid/144.mp4'),
(145, 300, '4K', 'https://cdn.plataforma.com/vid/145.mp4'),
(148, 3600, '1080p', 'https://cdn.plataforma.com/vid/148.mp4'),
(149, 4500, '1080p', 'https://cdn.plataforma.com/vid/149.mp4'),
(152, 1800, '1080p', 'https://cdn.plataforma.com/vid/152.mp4'),
(156, 2700, '1080p', 'https://cdn.plataforma.com/vid/156.mp4'),

-- Creador 6
(161, 900, '4K', 'https://cdn.plataforma.com/vid/161.mp4'),
(164, 1200, '1080p', 'https://cdn.plataforma.com/vid/164.mp4'),
(165, 1500, '1080p', 'https://cdn.plataforma.com/vid/165.mp4'),
(168, 5400, '1080p', 'https://cdn.plataforma.com/vid/168.mp4'),
(172, 1800, '4K', 'https://cdn.plataforma.com/vid/172.mp4'),
(176, 7200, '1080p', 'https://cdn.plataforma.com/vid/176.mp4'),
(177, 600, '1080p', 'https://cdn.plataforma.com/vid/177.mp4'),
(180, 2400, '4K', 'https://cdn.plataforma.com/vid/180.mp4'),
(181, 1800, '1080p', 'https://cdn.plataforma.com/vid/181.mp4'),
(184, 3600, '1080p', 'https://cdn.plataforma.com/vid/184.mp4'),
(188, 900, '720p', 'https://cdn.plataforma.com/vid/188.mp4'),

-- Creador 7
(193, 1200, '4K', 'https://cdn.plataforma.com/vid/193.mp4'),
(196, 800, '1080p', 'https://cdn.plataforma.com/vid/196.mp4'),
(197, 1500, '1080p', 'https://cdn.plataforma.com/vid/197.mp4'),
(200, 2400, '1080p', 'https://cdn.plataforma.com/vid/200.mp4'),
(204, 1800, '4K', 'https://cdn.plataforma.com/vid/204.mp4'),
(208, 2700, '1080p', 'https://cdn.plataforma.com/vid/208.mp4'),
(209, 1500, '1080p', 'https://cdn.plataforma.com/vid/209.mp4'),
(212, 600, '720p', 'https://cdn.plataforma.com/vid/212.mp4'),
(213, 2100, '1080p', 'https://cdn.plataforma.com/vid/213.mp4'),
(216, 3600, '1080p', 'https://cdn.plataforma.com/vid/216.mp4'),
(220, 1500, '1080p', 'https://cdn.plataforma.com/vid/220.mp4'),

-- Creador 8
(225, 5400, '1080p', 'https://cdn.plataforma.com/vid/225.mp4'),
(228, 7200, '1080p', 'https://cdn.plataforma.com/vid/228.mp4'),
(229, 900, '1080p', 'https://cdn.plataforma.com/vid/229.mp4'),
(232, 5400, '1080p', 'https://cdn.plataforma.com/vid/232.mp4'),
(236, 3600, '1080p', 'https://cdn.plataforma.com/vid/236.mp4'),
(240, 2400, '1080p', 'https://cdn.plataforma.com/vid/240.mp4'),
(241, 7200, '4K', 'https://cdn.plataforma.com/vid/241.mp4'),
(244, 5400, '1080p', 'https://cdn.plataforma.com/vid/244.mp4'),
(245, 1200, '1080p', 'https://cdn.plataforma.com/vid/245.mp4'),
(248, 3600, '1080p', 'https://cdn.plataforma.com/vid/248.mp4'),
(252, 7200, '1080p', 'https://cdn.plataforma.com/vid/252.mp4'),

-- Creador 9
(257, 1800, '4K', 'https://cdn.plataforma.com/vid/257.mp4'),
(260, 600, '1080p', 'https://cdn.plataforma.com/vid/260.mp4'),
(261, 2400, '4K', 'https://cdn.plataforma.com/vid/261.mp4'),
(264, 3000, '1080p', 'https://cdn.plataforma.com/vid/264.mp4'),
(268, 2100, '1080p', 'https://cdn.plataforma.com/vid/268.mp4'),
(272, 3600, '4K', 'https://cdn.plataforma.com/vid/272.mp4'),
(273, 1800, '1080p', 'https://cdn.plataforma.com/vid/273.mp4'),
(276, 2700, '1080p', 'https://cdn.plataforma.com/vid/276.mp4'),
(277, 1200, '1080p', 'https://cdn.plataforma.com/vid/277.mp4'),
(280, 1500, '1080p', 'https://cdn.plataforma.com/vid/280.mp4'),
(284, 2400, '4K', 'https://cdn.plataforma.com/vid/284.mp4'),

-- Creador 10
(289, 300, '1080p', 'https://cdn.plataforma.com/vid/289.mp4'),
(292, 450, '720p', 'https://cdn.plataforma.com/vid/292.mp4'),
(296, 3600, '1080p', 'https://cdn.plataforma.com/vid/296.mp4'),
(297, 600, '1080p', 'https://cdn.plataforma.com/vid/297.mp4'),
(300, 900, '1080p', 'https://cdn.plataforma.com/vid/300.mp4'),
(304, 5400, '1080p', 'https://cdn.plataforma.com/vid/304.mp4'),
(305, 450, '1080p', 'https://cdn.plataforma.com/vid/305.mp4'),
(308, 4800, '1080p', 'https://cdn.plataforma.com/vid/308.mp4'),
(312, 1200, '1080p', 'https://cdn.plataforma.com/vid/312.mp4'),
(313, 180, '1080p', 'https://cdn.plataforma.com/vid/313.mp4'),
(317, 900, '1080p', 'https://cdn.plataforma.com/vid/317.mp4'),

-- Creador 11
(321, 1200, '1080p', 'https://cdn.plataforma.com/vid/321.mp4'),
(324, 1800, '4K', 'https://cdn.plataforma.com/vid/324.mp4'),
(328, 1500, '1080p', 'https://cdn.plataforma.com/vid/328.mp4'),
(329, 1100, '1080p', 'https://cdn.plataforma.com/vid/329.mp4'),
(332, 2400, '1080p', 'https://cdn.plataforma.com/vid/332.mp4'),
(336, 5400, '1080p', 'https://cdn.plataforma.com/vid/336.mp4'),
(337, 900, '1080p', 'https://cdn.plataforma.com/vid/337.mp4'),
(340, 3600, '1080p', 'https://cdn.plataforma.com/vid/340.mp4'),
(344, 1200, '1080p', 'https://cdn.plataforma.com/vid/344.mp4'),
(345, 1500, '1080p', 'https://cdn.plataforma.com/vid/345.mp4'),
(349, 300, '1080p', 'https://cdn.plataforma.com/vid/349.mp4'),

-- Creador 12
(353, 1500, '4K', 'https://cdn.plataforma.com/vid/353.mp4'),
(356, 2400, '1080p', 'https://cdn.plataforma.com/vid/356.mp4'),
(360, 900, '1080p', 'https://cdn.plataforma.com/vid/360.mp4'),
(361, 1200, '1080p', 'https://cdn.plataforma.com/vid/361.mp4'),
(364, 1800, '4K', 'https://cdn.plataforma.com/vid/364.mp4'),
(368, 3600, '1080p', 'https://cdn.plataforma.com/vid/368.mp4'),
(369, 1500, '1080p', 'https://cdn.plataforma.com/vid/369.mp4'),
(372, 2100, '1080p', 'https://cdn.plataforma.com/vid/372.mp4'),
(376, 600, '4K', 'https://cdn.plataforma.com/vid/376.mp4'),
(377, 2400, '1080p', 'https://cdn.plataforma.com/vid/377.mp4'),
(381, 900, '1080p', 'https://cdn.plataforma.com/vid/381.mp4'),

-- Creador 13
(385, 1200, '1080p', 'https://cdn.plataforma.com/vid/385.mp4'),
(388, 1800, '1080p', 'https://cdn.plataforma.com/vid/388.mp4'),
(392, 5400, '1080p', 'https://cdn.plataforma.com/vid/392.mp4'),
(393, 1500, '1080p', 'https://cdn.plataforma.com/vid/393.mp4'),
(396, 2400, '1080p', 'https://cdn.plataforma.com/vid/396.mp4'),
(400, 3600, '1080p', 'https://cdn.plataforma.com/vid/400.mp4'),
(401, 900, '1080p', 'https://cdn.plataforma.com/vid/401.mp4'),
(404, 2100, '1080p', 'https://cdn.plataforma.com/vid/404.mp4'),
(406, 3000, '1080p', 'https://cdn.plataforma.com/vid/406.mp4'),
(409, 1800, '1080p', 'https://cdn.plataforma.com/vid/409.mp4'),
(413, 600, '1080p', 'https://cdn.plataforma.com/vid/413.mp4'),

-- Creador 14
(417, 600, '1080p', 'https://cdn.plataforma.com/vid/417.mp4'),
(420, 2400, '1080p', 'https://cdn.plataforma.com/vid/420.mp4'),
(424, 3600, '1080p', 'https://cdn.plataforma.com/vid/424.mp4'),
(425, 900, '1080p', 'https://cdn.plataforma.com/vid/425.mp4'),
(428, 1200, '1080p', 'https://cdn.plataforma.com/vid/428.mp4'),
(432, 5400, '1080p', 'https://cdn.plataforma.com/vid/432.mp4'),
(433, 1500, '1080p', 'https://cdn.plataforma.com/vid/433.mp4'),
(436, 1800, '1080p', 'https://cdn.plataforma.com/vid/436.mp4'),
(438, 300, '1080p', 'https://cdn.plataforma.com/vid/438.mp4'),
(441, 1200, '1080p', 'https://cdn.plataforma.com/vid/441.mp4'),
(445, 2700, '1080p', 'https://cdn.plataforma.com/vid/445.mp4'),

-- Creador 15
(449, 1200, '1080p', 'https://cdn.plataforma.com/vid/449.mp4'),
(452, 2400, '1080p', 'https://cdn.plataforma.com/vid/452.mp4'),
(456, 3600, '1080p', 'https://cdn.plataforma.com/vid/456.mp4'),
(457, 1500, '1080p', 'https://cdn.plataforma.com/vid/457.mp4'),
(460, 5400, '1080p', 'https://cdn.plataforma.com/vid/460.mp4'),
(464, 1800, '1080p', 'https://cdn.plataforma.com/vid/464.mp4'),
(465, 2100, '1080p', 'https://cdn.plataforma.com/vid/465.mp4'),
(468, 7200, '1080p', 'https://cdn.plataforma.com/vid/468.mp4'),
(470, 900, '1080p', 'https://cdn.plataforma.com/vid/470.mp4'),
(473, 1200, '1080p', 'https://cdn.plataforma.com/vid/473.mp4'),
(477, 1500, '1080p', 'https://cdn.plataforma.com/vid/477.mp4'),

-- Creador 16
(481, 1800, '1080p', 'https://cdn.plataforma.com/vid/481.mp4'),
(484, 5400, '1080p', 'https://cdn.plataforma.com/vid/484.mp4'),
(488, 3600, '1080p', 'https://cdn.plataforma.com/vid/488.mp4'),
(489, 1500, '1080p', 'https://cdn.plataforma.com/vid/489.mp4'),
(492, 7200, '1080p', 'https://cdn.plataforma.com/vid/492.mp4'),
(496, 5400, '1080p', 'https://cdn.plataforma.com/vid/496.mp4'),
(497, 1200, '1080p', 'https://cdn.plataforma.com/vid/497.mp4'),
(500, 2400, '1080p', 'https://cdn.plataforma.com/vid/500.mp4'),
(502, 900, '1080p', 'https://cdn.plataforma.com/vid/502.mp4'),
(505, 3000, '1080p', 'https://cdn.plataforma.com/vid/505.mp4'),
(509, 1200, '1080p', 'https://cdn.plataforma.com/vid/509.mp4'),

-- Creador 17
(513, 1500, '1080p', 'https://cdn.plataforma.com/vid/513.mp4'),
(516, 2400, '1080p', 'https://cdn.plataforma.com/vid/516.mp4'),
(520, 7200, '1080p', 'https://cdn.plataforma.com/vid/520.mp4'),
(521, 900, '1080p', 'https://cdn.plataforma.com/vid/521.mp4'),
(524, 14400, '1080p', 'https://cdn.plataforma.com/vid/524.mp4'),
(528, 3600, '1080p', 'https://cdn.plataforma.com/vid/528.mp4'),
(529, 4500, '1080p', 'https://cdn.plataforma.com/vid/529.mp4'),
(532, 3600, '1080p', 'https://cdn.plataforma.com/vid/532.mp4'),
(534, 1200, '1080p', 'https://cdn.plataforma.com/vid/534.mp4'),
(537, 600, '1080p', 'https://cdn.plataforma.com/vid/537.mp4'),
(541, 1800, '1080p', 'https://cdn.plataforma.com/vid/541.mp4'),

-- Creador 18
(545, 300, '1080p', 'https://cdn.plataforma.com/vid/545.mp4'),
(548, 3600, '1080p', 'https://cdn.plataforma.com/vid/548.mp4'),
(552, 7200, '1080p', 'https://cdn.plataforma.com/vid/552.mp4'),
(553, 1200, '1080p', 'https://cdn.plataforma.com/vid/553.mp4'),
(556, 4500, '1080p', 'https://cdn.plataforma.com/vid/556.mp4'),
(560, 5400, '1080p', 'https://cdn.plataforma.com/vid/560.mp4'),
(561, 900, '1080p', 'https://cdn.plataforma.com/vid/561.mp4'),
(564, 1500, '1080p', 'https://cdn.plataforma.com/vid/564.mp4'),
(566, 1800, '1080p', 'https://cdn.plataforma.com/vid/566.mp4'),
(569, 2100, '1080p', 'https://cdn.plataforma.com/vid/569.mp4'),
(573, 1200, '1080p', 'https://cdn.plataforma.com/vid/573.mp4'),

-- Creador 19
(577, 900, '1080p', 'https://cdn.plataforma.com/vid/577.mp4'),
(580, 2400, '1080p', 'https://cdn.plataforma.com/vid/580.mp4'),
(584, 1200, '1080p', 'https://cdn.plataforma.com/vid/584.mp4'),
(585, 1800, '1080p', 'https://cdn.plataforma.com/vid/585.mp4'),
(588, 2700, '1080p', 'https://cdn.plataforma.com/vid/588.mp4'),
(592, 1500, '1080p', 'https://cdn.plataforma.com/vid/592.mp4'),
(593, 600, '1080p', 'https://cdn.plataforma.com/vid/593.mp4'),
(596, 1200, '1080p', 'https://cdn.plataforma.com/vid/596.mp4'),
(598, 3600, '1080p', 'https://cdn.plataforma.com/vid/598.mp4'),
(601, 2400, '1080p', 'https://cdn.plataforma.com/vid/601.mp4'),
(605, 900, '1080p', 'https://cdn.plataforma.com/vid/605.mp4'),

-- Creador 20
(609, 1200, '1080p', 'https://cdn.plataforma.com/vid/609.mp4'),
(612, 3600, '1080p', 'https://cdn.plataforma.com/vid/612.mp4'),
(616, 1800, '1080p', 'https://cdn.plataforma.com/vid/616.mp4'),
(617, 2400, '1080p', 'https://cdn.plataforma.com/vid/617.mp4'),
(620, 5400, '1080p', 'https://cdn.plataforma.com/vid/620.mp4'),
(624, 7200, '1080p', 'https://cdn.plataforma.com/vid/624.mp4'),
(625, 1500, '1080p', 'https://cdn.plataforma.com/vid/625.mp4'),
(628, 900, '1080p', 'https://cdn.plataforma.com/vid/628.mp4'),
(630, 4500, '1080p', 'https://cdn.plataforma.com/vid/630.mp4'),
(633, 2100, '1080p', 'https://cdn.plataforma.com/vid/633.mp4'),
(637, 1800, '1080p', 'https://cdn.plataforma.com/vid/637.mp4'),

-- Creador 21
(641, 1500, '1080p', 'https://cdn.plataforma.com/vid/641.mp4'),
(644, 2400, '4K', 'https://cdn.plataforma.com/vid/644.mp4'),
(648, 1800, '4K', 'https://cdn.plataforma.com/vid/648.mp4'),
(649, 1200, '1080p', 'https://cdn.plataforma.com/vid/649.mp4'),
(652, 600, '4K', 'https://cdn.plataforma.com/vid/652.mp4'),
(656, 900, '4K', 'https://cdn.plataforma.com/vid/656.mp4'),
(657, 60, '1080p', 'https://cdn.plataforma.com/vid/657.mp4'),
(660, 1500, '1080p', 'https://cdn.plataforma.com/vid/660.mp4'),
(662, 1200, '1080p', 'https://cdn.plataforma.com/vid/662.mp4'),
(665, 2400, '1080p', 'https://cdn.plataforma.com/vid/665.mp4'),
(669, 1800, '1080p', 'https://cdn.plataforma.com/vid/669.mp4'),

-- Creador 22
(673, 600, '4K', 'https://cdn.plataforma.com/vid/673.mp4'),
(676, 900, '4K', 'https://cdn.plataforma.com/vid/676.mp4'),
(680, 1800, '4K', 'https://cdn.plataforma.com/vid/680.mp4'),
(681, 1500, '1080p', 'https://cdn.plataforma.com/vid/681.mp4'),
(684, 720, '4K', 'https://cdn.plataforma.com/vid/684.mp4'),
(688, 480, '4K', 'https://cdn.plataforma.com/vid/688.mp4'),
(689, 1200, '1080p', 'https://cdn.plataforma.com/vid/689.mp4'),
(692, 3600, '1080p', 'https://cdn.plataforma.com/vid/692.mp4'),
(694, 2400, '1080p', 'https://cdn.plataforma.com/vid/694.mp4'),
(697, 900, '1080p', 'https://cdn.plataforma.com/vid/697.mp4'),
(701, 600, '1080p', 'https://cdn.plataforma.com/vid/701.mp4'),

-- Creador 23
(705, 5400, '1080p', 'https://cdn.plataforma.com/vid/705.mp4'),
(708, 1200, '1080p', 'https://cdn.plataforma.com/vid/708.mp4'),
(712, 14400, '1080p', 'https://cdn.plataforma.com/vid/712.mp4'),
(713, 1500, '1080p', 'https://cdn.plataforma.com/vid/713.mp4'),
(716, 900, '1080p', 'https://cdn.plataforma.com/vid/716.mp4'),
(720, 7200, '1080p', 'https://cdn.plataforma.com/vid/720.mp4'),
(721, 1800, '1080p', 'https://cdn.plataforma.com/vid/721.mp4'),
(724, 3600, '1080p', 'https://cdn.plataforma.com/vid/724.mp4'),
(726, 5400, '1080p', 'https://cdn.plataforma.com/vid/726.mp4'),
(729, 1200, '1080p', 'https://cdn.plataforma.com/vid/729.mp4'),
(733, 900, '1080p', 'https://cdn.plataforma.com/vid/733.mp4'),

-- Creador 24
(737, 3600, '1080p', 'https://cdn.plataforma.com/vid/737.mp4'),
(740, 7200, '1080p', 'https://cdn.plataforma.com/vid/740.mp4'),
(744, 4500, '1080p', 'https://cdn.plataforma.com/vid/744.mp4'),
(745, 600, '1080p', 'https://cdn.plataforma.com/vid/745.mp4'),
(748, 5400, '1080p', 'https://cdn.plataforma.com/vid/748.mp4'),
(752, 1200, '1080p', 'https://cdn.plataforma.com/vid/752.mp4'),
(753, 4800, '1080p', 'https://cdn.plataforma.com/vid/753.mp4'),
(756, 3600, '1080p', 'https://cdn.plataforma.com/vid/756.mp4'),
(758, 1800, '1080p', 'https://cdn.plataforma.com/vid/758.mp4'),
(761, 900, '1080p', 'https://cdn.plataforma.com/vid/761.mp4'),
(765, 5400, '1080p', 'https://cdn.plataforma.com/vid/765.mp4'),

-- Creador 25
(769, 14400, '1080p', 'https://cdn.plataforma.com/vid/769.mp4'),
(772, 3600, '1080p', 'https://cdn.plataforma.com/vid/772.mp4'),
(776, 1800, '1080p', 'https://cdn.plataforma.com/vid/776.mp4'),
(777, 600, '1080p', 'https://cdn.plataforma.com/vid/777.mp4'),
(780, 7200, '1080p', 'https://cdn.plataforma.com/vid/780.mp4'),
(784, 5400, '1080p', 'https://cdn.plataforma.com/vid/784.mp4'),
(785, 1200, '1080p', 'https://cdn.plataforma.com/vid/785.mp4'),
(788, 7200, '1080p', 'https://cdn.plataforma.com/vid/788.mp4'),
(790, 10800, '1080p', 'https://cdn.plataforma.com/vid/790.mp4'),
(793, 1500, '1080p', 'https://cdn.plataforma.com/vid/793.mp4'),
(797, 2400, '1080p', 'https://cdn.plataforma.com/vid/797.mp4');


-- =========================================================================
-- TABLA IMAGEN: Solo IDs correspondientes a 'tipo_contenido' = 'IMAGEN'
-- =========================================================================

INSERT INTO Imagen (idPublicacion, ancho, alto, formato, alt_text, url_imagen) VALUES 
-- Creador 1
(2, 1920, 1080, 'JPG', 'Setup de streaming con luces RGB', 'https://cdn.plataforma.com/img/2.jpg'),
(6, 1080, 1080, 'PNG', 'Tier list de personajes de RPG', 'https://cdn.plataforma.com/img/6.png'),
(10, 3840, 2160, 'JPG', 'Captura 4K del nuevo mapa', 'https://cdn.plataforma.com/img/10.jpg'),
(14, 1080, 1350, 'JPG', 'Foto con fans en evento gaming', 'https://cdn.plataforma.com/img/14.jpg'),
(18, 1920, 1080, 'PNG', 'Wallpaper exclusivo PC', 'https://cdn.plataforma.com/img/18.png'),
(22, 1920, 1080, 'JPG', 'Arte conceptual filtrado', 'https://cdn.plataforma.com/img/22.jpg'),
(26, 1080, 1080, 'JPG', 'Captura del peor bug del juego', 'https://cdn.plataforma.com/img/26.jpg'),
(30, 1080, 1080, 'PNG', 'Meme mensual de la comunidad', 'https://cdn.plataforma.com/img/30.png'),

-- Creador 2
(34, 1080, 1350, 'JPG', 'Transformación física de cliente', 'https://cdn.plataforma.com/img/34.jpg'),
(36, 1080, 1080, 'PNG', 'Infografía de macronutrientes', 'https://cdn.plataforma.com/img/36.png'),
(38, 1080, 1350, 'JPG', 'Foto de antes y después', 'https://cdn.plataforma.com/img/38.jpg'),
(42, 1080, 1080, 'JPG', 'Compra del supermercado saludable', 'https://cdn.plataforma.com/img/42.jpg'),
(46, 1080, 1080, 'PNG', 'Errores de postura en gimnasio', 'https://cdn.plataforma.com/img/46.png'),
(50, 1080, 1350, 'JPG', 'Levantamiento de peso muerto', 'https://cdn.plataforma.com/img/50.jpg'),
(52, 1080, 1080, 'JPG', 'Check in de medidas semanales', 'https://cdn.plataforma.com/img/52.jpg'),
(54, 1080, 1350, 'JPG', 'Outfit deportivo negro', 'https://cdn.plataforma.com/img/54.jpg'),
(58, 1080, 1080, 'JPG', 'Batido de proteína de chocolate', 'https://cdn.plataforma.com/img/58.jpg'),
(62, 1920, 1080, 'JPG', 'Gimnasio montado en casa', 'https://cdn.plataforma.com/img/62.jpg'),

-- Creador 3
(67, 1920, 1080, 'PNG', 'Diagrama de flujo de código', 'https://cdn.plataforma.com/img/67.png'),
(70, 1920, 1080, 'JPG', 'Escritorio con monitores ultra-wide', 'https://cdn.plataforma.com/img/70.jpg'),
(74, 1080, 1080, 'PNG', 'Gráficas de test de rendimiento', 'https://cdn.plataforma.com/img/74.png'),
(78, 1920, 1080, 'JPG', 'Comparativa de colores en monitores', 'https://cdn.plataforma.com/img/78.jpg'),
(82, 1080, 1350, 'JPG', 'Interior de PC limpio', 'https://cdn.plataforma.com/img/82.jpg'),
(84, 1080, 1920, 'PNG', 'Hoja de trucos de Git', 'https://cdn.plataforma.com/img/84.png'),
(86, 1080, 1080, 'JPG', 'Stand en convención de tecnología', 'https://cdn.plataforma.com/img/86.jpg'),
(90, 1080, 1350, 'JPG', 'Gestión de cables perfecta', 'https://cdn.plataforma.com/img/90.jpg'),
(94, 1080, 1080, 'JPG', 'Setup de viaje minimalista', 'https://cdn.plataforma.com/img/94.jpg'),

-- Creador 4
(98, 1920, 1080, 'JPG', 'Boceto limpio de guerrero', 'https://cdn.plataforma.com/img/98.jpg'),
(102, 1080, 1080, 'PNG', 'Paleta de colores digital', 'https://cdn.plataforma.com/img/102.png'),
(106, 1080, 1350, 'JPG', 'Fanart de anime shonen', 'https://cdn.plataforma.com/img/106.jpg'),
(110, 1920, 1080, 'JPG', 'Fondo de ciudad cyberpunk', 'https://cdn.plataforma.com/img/110.jpg'),
(111, 1080, 1080, 'PNG', 'Archivo descargable PSD', 'https://cdn.plataforma.com/img/111.png'),
(114, 1920, 1080, 'JPG', 'Ilustración completa de ciudad', 'https://cdn.plataforma.com/img/114.jpg'),
(118, 1080, 1080, 'JPG', 'Bocetos rápidos en libreta', 'https://cdn.plataforma.com/img/118.jpg'),
(122, 1080, 1080, 'JPG', 'Comparativa dibujo antiguo vs nuevo', 'https://cdn.plataforma.com/img/122.jpg'),
(126, 1920, 1080, 'JPG', 'Concept art de entorno de juego', 'https://cdn.plataforma.com/img/126.jpg'),
(127, 3840, 2160, 'PNG', 'Wallpaper alta resolución', 'https://cdn.plataforma.com/img/127.png'),
(128, 1080, 1080, 'PNG', 'Capas de dibujo separadas', 'https://cdn.plataforma.com/img/128.png'),

-- Creador 5
(130, 1920, 1080, 'JPG', 'Estudio de grabación profesional', 'https://cdn.plataforma.com/img/130.jpg'),
(134, 1080, 1350, 'JPG', 'Colección de guitarras en pared', 'https://cdn.plataforma.com/img/134.jpg'),
(138, 1920, 1080, 'JPG', 'Foto en blanco y negro de concierto', 'https://cdn.plataforma.com/img/138.jpg'),
(142, 1080, 1080, 'JPG', 'Pedalera de efectos de guitarra', 'https://cdn.plataforma.com/img/142.jpg'),
(143, 1080, 1080, 'PNG', 'Icono de paquete de stems', 'https://cdn.plataforma.com/img/143.png'),
(146, 1080, 1080, 'JPG', 'Portada oficial del nuevo EP', 'https://cdn.plataforma.com/img/146.jpg'),
(150, 1920, 1080, 'JPG', 'Productor trabajando en el DAW', 'https://cdn.plataforma.com/img/150.jpg'),
(154, 1080, 1080, 'JPG', 'Vinilo de edición limitada', 'https://cdn.plataforma.com/img/154.jpg'),
(158, 1080, 1350, 'PNG', 'Lista de canciones del show', 'https://cdn.plataforma.com/img/158.png'),
(159, 1080, 1080, 'PNG', 'Icono de samples de batería', 'https://cdn.plataforma.com/img/159.png'),
(160, 1080, 1080, 'JPG', 'Arte cover de pista instrumental', 'https://cdn.plataforma.com/img/160.jpg'),

-- Creador 6
(162, 1080, 1350, 'JPG', 'Emplatado elegante de cena', 'https://cdn.plataforma.com/img/162.jpg'),
(166, 1920, 1080, 'JPG', 'Set de cuchillos de chef', 'https://cdn.plataforma.com/img/166.jpg'),
(170, 1080, 1080, 'JPG', 'Asado jugoso a la parrilla', 'https://cdn.plataforma.com/img/170.jpg'),
(174, 1080, 1350, 'JPG', 'Macetas con hierbas aromáticas', 'https://cdn.plataforma.com/img/174.jpg'),
(175, 1080, 1920, 'PNG', 'Menú mensual imprimible', 'https://cdn.plataforma.com/img/175.png'),
(178, 1080, 1080, 'JPG', 'Tarta de chocolate brillante', 'https://cdn.plataforma.com/img/178.jpg'),
(182, 1920, 1080, 'JPG', 'Desayuno completo en la cama', 'https://cdn.plataforma.com/img/182.jpg'),
(186, 1080, 1080, 'JPG', 'Paella tradicional española', 'https://cdn.plataforma.com/img/186.jpg'),
(190, 1920, 1080, 'JPG', 'Ingredientes picados y ordenados', 'https://cdn.plataforma.com/img/190.jpg'),
(191, 1080, 1080, 'PNG', 'Portada del recetario VIP', 'https://cdn.plataforma.com/img/191.png'),
(192, 1080, 1080, 'PNG', 'Tiempos de cocción gráfica', 'https://cdn.plataforma.com/img/192.png'),

-- Creador 7
(194, 1080, 1350, 'JPG', 'Outfit de primavera en el parque', 'https://cdn.plataforma.com/img/194.jpg'),
(198, 1920, 1080, 'JPG', 'Paisaje de montaña desde ventana', 'https://cdn.plataforma.com/img/198.jpg'),
(202, 1080, 1080, 'JPG', 'Nueva cámara de vlogging', 'https://cdn.plataforma.com/img/202.jpg'),
(206, 1080, 1080, 'JPG', 'Perro con juguete destruido', 'https://cdn.plataforma.com/img/206.jpg'),
(207, 1080, 1350, 'JPG', 'Foto polaroid escaneada infancia', 'https://cdn.plataforma.com/img/207.jpg'),
(210, 1080, 1080, 'JPG', 'Maleta empacada a la mitad', 'https://cdn.plataforma.com/img/210.jpg'),
(214, 1080, 1350, 'JPG', 'Selfie grupal en plaza', 'https://cdn.plataforma.com/img/214.jpg'),
(218, 1920, 1080, 'JPG', 'Cuarto redecorado antes y después', 'https://cdn.plataforma.com/img/218.jpg'),
(222, 1920, 1080, 'JPG', 'Diseño de miniatura de YouTube', 'https://cdn.plataforma.com/img/222.jpg'),
(223, 1080, 1920, 'PNG', 'Wallpaper para teléfono', 'https://cdn.plataforma.com/img/223.png'),
(224, 1080, 1080, 'JPG', 'Collage de mejores momentos', 'https://cdn.plataforma.com/img/224.jpg'),

-- Creador 8
(226, 1080, 1080, 'PNG', 'Infografía Leyes de Newton', 'https://cdn.plataforma.com/img/226.png'),
(230, 1920, 1080, 'PNG', 'Mapa mental Revolución Francesa', 'https://cdn.plataforma.com/img/230.png'),
(234, 1920, 1080, 'JPG', 'Escritorio con apuntes y café', 'https://cdn.plataforma.com/img/234.jpg'),
(238, 1920, 1080, 'PNG', 'Tabla periódica con colores', 'https://cdn.plataforma.com/img/238.png'),
(239, 1080, 1080, 'PNG', 'Estructuras moleculares orgánicas', 'https://cdn.plataforma.com/img/239.png'),
(242, 1080, 1080, 'PNG', 'Diagrama de flujo if-else', 'https://cdn.plataforma.com/img/242.png'),
(246, 1080, 1350, 'JPG', 'Lanzando el birrete al aire', 'https://cdn.plataforma.com/img/246.jpg'),
(250, 1920, 1080, 'PNG', 'Pantallazo de plantilla Notion', 'https://cdn.plataforma.com/img/250.png'),
(254, 1920, 1080, 'PNG', 'Esquema partes del cerebro', 'https://cdn.plataforma.com/img/254.png'),
(255, 1080, 1080, 'JPG', 'Flashcards impresas sobre mesa', 'https://cdn.plataforma.com/img/255.jpg'),
(256, 1080, 1080, 'PNG', 'Dibujo de célula vegetal', 'https://cdn.plataforma.com/img/256.png'),

-- Creador 9
(258, 1080, 1350, 'JPG', 'Micrófono binaural 3Dio', 'https://cdn.plataforma.com/img/258.jpg'),
(262, 1920, 1080, 'JPG', 'Setup con luces de hadas tenues', 'https://cdn.plataforma.com/img/262.jpg'),
(266, 1080, 1080, 'JPG', 'Objetos de madera y cepillos', 'https://cdn.plataforma.com/img/266.jpg'),
(270, 1080, 1080, 'JPG', 'Velas aromáticas encendidas', 'https://cdn.plataforma.com/img/270.jpg'),
(271, 1080, 1920, 'JPG', 'Fondo de bosque con niebla', 'https://cdn.plataforma.com/img/271.jpg'),
(274, 1080, 1080, 'PNG', 'Boceto de avatar estilo anime', 'https://cdn.plataforma.com/img/274.png'),
(278, 1920, 1080, 'JPG', 'Colección de peines y cepillos', 'https://cdn.plataforma.com/img/278.jpg'),
(282, 1920, 1080, 'PNG', 'Gráfica de ondas de audio ASMR', 'https://cdn.plataforma.com/img/282.png'),
(286, 1080, 1080, 'JPG', 'Foto borrosa de próximo roleplay', 'https://cdn.plataforma.com/img/286.jpg'),
(287, 1080, 1080, 'JPG', 'Cover art para pista de lluvia', 'https://cdn.plataforma.com/img/287.jpg'),
(288, 1080, 1080, 'PNG', 'Hoja de stickers en formato PNG', 'https://cdn.plataforma.com/img/288.png'),

-- Creador 10
(290, 1080, 1080, 'JPG', 'Meme texto blanco fondo negro', 'https://cdn.plataforma.com/img/290.jpg'),
(294, 1920, 1080, 'JPG', 'Teatro lleno desde el escenario', 'https://cdn.plataforma.com/img/294.jpg'),
(298, 1080, 1080, 'JPG', 'Dibujo caricatura del comediante', 'https://cdn.plataforma.com/img/298.jpg'),
(302, 1080, 1350, 'JPG', 'Selfie grupal comediantes sonriendo', 'https://cdn.plataforma.com/img/302.jpg'),
(303, 1080, 1350, 'JPG', 'Póster de gira firmado', 'https://cdn.plataforma.com/img/303.jpg'),
(306, 1080, 1080, 'JPG', 'Cara de confusión comediante', 'https://cdn.plataforma.com/img/306.jpg'),
(307, 1080, 1080, 'JPG', 'Foto escolar vergonzosa', 'https://cdn.plataforma.com/img/307.jpg'),
(310, 1080, 1350, 'JPG', 'Outfit casual de comediante', 'https://cdn.plataforma.com/img/310.jpg'),
(311, 1080, 1080, 'JPG', 'Credencial VIP backstage', 'https://cdn.plataforma.com/img/311.jpg'),
(315, 1080, 1920, 'PNG', 'Wallpaper con frase graciosa', 'https://cdn.plataforma.com/img/315.png'),
(319, 1080, 1080, 'PNG', 'Diseño de camiseta oficial', 'https://cdn.plataforma.com/img/319.png'),

-- Creador 11
(322, 1080, 1350, 'JPG', 'Outfit completo en espejo', 'https://cdn.plataforma.com/img/322.jpg'),
(326, 1080, 1080, 'JPG', 'Swatches de labiales en el brazo', 'https://cdn.plataforma.com/img/326.jpg'),
(330, 1080, 1080, 'JPG', 'Joyas y lentes de sol en mesa', 'https://cdn.plataforma.com/img/330.jpg'),
(334, 1080, 1080, 'JPG', 'Uñas acrílicas diseño francés', 'https://cdn.plataforma.com/img/334.jpg'),
(335, 1080, 1080, 'JPG', 'Portada del Lookbook otoño', 'https://cdn.plataforma.com/img/335.jpg'),
(338, 1080, 1080, 'JPG', 'Paleta de sombras abierta', 'https://cdn.plataforma.com/img/338.jpg'),
(339, 1080, 1350, 'JPG', 'Sesión de fotos revista moda', 'https://cdn.plataforma.com/img/339.jpg'),
(342, 1920, 1080, 'JPG', 'Estante lleno de perfumes', 'https://cdn.plataforma.com/img/342.jpg'),
(343, 1080, 1080, 'JPG', 'Collage texturas y ropa de otoño', 'https://cdn.plataforma.com/img/343.jpg'),
(347, 1080, 1920, 'JPG', 'Wallpaper de seda brillante', 'https://cdn.plataforma.com/img/347.jpg'),
(351, 1080, 1080, 'PNG', 'Plantilla de corte de costura', 'https://cdn.plataforma.com/img/351.png'),

-- Creador 12
(354, 1920, 1080, 'JPG', 'Atardecer naranja en la playa', 'https://cdn.plataforma.com/img/354.jpg'),
(358, 1080, 1080, 'JPG', 'Páginas del pasaporte con sellos', 'https://cdn.plataforma.com/img/358.jpg'),
(362, 1920, 1080, 'JPG', 'Pico de montaña nevado', 'https://cdn.plataforma.com/img/362.jpg'),
(366, 1080, 1080, 'JPG', 'Cámaras y lentes en el piso', 'https://cdn.plataforma.com/img/366.jpg'),
(367, 1920, 1080, 'PNG', 'Mapa con pines rojos de ubicaciones', 'https://cdn.plataforma.com/img/367.png'),
(370, 1080, 1350, 'JPG', 'Turista sonriendo con locales', 'https://cdn.plataforma.com/img/370.jpg'),
(371, 1920, 1080, 'JPG', 'Portada del álbum fotográfico digital', 'https://cdn.plataforma.com/img/371.jpg'),
(374, 1080, 1080, 'JPG', 'Pizza Margarita auténtica', 'https://cdn.plataforma.com/img/374.jpg'),
(375, 1080, 1080, 'JPG', 'Diseño de postal digital', 'https://cdn.plataforma.com/img/375.jpg'),
(379, 1080, 1080, 'JPG', 'Foto antes y después del filtro', 'https://cdn.plataforma.com/img/379.jpg'),
(383, 1920, 1080, 'JPG', 'Calendario y boletos de avión', 'https://cdn.plataforma.com/img/383.jpg'),

-- Creador 13
(386, 1920, 1080, 'PNG', 'Gráfico de barras inflación', 'https://cdn.plataforma.com/img/386.png'),
(390, 1080, 1080, 'JPG', 'Pantallazo de matriz Excel', 'https://cdn.plataforma.com/img/390.jpg'),
(394, 1080, 1920, 'PNG', 'Infografía tarjetas de crédito', 'https://cdn.plataforma.com/img/394.png'),
(398, 1920, 1080, 'PNG', 'Mapa mental de ingresos pasivos', 'https://cdn.plataforma.com/img/398.png'),
(399, 1080, 1080, 'JPG', 'Vista previa calculadora Excel', 'https://cdn.plataforma.com/img/399.jpg'),
(402, 1920, 1080, 'JPG', 'Laptop y taza de café finanzas', 'https://cdn.plataforma.com/img/402.jpg'),
(403, 1080, 1080, 'JPG', 'Portada reporte mensual PDF', 'https://cdn.plataforma.com/img/403.jpg'),
(407, 1920, 1080, 'PNG', 'Evolución de acciones línea verde', 'https://cdn.plataforma.com/img/407.png'),
(411, 1080, 1080, 'PNG', 'Calendario metas 2026', 'https://cdn.plataforma.com/img/411.png'),
(412, 1920, 1080, 'JPG', 'Interfaz calculadora interactiva', 'https://cdn.plataforma.com/img/412.jpg'),
(415, 1080, 1080, 'JPG', 'Certificado de economía', 'https://cdn.plataforma.com/img/415.jpg'),

-- Creador 14
(418, 1080, 1080, 'PNG', 'Panel de estadísticas de fútbol', 'https://cdn.plataforma.com/img/418.png'),
(422, 1080, 1080, 'JPG', 'Formación de 11 jugadores en cancha', 'https://cdn.plataforma.com/img/422.jpg'),
(426, 1920, 1080, 'PNG', 'Línea de tiempo de récords', 'https://cdn.plataforma.com/img/426.png'),
(430, 1920, 1080, 'JPG', 'Estadio repleto luces nocturnas', 'https://cdn.plataforma.com/img/430.jpg'),
(431, 1080, 1920, 'JPG', 'Wallpaper de cancha de césped', 'https://cdn.plataforma.com/img/431.jpg'),
(434, 1080, 1080, 'JPG', 'Camisetas clásicas colgadas', 'https://cdn.plataforma.com/img/434.jpg'),
(435, 1920, 1080, 'PNG', 'Flechas y diagramas en pizarra', 'https://cdn.plataforma.com/img/435.png'),
(439, 1080, 1080, 'PNG', 'Gráfico de torta posesión de balón', 'https://cdn.plataforma.com/img/439.png'),
(443, 1080, 1080, 'JPG', 'Llaves del torneo tipo árbol', 'https://cdn.plataforma.com/img/443.jpg'),
(444, 1080, 1080, 'JPG', 'Boceto de trofeo filtrado', 'https://cdn.plataforma.com/img/444.jpg'),
(447, 1080, 1350, 'JPG', 'Lista de top 10 salarios filtrada', 'https://cdn.plataforma.com/img/447.jpg'),

-- Creador 15
(450, 1080, 1350, 'JPG', 'Montaje comparativo de pósters', 'https://cdn.plataforma.com/img/450.jpg'),
(454, 1920, 1080, 'PNG', 'Timeline del universo cinematográfico', 'https://cdn.plataforma.com/img/454.png'),
(458, 1080, 1350, 'JPG', 'Pose traje de gala alfombra roja', 'https://cdn.plataforma.com/img/458.jpg'),
(462, 1920, 1080, 'JPG', 'Pantalla dividida con y sin CGI', 'https://cdn.plataforma.com/img/462.jpg'),
(463, 1080, 1080, 'JPG', 'Dibujos a lápiz de storyboard', 'https://cdn.plataforma.com/img/463.jpg'),
(466, 1080, 1080, 'JPG', 'Boletos de cine vintage', 'https://cdn.plataforma.com/img/466.jpg'),
(467, 3840, 2160, 'JPG', 'Escena explosiva en 4K', 'https://cdn.plataforma.com/img/467.jpg'),
(471, 1080, 1080, 'PNG', 'Muestras de color estilo película', 'https://cdn.plataforma.com/img/471.png'),
(475, 1080, 1350, 'JPG', 'Boceto de traje de héroe', 'https://cdn.plataforma.com/img/475.jpg'),
(476, 1920, 1080, 'PNG', 'Plano cenital con focos y cámara', 'https://cdn.plataforma.com/img/476.png'),
(479, 1080, 1080, 'JPG', 'Gafete digital con código QR', 'https://cdn.plataforma.com/img/479.jpg'),

-- Creador 16
(482, 1920, 1080, 'JPG', 'Estantería llena de libros por color', 'https://cdn.plataforma.com/img/482.jpg'),
(486, 1080, 1920, 'PNG', 'Rostros y nombres de autores', 'https://cdn.plataforma.com/img/486.png'),
(490, 1080, 1080, 'JPG', 'Marcapáginas de madera tallada', 'https://cdn.plataforma.com/img/490.jpg'),
(494, 1080, 1350, 'JPG', 'Portada final de la novela', 'https://cdn.plataforma.com/img/494.jpg'),
(495, 1920, 1080, 'PNG', 'Esquema de post-its en pared', 'https://cdn.plataforma.com/img/495.png'),
(498, 1080, 1080, 'JPG', 'Collage de ropa y objetos aesthetic', 'https://cdn.plataforma.com/img/498.jpg'),
(503, 1920, 1080, 'JPG', 'Mapa de fantasía estilo antiguo', 'https://cdn.plataforma.com/img/503.jpg'),
(507, 1080, 1080, 'JPG', 'Bocetos de criaturas a tinta', 'https://cdn.plataforma.com/img/507.jpg'),
(508, 1080, 1350, 'JPG', 'Manuscrito rayado con bolígrafo rojo', 'https://cdn.plataforma.com/img/508.jpg'),
(511, 1920, 1080, 'PNG', 'Árbol familiar con flechas de relación', 'https://cdn.plataforma.com/img/511.png'),
(512, 1080, 1920, 'PNG', 'Wallpaper con cita de libro', 'https://cdn.plataforma.com/img/512.png'),

-- Creador 17
(514, 1920, 1080, 'JPG', 'Mesa de centro pulida y barnizada', 'https://cdn.plataforma.com/img/514.jpg'),
(518, 1080, 1350, 'JPG', 'Sillón tapizado comparado con viejo', 'https://cdn.plataforma.com/img/518.jpg'),
(522, 1080, 1080, 'JPG', 'Set de pinceles finos limpios', 'https://cdn.plataforma.com/img/522.jpg'),
(526, 1920, 1080, 'JPG', 'Tablero con telas y maderas de muestra', 'https://cdn.plataforma.com/img/526.jpg'),
(527, 1080, 1080, 'PNG', 'Blueprint técnico de repisa', 'https://cdn.plataforma.com/img/527.png'),
(530, 1080, 1080, 'JPG', 'Circuito verde con soldaduras LED', 'https://cdn.plataforma.com/img/530.jpg'),
(535, 1080, 1080, 'PNG', 'Icono para descargar PDF de corte', 'https://cdn.plataforma.com/img/535.png'),
(539, 1920, 1080, 'PNG', 'Diagrama de conexión de cables', 'https://cdn.plataforma.com/img/539.png'),
(540, 1080, 1080, 'JPG', 'Macro de vetas de madera nogal', 'https://cdn.plataforma.com/img/540.jpg'),
(543, 1920, 1080, 'JPG', 'Render 3D de escritorio de esquina', 'https://cdn.plataforma.com/img/543.jpg'),
(544, 1080, 1080, 'JPG', 'Diseño vectorial para corte láser', 'https://cdn.plataforma.com/img/544.jpg'),

-- Creador 18
(546, 1080, 1080, 'JPG', 'Collage de portadas de periódicos', 'https://cdn.plataforma.com/img/546.jpg'),
(550, 1920, 1080, 'PNG', 'Línea de evolución de votos mensual', 'https://cdn.plataforma.com/img/550.png'),
(554, 1920, 1080, 'JPG', 'Mapa mundial con códigos de color', 'https://cdn.plataforma.com/img/554.jpg'),
(558, 1080, 1080, 'JPG', 'Dibujo satírico de un político', 'https://cdn.plataforma.com/img/558.jpg'),
(559, 1080, 1080, 'PNG', 'Gráfico de barras de encuestas locales', 'https://cdn.plataforma.com/img/559.png'),
(562, 1920, 1080, 'JPG', 'Micrófonos apuntando al atril', 'https://cdn.plataforma.com/img/562.jpg'),
(567, 1080, 1080, 'JPG', 'Hoja de cálculo con cifras presupuestarias', 'https://cdn.plataforma.com/img/567.jpg'),
(571, 1080, 1080, 'PNG', 'Organigrama de los poderes del estado', 'https://cdn.plataforma.com/img/571.png'),
(572, 1080, 1350, 'JPG', 'Documento antiguo escaneado con sello', 'https://cdn.plataforma.com/img/572.jpg'),
(575, 1080, 1080, 'PNG', 'Pastel estadístico de abstención', 'https://cdn.plataforma.com/img/575.png'),
(576, 1920, 1080, 'JPG', 'Mitin político desde atrás de la tarima', 'https://cdn.plataforma.com/img/576.jpg'),

-- Creador 19
(578, 1080, 1350, 'JPG', 'Perro golden retriever dormido en sofá', 'https://cdn.plataforma.com/img/578.jpg'),
(582, 1080, 1080, 'JPG', 'Pelotas y cuerdas en el pasto', 'https://cdn.plataforma.com/img/582.jpg'),
(586, 1920, 1080, 'JPG', 'Familia abrazando a dos perros y un gato', 'https://cdn.plataforma.com/img/586.jpg'),
(590, 1080, 1080, 'JPG', 'Perro sucio vs Perro recién bañado', 'https://cdn.plataforma.com/img/590.jpg'),
(591, 1080, 1080, 'PNG', 'Plantilla de calendario mensual', 'https://cdn.plataforma.com/img/591.png'),
(594, 1080, 1350, 'JPG', 'Perrito con suéter tejido rojo', 'https://cdn.plataforma.com/img/594.jpg'),
(599, 1080, 1920, 'PNG', 'Checklist de tareas de mascota', 'https://cdn.plataforma.com/img/599.png'),
(603, 1080, 1080, 'JPG', 'Ilustración con siluetas de razas', 'https://cdn.plataforma.com/img/603.jpg'),
(604, 1080, 1920, 'PNG', 'Fondo de pantalla de huellas minimalista', 'https://cdn.plataforma.com/img/604.png'),
(607, 1080, 1080, 'JPG', 'Cachorro de un mes en una manta', 'https://cdn.plataforma.com/img/607.jpg'),
(608, 1080, 1080, 'JPG', 'Meme de perro confundido', 'https://cdn.plataforma.com/img/608.jpg'),

-- Creador 20
(610, 1080, 1080, 'PNG', 'Texto sobre fondo estrellado explicando Mercurio', 'https://cdn.plataforma.com/img/610.png'),
(614, 1080, 1350, 'JPG', 'Mesa con velas, cuarzos y cartas', 'https://cdn.plataforma.com/img/614.jpg'),
(618, 1080, 1080, 'JPG', 'Cuarzo rosa y amatista brillando', 'https://cdn.plataforma.com/img/618.jpg'),
(622, 1080, 1080, 'JPG', 'Carta del Loco del tarot clásico', 'https://cdn.plataforma.com/img/622.jpg'),
(623, 1080, 1920, 'PNG', 'Plantilla en blanco de fases lunares', 'https://cdn.plataforma.com/img/623.png'),
(626, 1080, 1350, 'JPG', 'Baraja de cartas holográfica nueva', 'https://cdn.plataforma.com/img/626.jpg'),
(631, 1920, 1080, 'JPG', 'Constelaciones sobre fondo negro HD', 'https://cdn.plataforma.com/img/631.jpg'),
(635, 1080, 1080, 'PNG', 'Círculo zodiacal con fechas clave 2026', 'https://cdn.plataforma.com/img/635.png'),
(636, 1080, 1920, 'JPG', 'Wallpapers del símbolo de Aries', 'https://cdn.plataforma.com/img/636.jpg'),
(639, 1080, 1080, 'JPG', 'Primer plano de cristal transparente', 'https://cdn.plataforma.com/img/639.jpg'),
(640, 1080, 1080, 'JPG', 'Collar protector hecho a mano', 'https://cdn.plataforma.com/img/640.jpg'),

-- Creador 21
(642, 1080, 1350, 'JPG', 'Cosplayer sonriendo en salón de convenciones', 'https://cdn.plataforma.com/img/642.jpg'),
(646, 1080, 1080, 'JPG', 'Primer plano de rostro con orejas puntiagudas', 'https://cdn.plataforma.com/img/646.jpg'),
(650, 1080, 1350, 'JPG', 'Traje de armadura negro y rojo cuerpo entero', 'https://cdn.plataforma.com/img/650.jpg'),
(654, 1920, 1080, 'JPG', 'Foto natural junto a foto con efectos mágicos', 'https://cdn.plataforma.com/img/654.jpg'),
(655, 1080, 1350, 'JPG', 'Modelo en lencería con alas de demonio', 'https://cdn.plataforma.com/img/655.jpg'),
(658, 1080, 1080, 'JPG', 'Silueta en las sombras con luces neón', 'https://cdn.plataforma.com/img/658.jpg'),
(663, 3840, 2160, 'JPG', 'Pack de fotos de Maid estilo Pin-up HD', 'https://cdn.plataforma.com/img/663.jpg'),
(667, 1080, 1080, 'JPG', 'Fotos instantáneas con firma a marcador', 'https://cdn.plataforma.com/img/667.jpg'),
(668, 1080, 1920, 'JPG', 'Fondos de pantalla exclusivos para móviles', 'https://cdn.plataforma.com/img/668.jpg'),
(671, 1080, 1350, 'JPG', 'Set picante de enfermera anime', 'https://cdn.plataforma.com/img/671.jpg'),
(672, 1080, 1080, 'JPG', 'Toma descartada sonriendo a cámara', 'https://cdn.plataforma.com/img/672.jpg'),

-- Creador 22
(674, 1080, 1350, 'JPG', 'Retrato dramático alto contraste B/N', 'https://cdn.plataforma.com/img/674.jpg'),
(678, 1080, 1080, 'JPG', 'Selfie en el espejo sin maquillaje', 'https://cdn.plataforma.com/img/678.jpg'),
(682, 1080, 1350, 'JPG', 'Ropa de calle oversize en la ciudad', 'https://cdn.plataforma.com/img/682.jpg'),
(686, 1080, 1080, 'JPG', 'Adelanto borroso de la nueva sesión', 'https://cdn.plataforma.com/img/686.jpg'),
(687, 1080, 1350, 'JPG', 'Foto artística sensual con alas blancas', 'https://cdn.plataforma.com/img/687.jpg'),
(690, 1920, 1080, 'JPG', 'Cielo naranja visto desde un balcón', 'https://cdn.plataforma.com/img/690.jpg'),
(691, 1080, 1350, 'JPG', 'Sesión explícita agua cayendo sobre piel', 'https://cdn.plataforma.com/img/691.jpg'),
(695, 3840, 2160, 'JPG', 'Carpeta de archivos originales .CR2', 'https://cdn.plataforma.com/img/695.jpg'),
(699, 1080, 1080, 'JPG', 'Caja llena de polaroids impresas', 'https://cdn.plataforma.com/img/699.jpg'),
(700, 1080, 1920, 'JPG', 'Fondos NSFW diseñados para el teléfono', 'https://cdn.plataforma.com/img/700.jpg'),
(703, 1920, 1080, 'JPG', 'Portada del calendario PDF', 'https://cdn.plataforma.com/img/703.jpg'),
(704, 1080, 1350, 'JPG', 'Modelo iluminada solo con luces de neón', 'https://cdn.plataforma.com/img/704.jpg'),

-- Creador 23
(706, 1080, 1080, 'JPG', 'Lineart de chica anime escolar', 'https://cdn.plataforma.com/img/706.jpg'),
(710, 1920, 1080, 'JPG', 'Tableta gráfica encendida sobre el escritorio', 'https://cdn.plataforma.com/img/710.jpg'),
(714, 1080, 1350, 'JPG', 'Dibujo de dos personajes famosos abrazados', 'https://cdn.plataforma.com/img/714.jpg'),
(718, 1080, 1080, 'PNG', 'Cuadros de color naranja y rojo', 'https://cdn.plataforma.com/img/718.png'),
(719, 1080, 1080, 'PNG', 'Icono de archivo de Photoshop', 'https://cdn.plataforma.com/img/719.png'),
(722, 1080, 1080, 'JPG', 'Llaveros y pósters del autor', 'https://cdn.plataforma.com/img/722.jpg'),
(723, 1920, 1080, 'JPG', 'Viñetas de cómic en blanco y negro', 'https://cdn.plataforma.com/img/723.jpg'),
(727, 1080, 1350, 'JPG', 'Arte oscuro de fantasía y tentáculos', 'https://cdn.plataforma.com/img/727.jpg'),
(731, 3840, 2160, 'JPG', 'Chica demonio a todo color sin censura', 'https://cdn.plataforma.com/img/731.jpg'),
(732, 1080, 1080, 'PNG', 'Captura de trazos de pinceles nuevos', 'https://cdn.plataforma.com/img/732.png'),
(735, 1080, 1350, 'JPG', 'Portada oficial del doujinshi volumen 1', 'https://cdn.plataforma.com/img/735.jpg'),

-- Creador 24
(738, 1920, 1080, 'JPG', 'Dos micrófonos Shure en la mesa del estudio', 'https://cdn.plataforma.com/img/738.jpg'),
(742, 1080, 1080, 'JPG', 'Silueta misteriosa del invitado de la semana', 'https://cdn.plataforma.com/img/742.jpg'),
(746, 1080, 1350, 'JPG', 'Arte oficial promocional de temporada 2', 'https://cdn.plataforma.com/img/746.jpg'),
(750, 1920, 1080, 'JPG', 'Los hosts riendo frente a la cónsola', 'https://cdn.plataforma.com/img/750.jpg'),
(751, 1920, 1080, 'JPG', 'Fondos 3D de cabina para videollamadas', 'https://cdn.plataforma.com/img/751.jpg'),
(754, 1080, 1080, 'PNG', 'Gráficas graciosas de retención de audiencia', 'https://cdn.plataforma.com/img/754.png'),
(759, 1080, 1350, 'JPG', 'Fotos de fans en el bar', 'https://cdn.plataforma.com/img/759.jpg'),
(763, 1080, 1080, 'PNG', 'Pack de stickers con caras raras', 'https://cdn.plataforma.com/img/763.png'),
(764, 1080, 1080, 'JPG', 'Meme interno de la broma del episodio 12', 'https://cdn.plataforma.com/img/764.jpg'),
(767, 1080, 1080, 'PNG', 'Boleto digital dorado para show en vivo', 'https://cdn.plataforma.com/img/767.png'),

-- Creador 25
(770, 1920, 1080, 'JPG', 'Paisaje de fantasía de Skyrim iluminado', 'https://cdn.plataforma.com/img/770.jpg'),
(774, 1080, 1080, 'JPG', 'Audífonos inalámbricos sobre alfombrilla', 'https://cdn.plataforma.com/img/774.jpg'),
(778, 1080, 1350, 'JPG', 'Primer plano del rostro del personaje creado', 'https://cdn.plataforma.com/img/778.jpg'),
(782, 1080, 1080, 'JPG', 'Captura de NPC atorado en una pared', 'https://cdn.plataforma.com/img/782.jpg'),
(783, 3840, 2160, 'JPG', 'Texturas híper realistas de piel', 'https://cdn.plataforma.com/img/783.jpg'),
(786, 1920, 1080, 'JPG', 'Banner offline del canal de Twitch', 'https://cdn.plataforma.com/img/786.jpg'),
(787, 1080, 1080, 'PNG', 'Modelos 3D de avatares VR', 'https://cdn.plataforma.com/img/787.png'),
(791, 1080, 1350, 'JPG', 'Render de Blender del protagonista', 'https://cdn.plataforma.com/img/791.jpg'),
(795, 1080, 1920, 'JPG', 'Fondos de pantalla de cuerpo entero', 'https://cdn.plataforma.com/img/795.jpg'),
(799, 3840, 2160, 'JPG', 'Escenas cinemáticas del final sin ropa', 'https://cdn.plataforma.com/img/799.jpg');

SET IDENTITY_INSERT Imagen OFF;

-- =========================================================================
-- TABLA TEXTO: Solo IDs correspondientes a 'tipo_contenido' = 'TEXTO'
-- =========================================================================

INSERT INTO Texto (idPublicacion, contenido_html, resumen_gratuito) VALUES 
-- Creador 1
(3, '<p>El farmeo eficiente requiere rutas específicas...</p>', 'Rutas de farmeo iniciales.'),
(7, '<p>La lore del jefe final es más profunda de lo que parece...</p>', 'Descubre la historia del villano.'),
(11, '<p>Configura tus macros así: <ul><li>Ataque: Tecla 1</li></ul></p>', 'Macros para mejorar tu APM.'),
(15, '<p>Se han filtrado los siguientes cambios en el meta...</p>', 'Notas del parche anticipadas.'),
(19, '<p>Comenzar a moddear requiere entender la estructura...</p>', 'Introducción al modding.'),
(23, '<p>La monetización en juegos actuales es agresiva...</p>', 'Mi opinión sobre los pases de batalla.'),
(25, '<p>Si acabas de empezar, enfócate en el tutorial...</p>', 'Lo básico para no morir rápido.'),
(27, '<p>Estas opciones gráficas te darán más FPS...</p>', 'Optimiza tus gráficos al máximo.'),
(29, '<p>Este año quiero llegar a nivel competitivo...</p>', 'Mis metas para la nueva temporada.'),
(31, '<p>Reglas del servidor: No toxicidad...</p>', 'Normas para nuestra comunidad privada.'),

-- Creador 2
(33, '<p>Sudar más no significa perder más grasa...</p>', 'Mito: Sudar quema grasa.'),
(39, '<p>Mi stack actual: Creatina, Creatina y Omega 3.</p>', 'Qué suplementos valen la pena.'),
(41, '<p>La sobrecarga progresiva es la clave real...</p>', 'Entiende por qué estás estancado.'),
(44, '<p>Ingredientes: Avena, huevo, plátano...</p>', 'Recetas dulces y altas en proteína.'),
(48, '<p>Calienta así: Movilidad articular 5 mins...</p>', 'Rutina para evitar lesiones.'),
(49, '<p>El ayuno no es mágico, pero ayuda a controlar...</p>', 'Pros y contras del ayuno.'),
(55, '<p>Usa la fórmula de Harris-Benedict para calcular...</p>', 'Aprende a calcular tus calorías.'),
(57, '<p>Dormir 8 horas regula tus hormonas del hambre...</p>', 'El impacto del descanso en tu físico.'),
(60, '<p>Lunes: Pollo con arroz. Martes: Pescado...</p>', 'Menú de la semana estructurado.'),
(63, '<p>Formulario para empezar tu asesoría...</p>', 'Cupos abiertos para coaching.'),

-- Creador 3
(65, '<p>El rendimiento multi-core es excepcional...</p>', 'Análisis del nuevo procesador.'),
(68, '<p>Usa nombres descriptivos para tus variables...</p>', 'Mejores prácticas en programación.'),
(71, '<p>Este script de bash hace copias de seguridad automáticas...</p>', 'Automatiza tareas aburridas.'),
(73, '<p>La IA generativa cambiará cómo programamos...</p>', 'El rol del programador en el futuro.'),
(76, '<p>Un B-tree es ideal para bases de datos...</p>', 'Aprende qué es un B-tree.'),
(79, '<p>Los ataques de inyección SQL aún existen...</p>', 'Vulnerabilidades web comunes.'),
(81, '<p>Fíjate en la RAM y el procesador antes que en la cámara.</p>', 'Qué buscar al comprar un celular.'),
(87, '<p>Los microservicios escalan mejor que un monolito...</p>', 'Patrones de arquitectura.'),
(89, '<p>La cultura tóxica me obligó a renunciar...</p>', 'Mi experiencia laboral pasada.'),
(92, '<p>Mes 1: HTML/CSS. Mes 2: JavaScript...</p>', 'Ruta de aprendizaje para ser Frontend.'),
(95, '<p>Aquí está el enlace al repositorio de GitHub...</p>', 'Código final del proyecto.'),

-- Creador 4
(99, '<p>Usa un pincel de opacidad baja para transiciones suaves.</p>', 'Sombreado en pintura digital.'),
(103, '<p>Experimenta con herramientas hasta sentirte cómodo.</p>', 'Consejos para artistas nuevos.'),
(105, '<p>Mi tableta principal es la Wacom Cintiq 16...</p>', 'Mi setup de arte completo.'),
(107, '<p>Descarga mis pinceles de textura aquí...</p>', 'Pack de pinceles personalizados.'),
(109, '<p>A veces lo mejor es dejar el lápiz y salir a caminar.</p>', 'Cómo lidiar con el bloqueo creativo.'),
(115, '<p>Calcula tu precio por hora de trabajo...</p>', 'Cómo valorar tu arte comercialmente.'),
(119, '<p>Link a mi carpeta privada de referencias de anatomía.</p>', 'Referencias para practicar.'),
(121, '<p>Clip Studio Paint superó mis expectativas.</p>', 'Review de programas de dibujo.'),
(123, '<p>Revisa la iluminación en esta pieza, falta contraste.</p>', 'Críticas constructivas a dibujos.'),
(125, '<p>Empecé dibujando en cuadernos de cuadrícula...</p>', 'Mi historia como ilustrador.'),

-- Creador 5
(131, '<p>La escala Dórica da un sonido melancólico...</p>', 'Modos griegos explicados.'),
(135, '<p>PDF con la partitura para piano y guitarra...</p>', 'Notas de mi última canción.'),
(137, '<p>Un buen micrófono y una interfaz es todo lo que ocupas.</p>', 'Lo esencial para empezar a grabar.'),
(139, '<p>El ii-V-I es la columna vertebral del Jazz...</p>', 'Armonía avanzada básica.'),
(141, '<p>El Korg Minilogue es una bestia analógica.</p>', 'Reseña de hardware musical.'),
(147, '<p>Distribuidoras como DistroKid facilitan el proceso.</p>', 'Sube tu música a plataformas.'),
(151, '<p>Corta las frecuencias por debajo de 100Hz...</p>', 'Tips rápidos de EQ.'),
(153, '<p>Los contratos abusivos son comunes, lee la letra pequeña.</p>', 'Cuidado al firmar con disqueras.'),
(155, '<p>Estas letras nunca llegaron al álbum final...</p>', 'Poemas y canciones descartadas.'),
(157, '<p>Descarga estos compresores y reverbs gratis.</p>', 'Lista de plugins gratuitos.'),

-- Creador 6
(163, '<p>Día 1: Mezclar agua y harina en partes iguales...</p>', 'Guía de 7 días para masa madre.'),
(167, '<p>Para un término medio, busca los 55 grados Celsius.</p>', 'Temperaturas exactas para carne.'),
(169, '<p>Sal kosher, pimienta negra molida gruesa, y un buen aceite.</p>', 'Los básicos de la cocina.'),
(171, '<p>Lista completa para preparar las recetas del mes.</p>', 'Ingredientes para meal prep.'),
(173, '<p>El truco es no cortar la raíz de la cebolla.</p>', 'Tips para picar más rápido.'),
(179, '<p>Si no tienes Buttermilk, usa leche con limón.</p>', 'Sustitutos de emergencia.'),
(183, '<p>Blanquea los vegetales antes de congelarlos.</p>', 'Técnicas para que la comida dure.'),
(185, '<p>Una piedra de afilar de grano 1000/6000 es ideal.</p>', 'Mantenimiento de cuchillos.'),
(187, '<p>Quesos fuertes van bien con vinos tintos de cuerpo...</p>', 'Guía básica de maridaje.'),
(189, '<p>Los cortadores de aguacate son innecesarios...</p>', 'Ahorra dinero en tu cocina.'),

-- Creador 7
(195, '<p>El clima arruinó la primera toma y casi pierdo el tren...</p>', 'Lo que pasó detrás de cámaras.'),
(199, '<p>Exponerte en internet da miedo al principio...</p>', 'Salud mental y creación de contenido.'),
(201, '<p>Soy alérgico a los mariscos y le tengo fobia a las aves.</p>', 'Curiosidades sobre mi vida.'),
(203, '<p>Estas cafeterías son mis favoritas para escribir.</p>', 'Mis rincones ocultos en la ciudad.'),
(205, '<p>Este año prometo viajar a un país nuevo.</p>', 'Objetivos personales de 2026.'),
(211, '<p>Día 1: Llegada a Roma. Día 2: Coliseo...</p>', 'Mi plan de viaje completo.'),
(215, '<p>Ustedes fueron los primeros 100 y se los agradezco...</p>', 'Un mensaje para mis OG fans.'),
(217, '<p>Me levanto a las 6 AM, medito y preparo café...</p>', 'Mi rutina para ser productivo.'),
(219, '<p>Las madrugadas siempre me ponen nostálgico...</p>', 'Escritos de media noche.'),
(221, '<p>Uso Premiere Pro para video y Lightroom para fotos.</p>', 'El software detrás de mis vlogs.'),

-- Creador 8
(227, '<p>Descarga el PDF con los ejercicios de dinámica resueltos.</p>', 'Problemas de física paso a paso.'),
(231, '<p>Respira profundo antes de voltear la hoja del examen...</p>', 'Manejo del estrés académico.'),
(233, '<p>La repetición espaciada cambiará cómo memorizas.</p>', 'Estudia de forma inteligente.'),
(235, '<p>Archivo adjunto: Parciales de 2022 a 2024.</p>', 'Exámenes anteriores para practicar.'),
(237, '<p>Deben leer "Sapiens" y "Pensar rápido, pensar despacio".</p>', 'Libros que te harán más inteligente.'),
(243, '<p>Implementación en C++ del Algoritmo de Dijkstra.</p>', 'Código para la clase de grafos.'),
(247, '<p>El impacto de la globalización en el siglo XXI...</p>', 'Borrador de mi último ensayo.'),
(249, '<p>Organizo mis entregas usando bases de datos en Notion.</p>', 'Gestión de tiempo para estudiantes.'),
(251, '<p>Intenta no agrupar clases pesadas el mismo día.</p>', 'Cómo elegir tus materias.'),
(253, '<p>Aquí están mis notas escaneadas del semestre pasado.</p>', 'Apuntes de clase en PDF.'),

-- Creador 9
(259, '<p>El ASMR me ayudó a superar mis ataques de pánico.</p>', 'Mi historia con el ASMR.'),
(263, '<p>Repite conmigo: Soy suficiente y merezco descansar.</p>', 'Frases para relajarte hoy.'),
(265, '<p>El cepillado de micrófonos y el sonido de teclado son top.</p>', 'Mis triggers favoritos.'),
(267, '<p>Guion del roleplay médico de la próxima semana.</p>', 'Adelanto del próximo video.'),
(269, '<p>Estudios demuestran que baja el ritmo cardíaco.</p>', 'La ciencia detrás del cosquilleo.'),
(275, '<p>Cierra los ojos, apaga las pantallas y respira.</p>', 'Un recordatorio para dormir.'),
(279, '<p>Guarda esto para cuando sientas que no puedes más.</p>', 'Palabras de aliento.'),
(281, '<p>Mantén tu cuarto frío y oscuro para dormir mejor.</p>', 'Tips para combatir el insomnio.'),
(283, '<p>Los versos de Bécquer siempre me relajan.</p>', 'Poemas suaves para ti.'),
(285, '<p>Un té caliente, un buen libro y luces bajas.</p>', 'Cómo me desconecto yo.'),

-- Creador 10
(291, '<p>Escribí esto y me di cuenta que no daba risa...</p>', 'Chistes que nunca verán la luz.'),
(293, '<p>Me temblaban las piernas y se me olvidó la rutina.</p>', 'Mi primera vez en el escenario.'),
(295, '<p>Documento de texto con el monólogo de este viernes.</p>', 'Acceso anticipado a mi material.'),
(299, '<p>Estos chistes eran demasiado oscuros para YouTube.</p>', 'Humor negro sin filtros.'),
(301, '<p>Reírnos de nuestras desgracias es un mecanismo de defensa.</p>', 'La filosofía detrás del humor.'),
(309, '<p>Superbad y The Hangover definieron una generación.</p>', 'Películas que sí dan risa.'),
(314, '<p>El público de hoy fue increíble, gracias Caracas.</p>', 'Mis pensamientos tras el show.'),
(316, '<p>Normalmente empiezo con una premisa y busco el giro.</p>', 'Mi proceso creativo de escritura.'),
(318, '<p>Dave Chappelle y Bill Burr son mis grandes referentes.</p>', 'Comediantes que debes ver.'),
(320, '<p>10 horas de viaje por carretera, pero vale la pena.</p>', 'Lo cansado que es ir de gira.'),

-- Creador 11
(323, '<p>Los colores pastel dominarán la primavera este año.</p>', 'Lo que se viene en la moda.'),
(325, '<p>El blanco, negro y beige son la base de tu armario.</p>', 'Cápsula de guardarropa.'),
(327, '<p>Ácido hialurónico, retinol y mucho protector solar.</p>', 'Mis productos de rutina de piel.'),
(331, '<p>Si tienes venas verdes, eres de tonos cálidos.</p>', 'Aprende qué colores te favorecen.'),
(333, '<p>No difuminar bien la base en el cuello es fatal.</p>', 'Cosas que debes evitar al maquillarte.'),
(341, '<p>La moda rápida contamina, opta por estas marcas locales.</p>', 'Alternativas al Fast Fashion.'),
(346, '<p>El diseño de la rosa significa renacer...</p>', 'El significado de mis tatuajes.'),
(348, '<p>Busca inspiración, limpia tu clóset y prueba siluetas.</p>', 'Encuentra tu estilo único.'),
(350, '<p>Labial, llaves, crema de manos y batería portátil.</p>', 'Lo que nunca falta en mi cartera.'),
(352, '<p>Las marcas te regalan productos para que mientas.</p>', 'La verdad sobre los PR packages.'),

-- Creador 12
(355, '<p>Gasté exactamente $450 USD en 5 días.</p>', 'Desglose financiero de mi viaje.'),
(357, '<p>Lleva prendas versátiles y enrolla tu ropa.</p>', 'Cómo viajar ligero de equipaje.'),
(359, '<p>Aquí están los números de los lancheros en Los Roques.</p>', 'Contactos VIP para tus viajes.'),
(363, '<p>Usa modo incógnito y busca vuelos los martes.</p>', 'Hackea los algoritmos de aerolíneas.'),
(365, '<p>No confiar en Google Maps en callejones fue mi peor error.</p>', 'Aprende de mis descuidos.'),
(373, '<p>Requisitos actualizados para entrar a Europa.</p>', 'Trámites de aduana y visas.'),
(378, '<p>Citymapper, Google Translate Offline y Hostelworld.</p>', 'Las aplicaciones que me salvan.'),
(380, '<p>Capas térmicas, botas impermeables y gorro polar.</p>', 'Cómo vestirse para la nieve.'),
(382, '<p>Pistas: Hablan portugués y tienen un cristo gigante.</p>', 'Adivina dónde estaré la próxima semana.'),
(384, '<p>No viajes sin seguro, una apendicitis casi me arruina.</p>', 'La importancia de estar asegurado.'),

-- Creador 13
(387, '<p>Regla 50/30/20: Necesidades, Deseos, Ahorro.</p>', 'Aprende a organizar tus ingresos.'),
(389, '<p>Endeudarse para comprar un auto nuevo es un error.</p>', 'Trampas financieras de la juventud.'),
(391, '<p>Actualmente tengo 40% BTC y 60% ETH en frío.</p>', 'Qué criptos estoy holdeando.'),
(395, '<p>El libro enseña que tu casa no es un activo.</p>', 'Las mejores lecciones de Kiyosaki.'),
(397, '<p>Con la subida de tasas, los créditos serán más caros.</p>', 'Cómo te afecta la decisión del banco.'),
(405, '<p>Las suscripciones fantasma drenan tu bolsillo.</p>', 'Corta tus gastos hormiga.'),
(408, '<p>Entrada en $150, Stop Loss en $140. Riesgo moderado.</p>', 'Alertas de bolsa privadas.'),
(410, '<p>EBITDA, ROI, ETF explicados de forma sencilla.</p>', 'Entiende el lenguaje de Wall Street.'),
(414, '<p>Documenta tus logros y pide una reunión formal.</p>', 'Tips de negociación salarial.'),
(416, '<p>Los bonos a 10 años están dando un rendimiento seguro.</p>', 'Opciones de bajo riesgo.'),

-- Creador 14
(419, '<p>Guardiola perfeccionó esta táctica con Messi...</p>', 'Entendiendo la estrategia moderna.'),
(421, '<p>Sus números no mienten, su impacto en el juego es total.</p>', 'Mi elegido a jugador del año.'),
(423, '<p>Si marcan en los primeros 15 min, el partido se rompe.</p>', 'Mi análisis previo al derby.'),
(427, '<p>Evalúo el xG (Goles esperados) y rachas locales.</p>', 'Cómo analizo las apuestas.'),
(429, '<p>Desde Uruguay 1930 hasta la actualidad...</p>', 'Datos curiosos de las copas.'),
(437, '<p>Falta un medio defensivo de contención urgente.</p>', 'Crítica constructiva a la directiva.'),
(440, '<p>Las malas gestiones financieras están destruyendo al club.</p>', 'Lo que no se ve en la cancha.'),
(442, '<p>Los derechos televisivos inflaron el mercado de pases.</p>', 'El negocio detrás del balón.'),
(446, '<p>Explicación de los downs, yardas y faltas comunes.</p>', 'Aprende a ver la NFL.'),
(448, '<p>Ha sido un año lleno de sorpresas y decepciones.</p>', 'Conclusiones finales.'),

-- Creador 15
(451, '<p>El clímax funciona por la iluminación y el silencio.</p>', 'Análisis de la escena final.'),
(453, '<p>Fuentes confirman que están buscando un nuevo actor.</p>', 'Rumores del MCU.'),
(455, '<p>Creo que todo esto fue un sueño del protagonista.</p>', 'Lo que pasará en la secuela.'),
(459, '<p>La producción fue un infierno por cambios de guion.</p>', 'Drama detrás de cámaras.'),
(461, '<p>Su expresión facial transmitió todo sin decir una palabra.</p>', 'Análisis de actuación.'),
(469, '<p>Tienen que ver esta joya coreana escondida en Netflix.</p>', 'Películas que nadie conoce.'),
(472, '<p>Traducción de las anotaciones al margen del guionista.</p>', 'Detalles ocultos del guion.'),
(474, '<p>Cómo construir un antagonista que genere empatía.</p>', 'Técnicas de narrativa.'),
(478, '<p>Una barra de sonido decente cambia por completo la experiencia.</p>', 'Mejora tu audio en casa.'),
(480, '<p>Ese final arruinó toda la construcción de personajes.</p>', 'Opinión honesta y dura.'),

-- Creador 16
(483, '<p>Capítulo 1: La ciudad siempre estaba fría...</p>', 'Primer vistazo a mi próxima historia.'),
(485, '<p>El autor logra un ritmo impecable, muy recomendado.</p>', 'Opinión sobre el bestseller de hoy.'),
(487, '<p>Escribí 2000 palabras hoy, pero siento que es relleno.</p>', 'Las frustraciones del escritor.'),
(491, '<p>Este era el final trágico original, ¿qué opinan?</p>', 'Final alternativo revelado.'),
(493, '<p>Si te estancas, escribe la escena más loca que imagines.</p>', 'Supera la página en blanco.'),
(499, '<p>Agencias que están recibiendo manuscritos actualmente.</p>', 'Ayuda para publicar tu libro.'),
(501, '<p>Asimov, Sanderson y Le Guin lideran mi lista.</p>', 'Mis ídolos literarios.'),
(504, '<p>Versos sueltos sobre la lluvia y el café.</p>', 'Mis escritos más personales.'),
(506, '<p>Leo 30 páginas al despertar y 30 antes de dormir.</p>', 'Cómo leer más libros al año.'),
(510, '<p>"No todos los que deambulan están perdidos".</p>', 'Citas que inspiran mis obras.'),

-- Creador 17
(515, '<p>Taladro, lijadora orbital, cinta métrica y martillo.</p>', 'Lo esencial para empezar a crear.'),
(517, '<p>El pino es suave y barato, el roble es resistente pero caro.</p>', 'Cómo escoger materiales.'),
(519, '<p>Aquí compro mis resinas y pigmentos a precio de mayorista.</p>', 'Contactos para ahorrar dinero.'),
(523, '<p>Usa esta fórmula en Excel para no perder dinero al cobrar.</p>', 'Presupuestando proyectos.'),
(525, '<p>Clasifica los tornillos por tamaño en frascos de vidrio.</p>', 'Mantén tu área limpia.'),
(531, '<p>Mezcla poliuretano y un toque de solvente para más brillo.</p>', 'Acabados perfectos en madera.'),
(533, '<p>Puedes armar mesas ratonas, estantes y hasta sofás.</p>', 'Proyectos ecológicos y baratos.'),
(536, '<p>Descarga las medidas exactas de los cortes.</p>', 'Instrucciones técnicas de ensamblaje.'),
(538, '<p>Limpia tus brochas de inmediato y aceita tus metales.</p>', 'Alarga la vida de tus herramientas.'),
(542, '<p>Gracias por sus ideas, el próximo video será una lámpara.</p>', 'Leyendo a la comunidad.'),

-- Creador 18
(547, '<p>Esta nueva legislación afectará directamente los impuestos.</p>', 'Lo que no te cuentan en la TV.'),
(549, '<p>La polarización nos está cegando ante los problemas reales.</p>', 'Reflexiones sobre la sociedad.'),
(551, '<p>Las cifras de los contratos públicos no cuadran.</p>', 'Investigación periodística exclusiva.'),
(555, '<p>El tratado comercial beneficiará solo a las multinacionales.</p>', 'Análisis macroeconómico.'),
(557, '<p>Los medios tradicionales ya no controlan la narrativa.</p>', 'El impacto del internet en la política.'),
(563, '<p>Análisis de las falacias lógicas usadas en el mitin de ayer.</p>', 'Desmontando discursos.'),
(565, '<p>La vida de Churchill nos enseña sobre la resiliencia en crisis.</p>', 'Lecciones de grandes líderes.'),
(568, '<p>El candidato A ofrece subsidios, el candidato B recortes...</p>', 'Lo que proponen realmente.'),
(570, '<p>Definición clara de inflación, déficit fiscal y populismo.</p>', 'Términos que debes manejar.'),
(574, '<p>1984 y Rebelión en la Granja son más actuales que nunca.</p>', 'Lecturas fundamentales.'),

-- Creador 19
(579, '<p>Alimentar con carne cruda mejoró el pelaje de Max, pero cuidado.</p>', 'Mi experiencia con dietas naturales.'),
(581, '<p>Usa juguetes interactivos y mantén una rutina predecible.</p>', 'Ayuda a tu perro hiperactivo.'),
(583, '<p>El chocolate, las uvas y la cebolla son tóxicos mortales.</p>', 'Lo que nunca debes darle a tu perro.'),
(587, '<p>Cómo hacer RCP canino y armar un botiquín básico.</p>', 'Salva la vida de tu mejor amigo.'),
(589, '<p>El ronroneo reduce el estrés y la presión arterial humana.</p>', 'La magia de los felinos.'),
(595, '<p>Si bosteza o se relame, está estresado, no relajado.</p>', 'Aprende a leer a tu perro.'),
(597, '<p>Esta marca aglomera mejor y no deja polvo en el piso.</p>', 'El mejor producto para areneros.'),
(600, '<p>Mantén una barrera física los primeros días y mezcla olores.</p>', 'Pasos para una convivencia en paz.'),
(602, '<p>Los arneses son mejores para no dañar su tráquea.</p>', 'Paseos seguros y cómodos.'),
(606, '<p>Sí, Max es un Golden puro, y tiene 3 años.</p>', 'Respondiendo sus preguntas frecuentes.'),

-- Creador 20
(611, '<p>Escribe lo que quieres soltar y quema el papel...</p>', 'Limpieza con la fase lunar.'),
(613, '<p>Este mes será intenso para los signos de agua...</p>', 'Tu guía astrológica de abril.'),
(615, '<p>Usa palo santo y sal marina en las esquinas de tu casa.</p>', 'Protege tu espacio personal.'),
(619, '<p>Visualiza una cúpula de luz blanca al salir de casa.</p>', 'Magia sencilla para el día a día.'),
(621, '<p>Aries y Leo hacen chispas, pero Sagitario equilibra.</p>', 'Dinámicas entre signos.'),
(627, '<p>Descarga mi guía básica para entender tu carta natal.</p>', 'Material para estudiantes de astrología.'),
(629, '<p>Los eclipses traen cierres forzados, no te resistas.</p>', 'Temporada de eclipses explicada.'),
(632, '<p>Repite: Soy un imán de energía positiva y prosperidad.</p>', 'Afirmaciones de poder.'),
(634, '<p>Tu sol es tu esencia, tu ascendente es tu máscara.</p>', 'Conceptos astrológicos confusos.'),
(638, '<p>Lecturas sobre tarot evolutivo y magia verde.</p>', 'Libros recomendados.'),

-- Creador 21
(643, '<p>Archivos listos para imprimir y cortar en goma eva.</p>', 'Patrones a escala real.'),
(645, '<p>El cartón reciclado y la resina pueden hacer milagros.</p>', 'Cosplay con bajo presupuesto.'),
(647, '<p>Curva la espalda baja y juega con las sombras del cuarto.</p>', 'Fotografía y expresión corporal.'),
(651, '<p>Links a las tiendas donde compro los encajes y medias.</p>', 'Los secretos de mi vestuario.'),
(653, '<p>Usa horquillas cruzadas y malla protectora debajo.</p>', 'Que no se te caiga el cabello.'),
(659, '<p>Si saben usar Photoshop, aquí tienen fotos crudas para jugar.</p>', 'Material exclusivo para editores.'),
(661, '<p>Los comentarios negativos no pagan mis materiales.</p>', 'Mi actitud frente a los trolls.'),
(664, '<p>¿Quieren ver a Tifa de FF7 o a 2B?</p>', 'Ayúdenme a decidir mi próximo traje.'),
(666, '<p>Mucha hidratación y desmaquillante bifásico es vital.</p>', 'Cuidando el rostro tras el maquillaje pesado.'),
(670, '<p>Las luces LED y la espuma de alta densidad fueron carísimas.</p>', 'La verdad sobre los costos del cosplay.'),

-- Creador 22
(675, '<p>Hidrato mi piel con aceite de coco y hago estiramientos.</p>', 'Preparación antes de cámara.'),
(677, '<p>La mandíbula relajada y los ojos entrecerrados dan más misterio.</p>', 'Domina tus ángulos.'),
(679, '<p>Estaba súper nerviosa, pero el fotógrafo me dio mucha confianza.</p>', 'Superando la pena inicial.'),
(683, '<p>Mis marcas preferidas para vibradores a prueba de agua.</p>', 'Recomendaciones muy personales.'),
(685, '<p>Usamos una Sony A7III y un lente 85mm f1.4.</p>', 'Información técnica para fotógrafos.'),
(693, '<p>Pilates, mucha agua y evitar los lácteos me funciona.</p>', 'Mis hábitos de cuidado personal.'),
(696, '<p>Hoy me siento más segura de mi cuerpo que nunca.</p>', 'Reflexiones sobre autoestima.'),
(698, '<p>Quiero hacer colaboraciones internacionales este verano.</p>', 'Lo que viene para mi carrera.'),
(702, '<p>Prometo subir contenido más seguido y hacer directos.</p>', 'Mis metas junto a ustedes.'),

-- Creador 23
(707, '<p>Exagerar las caderas y el busto requiere entender la gravedad.</p>', 'Proporciones en el dibujo Hentai.'),
(709, '<p>La animación de este estudio es brutal, pero la trama flojea.</p>', 'Reseña honesta de estrenos.'),
(711, '<p>Borrador de los diálogos de las escenas íntimas.</p>', 'Escritura de guiones maduros.'),
(715, '<p>Los ojos y la boca expresan el 90% del impacto visual.</p>', 'Técnicas de emotividad manga.'),
(717, '<p>Twitter restringe mucho, prefiero usar estas plataformas alternativas.</p>', 'Evitando el shadowban.'),
(725, '<p>Berserk, Vagabond y Gantz son obras maestras.</p>', 'Mangas maduros que debes leer.'),
(728, '<p>¿Quieren historia de fantasía oscura o ciencia ficción sucia?</p>', 'Encuesta para mis mecenas.'),
(730, '<p>Admiro profundamente el trabajo de Kentaro Miura.</p>', 'Mis inspiraciones.'),
(734, '<p>Quiero publicar un libro físico este año.</p>', 'Mis proyectos a futuro.'),
(736, '<p>Script de los primeros 3 finales alternativos del juego.</p>', 'Escribiendo visual novels.'),

-- Creador 24
(739, '<p>Esta es la historia de una suscriptora en un ascensor...</p>', 'Relatos picantes enviados por ustedes.'),
(741, '<p>La comunicación abierta en la cama lo cambia todo.</p>', 'Psicología y relaciones.'),
(743, '<p>Nuestro invitado dijo algo que no pudimos subir a YouTube.</p>', 'Secretos de cabina.'),
(747, '<p>No asumas lo que tu pareja quiere, pregúntalo directamente.</p>', 'Tips para mejorar la intimidad.'),
(749, '<p>Queríamos un espacio sin juicios morales sobre la sexualidad.</p>', 'Los inicios del show.'),
(755, '<p>Transcripción del debate sobre el poliamor.</p>', 'Para quienes prefieren leer.'),
(757, '<p>La peor cita de Tinder que nos han enviado hasta ahora.</p>', 'Humor y desgracias amorosas.'),
(760, '<p>Una vez le dijimos a alguien que terminara por WhatsApp... mala idea.</p>', 'Aceptando nuestros errores.'),
(762, '<p>Si quieres salir en el programa, envía tu audio a este link.</p>', 'Dinámicas de participación.'),
(766, '<p>Vamos a hablar sobre juguetes, fetiches raros y más psicólogos.</p>', 'Lo que se viene en el podcast.'),

-- Creador 25
(771, '<p>Paso 1: Instala el script extender. Paso 2: Copia la carpeta meshes...</p>', 'Mods NSFW sin romper el juego.'),
(773, '<p>Tengo una RTX 4090 y 64GB de RAM para soportar tantos mods.</p>', 'Mi bestia de computadora.'),
(775, '<p>Estos mods de iluminación cambian el juego por completo.</p>', 'Gráficos ultra realistas.'),
(779, '<p>Para desbloquear la ruta oculta, responde B en el diálogo 3.</p>', 'Guías de novelas visuales.'),
(781, '<p>El subtexto de esta misión es sorprendentemente maduro.</p>', 'Análisis narrativo en videojuegos.'),
(789, '<p>Plataformas que prohíben juegos por violencia pero no por otras cosas.</p>', 'La doble moral del gaming.'),
(792, '<p>Ajustes específicos para el motor de físicas de cuerpos.</p>', 'Tutorial de modding pesado.'),
(794, '<p>Sin mis mods de Twitch, el chat sería un caos, gracias a todos.</p>', 'Apreciación a la comunidad.'),
(796, '<p>Descarguen este save file si quieren saltarse el farmeo inicial.</p>', 'Regalo para la comunidad VIP.'),
(798, '<p>Planeo traer juegos VR más interactivos con ustedes.</p>', 'Nuevos formatos de streams.'),
(800, '<p>Cómo crear tus propias animaciones para insertarlas en el juego.</p>', 'Lleva el modding al siguiente nivel.');

----------comentarios-------------

SET IDENTITY_INSERT Comentario ON;

-- Insertando 100 Comentarios Raíz (idComentarioPadre = NULL)
-- Distribuidos en las primeras 100 publicaciones para asegurar visibilidad inicial
INSERT INTO Comentario (id, idUsuario, idPublicacion, idComentarioPadre, texto, fecha) VALUES 
(1, 55, 1, NULL, '¡Excelente video! Muy bien editado.', '2025-03-16 10:30:00'),
(2, 62, 2, NULL, '¿Qué cámara usaste para esta foto?', '2025-03-26 14:15:00'),
(3, 78, 3, NULL, 'No conocía esta ruta de farmeo, gracias.', '2025-04-06 09:00:00'),
(4, 12, 4, NULL, 'El balance de armas quedó horrible en este parche.', '2025-04-16 20:45:00'),
(5, 105, 5, NULL, '¡Qué buena jugada en el minuto 3:45!', '2025-04-26 18:20:00'),
(6, 140, 6, NULL, 'Coincido totalmente con la Tier List.', '2025-05-06 11:10:00'),
(7, 200, 7, NULL, 'La historia de este jefe me puso la piel de gallina.', '2025-05-16 22:30:00'),
(8, 33, 8, NULL, '¿Buscan gente para el equipo competitivo?', '2025-05-26 15:00:00'),
(9, 15, 9, NULL, 'Ese teclado suena increíble.', '2025-06-06 13:05:00'),
(10, 44, 10, NULL, 'El mapa visualmente es una obra de arte.', '2025-06-16 17:40:00'),
(11, 89, 11, NULL, 'Intenté configurar los macros pero no me funcionan.', '2025-06-26 19:25:00'),
(12, 210, 12, NULL, 'Increíble que no recibieras ni un golpe.', '2025-07-06 12:00:00'),
(13, 115, 13, NULL, 'Esperaba más de este juego sinceramente.', '2025-07-16 14:35:00'),
(14, 5, 14, NULL, '¡Qué genial conocerte en persona!', '2025-07-26 16:50:00'),
(15, 132, 15, NULL, '¿Es real esa filtración? Parece fake.', '2025-08-06 08:15:00'),
(16, 245, 16, NULL, 'Ese combo es imposible de hacer en consola.', '2025-08-16 21:10:00'),
(17, 77, 17, NULL, 'F en el chat por esa derrota, dolió.', '2025-08-26 10:40:00'),
(18, 180, 18, NULL, 'Ya lo puse de fondo de pantalla, gracias.', '2025-09-06 14:00:00'),
(19, 222, 19, NULL, '¿Qué motor usaste para el mod?', '2025-09-16 11:20:00'),
(20, 50, 20, NULL, 'Ese tiempo es de locos, felicidades.', '2025-09-26 23:15:00'),
(21, 10, 21, NULL, 'Este indie me recordó mucho a Zelda.', '2025-10-06 15:30:00'),
(22, 166, 22, NULL, 'El diseño de personajes es lo mejor.', '2025-10-16 09:45:00'),
(23, 240, 23, NULL, 'La industria está muriendo por los micro-pagos.', '2025-10-26 20:00:00'),
(24, 11, 24, NULL, 'Buena entrevista, se nota que sabe mucho.', '2025-11-06 13:12:00'),
(25, 68, 25, NULL, 'Me sirvió mucho para empezar, gracias.', '2025-11-16 10:05:00'),
(26, 125, 26, NULL, 'Jajaja ese bug es legendario.', '2025-11-26 22:40:00'),
(27, 39, 27, NULL, 'Subí 20 FPS con esto, eres un crack.', '2025-12-06 11:55:00'),
(28, 150, 28, NULL, 'Participo por el sorteo, ¡suerte a todos!', '2025-12-16 14:20:00'),
(29, 94, 29, NULL, 'Suerte con tus metas de 2026.', '2026-01-11 09:00:00'),
(30, 2, 30, NULL, 'Ese meme representa mi vida entera.', '2026-01-21 21:30:00'),
(31, 88, 31, NULL, 'Reglas claras conservan amistades.', '2026-02-11 10:45:00'),
(32, 230, 32, NULL, 'El trailer me dejó con más dudas que respuestas.', '2026-02-28 23:55:00'),
(33, 41, 33, NULL, 'Por fin alguien desmiente este mito.', '2025-03-13 08:30:00'),
(34, 19, 34, NULL, 'Qué orgullo ver ese progreso.', '2025-03-23 11:20:00'),
(35, 121, 35, NULL, 'Mañana mismo empiezo con esta rutina.', '2025-04-03 07:15:00'),
(36, 155, 36, NULL, 'Me cuesta llegar a las proteínas diarias.', '2025-04-13 14:40:00'),
(37, 249, 37, NULL, 'Comes mucho mejor que yo, jajaja.', '2025-04-23 20:10:00'),
(38, 70, 38, NULL, 'Inspirador, de verdad.', '2025-05-03 10:00:00'),
(39, 110, 39, NULL, '¿La creatina tiene efectos secundarios?', '2025-05-13 16:35:00'),
(40, 201, 40, NULL, 'Siempre bajaba demasiado la espalda, gracias.', '2025-05-23 18:50:00'),
(41, 56, 41, NULL, 'Llevo 2 meses estancado en banca.', '2026-01-03 12:20:00'),
(42, 13, 42, NULL, '¿Cuánto gastas al mes en comida?', '2026-01-13 15:45:00'),
(43, 99, 43, NULL, 'Casi me muero en el minuto 15, ¡buenísima!', '2026-01-23 08:30:00'),
(44, 188, 44, NULL, 'Ese postre se ve delicioso y fácil.', '2026-02-03 21:10:00'),
(45, 234, 45, NULL, 'Qué buen ambiente se ve en el grupo.', '2026-02-13 11:00:00'),
(46, 102, 46, NULL, 'Yo cometía el error #3 todos los días.', '2026-02-23 19:20:00'),
(47, 49, 47, NULL, 'Me encantan estos podcasts motivacionales.', '2025-08-03 22:00:00'),
(48, 144, 48, NULL, 'El calentamiento es lo más aburrido pero necesario.', '2025-08-13 06:45:00'),
(49, 212, 49, NULL, '¿Se puede entrenar en ayunas?', '2025-08-23 09:30:00'),
(50, 31, 50, NULL, 'Esa técnica de peso muerto es perfecta.', '2025-09-03 17:15:00'),
(51, 160, 51, NULL, 'Hacía falta un video así de estiramientos.', '2025-09-13 21:40:00'),
(52, 23, 52, NULL, 'Bajaste 2% de grasa en una semana, wow.', '2025-09-23 10:20:00'),
(53, 109, 53, NULL, 'Mis abdominales lloran con el ejercicio 4.', '2025-10-03 18:00:00'),
(54, 142, 54, NULL, '¿Dónde compraste esos zapatos?', '2025-10-13 14:15:00'),
(55, 177, 55, NULL, 'No entiendo bien cómo sacar el déficit.', '2025-10-23 11:05:00'),
(56, 126, 56, NULL, 'Llegué tarde al directo, ¿queda grabado?', '2025-11-03 20:30:00'),
(57, 134, 57, NULL, 'Yo duermo 5 horas y ando como un zombie.', '2025-11-13 08:15:00'),
(58, 22, 58, NULL, '¿Se le puede poner avena al batido?', '2025-11-23 15:40:00'),
(59, 158, 59, NULL, 'Mañana no podré ni caminar.', '2025-12-03 19:10:00'),
(60, 65, 60, NULL, '¿Se puede cambiar el pollo por tofu?', '2025-12-13 13:00:00'),
(61, 91, 61, NULL, 'En las fiestas es imposible mantener la dieta.', '2026-01-06 22:50:00'),
(62, 118, 62, NULL, 'El sueño de cualquier fitness lover.', '2026-01-16 16:30:00'),
(63, 192, 63, NULL, 'Te envié el formulario, espero tu respuesta.', '2026-02-06 10:20:00'),
(64, 47, 64, NULL, 'Lista para el desafío de 30 días.', '2026-02-21 07:45:00'),
(65, 18, 65, NULL, 'Gran review, me convenciste de comprarlo.', '2025-03-19 14:30:00'),
(66, 215, 66, NULL, '¿Esos switches son Brown o Blue?', '2025-03-29 11:15:00'),
(67, 131, 67, NULL, 'El diagrama está súper claro, gracias.', '2025-04-09 18:20:00'),
(68, 43, 68, NULL, 'He mejorado mucho mi código con estos tips.', '2025-04-19 20:10:00'),
(69, 156, 69, NULL, '¿La Lenovo sigue siendo buena opción?', '2025-04-29 15:50:00'),
(70, 72, 70, NULL, 'Qué envidia de setup, muy limpio.', '2025-05-09 10:30:00'),
(71, 101, 71, NULL, 'El script me ahorró horas de trabajo.', '2025-05-19 12:15:00'),
(72, 219, 72, NULL, 'SQL es mi pesadilla, a ver si entiendo ahora.', '2025-05-29 21:00:00'),
(73, 14, 73, NULL, 'Miedo me da que me reemplacen por una IA.', '2025-06-09 09:45:00'),
(74, 122, 74, NULL, 'Esa GPU calienta muchísimo.', '2025-06-19 14:20:00'),
(75, 239, 75, NULL, 'Me da miedo romper los pines del procesador.', '2025-06-29 11:30:00'),
(76, 54, 76, NULL, 'Excelente explicación de los B-trees.', '2025-07-09 16:10:00'),
(77, 130, 77, NULL, 'Semana movida en el mundo tech.', '2025-07-19 19:40:00'),
(78, 162, 78, NULL, 'El panel IPS siempre gana en colores.', '2025-07-29 13:25:00'),
(79, 199, 79, NULL, 'Uso 123456 de clave, ¿estoy en riesgo? jajaja.', '2025-08-09 10:05:00'),
(80, 241, 80, NULL, 'Hacking ético es la carrera del futuro.', '2025-08-19 22:50:00'),
(81, 6, 81, NULL, '¿iPhone o Samsung para este año?', '2025-08-29 17:30:00'),
(82, 128, 82, NULL, 'Ese polvo acumulado me dio ansiedad.', '2025-09-09 08:20:00'),
(83, 175, 83, NULL, 'Docker me cambió la vida como dev.', '2025-09-19 21:15:00'),
(84, 133, 84, NULL, 'Impreso y pegado en mi pared.', '2025-09-29 12:40:00'),
(85, 211, 85, NULL, 'Teletrabajo es libertad pura.', '2025-10-09 15:55:00'),
(86, 38, 86, NULL, 'Estuve ahí, fue un gran evento.', '2025-10-19 14:10:00'),
(87, 86, 87, NULL, 'Monolito vs Microservicios, eterno debate.', '2025-10-29 11:45:00'),
(88, 147, 88, NULL, 'AWS es carísimo si no sabes configurarlo.', '2025-11-09 09:30:00'),
(89, 214, 89, NULL, 'Te entiendo, yo pasé por lo mismo.', '2025-11-19 16:20:00'),
(90, 52, 90, NULL, '¿Qué usaste para amarrar los cables?', '2025-11-29 13:00:00'),
(91, 108, 91, NULL, 'Gran invitado, muy humilde.', '2025-12-09 20:15:00'),
(92, 191, 92, NULL, 'Justo lo que necesitaba para empezar.', '2025-12-19 17:40:00'),
(93, 242, 93, NULL, 'Mi código es un desastre, no lo mires.', '2026-01-09 10:10:00'),
(94, 25, 94, NULL, 'Compacto y potente, buen setup.', '2026-01-19 12:35:00'),
(95, 112, 95, NULL, '¿En qué lenguaje está el repositorio?', '2026-02-09 14:50:00'),
(96, 237, 96, NULL, 'Gracias por el tiempo del soporte.', '2026-02-26 19:20:00'),
(97, 129, 97, NULL, 'El speedpaint se ve genial.', '2025-03-11 11:00:00'),
(98, 141, 98, NULL, '¿Qué software usaste para el boceto?', '2025-03-22 15:30:00'),
(99, 103, 99, NULL, 'La luz ambiental me cuesta mucho todavía.', '2025-04-02 09:15:00'),
(100, 159, 100, NULL, 'Las proporciones son lo más difícil.', '2025-04-13 18:40:00');



-- Insertando 100 Respuestas de Nivel 1 (idComentarioPadre vinculados a 1-100)
INSERT INTO Comentario (id, idUsuario, idPublicacion, idComentarioPadre, texto, fecha) VALUES 
(101, 1, 1, 1, '¡Muchas gracias! Me tomó horas de edición.', '2025-03-16 12:45:00'),
(102, 3, 2, 2, 'Usé una Sony A7III con un lente de 35mm.', '2025-03-26 15:20:00'),
(103, 1, 3, 3, 'Es la más eficiente para el early game.', '2025-04-06 10:15:00'),
(104, 25, 4, 4, 'Totalmente, el nerfeo al rifle fue excesivo.', '2025-04-16 21:30:00'),
(105, 1, 5, 5, '¡Gracias! Estuve practicando ese combo semanas.', '2025-04-26 19:00:00'),
(106, 12, 6, 6, '¿No crees que el Guerrero debería estar en S?', '2025-05-06 12:40:00'),
(107, 1, 7, 7, 'Espera a ver la parte 2, se pone más oscuro.', '2025-05-17 08:00:00'),
(108, 45, 8, 8, 'Sí, escríbenos al privado para las pruebas.', '2025-05-26 16:20:00'),
(109, 3, 9, 9, 'Es un GMMK Pro con switches lubricados.', '2025-06-06 14:10:00'),
(110, 80, 10, 10, '¿Sabes si habrá easter eggs en esa zona?', '2025-06-16 18:50:00'),
(111, 3, 11, 11, 'Revisa que el software del mouse esté actualizado.', '2025-06-26 20:45:00'),
(112, 55, 12, 12, '¿Cuántas horas de práctica te tomó eso?', '2025-07-06 13:30:00'),
(113, 1, 13, 13, 'Es cierto que el hype le jugó en contra.', '2025-07-16 16:00:00'),
(114, 150, 14, 14, '¡Yo también quiero conocerlo en la próxima convención!', '2025-07-26 17:15:00'),
(115, 3, 15, 15, 'Confirmado por los dataminers esta mañana.', '2025-08-06 10:00:00'),
(116, 1, 16, 16, 'En realidad se puede, pero requiere un timing perfecto.', '2025-08-16 22:45:00'),
(117, 100, 17, 17, 'Ese lag en el último segundo fue injusto.', '2025-08-26 11:20:00'),
(118, 1, 18, 18, '¡Me alegra que te guste! Queda genial en monitores 4K.', '2025-09-06 15:30:00'),
(119, 3, 19, 19, 'Está hecho puramente en C++ y Python.', '2025-09-16 12:40:00'),
(120, 205, 20, 20, '¿Vais a subir el tutorial de los skips?', '2025-09-26 23:45:00'),
(121, 1, 21, 21, 'Exacto, la dirección de arte es muy similar.', '2025-10-06 16:15:00'),
(122, 4, 22, 22, '¡Gracias! El sombreado tomó su tiempo.', '2025-10-16 10:30:00'),
(123, 3, 23, 23, 'Lamentablemente es la tendencia de las grandes empresas.', '2025-10-26 21:15:00'),
(124, 130, 24, 24, '¿Cuándo sale la segunda parte de la charla?', '2025-11-06 14:50:00'),
(125, 1, 25, 25, 'Cualquier duda que tengas, déjala aquí.', '2025-11-16 11:30:00'),
(126, 60, 26, 26, '¿Cómo hiciste para que el personaje volara así?', '2025-11-26 23:10:00'),
(127, 3, 27, 27, '¡De nada! La oclusión ambiental consume demasiado.', '2025-12-06 13:00:00'),
(128, 215, 28, 28, '¡Yo también participo! Ojalá gane.', '2025-12-16 15:45:00'),
(129, 1, 29, 29, '¡Vamos con todo este año!', '2026-01-11 11:20:00'),
(130, 188, 30, 30, 'Lit, todos somos ese gato los lunes.', '2026-01-21 22:15:00'),
(131, 3, 31, 31, 'El respeto es fundamental en el chat.', '2026-02-11 12:00:00'),
(132, 99, 32, 32, 'Dicen que sale en diciembre de este año.', '2026-03-01 09:30:00'),
(133, 2, 33, 33, 'Exacto, es solo regulación de temperatura.', '2025-03-13 10:15:00'),
(134, 42, 34, 34, '¿Cuánto tiempo le tomó lograr ese cambio?', '2025-03-23 12:40:00'),
(135, 2, 35, 35, '¡Dale con todo! Cuida mucho la técnica.', '2025-04-03 09:20:00'),
(136, 67, 36, 36, 'Prueba agregando claras de huevo a tus batidos.', '2025-04-13 16:00:00'),
(137, 2, 37, 37, 'La clave es el meal prep los domingos.', '2025-04-23 21:45:00'),
(138, 120, 38, 38, '¿Haces asesorías personalizadas?', '2025-05-03 11:30:00'),
(139, 2, 39, 39, 'No, es el suplemento con más evidencia científica.', '2025-05-13 18:00:00'),
(140, 88, 40, 40, '¿Es mejor usar zapatos planos o con tacón?', '2025-05-23 20:15:00'),
(141, 2, 41, 41, 'Revisa si estás descansando lo suficiente.', '2026-01-03 14:00:00'),
(142, 199, 42, 42, 'Aproximadamente 60-80$ semanales si compras bien.', '2026-01-13 17:20:00'),
(143, 2, 43, 43, '¡Esa es la actitud! El HIIT es brutal.', '2026-01-23 10:45:00'),
(144, 25, 44, 44, '¿Se puede usar edulcorante líquido?', '2026-02-03 22:30:00'),
(145, 2, 45, 45, 'Somos una familia, nos apoyamos entre todos.', '2026-02-13 13:15:00'),
(146, 50, 46, 46, 'El error #3 es el que más lesiona hombros.', '2026-02-23 21:00:00'),
(147, 2, 47, 47, 'Me alegra que te sirva para entrenar con ganas.', '2025-08-04 09:30:00'),
(148, 77, 48, 48, '¿Qué opinas de calentar con cardio suave?', '2025-08-13 08:20:00'),
(149, 2, 49, 49, 'Sí, pero mantén la intensidad moderada al inicio.', '2025-08-23 11:45:00'),
(150, 110, 50, 50, '¿Usas agarre mixto o normal?', '2025-09-03 19:00:00'),
(151, 2, 51, 51, 'Hazlo después de entrenar o antes de dormir.', '2025-09-13 23:15:00'),
(152, 14, 52, 52, '¿Estás en etapa de definición ahora?', '2025-09-23 12:40:00'),
(153, 2, 53, 53, '¡A por ese six pack!', '2025-10-03 20:00:00'),
(154, 11, 54, 54, 'Son unas Nike Metcon 8, las mejores para crossfit.', '2025-10-13 16:30:00'),
(155, 2, 55, 55, 'Básicamente: multiplica tu peso por 22.', '2025-10-23 13:50:00'),
(156, 140, 56, 56, 'Sí, queda en la sección de "Videos" del canal.', '2025-11-03 22:15:00'),
(157, 2, 57, 57, 'Dormir es el mejor anabólico natural.', '2025-11-13 10:45:00'),
(158, 201, 58, 58, 'Sí, harina de avena le da mucha consistencia.', '2025-11-23 17:30:00'),
(159, 2, 59, 59, '¡Esa es la meta! Sin dolor no hay gloria.', '2025-12-03 21:00:00'),
(160, 33, 60, 60, 'Totalmente, el tofu marinado es buena opción.', '2025-12-13 15:45:00'),
(161, 2, 61, 61, 'Se puede, solo aplica la regla del 80/20.', '2026-01-07 10:20:00'),
(162, 5, 62, 62, '¿Cuánto costó la jaula de potencia?', '2026-01-16 18:40:00'),
(163, 2, 63, 63, '¡Perfecto! En breve reviso tu caso.', '2026-02-06 12:30:00'),
(164, 210, 64, 64, '¡Bienvenida! Dale con todo desde el día 1.', '2026-02-21 10:15:00'),
(165, 3, 65, 65, '¡No te vas a arrepentir! Es un gran salto.', '2025-03-19 16:20:00'),
(166, 12, 66, 66, 'Son Brown, prefiero el tacto equilibrado.', '2025-03-29 13:00:00'),
(167, 3, 67, 67, 'Lo hice en LucidChart, lo recomiendo mucho.', '2025-04-09 20:15:00'),
(168, 140, 68, 68, '¿Qué opinas de los comentarios en el código?', '2025-04-19 22:40:00'),
(169, 3, 69, 69, 'Sí, pero subió un poco de precio este mes.', '2025-04-29 17:30:00'),
(170, 45, 70, 70, '¿Qué monitor usas para programar?', '2025-05-09 12:15:00'),
(171, 3, 71, 71, 'La automatización es el camino del dev senior.', '2025-05-19 14:00:00'),
(172, 89, 72, 72, '¿Vas a explicar JOINs en la parte 2?', '2025-05-29 23:45:00'),
(173, 3, 73, 73, 'Hay que adaptarse y usarla como herramienta.', '2025-06-09 11:30:00'),
(174, 15, 74, 74, 'Le puse refrigeración líquida y bajó 15 grados.', '2025-06-19 16:50:00'),
(175, 3, 75, 75, 'Tómalo con calma y no fuerces nada.', '2025-06-29 13:40:00'),
(176, 210, 76, 76, '¿Cuál es la diferencia con un árbol binario normal?', '2025-07-09 18:20:00'),
(177, 3, 77, 77, 'Vienen cosas interesantes con los nuevos M4.', '2025-07-19 21:00:00'),
(178, 115, 78, 78, '¿Crees que el 4K en 27 pulgadas vale la pena?', '2025-07-29 15:30:00'),
(179, 3, 79, 79, 'Por favor, cambia esa clave a una de 12 dígitos.', '2025-08-09 12:10:00'),
(180, 132, 80, 80, '¿Qué distro de Linux recomiendas para eso?', '2025-08-19 23:55:00'),
(181, 3, 81, 81, 'Samsung tiene mejor pantalla, Apple mejor video.', '2025-08-29 19:15:00'),
(182, 245, 82, 82, 'Dale con aire comprimido, pero sin sacudirlo.', '2025-09-09 10:45:00'),
(183, 3, 83, 83, 'El aislamiento de contenedores es otro nivel.', '2025-09-19 22:30:00'),
(184, 77, 84, 84, '¿Puedes hacer una versión para Vim?', '2025-09-29 14:15:00'),
(185, 3, 85, 85, 'Totalmente, pero hay que saber separar espacios.', '2025-10-09 17:40:00'),
(186, 180, 86, 86, 'Ojalá nos crucemos en la del año que viene.', '2025-10-19 16:00:00'),
(187, 3, 87, 87, 'Depende totalmente del tamaño del equipo dev.', '2025-10-29 13:20:00'),
(188, 222, 88, 88, 'Aprende a usar el Free Tier de AWS para practicar.', '2025-11-09 11:45:00'),
(189, 3, 89, 89, 'A veces la paz mental vale más que el sueldo.', '2025-11-19 18:30:00'),
(190, 50, 90, 90, 'Usa velcro, las amarras de plástico son eternas.', '2025-11-29 15:10:00'),
(191, 3, 91, 91, 'Tiró unos consejos de arquitectura brutales.', '2025-12-09 22:30:00'),
(192, 10, 92, 92, '¿Cuánto tiempo al día le dedicas al estudio?', '2025-12-19 19:15:00'),
(193, 3, 93, 93, 'Tranquilo, todos empezamos con código spaghetti.', '2026-01-09 12:40:00'),
(194, 166, 94, 94, '¿Es una MacBook Air o Pro?', '2026-01-19 14:05:00'),
(195, 3, 95, 95, 'Está todo en C# (dotnet 8).', '2026-02-09 16:30:00'),
(196, 240, 96, 96, '¡Para eso estamos! Cualquier duda, escribe.', '2026-02-26 21:15:00'),
(197, 4, 97, 97, '¡Gracias! Lo grabé en Procreate.', '2025-03-11 13:45:00'),
(198, 11, 98, 98, 'Empecé en Photoshop y terminé en CSP.', '2025-03-22 17:10:00'),
(199, 4, 99, 99, 'Enfócate primero en los valores antes que en el color.', '2025-04-02 11:30:00'),
(200, 68, 100, 100, 'Te recomiendo el libro de Andrew Loomis.', '2025-04-13 20:45:00');


-- Insertando 100 Respuestas de Nivel 2 (idComentarioPadre vinculados a 101-200)
-- Estas cierran los 100 hilos con 3 niveles de profundidad
INSERT INTO Comentario (id, idUsuario, idPublicacion, idComentarioPadre, texto, fecha) VALUES 
(201, 55, 1, 101, 'Se nota el esfuerzo, sigue así.', '2025-03-16 14:00:00'),
(202, 62, 2, 102, 'Esa cámara es una bestia, vale cada centavo.', '2025-03-26 16:45:00'),
(203, 78, 3, 103, 'Anotado, la probaré hoy mismo.', '2025-04-06 12:00:00'),
(204, 12, 4, 104, 'Ojalá lo arreglen en el hotfix de la otra semana.', '2025-04-16 22:15:00'),
(205, 105, 5, 105, '¿Podrías hacer un tutorial lento de esa parte?', '2025-04-26 20:30:00'),
(206, 140, 6, 106, 'Tienes razón, el Guerrero escala mejor en late game.', '2025-05-06 14:00:00'),
(207, 200, 7, 107, '¡No puedo esperar! Activaré las notificaciones.', '2025-05-17 10:15:00'),
(208, 33, 8, 108, 'Perfecto, ya envié el mensaje directo.', '2025-05-26 17:50:00'),
(209, 15, 9, 109, '¿Qué lubricante usaste? El sonido es muy "creamy".', '2025-06-06 16:30:00'),
(210, 44, 10, 110, 'Espero que sí, la zona de las cuevas se ve sospechosa.', '2025-06-16 20:00:00'),
(211, 89, 11, 111, 'Era eso, ¡ya funciona! Muchas gracias.', '2025-06-26 22:10:00'),
(212, 210, 12, 112, 'Unas 500 horas fácil, es pura memoria muscular.', '2025-07-06 15:00:00'),
(213, 115, 13, 113, 'El marketing siempre miente un poquito.', '2025-07-16 17:45:00'),
(214, 5, 14, 114, '¡Hagamos una reunión de fans ese día!', '2025-07-26 19:30:00'),
(215, 132, 15, 115, 'Vaya... entonces habrá que ahorrar para el nuevo DLC.', '2025-08-06 12:20:00'),
(216, 245, 16, 116, 'Lo intentaré de nuevo con ese consejo.', '2025-08-17 09:00:00'),
(217, 77, 17, 117, 'Confirmo, el servidor de LATAM estaba fallando hoy.', '2025-08-26 13:40:00'),
(218, 180, 18, 118, 'Pasa el link en alta calidad por Discord.', '2025-09-06 17:15:00'),
(219, 222, 19, 119, 'Python es lo mejor para scripts rápidos.', '2025-09-16 14:20:00'),
(220, 50, 20, 120, 'Sí, sale el próximo viernes sin falta.', '2025-09-27 10:00:00'),
(221, 10, 21, 121, 'Por eso me enganchó desde el minuto 1.', '2025-10-06 18:30:00'),
(222, 166, 22, 122, 'Valió la pena, te quedó muy profesional.', '2025-10-16 12:00:00'),
(223, 240, 23, 123, 'La única forma de parar esto es no comprar.', '2025-10-26 23:00:00'),
(224, 11, 24, 124, 'A finales de mes, suscríbete para no perderla.', '2025-11-06 16:45:00'),
(225, 68, 25, 125, '¿Cómo derroto al primer mini-boss?', '2025-11-16 13:20:00'),
(226, 125, 26, 126, 'Es un glitch del motor de colisiones.', '2025-11-27 08:30:00'),
(227, 39, 27, 127, 'Exacto, bajándola la GPU descansa mucho.', '2025-12-06 15:15:00'),
(228, 150, 28, 128, '¡Suerte! Los premios están increíbles.', '2025-12-16 18:00:00'),
(229, 94, 29, 129, '¿Harás stream del progreso?', '2026-01-11 14:30:00'),
(230, 2, 30, 130, 'Hay que reír por no llorar, colega.', '2026-01-21 23:45:00'),
(231, 88, 31, 131, 'Baneen a los que no cumplan.', '2026-02-11 14:20:00'),
(232, 230, 32, 132, 'Estaré atento a la preventa entonces.', '2026-03-01 11:10:00'),
(233, 41, 33, 133, 'Increíble que todavía haya gente vendiendo fajas.', '2025-03-13 12:45:00'),
(234, 19, 34, 134, 'Fueron 12 semanas de constancia pura.', '2025-03-23 14:00:00'),
(235, 121, 35, 135, '¿Puedo cambiar las estocadas por prensa?', '2025-04-03 11:30:00'),
(236, 155, 36, 136, 'Es difícil al principio, pero te acostumbras.', '2025-04-13 18:20:00'),
(237, 249, 37, 137, 'La organización es el 80% del éxito.', '2025-04-23 23:00:00'),
(238, 70, 38, 138, 'Sí, escríbeme al mail que está en mi perfil.', '2025-05-03 13:45:00'),
(239, 110, 39, 139, '¿Hay alguna marca específica que recomiendes?', '2025-05-13 20:10:00'),
(240, 201, 40, 140, 'Plano siempre, para mayor estabilidad.', '2025-05-23 22:30:00'),
(241, 56, 41, 141, 'Intenta bajar un poco el peso y mejorar el rango.', '2026-01-03 16:15:00'),
(242, 13, 42, 142, 'Vale la pena la inversión por la salud.', '2026-01-13 19:30:00'),
(243, 99, 43, 143, '¡Ese es el espíritu! Sigue dándolo todo.', '2026-01-23 12:45:00'),
(244, 188, 44, 144, 'Sí, stevia o eritritol funcionan perfecto.', '2026-02-03 23:50:00'),
(245, 234, 45, 145, 'Es la mejor comunidad fitness de la plataforma.', '2026-02-13 15:20:00'),
(246, 102, 46, 146, 'Yo me lesioné así el año pasado, cuidado.', '2026-02-23 23:00:00'),
(247, 49, 47, 147, 'Escucharlo mientras entreno me da un plus.', '2025-08-04 11:30:00'),
(248, 144, 48, 148, 'Sirve para subir temperatura, pero no estira fibras.', '2025-08-13 10:45:00'),
(249, 212, 49, 149, 'Gracias, mañana pruebo el ayuno.', '2025-08-23 13:20:00'),
(250, 31, 50, 150, 'Agarre mixto para cuando el peso es muy alto.', '2025-09-03 21:00:00'),
(251, 160, 51, 151, '¿Cuántos segundos mantengo cada postura?', '2025-09-14 08:30:00'),
(252, 23, 52, 152, 'Sí, faltan 4 semanas para las fotos.', '2025-09-23 14:50:00'),
(253, 109, 53, 153, 'No te rindas, los resultados llegarán.', '2025-10-03 22:15:00'),
(254, 142, 54, 154, 'Gracias, las buscaré en la tienda oficial.', '2025-10-13 18:30:00'),
(255, 177, 55, 155, 'Es la fórmula más exacta que existe.', '2025-10-23 15:45:00'),
(256, 126, 56, 156, 'Lo veré de nuevo, me perdí la mitad.', '2025-11-03 23:50:00'),
(257, 134, 57, 157, 'Ese es un error grave para la recuperación.', '2025-11-13 12:30:00'),
(258, 22, 58, 158, 'O crema de maní, queda brutal.', '2025-11-23 19:15:00'),
(259, 158, 59, 159, '¡A darle! Mañana descanso.', '2025-12-03 23:30:00'),
(260, 65, 60, 160, 'Lo probaré este martes, gracias por el tip.', '2025-12-13 17:40:00'),
(261, 91, 61, 161, 'Yo uso el 80/20 y me va genial.', '2026-01-07 12:45:00'),
(262, 118, 62, 162, 'Unos 1500$ con el envío incluido.', '2026-01-16 20:30:00'),
(263, 192, 63, 163, 'Genial, estaré pendiente de mi bandeja.', '2026-02-06 14:50:00'),
(264, 47, 64, 164, '¡Vamos equipo, sí se puede!', '2026-02-21 12:30:00'),
(265, 18, 65, 165, '¿Qué tal va de batería el nuevo modelo?', '2025-03-19 18:15:00'),
(266, 215, 66, 166, 'Los Brown son los más cómodos para tipear.', '2025-03-29 15:30:00'),
(267, 131, 67, 167, '¿Es gratuito o de suscripción?', '2025-04-09 22:45:00'),
(268, 43, 68, 168, 'Son necesarios en lógica muy compleja.', '2025-04-20 09:15:00'),
(269, 156, 69, 169, 'En Amazon siempre hay ofertas cada mes.', '2025-04-29 19:40:00'),
(270, 72, 70, 170, 'Uso dos Dell 4K de 27 pulgadas.', '2025-05-09 14:30:00'),
(271, 101, 71, 171, 'Totalmente, menos tiempo en tareas repetitivas.', '2025-05-19 16:50:00'),
(272, 219, 72, 172, 'Sí, los JOINs son el corazón de SQL.', '2025-05-30 08:30:00'),
(273, 14, 73, 173, 'Exacto, quien la domine tendrá ventaja.', '2025-06-09 13:15:00'),
(274, 122, 74, 174, 'Mejoró mucho el ruido de los ventiladores.', '2025-06-19 18:40:00'),
(275, 239, 75, 175, 'Usa una pulsera antiestática por si acaso.', '2025-06-29 15:50:00'),
(276, 54, 76, 176, 'El B-tree está balanceado automáticamente.', '2025-07-09 20:30:00'),
(277, 130, 77, 177, 'Ojalá no suban tanto el precio base.', '2025-07-19 23:15:00'),
(278, 162, 78, 178, 'Para diseño gráfico es obligatorio.', '2025-07-29 17:40:00'),
(279, 199, 79, 179, 'Usa un gestor de contraseñas como Bitwarden.', '2025-08-09 14:15:00'),
(280, 241, 80, 180, 'Kali Linux es la estándar en el rubro.', '2025-08-20 09:30:00'),
(281, 6, 81, 181, 'Samsung para zoom, Apple para redes sociales.', '2025-08-29 21:00:00'),
(282, 128, 82, 182, 'Sin sacudirlo para no generar estática.', '2025-09-09 12:45:00'),
(283, 175, 83, 183, 'Adiós al "en mi máquina si funciona".', '2025-09-19 23:50:00'),
(284, 133, 84, 184, 'Vim es otro mundo, haré una pronto.', '2025-09-29 16:30:00'),
(285, 211, 85, 185, 'Yo uso la técnica pomodoro en casa.', '2025-10-09 19:15:00'),
(286, 38, 86, 186, 'El próximo año nos tomamos una foto.', '2025-10-19 18:40:00'),
(287, 86, 87, 187, 'Para startups, el monolito es más rápido.', '2025-10-29 15:30:00'),
(288, 147, 88, 188, 'Cuidado con las instancias que dejas abiertas.', '2025-11-09 13:50:00'),
(289, 214, 89, 189, 'Al final encontré algo mucho mejor.', '2025-11-19 20:30:00'),
(290, 52, 90, 190, 'El velcro es la clave del éxito visual.', '2025-11-29 17:15:00'),
(291, 108, 91, 191, 'Deberías traerlo de nuevo el próximo mes.', '2025-12-09 23:55:00'),
(292, 191, 92, 192, 'Le dedico unas 4 horas de estudio intenso.', '2025-12-19 21:40:00'),
(293, 242, 93, 193, 'Aprende sobre patrones de diseño, ayuda mucho.', '2026-01-09 14:20:00'),
(294, 166, 94, 194, 'Es una MacBook Pro con chip M3.', '2026-01-19 16:50:00'),
(295, 112, 95, 195, 'Dotnet es muy sólido para backend.', '2026-02-09 18:30:00'),
(296, 237, 96, 196, 'Estaré atento a tus correos.', '2026-02-26 23:10:00'),
(297, 129, 97, 197, '¿Qué modelo de iPad usas?', '2025-03-11 15:30:00'),
(298, 141, 98, 198, 'CSP es superior para entintado definitivamente.', '2025-03-22 19:15:00'),
(299, 4, 99, 199, 'Eso me cambió la perspectiva totalmente.', '2025-04-02 13:40:00'),
(300, 68, 100, 200, 'Es la biblia de la anatomía, gracias.', '2025-04-13 22:55:00');

--------------- bloques de comentarios raiz sin anidaciones total 700---------------------

-- Comentarios para publicaciones de Arte y Música (IDs 101 - 160)
INSERT INTO Comentario (id, idUsuario, idPublicacion, idComentarioPadre, texto, fecha) VALUES 
(301, 24, 101, NULL, 'El manejo del color es simplemente sublime.', '2025-04-24 10:00:00'),
(302, 142, 102, NULL, '¿Qué tableta recomiendas para empezar?', '2025-05-05 15:30:00'),
(303, 8, 103, NULL, 'Este tutorial de sombreado me salvó la vida.', '2025-05-16 09:20:00'),
(304, 215, 105, NULL, 'Me encantan los detalles de la textura.', '2025-06-07 20:15:00'),
(305, 33, 106, NULL, 'Increíble fanart, capturaste su esencia.', '2025-06-18 11:40:00'),
(306, 90, 109, NULL, 'A veces el bloqueo es lo más frustrante, gracias.', '2025-07-21 18:00:00'),
(307, 12, 113, NULL, 'Dibujar con la zurda es un reto de locos.', '2025-09-03 14:10:00'),
(308, 199, 114, NULL, 'Cyber City se ve tan vivo, gran trabajo.', '2025-09-14 22:05:00'),
(309, 56, 117, NULL, 'La sensibilidad de esa tableta se nota mucho.', '2025-10-17 13:50:00'),
(310, 222, 118, NULL, 'Esos sketches rápidos tienen mucha fuerza.', '2025-10-28 08:30:00'),
(311, 45, 122, NULL, 'La evolución es impresionante en solo un año.', '2025-12-11 19:45:00'),
(312, 131, 125, NULL, 'Me identifico mucho con tus inicios.', '2026-01-14 10:20:00'),
(313, 10, 129, NULL, 'Ese solo de guitarra fue épico.', '2025-03-12 16:00:00'),
(314, 88, 130, NULL, 'Qué estudio tan acogedor tienes ahora.', '2025-03-23 11:15:00'),
(315, 205, 133, NULL, 'Hacer un tema en 10 min es talento puro.', '2025-04-25 14:30:00'),
(316, 67, 134, NULL, 'Esa Gibson es mi guitarra soñada.', '2025-05-06 18:40:00'),
(317, 155, 138, NULL, 'La energía de ese show se siente en la foto.', '2025-06-19 23:10:00'),
(318, 23, 142, NULL, '¿Qué pedal usas para ese delay tan limpio?', '2025-08-02 09:55:00'),
(319, 110, 145, NULL, 'Esa colaboración me tomó por sorpresa, ¡brutal!', '2025-09-04 12:20:00'),
(320, 14, 149, NULL, 'Me sirvieron mucho tus respuestas sobre mezcla.', '2025-10-18 20:35:00'),
(321, 180, 153, NULL, 'La industria es dura, gracias por la honestidad.', '2025-12-01 15:50:00'),
(322, 5, 158, NULL, 'Ese setlist promete ser el mejor de la gira.', '2026-01-26 17:00:00'),

-- Comentarios para publicaciones de Cocina (IDs 161 - 192)
(323, 128, 161, NULL, 'La hice anoche y quedó espectacular.', '2025-03-13 14:00:00'),
(324, 43, 162, NULL, 'La presentación digna de una estrella Michelin.', '2025-03-24 20:30:00'),
(325, 219, 165, NULL, 'Increíble lo que hiciste con tan poco dinero.', '2025-04-26 13:10:00'),
(326, 72, 166, NULL, 'Esos cuchillos se ven peligrosamente afilados.', '2025-05-07 10:45:00'),
(327, 147, 169, NULL, 'Lista de básicos anotada para el súper.', '2025-06-09 11:20:00'),
(328, 156, 170, NULL, 'Se me hizo agua la boca con ese asado.', '2025-06-20 15:55:00'),
(329, 38, 173, NULL, '¡El truco de la cebolla realmente funciona!', '2025-07-23 09:30:00'),
(330, 241, 174, NULL, 'Nada como cocinar con hierbas frescas propias.', '2025-08-03 18:15:00'),
(331, 6, 177, NULL, 'Postres sin horno son mis favoritos por siempre.', '2025-09-05 16:40:00'),
(332, 112, 178, NULL, 'Esa tarta de chocolate se ve muy esponjosa.', '2025-09-16 21:00:00'),
(333, 237, 181, NULL, '¿Dónde venden esos tacos? Se ven 10/10.', '2025-10-19 12:25:00'),
(334, 18, 182, NULL, 'El mejor desayuno para empezar el lunes.', '2025-10-30 08:45:00'),
(335, 133, 185, NULL, 'Tener piedras de afilar cambió mi cocina.', '2025-12-02 14:10:00'),
(336, 108, 186, NULL, 'La paella tiene un color increíble.', '2025-12-13 19:30:00'),
(337, 211, 189, NULL, 'Completamente de acuerdo, puros trastes estorbando.', '2026-01-16 11:50:00'),
(338, 175, 190, NULL, 'Esa organización de ingredientes me da paz.', '2026-01-27 15:00:00'),

-- Comentarios para Vlogs y Educación (IDs 193 - 256)
(339, 52, 193, NULL, 'Qué bonitas son las calles de esa ciudad.', '2025-03-15 10:20:00'),
(340, 166, 194, NULL, 'Te ves genial, el estilo te queda perfecto.', '2025-03-25 13:45:00'),
(341, 86, 197, NULL, 'Amo tus vlogs de domingo, son muy relajantes.', '2025-04-25 21:10:00'),
(342, 242, 198, NULL, 'Qué vista tan privilegiada tienes.', '2025-05-05 07:30:00'),
(343, 15, 201, NULL, 'No me esperaba lo de la fobia a las aves.', '2025-06-05 18:15:00'),
(344, 25, 202, NULL, 'La calidad de imagen de esa cámara es top.', '2025-06-15 12:40:00'),
(345, 112, 205, NULL, 'Espero que cumplas todos tus planes este año.', '2025-07-15 09:00:00'),
(346, 191, 206, NULL, 'Pobre Max, tiene cara de "yo no fui".', '2025-07-25 14:50:00'),
(347, 47, 209, NULL, 'Yo no aguantaría ni 2 horas sin el móvil.', '2025-08-25 11:30:00'),
(348, 101, 210, NULL, 'Buen viaje, disfruta mucho de Europa.', '2025-09-05 16:20:00'),
(349, 214, 213, NULL, 'Esa comida se ve un poco cuestionable jaja.', '2025-10-05 19:40:00'),
(350, 39, 214, NULL, 'Qué suerte los que pudieron conocerte.', '2025-10-15 15:10:00'),
(351, 150, 217, NULL, 'Necesito esa disciplina para levantarme temprano.', '2025-11-15 06:45:00'),
(352, 94, 218, NULL, 'El cambio del cuarto es radical, buen gusto.', '2025-11-25 22:15:00'),
(353, 2, 221, NULL, 'Anotando las apps para mis propios videos.', '2026-01-09 13:00:00'),
(354, 18, 225, NULL, 'Por fin entendí las leyes de Newton, gracias.', '2025-03-17 11:45:00'),
(355, 215, 226, NULL, 'Infografía perfecta para estudiar rápido.', '2025-03-27 09:30:00'),
(356, 131, 229, NULL, 'Mis apuntes son un desastre comparados con los tuyos.', '2025-04-27 15:55:00'),
(357, 43, 230, NULL, 'Historia se me hacía difícil hasta este esquema.', '2025-05-07 18:20:00'),
(358, 156, 233, NULL, 'El método Pomodoro realmente cambia el juego.', '2025-06-07 10:10:00'),
(359, 72, 234, NULL, 'Qué ordenado tienes todo, ayuda a concentrarse.', '2025-06-17 14:40:00'),
(360, 101, 237, NULL, 'Sapiens es un libro que todos deberían leer.', '2025-07-17 21:30:00'),
(361, 219, 238, NULL, 'La tabla periódica más bonita que he visto.', '2025-07-27 12:15:00'),
(362, 14, 241, NULL, 'Python es el mejor lenguaje para empezar hoy.', '2025-08-27 19:50:00'),
(363, 122, 242, NULL, 'Lógica de programación explicada fácil.', '2025-09-07 11:20:00'),
(364, 239, 245, NULL, 'Excelente video explicativo, muy conciso.', '2025-10-07 15:45:00'),
(365, 54, 246, NULL, '¡Muchas felicidades por ese título!', '2025-10-17 17:30:00'),
(366, 130, 249, NULL, 'Notion es mi cerebro secundario ahora.', '2025-11-17 08:55:00'),
(367, 162, 250, NULL, 'Me descargué la plantilla, está increíble.', '2025-11-27 20:05:00'),
(368, 199, 253, NULL, 'Esos apuntes de la facultad son oro puro.', '2026-01-13 13:40:00'),
(369, 241, 254, NULL, 'El mapa conceptual me ayudó mucho para el parcial.', '2026-01-23 18:25:00'),

-- Comentarios para ASMR y Comedia (IDs 257 - 320)
(370, 6, 257, NULL, 'Los sonidos de madera son mis favoritos.', '2025-03-19 23:45:00'),
(371, 128, 258, NULL, 'Ese micrófono se ve súper profesional.', '2025-03-29 14:10:00'),
(372, 175, 261, NULL, 'El roleplay me dejó dormido en 5 minutos.', '2025-04-29 22:50:00'),
(373, 133, 262, NULL, 'Qué paz transmite ese set con las luces.', '2025-05-09 20:15:00'),
(374, 211, 265, NULL, 'El sonido de teclado mecánico es adictivo.', '2025-06-09 09:30:00'),
(375, 38, 266, NULL, 'Me encantan los props que usas.', '2025-06-19 11:55:00'),
(376, 86, 269, NULL, 'No sabía que bajaba tanto el ritmo cardíaco.', '2025-07-19 15:20:00'),
(377, 147, 270, NULL, 'Esas velas huelen a gloria, las compré.', '2025-07-29 18:00:00'),
(378, 222, 273, NULL, 'El tapping en vidrio es puro hormigueo.', '2025-08-29 23:10:00'),
(379, 10, 274, NULL, 'El avatar te quedó súper tierno.', '2025-09-09 12:45:00'),
(380, 50, 277, NULL, 'Los susurros inaudibles son mis preferidos.', '2025-10-09 21:30:00'),
(381, 108, 278, NULL, 'Vaya colección de cepillos tienes.', '2025-10-19 14:05:00'),
(382, 191, 281, NULL, 'Buenos consejos para mejorar el sueño.', '2025-11-19 22:50:00'),
(383, 242, 282, NULL, 'La visualización de ondas es muy hipnótica.', '2025-11-29 08:15:00'),
(384, 25, 285, NULL, 'Gracias por compartir tu rutina de relax.', '2026-01-15 20:40:00'),
(385, 112, 286, NULL, 'Esperando con ansias ese nuevo video.', '2026-01-25 11:20:00'),
(386, 129, 289, NULL, 'Literalmente yo cada lunes a las 7 AM.', '2025-03-13 15:30:00'),
(387, 141, 290, NULL, 'Jajaja el mejor meme de la semana.', '2025-03-23 21:10:00'),
(388, 103, 293, NULL, 'Qué valor hay que tener para subirte ahí.', '2025-04-23 10:45:00'),
(389, 159, 294, NULL, 'Se ve que estaba a tope el teatro, felicidades.', '2025-05-03 12:00:00'),
(390, 55, 297, NULL, 'Esa imitación de la villana fue perfecta.', '2025-06-03 19:20:00'),
(391, 62, 298, NULL, 'Qué gran detalle del fan, está muy parecido.', '2025-06-13 08:40:00'),
(392, 78, 301, NULL, 'La risa es la mejor medicina, gran reflexión.', '2025-07-13 14:55:00'),
(393, 12, 302, NULL, 'Qué reunión de cracks hay ahí.', '2025-07-23 16:30:00'),
(394, 105, 305, NULL, 'Yo soy el amigo que se queda dormido.', '2025-08-23 20:10:00'),
(395, 140, 306, NULL, 'Tu cara lo dice todo, buenísimo.', '2025-09-03 09:20:00'),
(396, 200, 309, NULL, 'Superbad es una obra maestra de la comedia.', '2025-10-03 13:45:00'),
(397, 33, 310, NULL, 'Ese outfit tiene mucho flow.', '2025-10-13 15:20:00'),
(398, 15, 313, NULL, 'Lo de la cuenta me pasa siempre, dolió.', '2025-11-13 11:30:00'),
(399, 44, 314, NULL, 'Se nota que lo disfrutaste mucho.', '2025-11-23 22:15:00'),
(400, 89, 317, NULL, 'Casi me muero de risa con la historia de la cita.', '2026-01-06 18:40:00'),

-- Comentarios para Moda y Viajes (IDs 321 - 384)
(401, 210, 321, NULL, 'Necesito todo ese haul en mi clóset.', '2025-03-15 16:20:00'),
(402, 115, 322, NULL, 'Ese look es un 10 de 10.', '2025-03-25 12:30:00'),
(403, 5, 325, NULL, 'Los neutros son vida, combinan con todo.', '2025-04-25 09:15:00'),
(404, 132, 326, NULL, 'Ese tono de rojo te queda increíble.', '2025-05-05 18:45:00'),
(405, 245, 329, NULL, 'Qué buenos hallazgos en la tienda de descuento.', '2025-06-05 21:20:00'),
(406, 77, 330, NULL, 'Amo los accesorios, le dan el toque final.', '2025-06-15 11:30:00'),
(407, 180, 333, NULL, 'Yo cometía ese error, gracias por el tip.', '2025-07-15 14:00:00'),
(408, 222, 334, NULL, 'Uñas preciosas, me haré ese diseño.', '2025-07-25 10:25:00'),
(409, 50, 337, NULL, 'Peinados salvavidas para cuando hay poco tiempo.', '2025-08-25 08:40:00'),
(410, 10, 338, NULL, 'Esa paleta tiene una pigmentación brutal.', '2025-09-05 15:50:00'),
(411, 166, 341, NULL, 'La moda sustentable es el camino correcto.', '2025-10-05 12:15:00'),
(412, 240, 342, NULL, 'Esa colección de perfumes es mi sueño.', '2025-10-15 20:30:00'),
(413, 11, 345, NULL, 'Amo el estilo de los 90s, te quedó igual.', '2025-11-15 19:10:00'),
(414, 68, 346, NULL, 'Qué bonito significado tienen tus tatuajes.', '2025-11-25 11:45:00'),
(415, 125, 349, NULL, 'Reto superado, yo tardo una hora mínimo.', '2026-01-09 14:30:00'),
(416, 39, 350, NULL, 'Yo llevo la mitad de cosas y ya pesa mucho.', '2026-01-19 16:50:00'),
(417, 150, 353, NULL, 'Margarita nunca deja de ser mágica.', '2025-03-17 18:20:00'),
(418, 94, 354, NULL, 'Esa foto parece de National Geographic.', '2025-03-27 20:10:00'),
(419, 2, 357, NULL, 'El tip de enrollar la ropa me salvó el viaje.', '2025-04-27 10:55:00'),
(420, 88, 358, NULL, 'Qué envidia (de la buena) esos sellos.', '2025-05-07 14:40:00'),
(421, 230, 361, NULL, 'Esa comida se ve deliciosa, ¿es picante?', '2025-06-07 22:15:00'),
(422, 41, 362, NULL, 'Qué paisaje tan imponente, increíble.', '2025-06-17 08:30:00'),
(423, 19, 365, NULL, 'Google Maps a veces es el enemigo.', '2025-07-17 19:10:00'),
(424, 121, 366, NULL, 'Buen equipo de fotografía llevas.', '2025-07-27 11:45:00'),
(425, 155, 369, NULL, 'Hay que tener mucha garra para ese clima.', '2025-08-27 23:30:00'),
(426, 249, 370, NULL, 'La gente local siempre hace el viaje mejor.', '2025-09-07 13:00:00'),
(427, 70, 373, NULL, 'Anotando todo para el próximo verano.', '2025-10-07 10:20:00'),
(428, 110, 374, NULL, 'La pizza italiana no tiene comparación.', '2025-10-17 21:55:00'),
(429, 201, 377, NULL, 'Bogotá tiene una vibra genial, buen video.', '2025-11-17 12:40:00'),
(430, 56, 378, NULL, 'Citymapper es obligatorio en las ciudades.', '2025-11-27 15:15:00'),
(431, 13, 381, NULL, 'En el transporte público pasan las mejores historias.', '2026-01-13 19:40:00'),
(432, 99, 382, NULL, 'Espero el vlog de ese nuevo destino.', '2026-01-23 09:30:00'),

-- Comentarios adicionales para completar 150
(433, 11, 15, NULL, 'Las filtraciones casi siempre aciertan, a esperar.', '2025-08-07 10:15:00'),
(434, 45, 16, NULL, 'Ese combo lo hace un coreano en 2 segundos.', '2025-08-18 11:30:00'),
(435, 78, 21, NULL, 'Lo compraré hoy mismo por Steam.', '2025-10-07 16:50:00'),
(436, 102, 22, NULL, 'Esos detalles de la armadura son finos.', '2025-10-17 11:00:00'),
(437, 210, 23, NULL, 'Nadie nos obliga, pero nos ganan por el FOMO.', '2025-10-27 22:15:00'),
(438, 55, 33, NULL, 'La desinformación en el fitness es brutal.', '2025-03-14 09:40:00'),
(439, 13, 34, NULL, 'Motivación nivel 100 con ese post.', '2025-03-24 12:20:00'),
(440, 18, 65, NULL, 'Intel o AMD? Esa es la duda ahora.', '2025-03-20 15:45:00'),
(441, 140, 66, NULL, 'El sonido de los switches mecánicos es zen.', '2025-03-30 11:20:00'),
(442, 222, 67, NULL, 'Limpia mucho la mente ver el proceso así.', '2025-04-10 19:05:00'),
(443, 33, 73, NULL, 'La IA es una ayuda, no una sustitución.', '2025-06-10 10:30:00'),
(444, 150, 74, NULL, 'Qué locura de benchmarks sacaste.', '2025-06-20 16:45:00'),
(445, 50, 85, NULL, 'Trabajar remoto es el sueño de todo programador.', '2025-10-10 17:30:00'),
(446, 25, 96, NULL, 'Me resolviste un bug que llevaba días, gracias.', '2026-02-27 14:15:00'),
(447, 60, 163, NULL, 'Mi masa madre murió al tercer día, ayuda.', '2025-04-05 09:10:00'),
(448, 12, 164, NULL, 'Esa técnica de picado es hipnótica.', '2025-04-16 11:55:00'),
(449, 115, 321, NULL, 'Me encantó el vestido verde esmeralda.', '2025-03-16 18:20:00'),
(450, 8, 353, NULL, 'Quiero ir a Margarita el próximo año sí o sí.', '2025-03-18 20:15:00');


-- Comentarios para publicaciones de Finanzas y Deportes (IDs 385 - 448)
INSERT INTO Comentario (id, idUsuario, idPublicacion, idComentarioPadre, texto, fecha) VALUES 
(451, 14, 385, NULL, '¿Crees que las tasas bajen el próximo trimestre?', '2025-03-14 11:00:00'),
(452, 122, 386, NULL, 'Impactante ver cómo ha subido todo en 10 años.', '2025-03-24 15:30:00'),
(453, 54, 389, NULL, 'Mi peor error fue sacar un crédito para un viaje.', '2025-04-24 09:20:00'),
(454, 130, 390, NULL, 'Notion es genial, pero Excel sigue siendo el rey.', '2025-05-04 20:15:00'),
(455, 162, 393, NULL, 'Gracias por democratizar las inversiones.', '2025-06-04 11:40:00'),
(456, 199, 394, NULL, 'Nunca usen más del 30% de su línea de crédito.', '2025-06-14 18:00:00'),
(457, 241, 397, NULL, 'Prefiero meterlo en un ETF y olvidarme.', '2025-07-14 14:10:00'),
(458, 6, 398, NULL, 'El mapa mental está súper claro para explicarlo en casa.', '2025-07-24 22:05:00'),
(459, 128, 401, NULL, 'Semana roja para las criptos, a aguantar.', '2025-08-24 13:50:00'),
(460, 175, 405, NULL, 'Los gastos hormiga me estaban matando el sueldo.', '2025-10-04 08:30:00'),
(461, 133, 409, NULL, 'Inspirador ver que se puede salir del pozo.', '2025-11-14 19:45:00'),
(462, 211, 410, NULL, 'Por fin entiendo qué es el interés compuesto.', '2025-11-24 10:20:00'),
(463, 38, 413, NULL, 'Empezando el reto de ahorro hoy mismo.', '2026-01-10 16:00:00'),
(464, 86, 417, NULL, 'El Madrid siempre sobrevive en Champions.', '2025-03-16 11:15:00'),
(465, 147, 418, NULL, 'Esas estadísticas explican por qué perdieron.', '2025-03-26 14:30:00'),
(466, 222, 421, NULL, 'Para mí el MVP es Vinicius, sin dudas.', '2025-04-26 18:40:00'),
(467, 10, 422, NULL, 'Falta un lateral izquierdo en ese once ideal.', '2025-05-06 23:10:00'),
(468, 50, 425, NULL, 'Qué desperdicio de dinero en ese fichaje.', '2025-06-06 09:55:00'),
(469, 108, 426, NULL, 'Bolt es de otro planeta, nadie lo alcanzará.', '2025-06-16 12:20:00'),
(470, 191, 429, NULL, 'Me encanta la sección de historia deportiva.', '2025-07-16 20:35:00'),
(471, 242, 430, NULL, 'Ese estadio es un templo, ¡qué envidia!', '2025-07-26 15:50:00'),
(472, 25, 433, NULL, 'El ambiente de la final fue eléctrico.', '2025-08-26 17:00:00'),
(473, 112, 434, NULL, 'La camiseta de los 90 tenía mucho más estilo.', '2025-09-06 14:00:00'),
(474, 129, 437, NULL, 'Si no cambian al DT, no vamos a ningún lado.', '2025-10-06 20:30:00'),
(475, 141, 438, NULL, 'El tercer gol es pura poesía visual.', '2025-10-16 13:10:00'),
(476, 103, 441, NULL, 'No sabía que el cricket fuera tan complejo.', '2025-11-16 10:45:00'),
(477, 159, 442, NULL, 'El deporte hoy es puro marketing y finanzas.', '2025-11-26 11:20:00'),
(478, 55, 445, NULL, 'Gran documental, no conocía a esa leyenda.', '2026-01-07 15:55:00'),
(479, 62, 446, NULL, 'Gracias, ahora sí entiendo qué pasa en el SuperBowl.', '2026-01-17 11:20:00'),

-- Comentarios para Cine y Literatura (IDs 449 - 512)
(480, 78, 449, NULL, 'Coincido, la película empieza lenta pero remonta.', '2025-03-18 09:30:00'),
(481, 12, 450, NULL, 'Tu versión del póster es mil veces mejor.', '2025-03-28 12:45:00'),
(482, 105, 453, NULL, 'Ese actor no pega nada con el personaje.', '2025-04-28 14:00:00'),
(483, 140, 454, NULL, 'Me perdí con tanto viaje en el tiempo.', '2025-05-08 11:30:00'),
(484, 200, 457, NULL, 'Coherence es una joya que pocos conocen.', '2025-06-08 18:20:00'),
(485, 33, 458, NULL, 'Qué elegancia, te ves increíble en la gala.', '2025-06-18 23:00:00'),
(486, 15, 461, NULL, 'Se merece el Oscar solo por esa escena.', '2025-07-18 13:45:00'),
(487, 44, 462, NULL, 'A veces el CGI arruina la inmersión.', '2025-07-28 20:10:00'),
(488, 89, 465, NULL, 'El terror psicológico es el que más asusta.', '2025-08-28 22:30:00'),
(489, 210, 466, NULL, 'Yo todavía guardo el de Avengers: Endgame.', '2025-09-08 16:15:00'),
(490, 115, 469, NULL, 'Esa serie coreana es adictiva, la vi en un día.', '2025-10-08 19:30:00'),
(491, 5, 470, NULL, 'El 3D fue una moda pasajera y molesta.', '2025-10-18 12:45:00'),
(492, 132, 473, NULL, 'Robo total en la categoría de mejor guion.', '2025-11-18 23:50:00'),
(493, 245, 474, NULL, 'Un buen villano siempre tiene una razón lógica.', '2025-11-28 15:20:00'),
(494, 77, 477, NULL, 'El cine indie tiene mucha más libertad creativa.', '2026-01-14 23:00:00'),
(495, 180, 478, NULL, 'Ahorrando para esos parlantes que mostraste.', '2026-01-24 11:30:00'),
(496, 222, 481, NULL, 'Leer a los clásicos te abre mucho la mente.', '2025-03-14 10:45:00'),
(497, 50, 482, NULL, 'Ordenada por colores... el sueño de todo lector.', '2025-03-24 13:20:00'),
(498, 10, 485, NULL, 'Me convenciste, lo compro esta tarde.', '2025-04-24 11:45:00'),
(499, 166, 486, NULL, 'García Márquez es insuperable para mí.', '2025-05-04 08:30:00'),
(500, 240, 489, NULL, 'Amo el olor de las librerías antiguas.', '2025-06-04 19:10:00'),
(501, 11, 490, NULL, '¿Dónde conseguiste ese marcapáginas?', '2025-06-14 12:40:00'),
(502, 68, 493, NULL, 'Escribir es un acto de resistencia, ánimo.', '2025-07-14 15:50:00'),
(503, 125, 494, NULL, 'La portada transmite mucho misterio.', '2025-07-24 17:30:00'),
(504, 39, 497, NULL, 'Me pasó lo mismo con ese libro, muy denso.', '2025-08-24 21:00:00'),
(505, 150, 498, NULL, 'Ese collage describe perfecto al protagonista.', '2025-09-04 10:20:00'),
(506, 94, 501, NULL, 'Sanderson escribe a una velocidad inhumana.', '2025-10-04 20:30:00'),
(507, 2, 502, NULL, 'Los unboxing de libros son mi debilidad.', '2025-10-14 14:50:00'),
(508, 88, 505, NULL, 'El libro siempre suele ser mejor, por el detalle.', '2025-11-14 12:30:00'),
(509, 230, 506, NULL, '30 páginas al día son casi 40 libros al año.', '2025-11-24 22:15:00'),
(510, 41, 509, NULL, 'Mis metas son leer al menos un clásico al mes.', '2026-01-07 10:20:00'),
(511, 19, 510, NULL, 'Esa frase de Tolkien es mi favorita.', '2026-01-17 18:40:00'),

-- Comentarios para Manualidades y Política (IDs 513 - 576)
(512, 121, 513, NULL, 'Qué buen cambio le diste a ese mueble.', '2025-03-16 12:30:00'),
(513, 155, 514, NULL, 'La madera nogal queda elegante con todo.', '2025-03-26 14:50:00'),
(514, 249, 517, NULL, 'No sabía la diferencia entre pino y abeto.', '2025-04-26 11:20:00'),
(515, 70, 518, NULL, 'El tapizado parece hecho por un profesional.', '2025-05-06 15:30:00'),
(516, 110, 521, NULL, 'Yo siempre chorreaba la pintura, buen consejo.', '2025-06-06 17:15:00'),
(517, 201, 522, NULL, 'Nada como pinceles nuevos para motivarse.', '2025-06-16 09:40:00'),
(518, 56, 525, NULL, 'Taller ordenado, mente ordenada.', '2025-07-16 12:20:00'),
(519, 13, 526, NULL, 'Ese moodboard me dio una idea para mi cuarto.', '2025-07-26 19:15:00'),
(520, 99, 529, NULL, 'Me encanta cómo quedó la iluminación LED.', '2025-08-26 14:20:00'),
(521, 18, 530, NULL, 'Soldar es un arte que requiere mucha paciencia.', '2025-09-06 16:30:00'),
(522, 140, 533, NULL, 'Los palets son vida para los que ahorramos.', '2025-10-06 10:10:00'),
(523, 222, 534, NULL, 'Cuidado con los dedos al usar esa sierra.', '2025-10-16 22:30:00'),
(524, 33, 537, NULL, '¿En serio hiciste eso en 10 minutos? Wow.', '2025-11-16 13:50:00'),
(525, 150, 538, NULL, 'Aceitar las herramientas les da años de vida.', '2025-11-26 08:15:00'),
(526, 50, 541, NULL, 'Mi lugar feliz es la ferretería también.', '2026-01-10 11:45:00'),
(527, 25, 542, NULL, 'Gracias por responder las dudas técnicas.', '2026-01-20 20:30:00'),
(528, 60, 545, NULL, 'El mejor resumen de noticias que he visto.', '2025-03-18 12:30:00'),
(529, 12, 546, NULL, 'Qué fuerte ese titular, no lo había leído.', '2025-03-28 14:50:00'),
(530, 115, 549, NULL, 'Excelente columna, muy objetiva.', '2025-04-28 11:20:00'),
(531, 8, 550, NULL, 'La abstención es el problema real.', '2025-05-08 15:30:00'),
(532, 142, 553, NULL, 'Todo está conectado globalmente, qué miedo.', '2025-06-08 17:15:00'),
(533, 215, 554, NULL, 'El mapa aclara muchas dudas geopolíticas.', '2025-06-18 09:40:00'),
(534, 33, 557, NULL, 'La libertad de prensa está en juego.', '2025-07-18 12:20:00'),
(535, 90, 558, NULL, 'Esa caricatura define perfecto al ministro.', '2025-07-28 19:15:00'),
(536, 12, 561, NULL, 'Hacía falta que alguien desmintiera eso.', '2025-08-28 14:20:00'),
(537, 199, 562, NULL, 'Te vi en la tele, gran cobertura.', '2025-09-08 16:30:00'),
(538, 56, 565, NULL, 'La historia se repite si no la conocemos.', '2025-10-08 10:10:00'),
(539, 222, 566, NULL, 'La gente en la calle tiene opiniones muy variadas.', '2025-10-18 22:30:00'),
(540, 45, 569, NULL, 'Se viene un trimestre económicamente duro.', '2025-11-18 13:50:00'),
(541, 131, 570, NULL, 'Me sirvió para la clase de instrucción premilitar.', '2025-11-28 08:15:00'),
(542, 10, 573, NULL, 'Ojalá el 2026 sea mejor para el país.', '2026-01-14 11:45:00'),
(543, 88, 574, NULL, 'Recomiendo también el de Animal Farm.', '2026-01-24 20:30:00'),

-- Comentarios para Mascotas (IDs 577 - 608)
(544, 205, 577, NULL, '¡Qué ternura! Bienvenido a la familia.', '2025-03-16 12:30:00'),
(545, 67, 578, NULL, 'Dormir es su actividad favorita, seguro.', '2025-03-26 14:50:00'),
(546, 155, 581, NULL, 'A mi cachorro le pasa igual cuando me voy.', '2025-04-26 11:20:00'),
(547, 23, 582, NULL, 'Esa pelota es indestructible, la recomiendo.', '2025-05-06 15:30:00'),
(548, 110, 585, NULL, 'Amo ver a los perros socializando así.', '2025-06-06 17:15:00'),
(549, 14, 586, NULL, 'Qué hermosa foto de familia.', '2025-06-16 09:40:00'),
(550, 180, 589, NULL, 'Mi gato es mi terapia diaria.', '2025-07-16 12:20:00'),
(551, 5, 590, NULL, 'Parece otro perro después del spa.', '2025-07-26 19:15:00'),
(552, 128, 593, NULL, '¿Dónde compraste esos snacks naturales?', '2025-08-26 14:20:00'),
(553, 43, 594, NULL, 'Max se ve muy guapo con su suéter.', '2025-09-06 16:30:00'),
(554, 219, 597, NULL, 'La arena de sílice es la mejor inversión.', '2025-10-06 10:10:00'),
(555, 72, 598, NULL, '¡Qué inteligente es! Aprendió rápido.', '2025-10-16 22:30:00'),
(556, 147, 601, NULL, 'Gracias por rescatarlo, el mundo necesita más así.', '2025-11-16 13:50:00'),
(557, 156, 602, NULL, 'Prefiero el arnés de pecho para pasear.', '2025-11-26 08:15:00'),
(558, 38, 605, NULL, '¡Feliz cumple Max! Queremos pastel perruno.', '2026-01-10 11:45:00'),
(559, 241, 606, NULL, 'Respondiste justo lo que quería saber.', '2026-01-20 20:30:00'),

-- Rellenando hasta el 600 con comentarios variados para cerrar volumen
(560, 45, 1, NULL, 'Me suscribí después de ver este video.', '2025-03-17 14:00:00'),
(561, 88, 2, NULL, 'Increíble iluminación.', '2025-03-27 15:00:00'),
(562, 130, 3, NULL, 'Necesitaba este tip de farmeo.', '2025-04-07 10:00:00'),
(563, 214, 4, NULL, 'Buffeen el arma, por favor.', '2025-04-17 21:00:00'),
(564, 52, 5, NULL, 'Jugada de nivel profesional.', '2025-04-27 19:30:00'),
(565, 12, 6, NULL, 'De acuerdo con la posición de la maga.', '2025-05-07 12:45:00'),
(566, 101, 7, NULL, 'Esa cinemática es de película.', '2025-05-18 09:10:00'),
(567, 192, 8, NULL, '¡Qué buena coordinación!', '2025-05-27 16:55:00'),
(568, 18, 9, NULL, 'Suena como mantequilla, hermoso.', '2025-06-07 14:20:00'),
(569, 215, 10, NULL, 'Deseando explorar esa cueva.', '2025-06-17 18:35:00'),
(570, 131, 11, NULL, 'Listo, configuración aplicada.', '2025-06-27 20:50:00'),
(571, 43, 12, NULL, 'Manos de acero tienes.', '2025-07-07 13:10:00'),
(572, 156, 13, NULL, 'Salió con muchos bugs, lamentable.', '2025-07-17 17:40:00'),
(573, 72, 14, NULL, 'Se ve muy humilde en persona.', '2025-07-27 21:15:00'),
(574, 101, 15, NULL, 'Ojalá la filtración sea real.', '2025-08-07 09:40:00'),
(575, 219, 16, NULL, 'Mañana lo intento sin falta.', '2025-08-17 22:55:00'),
(576, 14, 17, NULL, 'A todos nos ha pasado eso alguna vez.', '2025-08-27 11:20:00'),
(577, 122, 18, NULL, 'El mejor fondo que has subido.', '2025-09-07 15:45:00'),
(578, 239, 19, NULL, 'Sigue subiendo el devlog.', '2025-09-17 12:30:00'),
(579, 54, 20, NULL, 'Esquivaste el frame perfecto.', '2025-09-27 23:50:00'),
(580, 130, 21, NULL, 'La banda sonora es de 10.', '2025-10-07 16:05:00'),
(581, 162, 22, NULL, 'Dibujas demasiado bien.', '2025-10-17 10:50:00'),
(582, 199, 23, NULL, 'No más pre-ventas este año.', '2025-10-27 21:15:00'),
(583, 241, 24, NULL, '¡Trae a más gente de la industria!', '2025-11-07 14:30:00'),
(584, 6, 25, NULL, 'No paso del nivel 2 todavía.', '2025-11-17 11:00:00'),
(585, 128, 26, NULL, 'Parece un fallo de texturas.', '2025-11-27 23:45:00'),
(586, 43, 27, NULL, 'Mi PC respira ahora.', '2025-12-07 12:20:00'),
(587, 219, 28, NULL, '¡Ojalá me toque a mí!', '2025-12-17 15:55:00'),
(588, 72, 29, NULL, 'Vamos a por ese diamante este año.', '2026-01-12 10:40:00'),
(589, 147, 30, NULL, 'Jajaja qué bueno está.', '2026-01-22 22:50:00'),
(590, 156, 31, NULL, '¡Aceptado! Seguiremos las reglas.', '2026-02-12 11:15:00'),
(591, 38, 32, NULL, 'El hype está por las nubes.', '2026-03-01 10:55:00'),
(592, 241, 33, NULL, 'Ya decía yo que era mentira.', '2025-03-14 09:20:00'),
(593, 6, 34, NULL, 'Se le nota mucho más feliz ahora.', '2025-03-24 13:40:00'),
(594, 112, 35, NULL, 'Buen entrenamiento de pierna.', '2025-04-04 08:50:00'),
(595, 237, 36, NULL, 'Subiendo carbohidratos desde hoy.', '2025-04-14 15:10:00'),
(596, 18, 37, NULL, 'Esa ensalada se ve rica.', '2025-04-24 21:55:00'),
(597, 133, 38, NULL, 'Admirable la disciplina.', '2025-05-04 11:30:00'),
(598, 108, 39, NULL, 'Interesante, no sabía eso.', '2025-05-14 17:25:00'),
(599, 211, 40, NULL, 'Mejoraré mi postura.', '2025-05-24 19:40:00'),
(600, 175, 41, NULL, '¡Gracias por el ánimo!', '2026-01-04 13:15:00');


-- Comentarios para publicaciones de Astrología y Cosplay (IDs 609 - 672)
INSERT INTO Comentario (id, idUsuario, idPublicacion, idComentarioPadre, texto, fecha) VALUES 
(601, 20, 609, NULL, 'Mi luna en Escorpio lo confirma todo.', '2025-03-14 10:00:00'),
(602, 142, 610, NULL, 'Con razón se me rompió el teléfono hoy.', '2025-03-24 15:30:00'),
(603, 5, 613, NULL, 'Esperando con ansias la guía de este mes.', '2025-04-24 09:20:00'),
(604, 130, 614, NULL, 'Qué energía tan bonita transmite tu altar.', '2025-05-04 20:15:00'),
(605, 162, 617, NULL, 'Por fin entiendo qué es la casa 12.', '2025-06-04 11:40:00'),
(606, 199, 618, NULL, 'Necesito ese cuarzo rosa en mi vida.', '2025-06-14 18:00:00'),
(607, 241, 621, NULL, 'Sagitario y Leo son dinamita pura.', '2025-07-14 14:10:00'),
(608, 6, 625, NULL, 'Esa tienda parece sacada de una película.', '2025-08-24 22:05:00'),
(609, 128, 629, NULL, 'Siento el eclipse desde ya, qué intensidad.', '2025-10-04 13:50:00'),
(610, 175, 633, NULL, 'No me esperaba que ese actor fuera Virgo.', '2025-11-14 08:30:00'),
(611, 133, 637, NULL, 'Decretando un 2026 lleno de abundancia.', '2026-01-07 19:45:00'),
(612, 211, 641, NULL, 'Esa armadura te está quedando increíble.', '2025-03-18 10:20:00'),
(613, 38, 642, NULL, '¡Te vi en la convención! El traje es 10/10.', '2025-03-28 16:00:00'),
(614, 86, 645, NULL, 'Qué buen truco para ahorrar en materiales.', '2025-04-28 11:15:00'),
(615, 147, 646, NULL, 'Esas orejas de elfa se ven súper reales.', '2025-05-08 14:30:00'),
(616, 222, 649, NULL, 'Qué ganas de ir a un evento así.', '2025-06-08 18:40:00'),
(617, 10, 650, NULL, 'El acabado de la pintura es profesional.', '2025-06-18 23:10:00'),
(618, 50, 653, NULL, 'Gracias, mi peluca siempre se resbalaba.', '2025-07-18 09:55:00'),
(619, 108, 657, NULL, 'Esa transición fue mágina, gran edit.', '2025-08-28 12:20:00'),
(620, 191, 661, NULL, 'Ni caso a los haters, tu arte es genial.', '2025-10-08 20:35:00'),
(621, 242, 665, NULL, 'Definitivamente haré esa espada de espuma.', '2025-11-18 15:50:00'),
(622, 25, 669, NULL, 'Todos tenemos un inicio humilde, gran cambio.', '2026-01-14 17:00:00'),

-- Comentarios para Modelaje, Anime y Manga (IDs 673 - 736)
(623, 112, 673, NULL, 'Esa locación en la playa es perfecta.', '2025-03-14 11:00:00'),
(624, 129, 674, NULL, 'El blanco y negro le da mucha fuerza.', '2025-03-24 15:30:00'),
(625, 141, 677, NULL, 'Anotando los tips de pose para mis fotos.', '2025-04-24 09:20:00'),
(626, 103, 678, NULL, 'Eres hermosa incluso sin maquillaje.', '2025-05-04 20:15:00'),
(627, 159, 681, NULL, 'Qué envidia de viaje, se ve hermoso.', '2025-06-04 11:40:00'),
(628, 55, 682, NULL, 'Amo ese estilo urbano, te queda genial.', '2025-06-14 18:00:00'),
(629, 62, 685, NULL, 'La Sony A7III nunca falla para retrato.', '2025-07-14 14:10:00'),
(630, 78, 689, NULL, 'Ese conjunto verde es mi favorito.', '2025-08-24 22:05:00'),
(631, 12, 690, NULL, 'Qué atardecer tan espectacular.', '2025-09-04 13:50:00'),
(632, 105, 693, NULL, 'La constancia en el entrenamiento se nota.', '2025-10-04 08:30:00'),
(633, 140, 697, NULL, 'Tienes más ropa que una tienda, jaja.', '2025-11-14 19:45:00'),
(634, 200, 701, NULL, 'Gracias a ti por este año de contenido.', '2026-01-07 10:20:00'),
(635, 33, 705, NULL, 'Verte dibujar es súper relajante.', '2025-03-16 11:15:00'),
(636, 15, 706, NULL, 'Ese lineart es demasiado limpio, envidia.', '2025-03-26 14:30:00'),
(637, 44, 709, NULL, 'Totalmente de acuerdo con la reseña.', '2025-04-26 18:40:00'),
(638, 89, 710, NULL, 'Yo tengo la misma tableta, es genial.', '2025-05-06 23:10:00'),
(639, 210, 713, NULL, 'Estaba dudando cuál comprar, gracias.', '2025-06-06 09:55:00'),
(640, 115, 715, NULL, 'Las expresiones son lo que más me cuesta.', '2025-06-16 12:20:00'),
(641, 5, 717, NULL, 'Es una pena que censuren tanto el arte.', '2025-07-16 20:35:00'),
(642, 132, 721, NULL, 'Ojalá algún día pueda ir a un evento así.', '2025-08-26 15:50:00'),
(643, 245, 722, NULL, 'Ya pedí mis llaveros, qué ganas de que lleguen.', '2025-09-06 17:00:00'),
(644, 77, 725, NULL, 'Vagabond es arte puro en cada página.', '2025-10-06 14:00:00'),
(645, 180, 729, NULL, 'Reto extremo, pero te salió muy bien.', '2025-11-16 20:30:00'),
(646, 222, 733, NULL, 'Felicidades por todo lo que has crecido.', '2026-01-10 13:10:00'),

-- Comentarios para Podcasts y Gaming NSFW (IDs 737 - 800)
(647, 50, 737, NULL, 'Temazo el de hoy, muy necesario hablarlo.', '2025-03-18 10:45:00'),
(648, 10, 738, NULL, 'Esos micros son calidad de estudio profesional.', '2025-03-28 11:20:00'),
(649, 166, 741, NULL, 'Comunicación es la base de todo, gran consejo.', '2025-04-28 15:45:00'),
(650, 240, 742, NULL, '¡No puede ser! ¿Es quien yo creo que es?', '2025-05-08 08:30:00'),
(651, 11, 745, NULL, 'Casi escupo el café con esa anécdota.', '2025-06-08 19:10:00'),
(652, 68, 749, NULL, 'Hacía falta un podcast tan honesto como este.', '2025-07-18 12:40:00'),
(653, 125, 753, NULL, 'La experta aclaró muchísimas dudas hoy.', '2025-08-28 15:50:00'),
(654, 39, 757, NULL, 'Me pasó algo parecido en una primera cita.', '2025-10-08 17:30:00'),
(655, 150, 761, NULL, 'Qué oficinas tan modernas, felicidades.', '2025-11-18 21:00:00'),
(656, 94, 765, NULL, 'El especial de navidad fue lo mejor del año.', '2026-01-14 10:20:00'),
(657, 2, 769, NULL, 'Skyrim con mods es un juego infinito.', '2025-03-20 13:20:00'),
(658, 88, 770, NULL, 'Parece un juego de nueva generación.', '2025-03-30 14:50:00'),
(659, 230, 773, NULL, 'Con esa PC corres hasta la NASA.', '2025-04-30 21:00:00'),
(660, 41, 774, NULL, 'Tengo esos mismos audífonos, son 10/10.', '2025-05-10 22:15:00'),
(661, 19, 777, NULL, 'Casi me da un infarto con ese scream.', '2025-06-10 08:30:00'),
(662, 121, 781, NULL, 'La historia oculta es mejor que la principal.', '2025-07-20 19:10:00'),
(663, 155, 782, NULL, 'Los bugs de este juego son oro puro.', '2025-07-30 11:45:00'),
(664, 249, 785, NULL, '¿Es cómodo jugar con una sola mano?', '2025-08-30 23:30:00'),
(665, 70, 789, NULL, 'La censura a veces no tiene sentido.', '2025-10-10 13:00:00'),
(666, 110, 790, NULL, 'El directo de hoy fue legendario, gracias.', '2025-10-20 10:20:00'),
(667, 201, 793, NULL, 'Me sirvió mucho para configurar mi propio OBS.', '2025-11-20 21:55:00'),
(668, 56, 797, NULL, 'Coincido con el puesto número 1 del top.', '2026-01-17 12:40:00'),

-- Rellenando volumen variado para cerrar el bloque (IDs 669 - 750)
(669, 13, 65, NULL, '¡Lo quiero ya! Qué buen análisis.', '2025-03-22 19:40:00'),
(670, 99, 66, NULL, 'El teclado se ve precioso con ese RGB.', '2025-04-01 09:30:00'),
(671, 11, 70, NULL, 'Inspiración pura para mi oficina.', '2025-05-11 18:20:00'),
(672, 45, 75, NULL, 'A ver si por fin me armo mi propia PC.', '2025-07-01 11:30:00'),
(673, 78, 80, NULL, 'Ética ante todo, gran video.', '2025-08-21 16:50:00'),
(674, 102, 83, NULL, 'Docker es un camino de ida.', '2025-09-21 11:00:00'),
(675, 210, 84, NULL, 'Guardado en favoritos, súper útil.', '2025-10-01 22:15:00'),
(676, 55, 90, NULL, 'Satisfacción visual nivel máximo.', '2025-12-01 09:40:00'),
(677, 13, 94, NULL, 'Ideal para nómadas digitales.', '2026-01-21 12:20:00'),
(678, 18, 101, NULL, 'Me encanta el proceso, se ve tan fácil.', '2025-04-26 15:45:00'),
(679, 140, 110, NULL, 'El fondo te quedó increíble.', '2025-08-01 11:20:00'),
(680, 222, 114, NULL, 'Qué atmósfera lograste crear.', '2025-09-15 19:05:00'),
(681, 33, 130, NULL, 'Quiero grabar algo ahí algún día.', '2025-03-25 10:30:00'),
(682, 150, 134, NULL, 'La colección sigue creciendo.', '2025-05-08 16:45:00'),
(683, 50, 142, NULL, 'Pedalera de un pro.', '2025-08-03 17:30:00'),
(684, 25, 161, NULL, 'El pesto es vida.', '2025-03-15 14:15:00'),
(685, 60, 162, NULL, 'Parece de restaurante caro.', '2025-03-25 09:10:00'),
(686, 12, 166, NULL, 'Esos cuchillos cortan hasta el aire.', '2025-05-08 11:55:00'),
(687, 115, 170, NULL, 'Pásame un poco, por favor.', '2025-06-21 18:20:00'),
(688, 8, 182, NULL, 'Desayuno de campeones.', '2025-10-31 20:15:00'),
(689, 21, 193, NULL, 'Qué ganas de viajar ahora.', '2025-03-16 10:20:00'),
(690, 75, 194, NULL, 'Amo esas botas.', '2025-03-26 13:45:00'),
(691, 134, 197, NULL, 'Tus domingos se ven geniales.', '2025-04-26 21:10:00'),
(692, 189, 198, NULL, 'Pura paz.', '2025-05-06 07:30:00'),
(693, 204, 201, NULL, 'No me lo creo lo de las aves, jaja.', '2025-06-06 18:15:00'),
(694, 15, 202, NULL, 'Graba increíble esa cámara.', '2025-06-16 12:40:00'),
(695, 245, 205, NULL, 'A por todas este año.', '2025-07-16 09:00:00'),
(696, 66, 206, NULL, 'Qué travieso es.', '2025-07-26 14:50:00'),
(697, 81, 209, NULL, 'Reto difícil de cumplir.', '2025-08-26 11:30:00'),
(698, 110, 210, NULL, 'Disfruta el viaje.', '2025-09-06 16:20:00'),
(699, 156, 213, NULL, 'La comida callejera es un riesgo que tomo.', '2025-10-06 19:40:00'),
(700, 23, 214, NULL, 'Qué lindo momento.', '2025-10-16 15:10:00'),
(701, 142, 217, NULL, 'Yo también madrugo.', '2025-11-16 06:45:00'),
(702, 198, 218, NULL, 'Qué cambio.', '2025-11-26 22:15:00'),
(703, 31, 221, NULL, 'Anotado.', '2026-01-10 13:00:00'),
(704, 55, 225, NULL, 'Física fácil.', '2025-03-18 11:45:00'),
(705, 122, 226, NULL, 'Súper útil.', '2025-03-28 09:30:00'),
(706, 204, 229, NULL, 'Orden total.', '2025-04-28 15:55:00'),
(707, 7, 230, NULL, 'Gran esquema.', '2025-05-08 18:20:00'),
(708, 48, 233, NULL, 'Pomodoro manda.', '2025-06-08 10:10:00'),
(709, 92, 234, NULL, 'Concentración pura.', '2025-06-18 14:40:00'),
(710, 119, 237, NULL, 'Libro de cabecera.', '2025-07-18 21:30:00'),
(711, 160, 238, NULL, 'Preciosa tabla.', '2025-07-28 12:15:00'),
(712, 14, 241, NULL, 'Python power.', '2025-08-28 19:50:00'),
(713, 177, 242, NULL, 'Lógica clara.', '2025-09-08 11:20:00'),
(714, 23, 245, NULL, 'Buen video.', '2025-10-08 15:45:00'),
(715, 88, 246, NULL, 'Bravo.', '2025-10-18 17:30:00'),
(716, 134, 249, NULL, 'Notion lover.', '2025-11-18 08:55:00'),
(717, 192, 250, NULL, 'Bajada.', '2025-11-28 20:05:00'),
(718, 5, 253, NULL, 'Orita pura.', '2026-01-14 13:40:00'),
(719, 67, 254, NULL, 'Me sirve.', '2026-01-24 18:25:00'),
(720, 155, 257, NULL, 'Qué paz.', '2025-03-20 23:45:00'),
(721, 210, 258, NULL, 'Pro total.', '2025-03-30 14:10:00'),
(722, 115, 261, NULL, 'Zzz...', '2025-04-30 22:50:00'),
(723, 33, 262, NULL, 'Set soñado.', '2025-05-10 20:15:00'),
(724, 14, 265, NULL, 'Click click.', '2025-06-10 09:30:00'),
(725, 180, 266, NULL, 'Me gustan.', '2025-06-20 11:55:00'),
(726, 245, 269, NULL, 'Dato curioso.', '2025-07-20 15:20:00'),
(727, 77, 270, NULL, 'Huelen rico.', '2025-07-30 18:00:00'),
(728, 50, 273, NULL, 'Tingles.', '2025-08-30 23:10:00'),
(729, 10, 274, NULL, 'Tierno.', '2025-09-10 12:45:00'),
(730, 222, 277, NULL, 'Relajante.', '2025-10-10 21:30:00'),
(731, 166, 278, NULL, 'Vaya cepillos.', '2025-10-20 14:05:00'),
(732, 240, 281, NULL, 'Dormir bien.', '2025-11-20 22:50:00'),
(733, 11, 282, NULL, 'Hipotético.', '2025-11-30 08:15:00'),
(734, 68, 285, NULL, 'Desconexión.', '2026-01-16 20:40:00'),
(735, 125, 286, NULL, 'Esperándolo.', '2026-01-26 11:20:00'),
(736, 39, 289, NULL, 'Tal cual.', '2025-03-14 15:30:00'),
(737, 150, 290, NULL, 'Jaja.', '2025-03-24 21:10:00'),
(738, 94, 293, NULL, 'Qué nervios.', '2025-04-24 10:45:00'),
(739, 2, 294, NULL, 'Lleno total.', '2025-05-04 12:00:00'),
(740, 88, 297, NULL, 'Clavada.', '2025-06-04 19:20:00'),
(741, 230, 298, NULL, 'Parecido.', '2025-06-14 08:40:00'),
(742, 41, 301, NULL, 'Risa pura.', '2025-07-14 14:55:00'),
(743, 19, 302, NULL, 'Cracks.', '2025-07-24 16:30:00'),
(744, 121, 305, NULL, 'Ese soy yo.', '2025-08-24 20:10:00'),
(745, 155, 306, NULL, 'Épico.', '2025-09-04 09:20:00'),
(746, 249, 309, NULL, 'Clásico.', '2025-10-04 13:45:00'),
(747, 70, 310, NULL, 'Flow.', '2025-10-14 15:20:00'),
(748, 110, 313, NULL, 'Me pasó.', '2025-11-14 11:30:00'),
(749, 201, 314, NULL, 'Disfrute.', '2025-11-24 22:15:00'),
(750, 56, 317, NULL, 'Mucha risa.', '2026-01-07 18:40:00');

-- Distribución variada entre publicaciones 401 a 800
INSERT INTO Comentario (id, idUsuario, idPublicacion, idComentarioPadre, texto, fecha) VALUES 
(751, 13, 401, NULL, 'El análisis técnico fue muy preciso hoy.', '2025-08-25 10:00:00'),
(752, 99, 402, NULL, 'Esa silla ergonómica se ve muy cómoda.', '2025-09-02 15:30:00'),
(753, 11, 405, NULL, 'Cambié el café de afuera por el de casa, ¡gran ahorro!', '2025-10-02 09:20:00'),
(754, 45, 406, NULL, 'Gracias por la entrevista, despejó mis dudas.', '2025-10-12 20:15:00'),
(755, 78, 409, NULL, 'Tu historia me motivó a empezar a ahorrar.', '2025-11-12 11:40:00'),
(756, 102, 410, NULL, 'Este glosario es oro para los que estamos empezando.', '2025-11-22 18:00:00'),
(757, 210, 413, NULL, 'Día 5 del reto y todavía sigo firme.', '2026-01-10 14:10:00'),
(758, 55, 414, NULL, 'Justo tengo una reunión de sueldo el lunes, deséame suerte.', '2026-01-18 22:05:00'),
(759, 13, 417, NULL, 'El resumen me sirvió para ponerme al día.', '2025-03-14 13:50:00'),
(760, 18, 418, NULL, '¡Qué locura de estadísticas!', '2025-03-24 08:30:00'),
(761, 140, 421, NULL, 'Para mí el MVP sigue siendo el portero.', '2025-04-24 19:45:00'),
(762, 222, 422, NULL, 'Formación arriesgada pero efectiva.', '2025-05-04 10:20:00'),
(763, 33, 425, NULL, 'Esa inversión fue un error total del club.', '2025-06-04 16:00:00'),
(764, 150, 426, NULL, 'Correr a esa velocidad es de otro planeta.', '2025-06-14 21:10:00'),
(765, 50, 429, NULL, 'No sabía ese dato del mundial del 30.', '2025-07-14 15:45:00'),
(766, 25, 430, NULL, 'Estar ahí en persona debe ser increíble.', '2025-07-24 11:20:00'),
(767, 60, 433, NULL, 'El vlog capturó toda la emoción.', '2025-08-24 17:30:00'),
(768, 12, 434, NULL, 'Las de antes tenían mejores diseños.', '2025-09-04 14:50:00'),
(769, 115, 437, NULL, 'Necesitan fichar a un delantero urgente.', '2025-10-04 10:20:00'),
(770, 8, 438, NULL, '¡Qué golazo! Se la puso en el ángulo.', '2025-10-14 22:15:00'),
(771, 21, 441, NULL, 'Reglas extrañas pero divertidas.', '2025-11-14 08:30:00'),
(772, 75, 442, NULL, 'El dinero lo está arruinando todo.', '2025-11-24 11:45:00'),
(773, 134, 445, NULL, 'Documental 10/10, muy bien narrado.', '2026-01-06 19:10:00'),
(774, 189, 446, NULL, 'Por fin entiendo por qué se detienen tanto.', '2026-01-15 09:30:00'),
(775, 204, 449, NULL, 'La iré a ver este fin de semana.', '2025-03-17 18:20:00'),
(776, 15, 450, NULL, 'Me gusta más tu paleta de colores.', '2025-03-26 12:40:00'),
(777, 245, 453, NULL, 'Espero que los rumores sean ciertos.', '2025-04-26 16:15:00'),
(778, 66, 454, NULL, 'Esa línea de tiempo me salvó la vida.', '2025-05-06 13:45:00'),
(779, 81, 457, NULL, 'Películas infravaloradas de verdad.', '2025-06-06 09:00:00'),
(780, 110, 458, NULL, '¡Qué buen look para la alfombra!', '2025-06-16 23:30:00'),
(781, 156, 461, NULL, 'Su actuación fue lo mejor de la cinta.', '2025-07-16 19:10:00'),
(782, 23, 462, NULL, 'El CGI a veces distrae mucho.', '2025-07-26 15:55:00'),
(783, 142, 465, NULL, 'Terror de calidad, me asusté varias veces.', '2025-08-26 21:15:00'),
(784, 198, 466, NULL, 'Yo también guardo mis boletos.', '2025-09-06 12:20:00'),
(785, 31, 469, NULL, 'La serie me enganchó desde el primer capítulo.', '2025-10-06 18:40:00'),
(786, 55, 470, NULL, 'El 3D me daba dolor de cabeza.', '2025-10-16 11:30:00'),
(787, 122, 473, NULL, 'Injusto que no ganara mejor director.', '2025-11-16 22:50:00'),
(788, 204, 474, NULL, 'Ese villano tiene mucha profundidad.', '2025-11-26 14:15:00'),
(789, 7, 477, NULL, 'Cine indie > Blockbusters.', '2026-01-13 10:20:00'),
(790, 48, 478, NULL, 'Necesito ese equipo de sonido.', '2026-01-22 17:30:00'),
(791, 92, 481, NULL, 'Siempre es buen momento para los clásicos.', '2025-03-12 21:10:00'),
(792, 119, 482, NULL, 'Estantería soñada.', '2025-03-22 13:45:00'),
(793, 160, 485, NULL, 'Gracias por la reseña, lo leeré.', '2025-04-22 11:20:00'),
(794, 14, 486, NULL, 'Infografía muy completa sobre los autores.', '2025-05-02 08:50:00'),
(795, 177, 489, NULL, 'Amo perderme en las librerías.', '2025-06-02 20:30:00'),
(796, 23, 490, NULL, 'Ese marcapáginas es precioso.', '2025-06-12 15:45:00'),
(797, 88, 493, NULL, 'El bloqueo creativo es frustrante.', '2025-07-12 10:10:00'),
(798, 134, 494, NULL, '¡Qué portada tan misteriosa!', '2025-07-22 22:40:00'),
(799, 192, 497, NULL, 'Me pasó lo mismo con ese libro.', '2025-08-22 12:30:00'),
(800, 5, 498, NULL, 'El collage define muy bien la vibra.', '2025-09-02 18:25:00'),
(801, 67, 501, NULL, 'Sanderson nunca decepciona.', '2025-10-02 14:10:00'),
(802, 155, 502, NULL, '¡Cuántos libros! Qué envidia.', '2025-10-12 09:20:00'),
(803, 210, 505, NULL, 'Casi siempre prefiero el libro.', '2025-11-12 21:50:00'),
(804, 115, 506, NULL, 'Intentaré esa rutina de lectura.', '2025-11-22 13:40:00'),
(805, 33, 509, NULL, 'Vamos por esos objetivos literarios.', '2026-01-06 10:15:00'),
(806, 14, 510, NULL, 'Tolkien es eterno.', '2026-01-15 19:30:00'),
(807, 180, 513, NULL, 'El mueble parece otro, qué cambio.', '2025-03-14 22:50:00'),
(808, 245, 514, NULL, 'Me encanta el tono de la madera.', '2025-03-24 14:10:00'),
(809, 77, 517, NULL, 'No conocía esa diferencia, gracias.', '2025-04-24 11:30:00'),
(810, 50, 518, NULL, 'Tapizado impecable.', '2025-05-04 15:45:00'),
(811, 10, 521, NULL, 'Ese tip de pintura me salvó.', '2025-06-04 09:20:00'),
(812, 222, 522, NULL, 'Pinceles nuevos = Felicidad.', '2025-06-14 17:15:00'),
(813, 166, 525, NULL, 'Mi taller es un caos comparado con el tuyo.', '2025-07-14 13:00:00'),
(814, 240, 526, NULL, 'Amo los moodboards de inspiración.', '2025-07-24 19:40:00'),
(815, 11, 529, NULL, 'La lámpara LED quedó de lujo.', '2025-08-24 23:10:00'),
(816, 68, 530, NULL, 'Soldar da mucha paz.', '2025-09-04 12:45:00'),
(817, 125, 533, NULL, 'Proyectos económicos y bonitos.', '2025-10-04 21:30:00'),
(818, 39, 534, NULL, 'Con cuidado con esa sierra.', '2025-10-14 14:05:00'),
(819, 150, 537, NULL, '¡Reto superado con creces!', '2025-11-14 22:50:00'),
(820, 94, 538, NULL, 'Aceitar herramientas es vital.', '2025-11-24 08:15:00'),
(821, 2, 541, NULL, 'La ferretería es mi Disneyland.', '2026-01-09 20:40:00'),
(822, 88, 542, NULL, 'Gracias por la ayuda técnica.', '2026-01-19 11:20:00'),
(823, 230, 545, NULL, 'Información clara y al punto.', '2025-03-16 15:30:00'),
(824, 41, 546, NULL, 'Fuerte ese titular de hoy.', '2025-03-26 21:10:00'),
(825, 19, 549, NULL, 'Excelente reflexión sobre la polarización.', '2025-04-26 10:45:00'),
(826, 121, 550, NULL, 'Datos que duelen pero son necesarios.', '2025-05-06 12:00:00'),
(827, 155, 553, NULL, 'La economía global está muy inestable.', '2025-06-06 19:20:00'),
(828, 249, 554, NULL, 'Ese mapa lo explica todo.', '2025-06-16 08:40:00'),
(829, 70, 557, NULL, 'La narrativa está cambiando rápido.', '2025-07-16 14:55:00'),
(830, 110, 558, NULL, 'Jajaja la caricatura es perfecta.', '2025-07-26 16:30:00'),
(831, 201, 561, NULL, 'Muy bueno el desmentido.', '2025-08-26 20:10:00'),
(832, 56, 562, NULL, 'Gran trabajo de campo.', '2025-09-06 09:20:00'),
(833, 13, 565, NULL, 'La historia nos enseña mucho.', '2025-10-06 13:45:00'),
(834, 99, 566, NULL, 'Opiniones para todos los gustos.', '2025-10-16 15:20:00'),
(835, 11, 569, NULL, 'Trimestre complicado el que viene.', '2025-11-16 11:30:00'),
(836, 45, 570, NULL, 'Me sirvió mucho para entender los términos.', '2025-11-26 22:15:00'),
(837, 78, 573, NULL, 'Ojalá el 26 sea mejor.', '2026-01-13 18:40:00'),
(838, 102, 574, NULL, 'Ese libro es básico.', '2026-01-23 20:15:00'),
(839, 210, 577, NULL, 'Max es precioso.', '2025-03-15 12:30:00'),
(840, 55, 578, NULL, 'Esa cara de sueño...', '2025-03-25 14:50:00'),
(841, 13, 581, NULL, 'A mi cachorro le sirvieron los tips.', '2025-04-25 11:20:00'),
(842, 18, 582, NULL, 'Ese juguete es genial.', '2025-05-05 15:30:00'),
(843, 140, 585, NULL, 'Los vlogs de Max son mis favoritos.', '2025-06-05 17:15:00'),
(844, 222, 586, NULL, 'Bonita familia.', '2025-06-15 09:40:00'),
(845, 33, 589, NULL, 'Los gatos son lo mejor.', '2025-07-15 12:20:00'),
(846, 150, 590, NULL, 'Qué limpio quedó.', '2025-07-25 19:15:00'),
(847, 50, 593, NULL, 'Le gustaron mucho los snacks.', '2025-08-25 14:20:00'),
(848, 25, 594, NULL, 'Le queda muy bien el rojo.', '2025-09-05 16:30:00'),
(849, 60, 597, NULL, 'Gracias por la recomendación de arena.', '2025-10-05 10:10:00'),
(850, 12, 598, NULL, 'Max es muy listo.', '2025-10-15 22:30:00'),
(851, 115, 601, NULL, 'Qué lindo gesto rescatarlo.', '2025-11-15 13:50:00'),
(852, 8, 602, NULL, 'Prefiero arnés también.', '2025-11-25 08:15:00'),
(853, 21, 605, NULL, '¡Felicidades al cumpleañero!', '2026-01-09 11:45:00'),
(854, 75, 606, NULL, 'Duda resuelta.', '2026-01-19 20:30:00'),
(855, 134, 609, NULL, 'Tal cual mi carta astral.', '2025-03-13 10:00:00'),
(856, 189, 610, NULL, 'Odio cuando Mercurio retrocede.', '2025-03-23 15:30:00'),
(857, 204, 613, NULL, 'Esperando mi horóscopo.', '2025-04-23 09:20:00'),
(858, 15, 614, NULL, 'Tu altar tiene mucha luz.', '2025-05-03 20:15:00'),
(859, 245, 617, NULL, 'La casa 12 es complicada.', '2025-06-03 11:40:00'),
(860, 66, 618, NULL, 'Amo los cuarzos.', '2025-06-13 18:00:00'),
(861, 81, 621, NULL, 'Signos de fuego... qué intensidad.', '2025-07-13 14:10:00'),
(862, 110, 625, NULL, 'Qué tienda tan mágica.', '2025-08-23 22:05:00'),
(863, 156, 629, NULL, 'Los eclipses me cansan mucho.', '2025-10-03 13:50:00'),
(864, 23, 633, NULL, 'Sabía que era Virgo.', '2025-11-13 08:30:00'),
(865, 142, 637, NULL, 'Decretado queda.', '2026-01-06 19:45:00'),
(866, 198, 641, NULL, 'Va quedando brutal.', '2025-03-17 10:20:00'),
(867, 31, 642, NULL, '¡Te vi! El cosplay era genial.', '2025-03-27 16:00:00'),
(868, 55, 645, NULL, 'Buenos tips para ahorrar.', '2025-04-27 11:15:00'),
(869, 122, 646, NULL, 'Increíble maquillaje.', '2025-05-07 14:30:00'),
(870, 204, 649, NULL, 'Qué ganas de ir.', '2025-06-07 18:40:00'),
(871, 7, 650, NULL, 'Acabado profesional.', '2025-06-17 23:10:00'),
(872, 48, 653, NULL, '¡Por fin la peluca no se mueve!', '2025-07-17 09:55:00'),
(873, 92, 657, NULL, 'Qué buen edit.', '2025-08-27 12:20:00'),
(874, 119, 661, NULL, 'No escuches a los trolls.', '2025-10-07 20:35:00'),
(875, 160, 665, NULL, 'Haré esa espada.', '2025-11-17 15:50:00'),
(876, 14, 669, NULL, 'Vaya cambio, felicidades.', '2026-01-13 17:00:00'),
(877, 177, 673, NULL, 'Locación perfecta.', '2025-03-13 11:00:00'),
(878, 23, 674, NULL, 'Mucho estilo.', '2025-03-23 15:30:00'),
(879, 88, 677, NULL, 'Anotando poses.', '2025-04-23 09:20:00'),
(880, 134, 678, NULL, 'Natural y bella.', '2025-05-03 20:15:00'),
(881, 192, 681, NULL, 'Disfruta el viaje.', '2025-06-03 11:40:00'),
(882, 5, 682, NULL, 'Te queda genial.', '2025-06-13 18:00:00'),
(883, 67, 685, NULL, 'La Sony es una joya.', '2025-07-13 14:10:00'),
(884, 155, 689, NULL, 'El verde te favorece.', '2025-08-23 22:05:00'),
(885, 210, 690, NULL, 'Espectacular atardecer.', '2025-09-03 13:50:00'),
(886, 115, 693, NULL, 'Se nota el esfuerzo.', '2025-10-03 08:30:00'),
(887, 33, 697, NULL, 'Muchísima ropa, jaja.', '2025-11-13 19:45:00'),
(888, 14, 701, NULL, 'Gracias a ti.', '2026-01-06 10:20:00'),
(889, 180, 705, NULL, 'Muy relajante verte dibujar.', '2025-03-15 11:15:00'),
(890, 245, 706, NULL, 'Lineart perfecto.', '2025-03-25 14:30:00'),
(891, 77, 709, NULL, 'Reseña honesta, me gusta.', '2025-04-25 18:40:00'),
(892, 50, 710, NULL, 'Tengo la misma tableta.', '2025-05-05 23:10:00'),
(893, 10, 713, NULL, 'Gracias por la recomendación.', '2025-06-05 09:55:00'),
(894, 222, 715, NULL, 'Cuesta mucho las expresiones.', '2025-06-15 12:20:00'),
(895, 166, 717, NULL, 'Una pena la censura.', '2025-07-15 20:35:00'),
(896, 240, 721, NULL, 'Ojalá pueda ir.', '2025-08-25 15:50:00'),
(897, 11, 722, NULL, 'Ya pedí mis cosas.', '2025-09-05 17:00:00'),
(898, 68, 725, NULL, 'Berserk es lo mejor.', '2025-10-05 14:00:00'),
(899, 125, 729, NULL, 'Qué reto tan difícil.', '2025-11-15 20:30:00'),
(900, 39, 733, NULL, 'Felicidades por el crecimiento.', '2026-01-09 13:10:00');

-- Comentarios finales para las últimas publicaciones (737 - 800)
INSERT INTO Comentario (id, idUsuario, idPublicacion, idComentarioPadre, texto, fecha) VALUES 
(901, 150, 737, NULL, 'Me encantó la dinámica de este episodio.', '2025-03-18 15:00:00'),
(902, 94, 738, NULL, '¿Qué interfaz usan para esos micrófonos?', '2025-03-28 12:30:00'),
(903, 2, 741, NULL, 'Consejos de oro para la vida en pareja.', '2025-04-28 18:20:00'),
(904, 88, 742, NULL, '¡Sabía que vendría ese invitado algún día!', '2025-05-08 11:00:00'),
(905, 230, 745, NULL, 'He llorado de la risa con el clip viral.', '2025-06-08 22:15:00'),
(906, 41, 749, NULL, 'Gracias por crear este espacio tan necesario.', '2025-07-18 15:30:00'),
(907, 19, 753, NULL, 'Información muy profesional, me sirvió mucho.', '2025-08-28 19:10:00'),
(908, 121, 757, NULL, 'Mi peor cita fue en un cine, igual de malo.', '2025-10-08 20:15:00'),
(909, 155, 761, NULL, 'El diseño de las oficinas está a otro nivel.', '2025-11-18 23:30:00'),
(910, 249, 765, NULL, 'El mejor especial de navidad de la historia.', '2026-01-14 13:00:00'),
(911, 70, 769, NULL, 'Skyrim nunca muere gracias a estos mods.', '2025-03-21 10:20:00'),
(912, 110, 770, NULL, 'Parece un juego totalmente distinto, wow.', '2025-03-31 16:50:00'),
(913, 201, 773, NULL, 'Deseando tener una PC así algún día.', '2025-05-01 12:40:00'),
(914, 56, 774, NULL, 'Calidad de audio impecable en el stream.', '2025-05-11 19:15:00'),
(915, 13, 777, NULL, 'Casi tiro el monitor del susto, jajaja.', '2025-06-11 09:30:00'),
(916, 99, 781, NULL, 'El lore oculto de este juego es fascinante.', '2025-07-21 14:10:00'),
(917, 11, 782, NULL, 'Ese bug debería ser una función oficial.', '2025-07-31 22:05:00'),
(918, 45, 785, NULL, 'Se ve muy ergonómico ese teclado.', '2025-08-31 13:50:00'),
(919, 78, 789, NULL, 'Gran video sobre la libertad en el gaming.', '2025-10-11 10:30:00'),
(920, 102, 790, NULL, '¡Gracias por jugar con nosotros hoy!', '2025-10-21 21:15:00'),
(921, 210, 793, NULL, 'Configuración copiada, ahora se ve mejor.', '2025-11-21 10:20:00'),
(922, 55, 797, NULL, 'Justo mi juego favorito quedó de primero.', '2026-01-18 18:40:00'),

-- Comentarios aleatorios para cerrar los 1000
(923, 130, 451, NULL, 'Buen punto, hay que estar pendientes del banco.', '2025-03-14 14:00:00'),
(924, 162, 452, NULL, 'La inflación es el peor enemigo del ahorro.', '2025-03-24 18:15:00'),
(925, 199, 453, NULL, 'Es mejor ahorrar y luego viajar sin deudas.', '2025-04-24 12:30:00'),
(926, 241, 454, NULL, 'Las tablas dinámicas son vida.', '2025-05-04 22:00:00'),
(927, 6, 455, NULL, '¿Qué plataforma recomiendas para invertir?', '2025-06-04 14:45:00'),
(928, 128, 456, NULL, 'La tarjeta de crédito es una herramienta, no dinero.', '2025-06-14 19:30:00'),
(929, 175, 457, NULL, 'DCA y paciencia, esa es la clave.', '2025-07-14 16:50:00'),
(930, 133, 458, NULL, 'Me sirvió para explicarle a mis hijos.', '2025-07-24 23:10:00'),
(931, 211, 459, NULL, 'HODL hasta el final.', '2025-08-24 15:45:00'),
(932, 38, 460, NULL, 'Increíble cuánto se pierde en suscripciones.', '2025-10-04 11:20:00'),
(933, 86, 461, NULL, 'Gran lección de vida financiera.', '2025-11-14 21:00:00'),
(934, 147, 462, NULL, 'Magia matemática en estado puro.', '2025-11-24 13:15:00'),
(935, 222, 463, NULL, '¡Vamos que se puede ahorrar!', '2026-01-10 18:40:00'),
(936, 10, 464, NULL, 'Nunca los den por muertos en su torneo.', '2025-03-16 14:30:00'),
(937, 50, 465, NULL, 'La defensa estuvo horrible en esa jugada.', '2025-03-26 17:50:00'),
(938, 108, 466, NULL, 'Sin duda el mejor de su generación.', '2025-04-26 21:00:00'),
(939, 191, 467, NULL, 'Necesitan un cambio de táctica urgente.', '2025-05-07 10:15:00'),
(940, 242, 468, NULL, 'Vendido al mejor postor.', '2025-06-06 12:40:00'),
(941, 25, 469, NULL, 'Nadie volverá a correr así.', '2025-06-16 15:55:00'),
(942, 112, 470, NULL, 'Esa final cambió la historia.', '2025-07-16 23:20:00'),
(943, 129, 471, NULL, 'Quiero ir a ese estadio algún día.', '2025-07-26 19:10:00'),
(944, 141, 472, NULL, 'Los pelos de punta con ese final.', '2025-08-26 20:30:00'),
(945, 103, 473, NULL, 'Las de antes tenían más peso histórico.', '2025-09-06 17:15:00'),
(946, 159, 474, NULL, 'El entrenador tiene los días contados.', '2025-10-06 22:50:00'),
(947, 55, 475, NULL, 'Golazo de antología.', '2025-10-16 16:00:00'),
(948, 62, 476, NULL, 'Siempre se aprende algo nuevo de deportes.', '2025-11-16 13:20:00'),
(949, 78, 477, NULL, 'Puro negocio ahora.', '2025-11-26 15:45:00'),
(950, 12, 478, NULL, 'Emocionante de principio a fin.', '2026-01-07 19:10:00'),
(951, 105, 479, NULL, 'Ahora sí podré ver el partido sin perderme.', '2026-01-17 14:30:00'),
(952, 140, 480, NULL, 'Merece la pena ir al cine solo por eso.', '2025-03-18 11:20:00'),
(953, 200, 481, NULL, 'Mejor que el póster original.', '2025-03-28 16:45:00'),
(954, 33, 482, NULL, 'No le pega nada la voz.', '2025-04-28 17:10:00'),
(955, 15, 483, NULL, 'Tuve que ver el video dos veces para entender.', '2025-05-08 15:55:00'),
(956, 44, 484, NULL, 'Gracias por la recomendación.', '2025-06-08 21:30:00'),
(957, 89, 485, NULL, 'Te ves de revista.', '2025-06-19 08:15:00'),
(958, 210, 486, NULL, '¡Qué nivel de actuación!', '2025-07-18 16:40:00'),
(959, 115, 487, NULL, 'El CGI del dragón estaba fatal.', '2025-07-28 23:25:00'),
(960, 5, 488, NULL, 'No pude dormir después de verla.', '2025-08-29 09:10:00'),
(961, 132, 489, NULL, 'Los tesoros que uno guarda.', '2025-09-08 19:45:00'),
(962, 245, 490, NULL, 'Esa serie es cultura pop ahora.', '2025-10-08 22:15:00'),
(963, 77, 491, NULL, 'Vivan las gafas tradicionales.', '2025-10-18 16:50:00'),
(964, 180, 492, NULL, 'Ese director está muy infravalorado.', '2025-11-19 12:40:00'),
(965, 222, 493, NULL, 'Hacen falta más villanos así.', '2025-11-28 18:05:00'),
(966, 50, 494, NULL, 'Joyas ocultas del cine.', '2026-01-15 14:20:00'),
(967, 10, 495, NULL, 'Suena como si estuvieras allí.', '2026-01-24 16:15:00'),
(968, 166, 496, NULL, 'Espectacular para empezar el año.', '2025-03-14 13:30:00'),
(969, 240, 497, NULL, 'Quiero ese estante para mí.', '2025-03-24 18:45:00'),
(970, 11, 498, NULL, 'Añadido a mi lista de lectura.', '2025-04-24 14:10:00'),
(971, 68, 499, NULL, 'Gran trabajo de investigación.', '2025-05-04 11:20:00'),
(972, 125, 500, NULL, 'La magia de los libros impresos.', '2025-06-04 22:50:00'),
(973, 39, 501, NULL, 'Es una obra de arte el diseño.', '2025-06-14 15:45:00'),
(974, 150, 502, NULL, 'No bajes los brazos con la escritura.', '2025-07-14 18:20:00'),
(975, 94, 503, NULL, 'Capturaste la esencia del libro.', '2025-07-24 20:30:00'),
(976, 2, 504, NULL, 'A veces es mejor dejarlo y volver luego.', '2025-08-24 23:55:00'),
(977, 88, 505, NULL, 'Describe mi estado de ánimo.', '2025-09-04 13:10:00'),
(978, 230, 506, NULL, 'No puedo dejar de leer a Sanderson.', '2025-10-04 22:40:00'),
(979, 41, 507, NULL, '¡Qué paquete de libros!', '2025-10-14 17:15:00'),
(980, 19, 508, NULL, 'Fiel al material original.', '2025-11-14 15:50:00'),
(981, 121, 509, NULL, 'Un hábito que cambia vidas.', '2025-11-24 23:10:00'),
(982, 155, 510, NULL, 'A por todas con esos retos.', '2026-01-07 13:40:00'),
(983, 249, 511, NULL, 'Esa frase es legendaria.', '2026-01-17 21:05:00'),
(984, 70, 512, NULL, 'Parece un mueble nuevo.', '2025-03-16 15:20:00'),
(985, 110, 513, NULL, 'Me encanta ese acabado.', '2025-03-26 18:40:00'),
(986, 201, 514, NULL, 'Anotando materiales para mi mesa.', '2025-04-26 13:15:00'),
(987, 56, 515, NULL, 'Qué bien quedó el tapizado.', '2025-05-06 17:30:00'),
(988, 13, 516, NULL, 'Gran consejo para no manchar.', '2025-06-06 11:20:00'),
(989, 99, 517, NULL, 'Pinceles limpios siempre.', '2025-06-16 14:50:00'),
(990, 11, 518, NULL, 'Un taller digno de admirar.', '2025-07-16 16:45:00'),
(991, 45, 519, NULL, 'Me inspiraste para redecorar.', '2025-07-26 21:10:00'),
(992, 78, 520, NULL, 'La luz LED le da el toque.', '2025-08-26 19:30:00'),
(993, 102, 521, NULL, 'Soldadura impecable.', '2025-09-06 11:20:00'),
(994, 210, 522, NULL, 'Lo intentaré este domingo.', '2025-10-06 15:40:00'),
(995, 55, 523, NULL, '¡Cuidado con esa herramienta!', '2025-10-16 23:15:00'),
(996, 13, 524, NULL, 'Reto cumplido con creces.', '2025-11-16 16:50:00'),
(997, 18, 525, NULL, 'Excelente mantenimiento.', '2025-11-26 10:30:00'),
(998, 140, 526, NULL, 'Ferretería lover por aquí.', '2026-01-10 14:15:00'),
(999, 222, 527, NULL, 'Gracias por la ayuda.', '2026-01-20 22:50:00'),
(1000, 33, 528, NULL, 'Información muy valiosa.', '2025-03-18 15:30:00');

SET IDENTITY_INSERT Comentario OFF;

------------ usuario reaccion publicacion --------------

-- Reacciones del Usuario 1 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (1, 10, 1, '2025-06-16 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (1, 25, 2, '2025-11-17 09:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (1, 45, 4, '2025-07-13 09:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (1, 101, 1, '2025-04-24 15:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (1, 150, 2, '2025-10-29 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (1, 200, 6, '2025-05-25 20:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (1, 250, 4, '2025-11-27 15:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (1, 300, 1, '2025-04-14 10:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (1, 350, 2, '2026-01-19 17:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (1, 400, 3, '2025-02-20 18:00:00');

-- Reacciones del Usuario 2 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (2, 5, 2, '2025-04-26 12:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (2, 15, 4, '2025-08-07 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (2, 35, 1, '2025-04-03 11:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (2, 55, 6, '2025-10-24 13:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (2, 110, 2, '2025-08-01 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (2, 160, 1, '2026-02-17 19:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (2, 210, 4, '2025-09-05 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (2, 260, 2, '2025-04-19 22:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (2, 310, 6, '2025-10-14 08:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (2, 360, 1, '2025-05-27 22:00:00');

-- Reacciones del Usuario 3 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (3, 1, 4, '2025-03-16 09:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (3, 11, 2, '2025-06-27 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (3, 21, 6, '2025-10-07 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (3, 31, 1, '2026-02-12 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (3, 120, 2, '2025-11-19 15:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (3, 170, 4, '2025-06-20 16:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (3, 220, 1, '2025-12-15 17:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (3, 270, 6, '2025-07-29 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (3, 320, 2, '2026-02-21 19:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (3, 370, 4, '2025-09-07 22:00:00');

-- Reacciones del Usuario 4 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (4, 2, 1, '2025-03-26 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (4, 12, 2, '2025-07-07 11:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (4, 22, 4, '2025-10-17 12:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (4, 42, 6, '2026-01-14 13:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (4, 130, 1, '2025-03-23 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (4, 180, 2, '2025-10-08 17:40:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (4, 230, 4, '2025-05-07 19:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (4, 280, 1, '2025-11-09 20:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (4, 330, 2, '2025-06-15 21:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (4, 380, 4, '2025-12-17 22:00:00');

-- Reacciones del Usuario 5 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (5, 3, 2, '2025-04-06 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (5, 13, 1, '2025-07-17 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (5, 23, 4, '2025-10-27 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (5, 43, 6, '2026-01-24 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (5, 140, 2, '2025-07-11 16:40:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (5, 190, 1, '2026-01-27 18:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (5, 240, 4, '2025-08-17 19:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (5, 290, 2, '2025-03-24 20:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (5, 340, 1, '2025-09-25 22:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (5, 390, 4, '2025-05-03 22:00:00');

-- Reacciones del Usuario 6 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (6, 4, 1, '2025-04-16 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (6, 14, 2, '2025-07-27 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (6, 24, 4, '2025-11-07 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (6, 44, 6, '2026-02-04 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (6, 150, 1, '2025-10-29 16:40:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (6, 200, 2, '2025-05-25 18:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (6, 250, 4, '2025-11-27 19:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (6, 300, 1, '2025-04-14 20:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (6, 350, 2, '2026-01-19 22:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (6, 400, 4, '2025-02-20 18:15:00');

-- Reacciones del Usuario 7 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (7, 6, 2, '2025-05-06 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (7, 16, 1, '2025-08-17 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (7, 26, 4, '2025-11-27 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (7, 46, 6, '2026-02-24 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (7, 160, 2, '2026-02-17 16:40:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (7, 210, 1, '2025-09-05 18:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (7, 260, 4, '2025-04-19 19:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (7, 310, 2, '2025-10-14 20:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (7, 360, 1, '2025-05-27 22:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (7, 410, 4, '2025-11-22 15:30:00');

-- Reacciones del Usuario 8 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (8, 7, 1, '2025-05-17 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (8, 17, 2, '2025-08-26 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (8, 27, 4, '2025-12-07 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (8, 47, 6, '2025-08-04 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (8, 170, 1, '2025-06-20 16:40:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (8, 220, 2, '2025-12-15 18:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (8, 270, 4, '2025-07-29 19:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (8, 320, 1, '2026-02-21 20:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (8, 370, 2, '2025-09-07 22:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (8, 420, 4, '2025-04-14 18:30:00');

-- Reacciones del Usuario 9 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (9, 8, 2, '2025-05-26 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (9, 18, 4, '2025-09-06 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (9, 28, 1, '2025-12-17 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (9, 48, 6, '2025-08-13 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (9, 180, 2, '2025-10-07 16:40:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (9, 230, 1, '2025-05-07 18:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (9, 280, 4, '2025-11-09 19:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (9, 330, 2, '2025-06-15 20:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (9, 380, 1, '2025-12-17 22:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (9, 430, 4, '2025-07-24 21:00:00');

-- Reacciones del Usuario 10 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (10, 9, 1, '2025-06-07 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (10, 19, 2, '2025-09-17 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (10, 29, 4, '2026-01-12 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (10, 49, 6, '2025-08-23 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (10, 190, 1, '2026-01-27 16:40:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (10, 240, 2, '2025-08-17 18:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (10, 290, 4, '2025-03-24 19:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (10, 340, 1, '2025-09-25 20:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (10, 390, 2, '2025-05-02 22:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (10, 440, 4, '2025-11-04 15:45:00');

-- Reacciones del Usuario 11 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (11, 1, 2, '2025-03-16 11:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (11, 51, 4, '2025-09-12 12:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (11, 101, 1, '2025-04-24 13:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (11, 151, 6, '2025-11-08 14:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (11, 201, 2, '2025-06-04 15:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (11, 251, 1, '2025-12-06 16:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (11, 301, 4, '2025-07-12 17:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (11, 351, 2, '2026-02-08 18:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (11, 401, 1, '2025-08-22 19:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (11, 451, 4, '2025-03-14 20:00:00');

-- Reacciones del Usuario 12 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (12, 2, 6, '2025-03-26 11:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (12, 52, 1, '2025-09-22 12:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (12, 102, 2, '2025-05-04 13:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (12, 152, 4, '2025-11-19 14:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (12, 202, 1, '2025-06-14 15:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (12, 252, 6, '2025-12-16 16:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (12, 302, 2, '2025-07-22 17:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (12, 352, 1, '2026-02-18 18:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (12, 402, 4, '2025-09-02 19:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (12, 452, 2, '2025-03-24 20:00:00');

-- Reacciones del Usuario 13 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (13, 3, 1, '2025-04-06 11:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (13, 53, 2, '2025-10-02 12:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (13, 103, 4, '2025-05-15 13:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (13, 153, 6, '2025-11-30 14:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (13, 203, 1, '2025-06-24 15:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (13, 253, 2, '2026-01-12 16:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (13, 303, 4, '2025-08-02 17:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (13, 353, 1, '2025-03-16 18:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (13, 403, 6, '2025-09-12 19:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (13, 453, 2, '2025-04-24 20:00:00');

-- Reacciones del Usuario 14 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (14, 4, 2, '2025-04-16 11:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (14, 54, 4, '2025-10-12 12:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (14, 104, 1, '2025-05-26 13:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (14, 154, 6, '2025-12-11 14:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (14, 204, 2, '2025-07-04 15:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (14, 254, 1, '2026-01-22 16:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (14, 304, 4, '2025-08-12 17:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (14, 354, 2, '2025-03-26 18:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (14, 404, 1, '2025-09-22 19:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (14, 454, 4, '2025-05-08 20:00:00');

-- Reacciones del Usuario 15 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (15, 5, 1, '2025-04-26 11:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (15, 55, 2, '2025-10-22 12:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (15, 105, 4, '2025-06-06 13:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (15, 155, 6, '2025-12-22 14:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (15, 205, 1, '2025-07-14 15:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (15, 255, 2, '2026-02-12 16:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (15, 305, 4, '2025-08-22 17:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (15, 355, 1, '2025-04-06 18:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (15, 405, 6, '2025-10-02 19:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (15, 455, 2, '2025-06-04 20:00:00');

-- Reacciones del Usuario 16 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (16, 6, 2, '2025-05-06 11:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (16, 56, 4, '2025-11-02 12:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (16, 106, 1, '2025-06-17 13:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (16, 156, 6, '2026-01-03 14:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (16, 206, 2, '2025-07-24 15:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (16, 256, 1, '2026-02-22 16:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (16, 306, 4, '2025-09-02 17:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (16, 356, 2, '2025-04-16 18:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (16, 406, 1, '2025-10-12 19:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (16, 456, 4, '2025-06-14 20:00:00');

-- Reacciones del Usuario 17 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (17, 7, 1, '2025-05-17 11:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (17, 57, 2, '2025-11-12 12:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (17, 107, 4, '2025-06-28 13:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (17, 157, 6, '2026-01-14 14:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (17, 207, 1, '2025-08-04 15:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (17, 257, 2, '2025-03-18 16:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (17, 307, 4, '2025-09-12 17:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (17, 357, 1, '2025-04-26 18:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (17, 407, 6, '2025-10-22 19:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (17, 457, 2, '2025-07-14 20:00:00');

-- Reacciones del Usuario 18 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (18, 8, 2, '2025-05-26 11:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (18, 58, 4, '2025-11-22 12:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (18, 108, 1, '2025-07-09 13:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (18, 158, 6, '2026-01-25 14:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (18, 208, 2, '2025-08-14 15:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (18, 258, 1, '2025-03-28 16:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (18, 308, 4, '2025-09-22 17:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (18, 358, 2, '2025-05-06 18:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (18, 408, 1, '2025-11-02 19:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (18, 458, 4, '2025-07-24 20:00:00');

-- Reacciones del Usuario 19 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (19, 9, 1, '2025-06-07 11:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (19, 59, 2, '2025-12-02 12:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (19, 109, 4, '2025-07-20 13:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (19, 159, 6, '2026-02-05 14:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (19, 209, 1, '2025-08-24 15:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (19, 259, 2, '2025-04-08 16:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (19, 309, 4, '2025-10-02 17:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (19, 359, 1, '2025-05-16 18:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (19, 409, 6, '2025-11-12 19:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (19, 459, 2, '2025-08-24 20:00:00');

-- Reacciones del Usuario 20 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (20, 10, 2, '2025-06-16 11:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (20, 60, 4, '2025-12-12 12:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (20, 110, 1, '2025-07-31 13:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (20, 160, 6, '2026-02-16 14:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (20, 210, 2, '2025-09-04 15:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (20, 260, 1, '2025-04-19 16:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (20, 310, 4, '2025-10-12 17:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (20, 360, 2, '2025-05-26 18:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (20, 410, 1, '2025-11-22 19:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (20, 460, 4, '2025-10-04 20:00:00');

-- Reacciones del Usuario 21 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (21, 1, 1, '2025-03-16 12:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (21, 61, 2, '2026-01-05 13:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (21, 111, 4, '2025-08-11 14:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (21, 161, 6, '2025-03-12 15:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (21, 211, 1, '2025-09-14 16:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (21, 261, 2, '2025-04-28 17:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (21, 311, 4, '2025-10-22 18:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (21, 361, 1, '2025-06-06 19:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (21, 411, 6, '2025-12-02 20:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (21, 461, 2, '2025-07-16 21:00:00');

-- Reacciones del Usuario 22 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (22, 2, 2, '2025-03-26 12:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (22, 62, 4, '2026-01-15 13:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (22, 112, 1, '2025-08-22 14:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (22, 162, 6, '2025-03-23 15:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (22, 212, 2, '2025-09-24 16:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (22, 262, 1, '2025-05-08 17:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (22, 312, 4, '2025-11-02 18:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (22, 362, 2, '2025-06-16 19:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (22, 412, 1, '2025-12-12 20:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (22, 462, 4, '2025-07-26 21:00:00');

-- Reacciones del Usuario 23 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (23, 3, 4, '2025-04-06 12:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (23, 63, 1, '2026-02-05 13:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (23, 113, 2, '2025-09-02 14:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (23, 163, 4, '2025-04-03 15:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (23, 213, 6, '2025-10-04 16:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (23, 263, 2, '2025-05-18 17:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (23, 313, 1, '2025-11-12 18:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (23, 363, 4, '2025-06-26 19:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (23, 413, 2, '2026-01-08 20:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (23, 463, 1, '2025-08-06 21:00:00');

-- Reacciones del Usuario 24 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (24, 4, 1, '2025-04-16 12:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (24, 64, 2, '2026-02-20 13:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (24, 114, 4, '2025-09-13 14:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (24, 164, 1, '2025-04-14 15:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (24, 214, 6, '2025-10-14 16:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (24, 264, 2, '2025-05-28 17:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (24, 314, 4, '2025-11-22 18:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (24, 364, 1, '2025-07-06 19:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (24, 414, 2, '2026-01-18 20:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (24, 464, 6, '2025-08-16 21:00:00');

-- Reacciones del Usuario 25 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (25, 5, 4, '2025-04-26 12:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (25, 65, 1, '2025-03-18 13:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (25, 115, 2, '2025-09-24 14:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (25, 165, 4, '2025-04-25 15:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (25, 215, 6, '2025-10-24 16:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (25, 265, 2, '2025-06-08 17:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (25, 315, 1, '2025-12-02 18:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (25, 365, 4, '2025-07-16 19:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (25, 415, 2, '2026-02-08 20:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (25, 465, 1, '2025-08-26 21:00:00');


-- Reacciones del Usuario 26 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (26, 6, 1, '2025-05-07 09:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (26, 66, 2, '2025-03-30 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (26, 116, 3, '2025-10-06 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (26, 166, 4, '2025-05-07 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (26, 216, 5, '2025-11-05 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (26, 266, 6, '2025-06-20 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (26, 316, 7, '2025-12-13 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (26, 366, 1, '2025-07-28 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (26, 416, 2, '2026-02-19 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (26, 466, 4, '2025-09-07 08:45:00');

-- Reacciones del Usuario 27 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (27, 7, 2, '2025-05-18 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (27, 77, 3, '2025-07-20 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (27, 127, 4, '2026-02-05 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (27, 177, 5, '2025-09-05 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (27, 227, 6, '2025-04-07 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (27, 277, 7, '2025-10-09 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (27, 327, 1, '2025-05-15 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (27, 377, 2, '2025-11-18 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (27, 427, 3, '2025-06-25 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (27, 477, 4, '2026-01-13 08:45:00');

-- Reacciones del Usuario 28 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (28, 8, 3, '2025-05-27 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (28, 88, 4, '2025-11-09 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (28, 138, 5, '2025-06-19 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (28, 188, 6, '2026-01-05 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (28, 238, 7, '2025-07-27 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (28, 288, 1, '2026-02-25 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (28, 338, 2, '2025-09-05 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (28, 388, 3, '2025-04-13 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (28, 438, 4, '2025-10-17 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (28, 488, 5, '2025-05-23 08:45:00');

-- Reacciones del Usuario 29 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (29, 9, 4, '2025-06-07 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (29, 99, 5, '2025-04-03 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (29, 149, 6, '2025-10-18 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (29, 199, 7, '2025-05-15 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (29, 249, 1, '2025-11-17 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (29, 299, 2, '2025-06-23 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (29, 349, 3, '2026-01-10 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (29, 399, 4, '2025-08-03 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (29, 449, 5, '2025-03-17 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (29, 499, 6, '2025-07-13 08:45:00');

-- Reacciones del Usuario 30 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (30, 10, 5, '2025-06-17 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (30, 110, 6, '2025-08-01 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (30, 160, 7, '2026-02-17 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (30, 210, 1, '2025-09-05 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (30, 260, 2, '2025-04-20 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (30, 310, 3, '2025-10-13 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (30, 360, 4, '2025-05-27 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (30, 410, 5, '2025-11-23 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (30, 460, 6, '2025-07-07 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (30, 510, 7, '2026-01-16 08:45:00');

-- Reacciones del Usuario 31 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (31, 11, 6, '2025-06-28 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (31, 61, 7, '2026-01-07 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (31, 111, 1, '2025-08-12 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (31, 161, 2, '2025-03-13 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (31, 211, 3, '2025-09-15 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (31, 261, 4, '2025-04-29 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (31, 311, 5, '2025-10-23 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (31, 361, 6, '2025-06-07 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (31, 411, 7, '2025-12-03 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (31, 461, 1, '2025-07-17 08:45:00');

-- Reacciones del Usuario 32 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (32, 12, 7, '2025-07-07 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (32, 62, 1, '2026-01-16 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (32, 112, 2, '2025-08-23 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (32, 162, 3, '2025-03-24 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (32, 212, 4, '2025-09-25 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (32, 262, 5, '2025-05-09 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (32, 312, 6, '2025-11-03 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (32, 362, 7, '2025-06-17 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (32, 412, 1, '2025-12-13 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (32, 462, 2, '2025-07-27 08:45:00');

-- Reacciones del Usuario 33 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (33, 13, 1, '2025-07-17 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (33, 63, 2, '2026-02-06 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (33, 113, 3, '2025-09-03 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (33, 163, 4, '2025-04-04 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (33, 213, 5, '2025-10-05 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (33, 263, 6, '2025-05-19 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (33, 313, 7, '2025-11-13 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (33, 363, 1, '2025-06-27 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (33, 413, 2, '2026-01-09 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (33, 463, 3, '2025-08-07 08:45:00');

-- Reacciones del Usuario 34 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (34, 14, 2, '2025-07-27 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (34, 64, 3, '2026-02-21 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (34, 114, 4, '2025-09-14 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (34, 164, 5, '2025-04-15 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (34, 214, 6, '2025-10-15 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (34, 264, 7, '2025-05-29 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (34, 314, 1, '2025-11-23 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (34, 364, 2, '2025-07-07 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (34, 414, 3, '2026-01-19 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (34, 464, 4, '2025-08-17 08:45:00');

-- Reacciones del Usuario 35 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (35, 15, 3, '2025-08-07 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (35, 65, 4, '2025-03-20 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (35, 115, 5, '2025-09-25 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (35, 165, 6, '2025-04-26 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (35, 215, 7, '2025-10-25 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (35, 265, 1, '2025-06-09 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (35, 315, 2, '2025-12-03 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (35, 365, 3, '2025-07-17 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (35, 415, 4, '2026-02-09 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (35, 465, 5, '2025-08-27 08:45:00');

-- Reacciones del Usuario 36 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (36, 16, 4, '2025-08-17 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (36, 66, 5, '2025-03-30 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (36, 116, 6, '2025-10-06 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (36, 166, 7, '2025-05-07 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (36, 216, 1, '2025-11-05 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (36, 266, 2, '2025-06-20 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (36, 316, 3, '2025-12-13 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (36, 366, 4, '2025-07-28 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (36, 416, 5, '2026-02-19 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (36, 466, 6, '2025-09-07 08:45:00');

-- Reacciones del Usuario 37 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (37, 17, 5, '2025-08-27 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (37, 67, 6, '2025-04-10 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (37, 117, 7, '2025-10-18 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (37, 167, 1, '2025-05-18 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (37, 217, 2, '2025-11-16 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (37, 267, 3, '2025-06-29 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (37, 317, 4, '2026-01-07 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (37, 367, 5, '2025-08-07 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (37, 417, 6, '2025-03-15 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (37, 467, 7, '2025-07-29 08:45:00');

-- Reacciones del Usuario 38 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (38, 18, 6, '2025-09-07 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (38, 68, 7, '2025-04-20 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (38, 118, 1, '2025-10-28 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (38, 168, 2, '2025-05-29 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (38, 218, 3, '2025-11-26 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (38, 268, 4, '2025-07-10 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (38, 318, 5, '2026-01-16 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (38, 368, 6, '2025-08-17 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (38, 418, 7, '2025-03-25 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (38, 468, 1, '2025-09-27 08:45:00');

-- Reacciones del Usuario 39 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (39, 19, 7, '2025-09-17 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (39, 69, 1, '2025-04-30 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (39, 119, 2, '2025-11-08 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (39, 169, 3, '2025-06-09 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (39, 219, 4, '2025-12-05 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (39, 269, 5, '2025-07-19 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (39, 319, 6, '2026-02-06 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (39, 369, 7, '2025-08-28 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (39, 419, 1, '2025-04-05 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (39, 469, 2, '2025-10-07 08:45:00');

-- Reacciones del Usuario 40 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (40, 20, 1, '2025-09-27 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (40, 70, 2, '2025-05-09 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (40, 120, 3, '2025-11-19 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (40, 170, 4, '2025-06-20 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (40, 220, 5, '2025-12-15 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (40, 270, 6, '2025-07-30 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (40, 320, 7, '2026-02-22 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (40, 370, 1, '2025-09-08 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (40, 420, 2, '2025-04-15 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (40, 470, 3, '2025-10-17 08:45:00');

-- Reacciones del Usuario 41 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (41, 21, 2, '2025-10-07 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (41, 71, 3, '2025-05-19 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (41, 121, 4, '2025-11-30 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (41, 171, 5, '2025-07-01 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (41, 221, 6, '2026-01-11 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (41, 271, 7, '2025-08-09 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (41, 321, 1, '2025-03-15 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (41, 371, 2, '2025-09-17 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (41, 421, 3, '2025-04-25 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (41, 471, 4, '2025-10-27 08:45:00');

-- Reacciones del Usuario 42 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (42, 22, 3, '2025-10-17 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (42, 72, 4, '2025-05-30 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (42, 122, 5, '2025-12-11 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (42, 172, 6, '2025-07-12 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (42, 222, 7, '2026-01-22 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (42, 272, 1, '2025-08-19 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (42, 322, 2, '2025-03-25 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (42, 372, 3, '2025-09-27 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (42, 422, 4, '2025-05-05 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (42, 472, 5, '2025-11-07 08:45:00');

-- Reacciones del Usuario 43 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (43, 23, 4, '2025-10-27 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (43, 73, 5, '2025-06-09 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (43, 123, 6, '2025-12-22 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (43, 173, 7, '2025-07-23 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (43, 223, 1, '2026-02-12 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (43, 273, 2, '2025-08-30 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (43, 323, 3, '2025-04-05 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (43, 373, 4, '2025-10-07 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (43, 423, 5, '2025-05-15 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (43, 473, 6, '2025-11-17 08:45:00');

-- Reacciones del Usuario 44 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (44, 24, 5, '2025-11-07 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (44, 74, 6, '2025-06-19 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (44, 124, 7, '2026-01-03 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (44, 174, 1, '2025-08-03 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (44, 224, 2, '2026-02-19 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (44, 274, 3, '2025-09-10 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (44, 324, 4, '2025-04-15 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (44, 374, 5, '2025-10-18 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (44, 424, 6, '2025-05-25 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (44, 474, 7, '2025-11-27 08:45:00');

-- Reacciones del Usuario 45 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (45, 25, 6, '2025-11-17 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (45, 75, 7, '2025-06-29 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (45, 125, 1, '2026-01-14 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (45, 175, 2, '2025-08-14 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (45, 225, 3, '2026-03-10 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (45, 275, 4, '2025-09-19 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (45, 325, 5, '2025-04-26 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (45, 375, 6, '2025-10-27 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (45, 425, 7, '2025-06-05 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (45, 475, 1, '2025-12-07 08:45:00');

-- Reacciones del Usuario 46 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (46, 26, 7, '2025-11-27 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (46, 76, 1, '2025-07-10 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (46, 126, 2, '2026-01-25 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (46, 176, 3, '2025-08-25 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (46, 226, 4, '2026-03-11 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (46, 276, 5, '2025-09-29 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (46, 326, 6, '2025-05-05 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (46, 376, 7, '2025-11-07 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (46, 426, 1, '2025-06-15 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (46, 476, 2, '2025-12-17 08:45:00');

-- Reacciones del Usuario 47 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (47, 27, 1, '2025-12-07 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (47, 77, 2, '2025-07-20 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (47, 127, 3, '2026-02-05 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (47, 177, 4, '2025-09-05 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (47, 227, 5, '2026-03-11 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (47, 277, 6, '2025-10-09 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (47, 327, 7, '2025-05-15 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (47, 377, 1, '2025-11-18 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (47, 427, 2, '2025-06-25 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (47, 477, 3, '2026-01-13 08:45:00');

-- Reacciones del Usuario 48 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (48, 28, 2, '2025-12-17 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (48, 78, 3, '2025-07-29 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (48, 128, 4, '2026-02-16 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (48, 178, 5, '2025-09-17 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (48, 228, 6, '2026-03-11 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (48, 278, 7, '2025-10-19 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (48, 328, 1, '2025-05-25 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (48, 378, 2, '2025-11-28 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (48, 428, 3, '2025-07-05 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (48, 478, 4, '2026-01-23 08:45:00');

-- Reacciones del Usuario 49 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (49, 29, 3, '2026-01-12 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (49, 79, 4, '2025-08-09 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (49, 129, 5, '2025-03-12 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (49, 179, 6, '2025-09-27 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (49, 229, 7, '2026-03-11 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (49, 279, 1, '2025-10-29 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (49, 329, 2, '2025-06-05 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (49, 379, 3, '2025-12-07 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (49, 429, 4, '2025-07-15 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (49, 479, 5, '2026-02-13 08:45:00');

-- Reacciones del Usuario 50 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (50, 30, 4, '2026-01-21 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (50, 80, 5, '2025-08-20 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (50, 130, 6, '2025-03-23 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (50, 180, 7, '2025-10-08 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (50, 230, 1, '2026-03-11 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (50, 280, 2, '2025-11-10 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (50, 330, 3, '2025-06-15 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (50, 380, 4, '2025-12-17 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (50, 430, 5, '2025-07-25 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (50, 480, 6, '2026-02-23 08:45:00');


-- Reacciones del Usuario 51 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (51, 31, 1, '2026-02-12 09:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (51, 81, 2, '2025-08-30 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (51, 131, 3, '2025-04-03 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (51, 181, 4, '2025-10-19 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (51, 231, 5, '2025-05-17 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (51, 281, 6, '2025-11-19 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (51, 331, 7, '2025-06-25 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (51, 381, 1, '2026-01-14 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (51, 431, 2, '2025-08-05 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (51, 481, 3, '2025-03-13 08:45:00');

-- Reacciones del Usuario 52 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (52, 32, 2, '2026-03-01 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (52, 82, 3, '2025-09-10 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (52, 132, 4, '2025-04-14 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (52, 182, 5, '2025-10-30 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (52, 232, 6, '2025-05-27 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (52, 282, 7, '2025-11-29 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (52, 332, 1, '2025-07-05 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (52, 382, 2, '2026-01-24 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (52, 432, 3, '2025-08-15 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (52, 482, 4, '2025-03-23 08:45:00');

-- Reacciones del Usuario 53 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (53, 33, 3, '2025-03-14 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (53, 83, 4, '2025-09-20 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (53, 133, 5, '2025-04-25 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (53, 183, 6, '2025-11-10 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (53, 233, 7, '2025-06-07 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (53, 283, 1, '2025-12-09 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (53, 333, 2, '2025-07-16 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (53, 383, 3, '2026-02-13 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (53, 433, 4, '2025-08-25 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (53, 483, 5, '2025-04-03 08:45:00');

-- Reacciones del Usuario 54 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (54, 34, 4, '2025-03-24 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (54, 84, 5, '2025-09-30 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (54, 134, 6, '2025-05-06 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (54, 184, 7, '2025-11-21 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (54, 234, 1, '2025-06-17 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (54, 284, 2, '2025-12-19 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (54, 334, 3, '2025-07-25 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (54, 384, 4, '2026-02-23 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (54, 434, 5, '2025-09-05 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (54, 484, 6, '2025-04-13 08:45:00');

-- Reacciones del Usuario 55 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (55, 35, 5, '2025-04-03 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (55, 85, 6, '2025-10-10 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (55, 135, 7, '2025-05-17 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (55, 185, 1, '2025-12-02 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (55, 235, 2, '2025-06-27 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (55, 285, 3, '2026-01-16 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (55, 335, 4, '2025-08-05 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (55, 385, 5, '2025-03-13 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (55, 435, 6, '2025-09-15 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (55, 485, 7, '2025-04-23 08:45:00');

-- Reacciones del Usuario 56 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (56, 36, 6, '2025-04-13 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (56, 86, 7, '2025-10-20 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (56, 136, 1, '2025-05-28 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (56, 186, 2, '2025-12-13 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (56, 236, 3, '2025-07-07 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (56, 286, 4, '2026-01-26 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (56, 336, 5, '2025-08-15 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (56, 386, 6, '2025-03-23 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (56, 436, 7, '2025-09-25 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (56, 486, 1, '2025-05-03 08:45:00');

-- Reacciones del Usuario 57 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (57, 37, 7, '2025-04-23 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (57, 87, 1, '2025-10-30 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (57, 137, 2, '2025-06-08 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (57, 187, 3, '2025-12-24 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (57, 237, 4, '2025-07-17 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (57, 287, 5, '2026-02-15 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (57, 337, 6, '2025-08-25 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (57, 387, 7, '2025-04-03 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (57, 437, 1, '2025-10-05 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (57, 487, 2, '2025-05-13 08:45:00');

-- Reacciones del Usuario 58 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (58, 38, 1, '2025-05-03 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (58, 88, 2, '2025-11-10 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (58, 138, 3, '2025-06-19 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (58, 188, 4, '2026-01-05 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (58, 238, 5, '2025-07-27 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (58, 288, 6, '2026-02-25 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (58, 338, 7, '2025-09-05 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (58, 388, 1, '2025-04-13 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (58, 438, 2, '2025-10-17 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (58, 488, 3, '2025-05-23 08:45:00');

-- Reacciones del Usuario 59 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (59, 39, 2, '2025-05-13 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (59, 89, 3, '2025-11-20 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (59, 139, 4, '2025-06-30 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (59, 189, 5, '2026-01-16 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (59, 239, 6, '2025-08-07 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (59, 289, 7, '2025-03-13 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (59, 339, 1, '2025-09-15 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (59, 389, 2, '2025-04-24 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (59, 439, 3, '2025-10-25 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (59, 489, 4, '2025-06-05 08:45:00');

-- Reacciones del Usuario 60 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (60, 40, 3, '2025-05-24 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (60, 90, 4, '2025-11-30 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (60, 140, 5, '2025-07-11 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (60, 190, 6, '2026-01-27 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (60, 240, 7, '2025-08-17 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (60, 290, 1, '2025-03-24 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (60, 340, 2, '2025-09-26 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (60, 390, 3, '2025-05-04 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (60, 440, 4, '2025-11-04 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (60, 490, 5, '2025-06-14 08:45:00');

-- Reacciones del Usuario 61 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (61, 41, 4, '2026-01-04 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (61, 91, 5, '2025-12-09 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (61, 141, 6, '2025-07-22 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (61, 191, 7, '2026-02-07 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (61, 241, 1, '2025-08-27 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (61, 291, 2, '2025-04-03 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (61, 341, 3, '2025-10-05 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (61, 391, 4, '2025-05-13 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (61, 441, 5, '2025-11-15 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (61, 491, 6, '2025-06-23 08:45:00');

-- Reacciones del Usuario 62 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (62, 42, 5, '2026-01-14 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (62, 92, 6, '2025-12-20 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (62, 142, 7, '2025-08-02 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (62, 192, 1, '2026-02-18 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (62, 242, 2, '2025-09-07 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (62, 292, 3, '2025-04-13 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (62, 342, 4, '2025-10-16 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (62, 392, 5, '2025-05-23 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (62, 442, 6, '2025-11-25 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (62, 492, 7, '2025-07-03 08:45:00');

-- Reacciones del Usuario 63 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (63, 43, 6, '2026-01-24 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (63, 93, 7, '2026-01-09 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (63, 143, 1, '2025-08-13 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (63, 193, 2, '2025-03-15 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (63, 243, 3, '2025-09-17 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (63, 293, 4, '2025-04-23 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (63, 343, 5, '2025-10-25 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (63, 393, 6, '2025-06-03 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (63, 443, 7, '2025-12-05 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (63, 493, 1, '2025-07-13 08:45:00');

-- Reacciones del Usuario 64 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (64, 44, 7, '2026-02-05 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (64, 94, 1, '2026-01-19 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (64, 144, 2, '2025-08-24 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (64, 194, 3, '2025-03-25 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (64, 244, 4, '2025-09-27 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (64, 294, 5, '2025-05-04 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (64, 344, 6, '2025-11-05 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (64, 394, 7, '2025-06-13 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (64, 444, 1, '2025-12-15 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (64, 494, 2, '2025-07-23 08:45:00');

-- Reacciones del Usuario 65 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (65, 45, 1, '2025-07-13 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (65, 95, 2, '2026-02-10 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (65, 145, 3, '2025-09-04 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (65, 195, 4, '2025-04-05 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (65, 245, 5, '2025-10-07 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (65, 295, 6, '2025-05-13 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (65, 345, 7, '2025-11-16 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (65, 395, 1, '2025-06-23 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (65, 445, 2, '2026-01-06 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (65, 495, 3, '2025-08-03 08:45:00');

-- Reacciones del Usuario 66 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (66, 46, 2, '2025-07-23 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (66, 96, 3, '2026-02-27 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (66, 146, 4, '2025-09-15 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (66, 196, 5, '2025-04-15 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (66, 246, 6, '2025-10-17 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (66, 296, 7, '2025-05-23 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (66, 346, 1, '2025-11-26 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (66, 396, 2, '2025-07-03 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (66, 446, 3, '2026-01-16 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (66, 496, 4, '2025-08-13 08:45:00');

-- Reacciones del Usuario 67 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (67, 47, 3, '2025-08-05 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (67, 97, 4, '2025-03-12 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (67, 147, 5, '2025-09-26 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (67, 197, 6, '2025-04-25 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (67, 247, 7, '2025-10-27 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (67, 297, 1, '2025-06-04 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (67, 347, 2, '2025-12-05 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (67, 397, 3, '2025-07-13 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (67, 447, 4, '2026-02-06 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (67, 497, 5, '2025-08-23 08:45:00');

-- Reacciones del Usuario 68 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (68, 48, 4, '2025-08-14 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (68, 98, 5, '2025-03-23 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (68, 148, 6, '2025-10-07 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (68, 198, 7, '2025-05-05 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (68, 248, 1, '2025-11-07 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (68, 298, 2, '2025-06-15 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (68, 348, 3, '2025-12-15 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (68, 398, 4, '2025-07-23 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (68, 448, 5, '2026-02-21 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (68, 498, 6, '2025-09-03 08:45:00');

-- Reacciones del Usuario 69 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (69, 49, 5, '2025-08-24 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (69, 99, 6, '2025-04-03 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (69, 149, 7, '2025-10-18 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (69, 199, 1, '2025-05-15 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (69, 249, 2, '2025-11-17 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (69, 299, 3, '2025-06-24 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (69, 349, 4, '2026-01-09 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (69, 399, 5, '2025-08-03 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (69, 449, 6, '2025-03-17 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (69, 499, 7, '2025-07-13 08:45:00');

-- Reacciones del Usuario 70 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (70, 50, 6, '2025-09-04 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (70, 100, 7, '2025-04-14 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (70, 150, 1, '2025-10-29 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (70, 200, 2, '2025-05-25 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (70, 250, 3, '2025-11-28 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (70, 300, 4, '2025-04-14 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (70, 350, 5, '2026-01-19 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (70, 400, 6, '2025-02-21 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (70, 450, 7, '2025-03-28 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (70, 500, 1, '2025-09-23 08:45:00');

-- Reacciones del Usuario 71 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (71, 51, 7, '2025-09-13 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (71, 101, 1, '2025-04-25 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (71, 151, 2, '2025-11-09 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (71, 201, 3, '2025-06-05 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (71, 251, 4, '2025-12-07 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (71, 301, 5, '2025-07-13 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (71, 351, 6, '2026-02-09 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (71, 401, 7, '2025-08-23 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (71, 451, 1, '2025-03-15 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (71, 501, 2, '2026-03-01 08:45:00');

-- Reacciones del Usuario 72 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (72, 52, 1, '2025-09-23 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (72, 102, 2, '2025-05-06 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (72, 152, 3, '2025-11-20 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (72, 202, 4, '2025-06-15 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (72, 252, 5, '2025-12-17 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (72, 302, 6, '2025-07-23 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (72, 352, 7, '2026-02-19 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (72, 402, 1, '2025-09-03 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (72, 452, 2, '2025-03-25 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (72, 502, 3, '2026-03-02 08:45:00');

-- Reacciones del Usuario 73 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (73, 53, 2, '2025-10-03 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (73, 103, 3, '2025-04-04 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (73, 153, 4, '2025-12-01 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (73, 203, 5, '2025-06-25 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (73, 253, 6, '2026-01-13 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (73, 303, 7, '2025-08-03 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (73, 353, 1, '2025-03-17 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (73, 403, 2, '2025-09-13 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (73, 453, 3, '2025-04-25 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (73, 503, 4, '2026-03-03 08:45:00');

-- Reacciones del Usuario 74 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (74, 54, 3, '2025-10-13 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (74, 104, 4, '2025-05-27 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (74, 154, 5, '2025-12-12 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (74, 204, 6, '2025-07-05 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (74, 254, 7, '2026-01-23 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (74, 304, 1, '2025-08-13 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (74, 354, 2, '2025-03-27 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (74, 404, 3, '2025-09-23 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (74, 454, 4, '2025-05-09 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (74, 504, 5, '2026-03-04 08:45:00');

-- Reacciones del Usuario 75 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (75, 55, 4, '2025-10-23 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (75, 105, 5, '2025-06-07 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (75, 155, 6, '2025-12-23 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (75, 205, 7, '2025-07-15 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (75, 255, 1, '2026-02-13 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (75, 305, 2, '2025-08-23 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (75, 355, 3, '2025-04-07 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (75, 405, 4, '2025-10-03 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (75, 455, 5, '2025-06-05 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (75, 505, 6, '2026-03-05 08:45:00');


-- Reacciones del Usuario 76 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (76, 56, 7, '2025-11-04 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (76, 106, 1, '2025-06-18 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (76, 156, 2, '2026-01-04 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (76, 206, 3, '2025-07-25 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (76, 256, 4, '2026-02-23 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (76, 306, 5, '2025-09-03 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (76, 356, 6, '2025-04-17 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (76, 406, 7, '2025-10-13 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (76, 456, 1, '2025-05-27 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (76, 506, 2, '2025-11-25 08:45:00');

-- Reacciones del Usuario 77 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (77, 57, 1, '2025-11-14 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (77, 107, 2, '2025-06-29 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (77, 157, 3, '2026-01-15 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (77, 207, 4, '2025-08-05 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (77, 257, 5, '2025-03-19 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (77, 307, 6, '2025-09-13 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (77, 357, 7, '2025-04-27 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (77, 407, 1, '2025-10-23 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (77, 457, 2, '2025-07-15 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (77, 507, 3, '2025-12-03 08:45:00');

-- Reacciones del Usuario 78 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (78, 58, 2, '2025-11-24 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (78, 108, 3, '2025-07-10 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (78, 158, 4, '2026-01-26 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (78, 208, 5, '2025-08-15 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (78, 258, 6, '2025-03-29 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (78, 308, 7, '2025-09-23 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (78, 358, 1, '2025-05-07 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (78, 408, 2, '2025-11-03 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (78, 458, 3, '2025-07-25 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (78, 508, 4, '2025-12-13 08:45:00');

-- Reacciones del Usuario 79 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (79, 59, 3, '2025-12-03 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (79, 109, 4, '2025-07-21 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (79, 159, 5, '2026-02-06 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (79, 209, 6, '2025-08-25 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (79, 259, 7, '2025-04-09 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (79, 309, 1, '2025-10-03 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (79, 359, 2, '2025-05-17 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (79, 409, 3, '2025-11-13 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (79, 459, 4, '2025-08-25 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (79, 509, 5, '2026-01-07 08:45:00');

-- Reacciones del Usuario 80 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (80, 60, 4, '2025-12-13 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (80, 110, 5, '2025-08-01 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (80, 160, 6, '2026-02-17 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (80, 210, 7, '2025-09-05 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (80, 260, 1, '2025-04-20 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (80, 310, 2, '2025-10-13 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (80, 360, 3, '2025-05-27 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (80, 410, 4, '2025-11-23 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (80, 460, 5, '2025-07-07 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (80, 510, 6, '2026-01-16 08:45:00');

-- Reacciones del Usuario 81 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (81, 61, 5, '2026-01-06 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (81, 111, 6, '2025-08-12 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (81, 161, 7, '2025-03-13 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (81, 211, 1, '2025-09-15 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (81, 261, 2, '2025-04-29 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (81, 311, 3, '2025-10-23 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (81, 361, 4, '2025-06-07 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (81, 411, 5, '2025-12-03 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (81, 461, 6, '2025-07-17 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (81, 511, 7, '2026-02-06 08:45:00');

-- Reacciones del Usuario 82 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (82, 62, 6, '2026-01-16 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (82, 112, 7, '2025-08-23 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (82, 162, 1, '2025-03-24 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (82, 212, 2, '2025-09-25 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (82, 262, 3, '2025-05-09 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (82, 312, 4, '2025-11-03 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (82, 362, 5, '2025-06-17 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (82, 412, 6, '2025-12-13 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (82, 462, 7, '2025-07-27 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (82, 512, 1, '2026-02-21 08:45:00');

-- Reacciones del Usuario 83 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (83, 63, 7, '2026-02-06 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (83, 113, 1, '2025-09-03 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (83, 163, 2, '2025-04-04 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (83, 213, 3, '2025-10-05 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (83, 263, 4, '2025-05-19 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (83, 313, 5, '2025-11-13 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (83, 363, 6, '2025-06-27 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (83, 413, 7, '2026-01-09 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (83, 463, 1, '2025-08-07 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (83, 513, 2, '2025-03-15 08:45:00');

-- Reacciones del Usuario 84 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (84, 64, 1, '2026-02-21 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (84, 114, 2, '2025-09-14 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (84, 164, 3, '2025-04-15 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (84, 214, 4, '2025-10-15 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (84, 264, 5, '2025-05-29 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (84, 314, 6, '2025-11-23 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (84, 364, 7, '2025-07-07 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (84, 414, 1, '2026-01-19 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (84, 464, 2, '2025-08-17 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (84, 514, 3, '2025-03-25 08:45:00');

-- Reacciones del Usuario 85 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (85, 65, 2, '2025-03-20 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (85, 115, 3, '2025-09-25 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (85, 165, 4, '2025-04-26 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (85, 215, 5, '2025-10-25 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (85, 265, 6, '2025-06-09 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (85, 315, 7, '2025-12-03 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (85, 365, 1, '2025-07-17 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (85, 415, 2, '2026-02-09 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (85, 465, 3, '2025-08-27 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (85, 515, 4, '2025-04-05 08:45:00');

-- Reacciones del Usuario 86 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (86, 66, 3, '2025-03-30 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (86, 116, 4, '2025-10-06 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (86, 166, 5, '2025-05-07 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (86, 216, 6, '2025-11-05 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (86, 266, 7, '2025-06-20 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (86, 316, 1, '2025-12-13 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (86, 366, 2, '2025-07-28 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (86, 416, 3, '2026-02-19 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (86, 466, 4, '2025-09-07 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (86, 516, 5, '2025-04-15 08:45:00');

-- Reacciones del Usuario 87 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (87, 67, 4, '2025-04-10 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (87, 117, 5, '2025-10-18 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (87, 167, 6, '2025-05-18 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (87, 217, 7, '2025-11-16 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (87, 267, 1, '2025-06-29 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (87, 317, 2, '2026-01-07 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (87, 367, 3, '2025-08-07 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (87, 417, 4, '2025-03-15 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (87, 467, 5, '2025-07-29 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (87, 517, 6, '2025-04-25 08:45:00');

-- Reacciones del Usuario 88 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (88, 68, 5, '2025-04-20 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (88, 118, 6, '2025-10-28 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (88, 168, 7, '2025-05-29 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (88, 218, 1, '2025-11-26 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (88, 268, 2, '2025-07-10 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (88, 318, 3, '2026-01-16 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (88, 368, 4, '2025-08-17 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (88, 418, 5, '2025-03-25 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (88, 468, 6, '2025-09-27 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (88, 518, 7, '2025-05-05 08:45:00');

-- Reacciones del Usuario 89 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (89, 69, 6, '2025-04-30 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (89, 119, 7, '2025-11-08 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (89, 169, 1, '2025-06-09 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (89, 219, 2, '2025-12-05 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (89, 269, 3, '2025-07-19 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (89, 319, 4, '2026-02-06 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (89, 369, 5, '2025-08-28 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (89, 419, 6, '2025-04-05 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (89, 469, 7, '2025-10-07 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (89, 519, 1, '2025-05-15 08:45:00');

-- Reacciones del Usuario 90 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (90, 70, 7, '2025-05-09 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (90, 120, 1, '2025-11-19 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (90, 170, 2, '2025-06-20 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (90, 220, 3, '2025-12-15 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (90, 270, 4, '2025-07-30 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (90, 320, 5, '2026-02-22 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (90, 370, 6, '2025-09-08 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (90, 420, 7, '2025-04-15 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (90, 470, 1, '2025-10-17 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (90, 520, 2, '2025-05-25 08:45:00');

-- Reacciones del Usuario 91 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (91, 71, 1, '2025-05-19 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (91, 121, 2, '2025-11-30 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (91, 171, 3, '2025-07-01 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (91, 221, 4, '2026-01-11 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (91, 271, 5, '2025-08-09 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (91, 321, 6, '2025-03-15 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (91, 371, 7, '2025-09-17 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (91, 421, 1, '2025-04-25 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (91, 471, 2, '2025-10-27 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (91, 521, 3, '2025-06-05 08:45:00');

-- Reacciones del Usuario 92 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (92, 72, 2, '2025-05-30 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (92, 122, 3, '2025-12-11 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (92, 172, 4, '2025-07-12 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (92, 222, 5, '2026-01-22 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (92, 272, 6, '2025-08-19 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (92, 322, 7, '2025-03-25 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (92, 372, 1, '2025-09-27 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (92, 422, 2, '2025-05-05 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (92, 472, 3, '2025-11-07 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (92, 522, 4, '2025-06-15 08:45:00');

-- Reacciones del Usuario 93 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (93, 73, 3, '2025-06-09 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (93, 123, 4, '2025-12-22 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (93, 173, 5, '2025-07-23 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (93, 223, 6, '2026-02-12 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (93, 273, 7, '2025-08-30 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (93, 323, 1, '2025-04-05 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (93, 373, 2, '2025-10-07 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (93, 423, 3, '2025-05-15 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (93, 473, 4, '2025-11-17 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (93, 523, 5, '2025-06-25 08:45:00');

-- Reacciones del Usuario 94 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (94, 74, 4, '2025-06-19 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (94, 124, 5, '2026-01-03 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (94, 174, 6, '2025-08-03 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (94, 224, 7, '2026-02-19 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (94, 274, 1, '2025-09-10 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (94, 324, 2, '2025-04-15 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (94, 374, 3, '2025-10-18 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (94, 424, 4, '2025-05-25 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (94, 474, 5, '2025-11-27 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (94, 524, 6, '2025-07-05 08:45:00');

-- Reacciones del Usuario 95 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (95, 75, 5, '2025-06-29 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (95, 125, 6, '2026-01-14 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (95, 175, 7, '2025-08-14 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (95, 225, 1, '2026-03-10 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (95, 275, 2, '2025-09-19 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (95, 325, 3, '2025-04-26 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (95, 375, 4, '2025-10-27 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (95, 425, 5, '2025-06-05 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (95, 475, 6, '2025-12-07 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (95, 525, 7, '2025-07-15 08:45:00');

-- Reacciones del Usuario 96 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (96, 76, 6, '2025-07-10 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (96, 126, 7, '2026-01-25 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (96, 176, 1, '2025-08-25 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (96, 226, 2, '2026-03-11 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (96, 276, 3, '2025-09-29 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (96, 326, 4, '2025-05-05 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (96, 376, 5, '2025-11-07 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (96, 426, 6, '2025-06-15 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (96, 476, 7, '2025-12-17 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (96, 526, 1, '2025-07-25 08:45:00');

-- Reacciones del Usuario 97 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (97, 77, 7, '2025-07-20 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (97, 127, 1, '2026-02-05 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (97, 177, 2, '2025-09-05 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (97, 227, 3, '2026-03-11 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (97, 277, 4, '2025-10-09 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (97, 327, 5, '2025-05-15 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (97, 377, 6, '2025-11-18 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (97, 427, 7, '2025-06-25 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (97, 477, 1, '2026-01-13 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (97, 527, 2, '2025-08-05 08:45:00');

-- Reacciones del Usuario 98 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (98, 78, 1, '2025-07-29 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (98, 128, 2, '2026-02-16 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (98, 178, 3, '2025-09-17 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (98, 228, 4, '2026-03-11 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (98, 278, 5, '2025-10-19 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (98, 328, 6, '2025-05-25 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (98, 378, 7, '2025-11-28 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (98, 428, 1, '2025-07-05 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (98, 478, 2, '2026-01-23 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (98, 528, 3, '2025-08-15 08:45:00');

-- Reacciones del Usuario 99 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (99, 79, 2, '2025-08-09 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (99, 129, 3, '2025-03-12 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (99, 179, 4, '2025-09-27 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (99, 229, 5, '2026-03-11 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (99, 279, 6, '2025-10-29 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (99, 329, 7, '2025-06-05 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (99, 379, 1, '2025-12-07 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (99, 429, 2, '2025-07-15 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (99, 479, 3, '2026-02-13 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (99, 529, 4, '2025-08-26 08:45:00');

-- Reacciones del Usuario 100 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (100, 80, 3, '2025-08-20 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (100, 130, 4, '2025-03-23 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (100, 180, 5, '2025-10-08 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (100, 230, 6, '2026-03-11 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (100, 280, 7, '2025-11-10 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (100, 330, 1, '2025-06-15 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (100, 380, 2, '2025-12-17 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (100, 430, 3, '2025-07-25 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (100, 480, 4, '2026-02-23 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (100, 530, 5, '2025-09-07 08:45:00');


-- Reacciones del Usuario 101 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (101, 501, 1, '2026-03-02 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (101, 551, 2, '2026-02-02 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (101, 601, 3, '2025-11-15 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (101, 651, 4, '2025-06-27 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (101, 701, 5, '2026-01-06 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (101, 751, 6, '2025-08-26 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (101, 800, 7, '2026-02-25 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (101, 510, 1, '2026-01-17 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (101, 560, 2, '2025-06-26 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (101, 610, 3, '2025-03-23 08:45:00');

-- Reacciones del Usuario 102 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (102, 502, 2, '2026-03-03 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (102, 552, 3, '2025-08-11 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (102, 602, 4, '2025-11-26 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (102, 652, 5, '2025-07-07 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (102, 702, 6, '2026-01-16 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (102, 752, 7, '2025-09-03 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (102, 799, 1, '2026-02-15 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (102, 511, 2, '2026-02-07 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (102, 561, 3, '2026-02-19 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (102, 611, 4, '2025-04-03 08:45:00');

-- Reacciones del Usuario 103 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (103, 503, 3, '2026-03-04 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (103, 553, 4, '2026-02-16 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (103, 603, 5, '2025-12-05 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (103, 653, 6, '2025-07-17 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (103, 703, 7, '2026-02-06 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (103, 753, 1, '2025-08-29 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (103, 798, 2, '2026-01-25 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (103, 512, 3, '2026-02-21 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (103, 562, 4, '2025-12-09 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (103, 612, 5, '2025-04-13 08:45:00');

-- Reacciones del Usuario 104 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (104, 504, 4, '2025-08-16 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (104, 554, 5, '2025-05-06 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (104, 604, 6, '2025-12-15 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (104, 654, 7, '2025-07-27 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (104, 704, 1, '2026-02-21 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (104, 754, 2, '2025-09-07 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (104, 797, 3, '2026-01-15 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (104, 513, 4, '2025-03-15 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (104, 563, 5, '2025-09-17 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (104, 613, 6, '2025-04-23 08:45:00');

-- Reacciones del Usuario 105 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (105, 505, 5, '2025-11-13 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (105, 555, 6, '2025-11-23 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (105, 605, 7, '2026-01-09 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (105, 655, 1, '2025-08-07 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (105, 705, 2, '2025-03-16 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (105, 755, 3, '2025-11-13 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (105, 796, 4, '2025-12-19 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (105, 514, 5, '2025-03-25 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (105, 564, 6, '2025-09-27 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (105, 614, 7, '2025-05-03 08:45:00');

-- Reacciones del Usuario 106 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (106, 506, 6, '2025-11-25 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (106, 556, 7, '2025-11-23 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (106, 606, 1, '2026-01-20 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (106, 656, 2, '2025-08-17 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (106, 706, 3, '2025-03-26 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (106, 756, 4, '2025-11-23 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (106, 795, 5, '2025-12-09 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (106, 515, 6, '2025-04-05 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (106, 565, 7, '2025-10-09 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (106, 615, 1, '2025-05-13 08:45:00');

-- Reacciones del Usuario 107 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (107, 507, 7, '2025-12-03 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (107, 557, 1, '2025-11-20 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (107, 607, 2, '2026-02-09 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (107, 657, 3, '2025-08-27 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (107, 707, 4, '2025-04-05 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (107, 757, 5, '2025-10-07 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (107, 794, 6, '2025-11-29 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (107, 516, 7, '2025-04-15 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (107, 566, 1, '2025-10-17 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (107, 616, 2, '2025-05-23 08:45:00');

-- Reacciones del Usuario 108 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (108, 508, 1, '2025-12-13 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (108, 558, 2, '2025-09-16 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (108, 608, 3, '2026-02-19 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (108, 658, 4, '2025-09-07 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (108, 708, 5, '2025-04-15 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (108, 758, 6, '2025-10-17 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (108, 793, 7, '2025-11-19 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (108, 517, 1, '2025-04-25 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (108, 567, 2, '2025-10-27 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (108, 617, 3, '2025-06-03 08:45:00');

-- Reacciones del Usuario 109 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (109, 509, 2, '2026-01-07 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (109, 559, 3, '2026-02-06 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (109, 609, 4, '2025-03-13 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (109, 659, 5, '2025-09-17 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (109, 709, 6, '2025-04-25 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (109, 759, 7, '2025-10-27 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (109, 792, 1, '2025-11-09 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (109, 518, 2, '2025-05-05 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (109, 568, 3, '2025-11-07 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (109, 618, 4, '2025-06-14 08:45:00');

-- Reacciones del Usuario 110 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (110, 510, 3, '2026-01-17 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (110, 560, 4, '2025-06-26 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (110, 610, 5, '2025-03-23 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (110, 660, 6, '2025-09-27 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (110, 710, 7, '2025-05-05 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (110, 760, 1, '2025-11-07 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (110, 791, 2, '2025-10-29 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (110, 519, 3, '2025-05-15 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (110, 569, 4, '2025-11-17 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (110, 619, 5, '2025-06-23 08:45:00');

-- Reacciones del Usuario 111 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (111, 511, 4, '2026-02-06 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (111, 561, 5, '2026-02-19 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (111, 611, 6, '2025-04-03 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (111, 661, 7, '2025-10-07 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (111, 711, 1, '2025-05-15 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (111, 761, 2, '2025-11-17 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (111, 790, 3, '2025-10-19 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (111, 520, 4, '2025-05-25 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (111, 570, 5, '2025-11-27 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (111, 620, 6, '2025-07-03 08:45:00');

-- Reacciones del Usuario 112 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (112, 512, 5, '2026-02-21 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (112, 562, 6, '2025-12-09 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (112, 612, 7, '2025-04-13 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (112, 662, 1, '2025-10-17 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (112, 712, 2, '2025-05-25 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (112, 762, 3, '2025-11-27 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (112, 789, 4, '2025-10-09 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (112, 521, 5, '2025-06-05 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (112, 571, 6, '2025-12-07 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (112, 621, 7, '2025-07-13 08:45:00');

-- Reacciones del Usuario 113 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (113, 513, 6, '2025-03-15 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (113, 563, 7, '2025-09-17 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (113, 613, 1, '2025-04-23 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (113, 663, 2, '2025-10-27 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (113, 713, 3, '2025-06-05 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (113, 763, 4, '2025-12-07 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (113, 788, 5, '2025-09-29 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (113, 522, 6, '2025-06-15 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (113, 572, 7, '2025-12-17 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (113, 622, 1, '2025-07-23 08:45:00');

-- Reacciones del Usuario 114 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (114, 514, 7, '2025-03-25 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (114, 564, 1, '2025-09-27 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (114, 614, 2, '2025-05-03 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (114, 664, 3, '2025-11-07 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (114, 714, 4, '2025-06-15 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (114, 764, 5, '2025-12-17 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (114, 787, 6, '2025-09-19 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (114, 523, 7, '2025-06-25 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (114, 573, 1, '2026-01-13 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (114, 623, 2, '2025-08-03 08:45:00');

-- Reacciones del Usuario 115 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (115, 515, 1, '2025-04-05 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (115, 565, 2, '2025-10-09 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (115, 615, 3, '2025-05-13 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (115, 665, 4, '2025-11-17 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (115, 715, 5, '2025-06-17 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (115, 765, 6, '2026-01-13 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (115, 786, 7, '2025-09-09 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (115, 524, 1, '2025-07-05 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (115, 574, 2, '2026-01-23 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (115, 624, 3, '2025-08-13 08:45:00');

-- Reacciones del Usuario 116 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (116, 516, 2, '2025-04-15 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (116, 566, 3, '2025-10-17 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (116, 616, 4, '2025-05-23 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (116, 666, 5, '2025-11-27 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (116, 716, 6, '2025-07-05 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (116, 766, 7, '2026-01-23 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (116, 785, 1, '2025-08-31 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (116, 525, 2, '2025-07-15 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (116, 575, 3, '2026-02-13 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (116, 625, 4, '2025-08-23 08:45:00');

-- Reacciones del Usuario 117 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (117, 517, 3, '2026-02-11 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (117, 567, 4, '2025-10-27 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (117, 617, 5, '2025-06-03 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (117, 667, 6, '2025-12-07 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (117, 717, 7, '2025-07-15 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (117, 767, 1, '2026-02-13 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (117, 784, 2, '2025-08-19 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (117, 526, 3, '2025-07-25 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (117, 576, 4, '2026-02-23 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (117, 626, 5, '2025-09-03 08:45:00');

-- Reacciones del Usuario 118 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (118, 518, 4, '2025-05-05 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (118, 568, 5, '2025-11-07 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (118, 618, 6, '2025-06-14 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (118, 668, 7, '2025-12-17 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (118, 718, 1, '2025-07-25 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (118, 768, 2, '2026-02-23 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (118, 783, 3, '2025-08-09 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (118, 527, 4, '2025-08-05 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (118, 577, 5, '2025-03-15 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (118, 627, 6, '2025-09-13 08:45:00');

-- Reacciones del Usuario 119 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (119, 519, 5, '2025-05-15 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (119, 569, 6, '2025-11-17 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (119, 619, 7, '2025-06-23 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (119, 669, 1, '2026-01-13 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (119, 719, 2, '2025-08-05 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (119, 750, 3, '2025-07-27 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (119, 782, 4, '2025-07-29 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (119, 528, 5, '2025-08-15 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (119, 578, 6, '2025-03-25 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (119, 628, 7, '2025-09-23 08:45:00');

-- Reacciones del Usuario 120 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (120, 520, 6, '2025-05-25 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (120, 570, 7, '2025-11-27 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (120, 620, 1, '2025-07-03 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (120, 670, 2, '2026-01-23 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (120, 720, 3, '2025-08-15 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (120, 749, 4, '2025-07-17 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (120, 781, 5, '2025-07-21 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (120, 529, 6, '2025-08-25 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (120, 579, 7, '2025-04-05 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (120, 629, 1, '2025-10-03 08:45:00');

-- Reacciones del Usuario 121 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (121, 521, 7, '2025-06-05 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (121, 571, 1, '2025-12-07 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (121, 621, 2, '2025-07-13 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (121, 671, 3, '2026-02-13 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (121, 721, 4, '2025-08-25 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (121, 748, 5, '2025-07-05 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (121, 780, 6, '2025-07-09 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (121, 530, 7, '2025-09-05 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (121, 580, 1, '2025-04-15 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (121, 630, 2, '2025-10-13 08:45:00');

-- Reacciones del Usuario 122 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (122, 522, 1, '2025-06-15 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (122, 572, 2, '2025-12-17 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (122, 622, 3, '2025-07-23 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (122, 672, 4, '2026-02-23 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (122, 722, 5, '2025-09-05 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (122, 747, 6, '2025-06-27 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (122, 779, 7, '2025-06-29 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (122, 531, 1, '2025-09-15 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (122, 581, 2, '2025-04-25 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (122, 631, 3, '2025-10-23 08:45:00');

-- Reacciones del Usuario 123 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (123, 523, 2, '2025-06-25 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (123, 573, 3, '2026-01-13 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (123, 623, 4, '2025-08-03 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (123, 673, 5, '2025-03-13 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (123, 723, 6, '2025-09-15 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (123, 746, 7, '2025-06-17 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (123, 778, 1, '2025-06-19 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (123, 532, 2, '2025-09-25 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (123, 582, 3, '2025-05-05 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (123, 632, 4, '2025-11-03 08:45:00');

-- Reacciones del Usuario 124 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (124, 524, 3, '2025-07-05 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (124, 574, 4, '2026-01-23 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (124, 624, 5, '2025-08-13 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (124, 674, 6, '2025-03-23 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (124, 724, 7, '2025-09-25 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (124, 745, 1, '2025-06-07 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (124, 777, 2, '2025-06-09 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (124, 533, 3, '2025-10-05 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (124, 583, 4, '2025-05-15 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (124, 633, 5, '2025-11-13 08:45:00');

-- Reacciones del Usuario 125 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (125, 525, 4, '2025-07-15 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (125, 575, 5, '2026-02-13 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (125, 625, 6, '2025-08-23 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (125, 675, 7, '2025-04-03 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (125, 725, 1, '2025-10-05 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (125, 744, 2, '2025-05-27 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (125, 776, 3, '2025-05-29 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (125, 534, 4, '2025-10-15 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (125, 584, 5, '2025-05-25 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (125, 634, 6, '2025-11-23 08:45:00');

-- Reacciones del Usuario 126 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (126, 526, 1, '2025-10-15 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (126, 576, 2, '2025-12-30 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (126, 626, 3, '2025-09-10 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (126, 676, 4, '2025-04-12 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (126, 726, 5, '2025-11-20 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (126, 776, 6, '2025-06-05 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (126, 536, 7, '2025-08-10 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (126, 586, 1, '2025-06-18 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (126, 636, 2, '2025-12-15 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (126, 686, 3, '2025-07-25 08:45:00');

-- Reacciones del Usuario 127 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (127, 527, 4, '2025-03-20 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (127, 577, 5, '2025-04-10 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (127, 627, 6, '2025-10-05 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (127, 677, 7, '2025-05-12 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (127, 727, 1, '2025-11-25 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (127, 777, 2, '2025-07-01 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (127, 537, 3, '2025-02-28 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (127, 587, 4, '2025-07-15 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (127, 637, 5, '2026-01-10 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (127, 687, 6, '2025-08-15 08:45:00');

-- Reacciones del Usuario 128 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (128, 528, 2, '2025-06-10 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (128, 578, 3, '2025-04-15 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (128, 628, 4, '2025-09-30 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (128, 678, 5, '2025-05-20 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (128, 728, 6, '2025-11-15 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (128, 778, 7, '2025-10-05 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (128, 538, 1, '2025-07-10 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (128, 588, 2, '2025-08-15 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (128, 638, 3, '2026-02-01 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (128, 688, 4, '2025-09-10 08:45:00');

-- Reacciones del Usuario 129 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (129, 529, 1, '2025-03-25 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (129, 579, 2, '2025-05-05 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (129, 629, 3, '2025-11-05 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (129, 679, 4, '2025-06-12 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (129, 729, 5, '2025-12-01 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (129, 779, 6, '2025-10-15 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (129, 539, 7, '2025-12-15 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (129, 589, 1, '2025-08-25 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (129, 639, 2, '2026-02-15 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (129, 689, 3, '2025-09-15 08:45:00');

-- Reacciones del Usuario 130 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (130, 530, 2, '2025-10-01 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (130, 580, 4, '2025-05-15 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (130, 630, 1, '2025-11-10 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (130, 680, 6, '2025-06-25 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (130, 730, 2, '2026-01-05 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (130, 780, 4, '2025-10-25 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (130, 540, 1, '2025-12-20 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (130, 590, 6, '2025-08-28 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (130, 640, 2, '2026-03-01 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (130, 690, 4, '2025-09-20 08:45:00');

-- Reacciones del Usuario 131 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (131, 531, 4, '2025-10-05 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (131, 581, 2, '2025-05-20 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (131, 631, 6, '2025-11-15 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (131, 681, 1, '2025-07-10 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (131, 731, 4, '2026-01-10 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (131, 781, 2, '2025-11-01 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (131, 541, 6, '2026-02-05 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (131, 591, 1, '2025-09-05 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (131, 641, 4, '2025-04-10 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (131, 691, 2, '2025-09-25 08:45:00');

-- Reacciones del Usuario 132 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (132, 532, 6, '2025-10-10 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (132, 582, 1, '2025-06-05 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (132, 632, 4, '2025-11-20 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (132, 682, 2, '2025-07-20 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (132, 732, 6, '2026-01-15 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (132, 782, 1, '2025-11-10 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (132, 542, 4, '2026-02-15 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (132, 592, 2, '2025-09-10 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (132, 642, 6, '2025-04-15 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (132, 692, 1, '2025-10-05 08:45:00');

-- Reacciones del Usuario 133 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (133, 533, 1, '2025-11-01 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (133, 583, 4, '2025-06-20 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (133, 633, 2, '2025-11-25 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (133, 683, 6, '2025-08-01 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (133, 733, 1, '2026-01-20 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (133, 783, 4, '2025-11-20 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (133, 543, 2, '2026-02-25 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (133, 593, 6, '2025-09-20 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (133, 643, 1, '2025-05-01 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (133, 693, 4, '2025-10-15 08:45:00');

-- Reacciones del Usuario 134 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (134, 534, 4, '2025-11-10 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (134, 584, 2, '2025-07-01 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (134, 634, 6, '2025-11-30 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (134, 684, 1, '2025-08-10 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (134, 734, 4, '2026-01-25 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (134, 784, 2, '2025-11-30 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (134, 544, 6, '2026-03-01 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (134, 594, 1, '2025-09-30 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (134, 644, 4, '2025-05-15 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (134, 694, 2, '2025-10-25 08:45:00');

-- Reacciones del Usuario 135 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (135, 535, 2, '2025-11-20 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (135, 585, 6, '2025-07-10 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (135, 635, 1, '2025-12-05 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (135, 685, 4, '2025-08-20 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (135, 735, 2, '2026-02-01 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (135, 785, 6, '2025-12-10 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (135, 545, 1, '2026-03-05 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (135, 595, 4, '2025-10-10 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (135, 645, 2, '2025-05-30 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (135, 695, 6, '2025-11-05 08:45:00');

-- Reacciones del Usuario 136 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (136, 536, 1, '2025-12-01 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (136, 586, 4, '2025-07-20 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (136, 636, 2, '2025-12-10 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (136, 686, 6, '2025-09-01 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (136, 736, 1, '2026-02-10 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (136, 786, 4, '2025-12-20 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (136, 546, 2, '2026-03-10 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (136, 596, 6, '2025-10-20 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (136, 646, 1, '2025-06-10 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (136, 696, 4, '2025-11-15 08:45:00');

-- Reacciones del Usuario 137 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (137, 537, 2, '2025-12-10 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (137, 587, 6, '2025-08-01 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (137, 637, 1, '2025-12-20 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (137, 687, 4, '2025-09-10 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (137, 737, 2, '2026-02-15 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (137, 787, 6, '2026-01-01 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (137, 547, 1, '2026-03-11 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (137, 597, 4, '2025-11-01 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (137, 647, 2, '2025-06-20 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (137, 697, 6, '2025-11-25 08:45:00');

-- Reacciones del Usuario 138 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (138, 538, 4, '2025-12-20 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (138, 588, 2, '2025-08-15 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (138, 638, 6, '2026-01-05 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (138, 688, 1, '2025-09-20 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (138, 738, 4, '2026-02-20 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (138, 788, 2, '2026-01-10 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (138, 548, 6, '2026-03-11 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (138, 598, 1, '2025-11-10 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (138, 648, 4, '2025-07-01 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (138, 698, 2, '2025-12-05 08:45:00');

-- Reacciones del Usuario 139 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (139, 539, 6, '2025-12-30 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (139, 589, 1, '2025-08-30 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (139, 639, 4, '2026-01-15 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (139, 689, 2, '2025-10-01 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (139, 739, 6, '2026-02-25 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (139, 789, 1, '2026-01-20 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (139, 549, 4, '2026-03-11 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (139, 599, 2, '2025-11-20 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (139, 649, 6, '2025-07-10 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (139, 699, 1, '2025-12-15 08:45:00');

-- Reacciones del Usuario 140 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (140, 540, 1, '2026-01-05 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (140, 590, 4, '2025-09-05 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (140, 640, 2, '2026-01-25 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (140, 690, 6, '2025-10-15 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (140, 740, 1, '2026-03-01 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (140, 790, 4, '2026-01-30 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (140, 550, 2, '2026-03-11 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (140, 600, 6, '2025-11-30 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (140, 650, 1, '2025-07-20 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (140, 700, 4, '2025-12-25 08:45:00');

-- Reacciones del Usuario 141 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (141, 541, 4, '2026-01-15 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (141, 591, 2, '2025-09-15 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (141, 641, 6, '2026-02-05 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (141, 691, 1, '2025-10-25 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (141, 741, 4, '2026-03-05 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (141, 791, 2, '2026-02-10 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (141, 551, 6, '2026-03-11 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (141, 601, 1, '2025-12-10 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (141, 651, 4, '2025-08-01 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (141, 701, 2, '2026-01-05 08:45:00');

-- Reacciones del Usuario 142 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (142, 542, 6, '2026-01-25 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (142, 592, 1, '2025-09-25 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (142, 642, 4, '2026-02-15 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (142, 692, 2, '2025-11-05 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (142, 742, 6, '2026-03-10 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (142, 792, 1, '2026-02-20 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (142, 552, 4, '2026-03-11 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (142, 602, 2, '2025-12-20 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (142, 652, 6, '2025-08-15 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (142, 702, 1, '2026-01-15 08:45:00');

-- Reacciones del Usuario 143 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (143, 543, 1, '2026-02-01 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (143, 593, 4, '2025-10-05 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (143, 643, 2, '2026-02-25 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (143, 693, 6, '2025-11-15 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (143, 743, 1, '2026-03-11 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (143, 793, 4, '2026-03-01 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (143, 553, 2, '2026-03-11 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (143, 603, 6, '2026-01-01 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (143, 653, 1, '2025-08-25 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (143, 703, 4, '2026-01-25 08:45:00');

-- Reacciones del Usuario 144 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (144, 544, 4, '2026-02-10 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (144, 594, 2, '2025-10-15 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (144, 644, 6, '2026-03-05 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (144, 694, 1, '2025-11-25 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (144, 744, 4, '2026-03-11 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (144, 794, 2, '2026-03-05 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (144, 554, 6, '2026-03-11 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (144, 604, 1, '2026-01-10 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (144, 654, 4, '2025-09-05 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (144, 704, 2, '2026-02-05 08:45:00');

-- Reacciones del Usuario 145 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (145, 545, 2, '2026-02-20 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (145, 595, 6, '2025-10-25 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (145, 645, 1, '2026-03-10 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (145, 695, 4, '2025-12-05 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (145, 745, 2, '2026-03-11 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (145, 795, 6, '2026-03-10 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (145, 555, 1, '2026-03-11 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (145, 605, 4, '2026-01-20 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (145, 655, 2, '2025-09-15 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (145, 705, 6, '2026-02-15 08:45:00');

-- Reacciones del Usuario 146 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (146, 546, 1, '2026-03-01 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (146, 596, 4, '2025-11-05 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (146, 646, 2, '2026-03-11 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (146, 696, 6, '2025-12-15 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (146, 746, 1, '2026-03-11 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (146, 796, 4, '2026-03-11 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (146, 556, 2, '2026-03-11 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (146, 606, 6, '2026-01-30 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (146, 656, 1, '2025-09-25 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (146, 706, 4, '2026-02-25 08:45:00');

-- Reacciones del Usuario 147 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (147, 547, 4, '2026-03-11 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (147, 597, 2, '2025-11-15 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (147, 647, 6, '2026-03-11 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (147, 697, 1, '2025-12-25 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (147, 747, 4, '2026-03-11 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (147, 797, 2, '2026-03-11 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (147, 557, 6, '2026-03-11 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (147, 607, 1, '2026-02-10 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (147, 657, 4, '2025-10-05 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (147, 707, 2, '2026-03-01 08:45:00');

-- Reacciones del Usuario 148 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (148, 548, 2, '2026-03-11 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (148, 598, 6, '2025-11-25 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (148, 648, 1, '2026-03-11 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (148, 698, 4, '2026-01-05 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (148, 748, 2, '2026-03-11 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (148, 798, 6, '2026-03-11 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (148, 558, 1, '2026-03-11 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (148, 608, 4, '2026-02-20 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (148, 658, 2, '2025-10-15 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (148, 708, 6, '2026-03-05 08:45:00');

-- Reacciones del Usuario 149 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (149, 549, 6, '2026-03-11 10:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (149, 599, 1, '2025-12-05 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (149, 649, 4, '2026-03-11 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (149, 699, 2, '2026-01-15 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (149, 749, 6, '2026-03-11 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (149, 799, 1, '2026-03-11 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (149, 559, 4, '2026-03-11 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (149, 609, 2, '2026-03-01 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (149, 659, 6, '2025-10-25 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (149, 709, 1, '2026-03-10 08:45:00');

-- Reacciones del Usuario 150 (10 reacciones)
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (150, 550, 1, '2026-03-11 11:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (150, 600, 4, '2025-12-15 14:15:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (150, 650, 2, '2026-03-11 18:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (150, 700, 6, '2026-01-25 10:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (150, 750, 1, '2026-03-11 21:00:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (150, 800, 4, '2026-03-11 12:45:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (150, 560, 2, '2026-03-11 15:10:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (150, 610, 6, '2026-03-05 11:30:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (150, 660, 1, '2025-11-05 16:20:00');
INSERT INTO UsuarioReaccionPublicacion (idUsuario, idPublicacion, idTipoReaccion, fecha_reaccion) VALUES (150, 710, 4, '2026-03-11 08:45:00');


-----------------etiquetas ---------------------

SET IDENTITY_INSERT Etiqueta ON;

INSERT INTO Etiqueta (id, nombre) VALUES 
(1, 'Gaming'), (2, 'Setup'), (3, 'PCMasterRace'), (4, 'Fitness'), (5, 'GymLife'),
(6, 'Saludable'), (7, 'Tecnologia'), (8, 'Software'), (9, 'Coding'), (10, 'ArteDigital'),
(11, 'Ilustracion'), (12, 'Sketch'), (13, 'Musica'), (14, 'Produccion'), (15, 'Guitarra'),
(16, 'Cocina'), (17, 'Recetas'), (18, 'Foodie'), (19, 'Vlog'), (20, 'EstiloDeVida'),
(21, 'Educacion'), (22, 'Aprender'), (23, 'Ciencia'), (24, 'ASMR'), (25, 'Relajacion'),
(26, 'Comedia'), (27, 'Humor'), (28, 'StandUp'), (29, 'Moda'), (30, 'Outfit'),
(31, 'Viajes'), (32, 'Turismo'), (33, 'Finanzas'), (34, 'Inversiones'), (35, 'Deportes'),
(36, 'Futbol'), (37, 'Cine'), (38, 'Peliculas'), (39, 'Literatura'), (40, 'Libros'),
(41, 'DIY'), (42, 'Manualidades'), (43, 'Politica'), (44, 'Mascotas'), (45, 'Astrologia'),
(46, 'Cosplay'), (47, 'Anime'), (48, 'Podcast'), (49, 'Exclusivo'), (50, 'Tendencias');

SET IDENTITY_INSERT Etiqueta OFF;


----------------publicacionEtiqueta-------------------------


-- Asociaciones para Publicaciones 1 a 200
INSERT INTO PublicacionEtiqueta (idPublicacion, idEtiqueta) VALUES 
-- Pubs 1-32 (Gaming) -> Tags 1, 2, 3, 49, 50
(1, 1), (1, 50), (2, 2), (2, 3), (3, 1), (3, 49), (4, 1), (4, 3), (5, 1), (5, 2),
(6, 1), (6, 50), (7, 3), (7, 49), (8, 1), (8, 2), (9, 2), (9, 3), (10, 1), (10, 50),
(11, 2), (11, 3), (12, 1), (12, 49), (13, 1), (13, 3), (14, 2), (14, 50), (15, 1), (15, 49),
(16, 2), (16, 3), (17, 1), (17, 50), (18, 2), (18, 3), (19, 1), (19, 49), (20, 1), (20, 3),
(21, 2), (21, 50), (22, 1), (22, 49), (23, 2), (23, 3), (24, 1), (24, 50), (25, 2), (25, 49),
(26, 1), (26, 3), (27, 2), (27, 50), (28, 1), (28, 49), (29, 2), (29, 3), (30, 1), (30, 50),
(31, 2), (31, 49), (32, 1), (32, 3),

-- Pubs 33-64 (Fitness) -> Tags 4, 5, 6, 49, 50
(33, 4), (33, 6), (34, 5), (34, 50), (35, 4), (35, 49), (36, 6), (36, 50), (37, 4), (37, 5),
(38, 5), (38, 6), (39, 4), (39, 49), (40, 6), (40, 50), (41, 4), (41, 5), (42, 5), (42, 6),
(43, 4), (43, 49), (44, 6), (44, 50), (45, 4), (45, 5), (46, 5), (46, 6), (47, 4), (47, 49),
(48, 6), (48, 50), (49, 4), (49, 5), (50, 5), (50, 6), (51, 4), (51, 49), (52, 6), (52, 50),
(53, 4), (53, 5), (54, 5), (54, 6), (55, 4), (55, 49), (56, 6), (56, 50), (57, 4), (57, 5),
(58, 5), (58, 6), (59, 4), (59, 49), (60, 6), (60, 50), (61, 4), (61, 5), (62, 5), (62, 6),
(63, 4), (63, 49), (64, 6), (64, 50),

-- Pubs 65-96 (Tech) -> Tags 7, 8, 9, 49, 50
(65, 7), (65, 8), (66, 9), (66, 50), (67, 7), (67, 49), (68, 8), (68, 50), (69, 7), (69, 9),
(70, 8), (70, 9), (71, 7), (71, 49), (72, 9), (72, 50), (73, 7), (73, 8), (74, 8), (74, 9),
(75, 7), (75, 49), (76, 9), (76, 50), (77, 7), (77, 8), (78, 8), (78, 9), (79, 7), (79, 49),
(80, 9), (80, 50), (81, 7), (81, 8), (82, 8), (82, 9), (83, 7), (83, 49), (84, 9), (84, 50),
(85, 7), (85, 8), (86, 8), (86, 9), (87, 7), (87, 49), (88, 9), (88, 50), (89, 7), (89, 8),
(90, 8), (90, 9), (91, 7), (91, 49), (92, 9), (92, 50), (93, 7), (93, 8), (94, 8), (94, 9),
(95, 7), (95, 49), (96, 9), (96, 50),

-- Pubs 97-128 (Arte) -> Tags 10, 11, 12, 49, 50
(97, 10), (97, 11), (98, 12), (98, 50), (99, 10), (99, 49), (100, 11), (100, 50), (101, 10), (101, 12),
(102, 11), (102, 12), (103, 10), (103, 49), (104, 12), (104, 50), (105, 10), (105, 11), (106, 11), (106, 12),
(107, 10), (107, 49), (108, 12), (108, 50), (109, 10), (109, 11), (110, 11), (110, 12), (111, 10), (111, 49),
(112, 12), (112, 50), (113, 10), (113, 11), (114, 11), (114, 12), (115, 10), (115, 49), (116, 12), (116, 50),
(117, 10), (117, 11), (118, 11), (118, 12), (119, 10), (119, 49), (120, 12), (120, 50), (121, 10), (121, 11),
(122, 11), (122, 12), (123, 10), (123, 49), (124, 12), (124, 50), (125, 10), (125, 11), (126, 11), (126, 12),
(127, 10), (127, 49), (128, 12), (128, 50),

-- Pubs 129-160 (Musica) -> Tags 13, 14, 15, 49, 50
(129, 13), (129, 14), (130, 15), (130, 50), (131, 13), (131, 49), (132, 14), (132, 50), (133, 13), (133, 15),
(134, 14), (134, 15), (135, 13), (135, 49), (136, 15), (136, 50), (137, 13), (137, 14), (138, 14), (138, 15),
(139, 13), (139, 49), (140, 15), (140, 50), (141, 13), (141, 14), (142, 14), (142, 15), (143, 13), (143, 49),
(144, 15), (144, 50), (145, 13), (145, 14), (146, 14), (146, 15), (147, 13), (147, 49), (148, 15), (148, 50),
(149, 13), (149, 14), (150, 14), (150, 15), (151, 13), (151, 49), (152, 15), (152, 50), (153, 13), (153, 14),
(154, 14), (154, 15), (155, 13), (155, 49), (156, 15), (156, 50), (157, 13), (157, 14), (158, 14), (158, 15),
(159, 13), (159, 49), (160, 15), (160, 50),

-- Pubs 161-200 (Cocina) -> Tags 16, 17, 18, 49, 50
(161, 16), (161, 17), (162, 18), (162, 50), (163, 16), (163, 49), (164, 17), (164, 50), (165, 16), (165, 18),
(166, 17), (166, 18), (167, 16), (167, 49), (168, 18), (168, 50), (169, 16), (169, 17), (170, 17), (170, 18),
(171, 16), (171, 49), (172, 18), (172, 50), (173, 16), (173, 17), (174, 17), (174, 18), (175, 16), (175, 49),
(176, 18), (176, 50), (177, 16), (177, 17), (178, 17), (178, 18), (179, 16), (179, 49), (180, 18), (180, 50),
(181, 16), (181, 17), (182, 17), (182, 18), (183, 16), (183, 49), (184, 18), (184, 50), (185, 16), (185, 17),
(186, 17), (186, 18), (187, 16), (187, 49), (188, 18), (188, 50), (189, 16), (189, 17), (190, 17), (190, 18),
(191, 16), (191, 49), (192, 18), (192, 50), (193, 16), (193, 17), (194, 17), (194, 18), (195, 16), (195, 49),
(196, 18), (196, 50), (197, 16), (197, 17), (198, 17), (198, 18), (199, 16), (199, 49), (200, 18), (200, 50);


-- Asociaciones para Publicaciones 201 a 400
-- Pubs 201-224 (Vlogs / Lifestyle) -> Tags 19, 20, 49, 50
(201, 19), (201, 20), (202, 19), (202, 50), (203, 20), (203, 49), (204, 19), (204, 50), (205, 19), (205, 20),
(206, 20), (206, 49), (207, 19), (207, 50), (208, 20), (208, 49), (209, 19), (209, 20), (210, 19), (210, 50),
(211, 20), (211, 49), (212, 19), (212, 50), (213, 20), (213, 49), (214, 19), (214, 20), (215, 20), (215, 49),
(216, 19), (216, 50), (217, 20), (217, 49), (218, 19), (218, 20), (219, 19), (219, 50), (220, 20), (220, 49),
(221, 19), (221, 20), (222, 20), (222, 49), (223, 19), (223, 50), (224, 20), (224, 49),

-- Pubs 225-256 (Educación / Ciencia) -> Tags 21, 22, 23, 49, 50
(225, 21), (225, 23), (226, 22), (226, 50), (227, 21), (227, 49), (228, 23), (228, 50), (229, 21), (229, 22),
(230, 22), (230, 49), (231, 21), (231, 23), (232, 22), (232, 50), (233, 21), (233, 49), (234, 23), (234, 50),
(235, 21), (235, 22), (236, 22), (236, 49), (237, 21), (237, 23), (238, 22), (238, 50), (239, 21), (239, 49),
(240, 23), (240, 50), (241, 21), (241, 22), (242, 22), (242, 49), (243, 21), (243, 23), (244, 22), (244, 50),
(245, 21), (245, 49), (246, 23), (246, 50), (247, 21), (247, 22), (248, 22), (248, 49), (249, 21), (249, 23),
(250, 22), (250, 50), (251, 21), (251, 49), (252, 23), (252, 50), (253, 21), (253, 22), (254, 22), (254, 49),
(255, 21), (255, 23), (256, 22), (256, 50),

-- Pubs 257-288 (ASMR / Relajación) -> Tags 24, 25, 49, 50
(257, 24), (257, 25), (258, 24), (258, 50), (259, 25), (259, 49), (260, 24), (260, 50), (261, 24), (261, 25),
(262, 25), (262, 49), (263, 24), (263, 50), (264, 25), (264, 49), (265, 24), (265, 25), (266, 24), (266, 50),
(267, 25), (267, 49), (268, 24), (268, 50), (269, 24), (269, 25), (270, 25), (270, 49), (271, 24), (271, 50),
(272, 25), (272, 49), (273, 24), (273, 25), (274, 24), (274, 50), (275, 25), (275, 49), (276, 24), (276, 50),
(277, 24), (277, 25), (278, 25), (278, 49), (279, 24), (279, 50), (280, 25), (280, 49), (281, 24), (281, 25),
(282, 24), (282, 50), (283, 25), (283, 49), (284, 24), (284, 50), (285, 24), (285, 25), (286, 25), (286, 49),
(287, 24), (287, 50), (288, 25), (288, 49),

-- Pubs 289-320 (Comedia / Humor) -> Tags 26, 27, 28, 49, 50
(289, 26), (289, 27), (290, 28), (290, 50), (291, 26), (291, 49), (292, 27), (292, 50), (293, 26), (293, 28),
(294, 27), (294, 28), (295, 26), (295, 49), (296, 28), (296, 50), (297, 26), (297, 27), (298, 27), (298, 28),
(299, 26), (299, 49), (300, 28), (300, 50), (301, 26), (301, 27), (302, 27), (302, 28), (303, 26), (303, 49),
(304, 28), (304, 50), (305, 26), (305, 27), (306, 27), (306, 28), (307, 26), (307, 49), (308, 28), (308, 50),
(309, 26), (309, 27), (310, 27), (310, 28), (311, 26), (311, 49), (312, 28), (312, 50), (313, 26), (313, 27),
(314, 27), (314, 28), (315, 26), (315, 49), (316, 28), (316, 50), (317, 26), (317, 27), (318, 27), (318, 28),
(319, 26), (319, 49), (320, 28), (320, 50),

-- Pubs 321-352 (Moda / Outfit) -> Tags 29, 30, 49, 50
(321, 29), (321, 30), (322, 29), (322, 50), (323, 30), (323, 49), (324, 29), (324, 50), (325, 29), (325, 30),
(326, 30), (326, 49), (327, 29), (327, 50), (328, 30), (328, 49), (329, 29), (329, 30), (330, 29), (330, 50),
(331, 30), (331, 49), (332, 29), (332, 50), (333, 29), (333, 30), (334, 30), (334, 49), (335, 29), (335, 50),
(336, 30), (336, 49), (337, 29), (337, 30), (338, 29), (338, 50), (339, 30), (339, 49), (340, 29), (340, 50),
(341, 29), (341, 30), (342, 30), (342, 49), (343, 29), (343, 50), (344, 30), (344, 49), (345, 29), (345, 30),
(346, 29), (346, 50), (347, 30), (347, 49), (348, 29), (348, 50), (349, 29), (349, 30), (350, 30), (350, 49),
(351, 29), (351, 50), (352, 30), (352, 49),

-- Pubs 353-384 (Viajes / Turismo) -> Tags 31, 32, 49, 50
(353, 31), (353, 32), (354, 31), (354, 50), (355, 32), (355, 49), (356, 31), (356, 50), (357, 31), (357, 32),
(358, 32), (358, 49), (359, 31), (359, 50), (360, 32), (360, 49), (361, 31), (361, 32), (362, 31), (362, 50),
(363, 32), (363, 49), (364, 31), (364, 50), (365, 31), (365, 32), (366, 32), (366, 49), (367, 31), (367, 50),
(368, 32), (368, 49), (369, 31), (369, 32), (370, 31), (370, 50), (371, 32), (371, 49), (372, 31), (372, 50),
(373, 31), (373, 32), (374, 32), (374, 49), (375, 31), (375, 50), (376, 32), (376, 49), (377, 31), (377, 32),
(378, 31), (378, 50), (379, 32), (379, 49), (380, 31), (380, 50), (381, 31), (381, 32), (382, 32), (382, 49),
(383, 31), (383, 50), (384, 32), (384, 49),

-- Pubs 385-400 (Finanzas / Inversiones) -> Tags 33, 34, 49, 50
(385, 33), (385, 34), (386, 33), (386, 50), (387, 34), (387, 49), (388, 33), (388, 50), (389, 33), (389, 34),
(390, 34), (390, 49), (391, 33), (391, 50), (392, 34), (392, 49), (393, 33), (393, 34), (394, 33), (394, 50),
(395, 34), (395, 49), (396, 33), (396, 50), (397, 33), (397, 34), (398, 34), (398, 49), (399, 33), (399, 50),
(400, 34), (400, 49);


-- Asociaciones para Publicaciones 401 a 600
-- Pubs 401-416 (Finanzas - continuación) -> Tags 33, 34, 49, 50
(401, 33), (401, 49), (402, 34), (402, 50), (403, 33), (403, 34), (404, 33), (404, 50), (405, 34), (405, 49),
(406, 33), (406, 34), (407, 33), (407, 50), (408, 34), (408, 49), (409, 33), (409, 34), (410, 33), (410, 50),
(411, 34), (411, 49), (412, 33), (412, 34), (413, 33), (413, 50), (414, 34), (414, 49), (415, 33), (415, 34),
(416, 33), (416, 50),

-- Pubs 417-448 (Deportes / Fútbol) -> Tags 35, 36, 49, 50
(417, 35), (417, 36), (418, 35), (418, 50), (419, 36), (419, 49), (420, 35), (420, 50), (421, 35), (421, 36),
(422, 36), (422, 49), (423, 35), (423, 50), (424, 36), (424, 49), (425, 35), (425, 36), (426, 35), (426, 50),
(427, 36), (427, 49), (428, 35), (428, 50), (429, 35), (429, 36), (430, 36), (430, 49), (431, 35), (431, 50),
(432, 36), (432, 49), (433, 35), (433, 36), (434, 35), (434, 50), (435, 36), (435, 49), (436, 35), (436, 50),
(437, 35), (437, 36), (438, 36), (438, 49), (439, 35), (439, 50), (440, 36), (440, 49), (441, 35), (441, 36),
(442, 35), (442, 50), (443, 36), (443, 49), (444, 35), (444, 50), (445, 35), (445, 36), (446, 36), (446, 49),
(447, 35), (447, 50), (448, 36), (448, 49),

-- Pubs 449-480 (Cine / Películas) -> Tags 37, 38, 49, 50
(449, 37), (449, 38), (450, 37), (450, 50), (451, 38), (451, 49), (452, 37), (452, 50), (453, 37), (453, 38),
(454, 38), (454, 49), (455, 37), (455, 50), (456, 38), (456, 49), (457, 37), (457, 38), (458, 35), (458, 50),
(459, 37), (459, 49), (460, 38), (460, 50), (461, 37), (461, 38), (462, 38), (462, 49), (463, 37), (463, 50),
(464, 38), (464, 49), (465, 37), (465, 38), (466, 37), (466, 50), (467, 38), (467, 49), (468, 37), (468, 50),
(469, 37), (469, 38), (470, 38), (470, 49), (471, 37), (471, 50), (472, 38), (472, 49), (473, 37), (473, 38),
(474, 37), (474, 50), (475, 38), (475, 49), (476, 37), (476, 50), (477, 37), (477, 38), (478, 38), (478, 49),
(479, 37), (479, 50), (480, 38), (480, 49),

-- Pubs 481-512 (Literatura / Libros) -> Tags 39, 40, 49, 50
(481, 39), (481, 40), (482, 39), (482, 50), (483, 40), (483, 49), (484, 39), (484, 50), (485, 39), (485, 40),
(486, 40), (486, 49), (487, 39), (487, 50), (488, 40), (488, 49), (489, 39), (489, 40), (490, 39), (490, 50),
(491, 40), (491, 49), (492, 39), (492, 50), (493, 39), (493, 40), (494, 40), (494, 49), (495, 39), (495, 50),
(496, 40), (496, 49), (497, 39), (497, 40), (498, 39), (498, 50), (499, 40), (499, 49), (500, 39), (500, 50),
(501, 39), (501, 40), (502, 40), (502, 49), (503, 39), (503, 50), (504, 40), (504, 49), (505, 39), (505, 40),
(506, 39), (506, 50), (507, 40), (507, 49), (508, 39), (508, 50), (509, 39), (509, 40), (510, 40), (510, 49),
(511, 39), (511, 50), (512, 40), (512, 49),

-- Pubs 513-544 (DIY / Manualidades) -> Tags 41, 42, 49, 50
(513, 41), (513, 42), (514, 41), (514, 50), (515, 42), (515, 49), (516, 41), (516, 50), (517, 41), (517, 42),
(518, 42), (518, 49), (519, 41), (519, 50), (520, 42), (520, 49), (521, 41), (521, 42), (522, 41), (522, 50),
(523, 42), (523, 49), (524, 41), (524, 50), (525, 41), (525, 42), (526, 42), (526, 49), (527, 41), (527, 50),
(528, 42), (528, 49), (529, 41), (529, 42), (530, 41), (530, 50), (531, 42), (531, 49), (532, 41), (532, 50),
(533, 41), (533, 42), (534, 42), (534, 49), (535, 41), (535, 50), (536, 42), (536, 49), (537, 41), (537, 42),
(538, 41), (538, 50), (539, 42), (539, 49), (540, 41), (540, 50), (541, 41), (541, 42), (542, 42), (542, 49),
(543, 41), (543, 50), (544, 42), (544, 49),

-- Pubs 545-576 (Política) -> Tags 43, 49, 50
(545, 43), (545, 50), (546, 43), (546, 49), (547, 43), (547, 50), (548, 43), (548, 49), (549, 43), (549, 50),
(550, 43), (550, 49), (551, 43), (551, 50), (552, 43), (552, 49), (553, 43), (553, 50), (554, 43), (554, 49),
(555, 43), (555, 50), (556, 43), (556, 49), (557, 43), (557, 50), (558, 43), (558, 49), (559, 43), (559, 50),
(560, 43), (560, 49), (561, 43), (561, 50), (562, 43), (562, 49), (563, 43), (563, 50), (564, 43), (564, 49),
(565, 43), (565, 50), (566, 43), (566, 49), (567, 43), (567, 50), (568, 43), (568, 49), (569, 43), (569, 50),
(570, 43), (570, 49), (571, 43), (571, 50), (572, 43), (572, 49), (573, 43), (573, 50), (574, 43), (574, 49),
(575, 43), (575, 50), (576, 43), (576, 49),

-- Pubs 577-600 (Mascotas) -> Tags 44, 49, 50
(577, 44), (577, 50), (578, 44), (578, 49), (579, 44), (579, 50), (580, 44), (580, 49), (581, 44), (581, 50),
(582, 44), (582, 49), (583, 44), (583, 50), (584, 44), (584, 49), (585, 44), (585, 50), (586, 44), (586, 49),
(587, 44), (587, 50), (588, 44), (588, 49), (589, 44), (589, 50), (590, 44), (590, 49), (591, 44), (591, 50),
(592, 44), (592, 49), (593, 44), (593, 50), (594, 44), (594, 49), (595, 44), (595, 50), (596, 44), (596, 49),
(597, 44), (597, 50), (598, 44), (598, 49), (599, 44), (599, 50), (600, 44), (600, 49);


-- Asociaciones para Publicaciones 601 a 800
-- Pubs 601-608 (Mascotas - continuación) -> Tags 44, 49, 50
(601, 44), (601, 49), (602, 44), (602, 50), (603, 44), (603, 49), (604, 44), (604, 50), (605, 44), (605, 49),
(606, 44), (606, 50), (607, 44), (607, 49), (608, 44), (608, 50),

-- Pubs 609-640 (Astrología) -> Tags 45, 49, 50
(609, 45), (609, 50), (610, 45), (610, 49), (611, 45), (611, 50), (612, 45), (612, 49), (613, 45), (613, 50),
(614, 45), (614, 49), (615, 45), (615, 50), (616, 45), (616, 49), (617, 45), (617, 50), (618, 45), (618, 49),
(619, 45), (619, 50), (620, 45), (620, 49), (621, 45), (621, 50), (622, 45), (622, 49), (623, 45), (623, 50),
(624, 45), (624, 49), (625, 45), (625, 50), (626, 45), (626, 49), (627, 45), (627, 50), (628, 45), (628, 49),
(629, 45), (629, 50), (630, 45), (630, 49), (631, 45), (631, 50), (632, 45), (632, 49), (633, 45), (633, 50),
(634, 45), (634, 49), (635, 45), (635, 50), (636, 45), (636, 49), (637, 45), (637, 50), (638, 45), (638, 49),
(639, 45), (639, 50), (640, 45), (640, 49),

-- Pubs 641-672 (Cosplay) -> Tags 46, 49, 50
(641, 46), (641, 50), (642, 46), (642, 49), (643, 46), (643, 50), (644, 46), (644, 49), (645, 46), (645, 50),
(646, 46), (646, 49), (647, 46), (647, 50), (648, 46), (648, 49), (649, 46), (649, 50), (650, 46), (650, 49),
(651, 46), (651, 50), (652, 46), (652, 49), (653, 46), (653, 50), (654, 46), (654, 49), (655, 46), (655, 50),
(656, 46), (656, 49), (657, 46), (657, 50), (658, 46), (658, 49), (659, 46), (659, 50), (660, 46), (660, 49),
(661, 46), (661, 50), (662, 46), (662, 49), (663, 46), (663, 50), (664, 46), (664, 49), (665, 46), (665, 50),
(666, 46), (666, 49), (667, 46), (667, 50), (668, 46), (668, 49), (669, 46), (669, 50), (670, 46), (670, 49),
(671, 46), (671, 50), (672, 46), (672, 49),

-- Pubs 673-704 (Modelaje) -> Tags 29, 30, 49, 50
(673, 29), (673, 50), (674, 30), (674, 49), (675, 29), (675, 50), (676, 30), (676, 49), (677, 29), (677, 50),
(678, 30), (678, 49), (679, 29), (679, 50), (680, 30), (680, 49), (681, 29), (681, 50), (682, 30), (682, 49),
(683, 29), (683, 50), (684, 30), (684, 49), (685, 29), (685, 50), (686, 30), (686, 49), (687, 29), (687, 50),
(688, 30), (688, 49), (689, 29), (689, 50), (690, 30), (690, 49), (691, 29), (691, 50), (692, 30), (692, 49),
(693, 29), (693, 50), (694, 30), (694, 49), (695, 29), (695, 50), (696, 30), (696, 49), (697, 29), (697, 50),
(698, 30), (698, 49), (699, 29), (699, 50), (700, 30), (700, 49), (701, 29), (701, 50), (702, 30), (702, 49),
(703, 29), (703, 50), (704, 30), (704, 49),

-- Pubs 705-736 (Anime) -> Tags 47, 49, 50
(705, 47), (705, 50), (706, 47), (706, 49), (707, 47), (707, 50), (708, 47), (708, 49), (709, 47), (709, 50),
(710, 47), (710, 49), (711, 47), (711, 50), (712, 47), (712, 49), (713, 47), (713, 50), (714, 47), (714, 49),
(715, 47), (715, 50), (716, 47), (716, 49), (717, 47), (717, 50), (718, 47), (718, 49), (719, 47), (719, 50),
(720, 47), (720, 49), (721, 47), (721, 50), (722, 47), (722, 49), (723, 47), (723, 50), (724, 47), (724, 49),
(725, 47), (725, 50), (726, 47), (726, 49), (727, 47), (727, 50), (728, 47), (728, 49), (729, 47), (729, 50),
(730, 47), (730, 49), (731, 47), (731, 50), (732, 47), (732, 49), (733, 47), (733, 50), (734, 47), (734, 49),
(735, 47), (735, 50), (736, 47), (736, 49),

-- Pubs 737-768 (Podcasts) -> Tags 48, 49, 50
(737, 48), (737, 50), (738, 48), (738, 49), (739, 48), (739, 50), (740, 48), (740, 49), (741, 48), (741, 50),
(742, 48), (742, 49), (743, 48), (743, 50), (744, 48), (744, 49), (745, 48), (745, 50), (746, 48), (746, 49),
(747, 48), (747, 50), (748, 48), (748, 49), (749, 48), (749, 50), (750, 48), (750, 49), (751, 48), (751, 50),
(752, 48), (752, 49), (753, 48), (753, 50), (754, 48), (754, 49), (755, 48), (755, 50), (756, 48), (756, 49),
(757, 48), (757, 50), (758, 48), (758, 49), (759, 48), (759, 50), (760, 48), (760, 49), (761, 48), (761, 50),
(762, 48), (762, 49), (763, 48), (763, 50), (764, 48), (764, 49), (765, 48), (765, 50), (766, 48), (766, 49),
(767, 48), (767, 50), (768, 48), (768, 49),

-- Pubs 769-800 (Gaming NSFW) -> Tags 1, 3, 49, 50
(769, 1), (769, 50), (770, 3), (770, 49), (771, 1), (771, 50), (772, 3), (772, 49), (773, 1), (773, 50),
(774, 3), (774, 49), (775, 1), (775, 50), (776, 3), (776, 49), (777, 1), (777, 50), (778, 3), (778, 49),
(779, 1), (779, 50), (780, 3), (780, 49), (781, 1), (781, 50), (782, 3), (782, 49), (783, 1), (783, 50),
(784, 3), (784, 49), (785, 1), (785, 50), (786, 3), (786, 49), (787, 1), (787, 50), (788, 3), (788, 49),
(789, 1), (789, 50), (790, 3), (790, 49), (791, 1), (791, 50), (792, 3), (792, 49), (793, 1), (793, 50),
(794, 3), (794, 49), (795, 1), (795, 50), (796, 3), (796, 49), (797, 1), (797, 50), (798, 3), (798, 49),
(799, 1), (799, 50), (800, 3), (800, 49);