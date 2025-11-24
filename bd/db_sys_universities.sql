/*
 Navicat Premium Data Transfer

 Source Server         : Localhost
 Source Server Type    : MySQL
 Source Server Version : 50715
 Source Host           : localhost:3306
 Source Schema         : db_sys_universities

 Target Server Type    : MySQL
 Target Server Version : 50715
 File Encoding         : 65001

 Date: 09/11/2025 20:10:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cat_departamentos
-- ----------------------------
DROP TABLE IF EXISTS `cat_departamentos`;
CREATE TABLE `cat_departamentos`  (
  `eCodDepartamento` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tNombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `eCodDireccionArea` int(11) NOT NULL,
  `tResponsable` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tCodEstatus` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`eCodDepartamento`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cat_departamentos
-- ----------------------------
INSERT INTO `cat_departamentos` VALUES (1, 'SISTEMAS', 1, 'LUIS VARGAS', 'AC');
INSERT INTO `cat_departamentos` VALUES (2, 'DIRECCION', 1, 'DIRECTOR', 'AC');
INSERT INTO `cat_departamentos` VALUES (3, 'OPERACIONES', 1, 'USUARIO', 'AC');

-- ----------------------------
-- Table structure for cat_empresas
-- ----------------------------
DROP TABLE IF EXISTS `cat_empresas`;
CREATE TABLE `cat_empresas`  (
  `eCodEmpresa` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tNombre` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tDireccion` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `tPaginaWeb` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tCodEstatus` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`eCodEmpresa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cat_empresas
-- ----------------------------
INSERT INTO `cat_empresas` VALUES (1, 'Universidad Tecnológica de Aguascalientes', 'Gerónimo de la Cuerva SN, Fracc Villas del Río, Aguascalientes, Ags', 'https://utma.edu.mx', 'AC');

-- ----------------------------
-- Table structure for cat_estadosmx
-- ----------------------------
DROP TABLE IF EXISTS `cat_estadosmx`;
CREATE TABLE `cat_estadosmx`  (
  `eCodEstado` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tNombre` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tCodEstatus` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'AC',
  PRIMARY KEY (`eCodEstado`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cat_estadosmx
-- ----------------------------
INSERT INTO `cat_estadosmx` VALUES (1, 'AGUASCALIENTES', 'AC');
INSERT INTO `cat_estadosmx` VALUES (2, 'BAJA CALIFORNIA NORTE', 'AC');
INSERT INTO `cat_estadosmx` VALUES (3, 'BAJA CALIFORNIA SUR', 'AC');
INSERT INTO `cat_estadosmx` VALUES (4, 'CAMPECHE', 'AC');
INSERT INTO `cat_estadosmx` VALUES (5, 'COAHUILA', 'AC');
INSERT INTO `cat_estadosmx` VALUES (6, 'COLIMA', 'AC');
INSERT INTO `cat_estadosmx` VALUES (7, 'CHIAPAS', 'AC');
INSERT INTO `cat_estadosmx` VALUES (8, 'CHIHUAHUA', 'AC');
INSERT INTO `cat_estadosmx` VALUES (9, 'CIUDAD DE MÉXICO', 'AC');
INSERT INTO `cat_estadosmx` VALUES (10, 'DURANGO', 'AC');
INSERT INTO `cat_estadosmx` VALUES (11, 'GUANAJUATO', 'AC');
INSERT INTO `cat_estadosmx` VALUES (12, 'GUERRERO', 'AC');
INSERT INTO `cat_estadosmx` VALUES (13, 'HIDALGO', 'AC');
INSERT INTO `cat_estadosmx` VALUES (14, 'JALISCO', 'AC');
INSERT INTO `cat_estadosmx` VALUES (15, 'ESTADO DE MÉXICO', 'AC');
INSERT INTO `cat_estadosmx` VALUES (16, 'MICHOACÁN', 'AC');
INSERT INTO `cat_estadosmx` VALUES (17, 'MORELOS', 'AC');
INSERT INTO `cat_estadosmx` VALUES (18, 'NAYARIT', 'AC');
INSERT INTO `cat_estadosmx` VALUES (19, 'NUEVO LEÓN', 'AC');
INSERT INTO `cat_estadosmx` VALUES (20, 'OAXACA', 'AC');
INSERT INTO `cat_estadosmx` VALUES (21, 'PUEBLA', 'AC');
INSERT INTO `cat_estadosmx` VALUES (22, 'QUERÉTARO', 'AC');
INSERT INTO `cat_estadosmx` VALUES (23, 'QUINTANA ROO', 'AC');
INSERT INTO `cat_estadosmx` VALUES (24, 'SAN LUIS POTOSÍ', 'AC');
INSERT INTO `cat_estadosmx` VALUES (25, 'SINALOA', 'AC');
INSERT INTO `cat_estadosmx` VALUES (26, 'SONORA', 'AC');
INSERT INTO `cat_estadosmx` VALUES (27, 'TABASCO', 'AC');
INSERT INTO `cat_estadosmx` VALUES (28, 'TAMAULIPAS', 'AC');
INSERT INTO `cat_estadosmx` VALUES (29, 'TLAXCALA', 'AC');
INSERT INTO `cat_estadosmx` VALUES (30, 'VERACRUZ', 'AC');
INSERT INTO `cat_estadosmx` VALUES (31, 'YUCATÁN', 'AC');
INSERT INTO `cat_estadosmx` VALUES (32, 'ZACATECAS', 'AC');

-- ----------------------------
-- Table structure for cat_estatus
-- ----------------------------
DROP TABLE IF EXISTS `cat_estatus`;
CREATE TABLE `cat_estatus`  (
  `eCodEstatus` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tCodEstatus` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tNombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tClase` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`eCodEstatus`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cat_estatus
-- ----------------------------
INSERT INTO `cat_estatus` VALUES (1, 'AC', 'ACTIVO', 'label label-success');
INSERT INTO `cat_estatus` VALUES (2, 'CA', 'CANCELADO', 'label label-warning');
INSERT INTO `cat_estatus` VALUES (3, 'EL', 'ELIMINADO', 'label label-danger');

-- ----------------------------
-- Table structure for cat_eventos
-- ----------------------------
DROP TABLE IF EXISTS `cat_eventos`;
CREATE TABLE `cat_eventos`  (
  `eCodEvento` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tNombre` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tNombreCorto` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tIcono` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tCodEstatus` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`eCodEvento`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cat_eventos
-- ----------------------------
INSERT INTO `cat_eventos` VALUES (1, 'Registro de datos', 'Registro', '<i class=\"fa fa-plus fa-fw text-success text-md va-middle\"></i>', 'AC');
INSERT INTO `cat_eventos` VALUES (2, 'Actualización de datos', 'Actualización', '<i class=\"fa fa-pencil fa-fw text-warning text-md va-middle\"></i>', 'AC');
INSERT INTO `cat_eventos` VALUES (3, 'Eliminación de datos', 'Eliminación', '<i class=\"fa fa-ban fa-fw text-danger text-md va-middle\"></i>', 'AC');
INSERT INTO `cat_eventos` VALUES (4, 'Consulta de información', 'Información', '<i class=\"fa fa-info fa-fw text-info text-md va-middle\"></i>', 'AC');
INSERT INTO `cat_eventos` VALUES (5, 'Impresión de PDF', 'PDF', '<i class=\"fa fa-file-pdf-o fa-fw text-muted text-md va-middle\"></i>', 'AC');
INSERT INTO `cat_eventos` VALUES (6, 'Exportación de Excel', 'Excel', '<i class=\"fa fa-file-excel-o fa-fw text-muted text-md va-middle\"></i>', 'AC');
INSERT INTO `cat_eventos` VALUES (7, 'Error de Sistema', 'Error', '<i class=\"fa fa-times-circle fa-fw text-danger text-md va-middle\"></i>', 'AC');
INSERT INTO `cat_eventos` VALUES (8, 'Logeo de Sistema', 'Logeo', '<i class=\"fa  fa-key fa-fw text-success text-md va-middle\"></i>', 'AC');
INSERT INTO `cat_eventos` VALUES (9, 'Navegación en Sistema', 'Navegación', '<i class=\"fa fa-globe fa-fw text-muted text-md va-middle\"></i>', 'AC');

-- ----------------------------
-- Table structure for cat_generos
-- ----------------------------
DROP TABLE IF EXISTS `cat_generos`;
CREATE TABLE `cat_generos`  (
  `eCodGenero` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tNombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`eCodGenero`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cat_generos
-- ----------------------------
INSERT INTO `cat_generos` VALUES (1, 'Masculino');
INSERT INTO `cat_generos` VALUES (2, 'Femenino');
INSERT INTO `cat_generos` VALUES (3, 'No Especificó');
INSERT INTO `cat_generos` VALUES (4, 'Otros');

-- ----------------------------
-- Table structure for cat_items
-- ----------------------------
DROP TABLE IF EXISTS `cat_items`;
CREATE TABLE `cat_items`  (
  `eCodItem` int(11) NOT NULL AUTO_INCREMENT,
  `tNombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `eCodTipoItem` int(11) NOT NULL,
  `tDescripcion` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `dPrecio` double(11, 2) NOT NULL,
  `fhFechaRegistro` datetime NOT NULL,
  `tCodEstatus` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'AC',
  PRIMARY KEY (`eCodItem`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cat_items
-- ----------------------------
INSERT INTO `cat_items` VALUES (1, 'Piña', 1, 'Es una fruta deliciosa', 25.00, '2024-05-24 16:49:50', 'AC');
INSERT INTO `cat_items` VALUES (2, 'Brócoli', 2, 'Es una verdura nutritiva', 40.00, '2024-05-24 16:50:16', 'AC');
INSERT INTO `cat_items` VALUES (3, 'a', 2, 'a', 15.00, '2024-05-24 23:48:15', 'AC');
INSERT INTO `cat_items` VALUES (4, 'b', 1, 'b', 21.00, '2024-05-24 23:51:40', 'EL');
INSERT INTO `cat_items` VALUES (5, 'c', 3, 'c', 621.00, '2024-05-24 23:55:32', 'CA');

-- ----------------------------
-- Table structure for cat_modulos
-- ----------------------------
DROP TABLE IF EXISTS `cat_modulos`;
CREATE TABLE `cat_modulos`  (
  `eCodModulo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tCodModulo` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ePosicion` int(11) NOT NULL,
  `tControlador` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tIcono` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tNombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tNombreCorto` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`eCodModulo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cat_modulos
-- ----------------------------
INSERT INTO `cat_modulos` VALUES (1, 'm1', 1, 'Configuracion', 'fa fa-cogs', 'CONFIGURACION', 'CONFIGURACION');
INSERT INTO `cat_modulos` VALUES (2, 'm2', 2, 'Usuario', 'fa fa-users', 'USUARIOS', 'USUARIOS');
INSERT INTO `cat_modulos` VALUES (3, 'm3', 3, 'Persona', 'fa fa-user', 'PERSONAS', 'PERSONAS');

-- ----------------------------
-- Table structure for cat_municipiosmx
-- ----------------------------
DROP TABLE IF EXISTS `cat_municipiosmx`;
CREATE TABLE `cat_municipiosmx`  (
  `eCodMunicipio` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `eCodEstado` int(11) UNSIGNED NULL DEFAULT NULL,
  `tNombre` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tCodEstatus` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'AC',
  PRIMARY KEY (`eCodMunicipio`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2459 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cat_municipiosmx
-- ----------------------------
INSERT INTO `cat_municipiosmx` VALUES (1, 1, 'AGUASCALIENTES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2, 1, 'ASIENTOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (3, 1, 'CALVILLO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (4, 1, 'COSÍO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (5, 1, 'JESÚS MARÍA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (6, 1, 'PABELLÓN DE ARTEAGA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (7, 1, 'RINCÓN DE ROMOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (8, 1, 'SAN JOSÉ DE GRACIA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (9, 1, 'TEPEZALÁ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (10, 1, 'EL LLANO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (11, 1, 'SAN FRANCISCO DE LOS ROMO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (12, 2, 'ENSENADA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (13, 2, 'MEXICALI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (14, 2, 'TECATE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (15, 2, 'TIJUANA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (16, 2, 'PLAYAS DE ROSARITO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (17, 3, 'COMONDÚ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (18, 3, 'MULEGÉ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (19, 3, 'LA PAZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (20, 3, 'LOS CABOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (21, 3, 'LORETO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (22, 4, 'CALKINÍ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (23, 4, 'CAMPECHE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (24, 4, 'CARMEN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (25, 4, 'CHAMPOTÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (26, 4, 'HECELCHAKÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (27, 4, 'HOPELCHÉN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (28, 4, 'PALIZADA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (29, 4, 'TENABO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (30, 4, 'ESCÁRCEGA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (31, 4, 'CALAKMUL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (32, 4, 'CANDELARIA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (33, 5, 'ABASOLO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (34, 5, 'ACUÑA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (35, 5, 'ALLENDE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (36, 5, 'ARTEAGA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (37, 5, 'CANDELA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (38, 5, 'CASTAÑOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (39, 5, 'CUATRO CIÉNEGAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (40, 5, 'ESCOBEDO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (41, 5, 'FRANCISCO I. MADERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (42, 5, 'FRONTERA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (43, 5, 'GENERAL CEPEDA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (44, 5, 'GUERRERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (45, 5, 'HIDALGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (46, 5, 'JIMÉNEZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (47, 5, 'JUÁREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (48, 5, 'LAMADRID', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (49, 5, 'MATAMOROS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (50, 5, 'MONCLOVA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (51, 5, 'MORELOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (52, 5, 'MÚZQUIZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (53, 5, 'NADADORES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (54, 5, 'NAVA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (55, 5, 'OCAMPO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (56, 5, 'PARRAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (57, 5, 'PIEDRAS NEGRAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (58, 5, 'PROGRESO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (59, 5, 'RAMOS ARIZPE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (60, 5, 'SABINAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (61, 5, 'SACRAMENTO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (62, 5, 'SALTILLO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (63, 5, 'SAN BUENAVENTURA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (64, 5, 'SAN JUAN DE SABINAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (65, 5, 'SAN PEDRO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (66, 5, 'SIERRA MOJADA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (67, 5, 'TORREÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (68, 5, 'VIESCA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (69, 5, 'VILLA UNIÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (70, 5, 'ZARAGOZA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (71, 6, 'ARMERÍA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (72, 6, 'COLIMA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (73, 6, 'COMALA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (74, 6, 'COQUIMATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (75, 6, 'CUAUHTÉMOC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (76, 6, 'IXTLAHUACÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (77, 6, 'MANZANILLO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (78, 6, 'MINATITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (79, 6, 'TECOMÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (80, 6, 'VILLA DE ÁLVAREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (81, 7, 'ACACOYAGUA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (82, 7, 'ACALA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (83, 7, 'ACAPETAHUA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (84, 7, 'ALTAMIRANO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (85, 7, 'AMATÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (86, 7, 'AMATENANGO DE LA FRONTERA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (87, 7, 'AMATENANGO DEL VALLE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (88, 7, 'ANGEL ALBINO CORZO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (89, 7, 'ARRIAGA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (90, 7, 'BEJUCAL DE OCAMPO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (91, 7, 'BELLA VISTA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (92, 7, 'BERRIOZÁBAL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (93, 7, 'BOCHIL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (94, 7, 'EL BOSQUE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (95, 7, 'CACAHOATÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (96, 7, 'CATAZAJÁ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (97, 7, 'CINTALAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (98, 7, 'COAPILLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (99, 7, 'COMITÁN DE DOMÍNGUEZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (100, 7, 'LA CONCORDIA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (101, 7, 'COPAINALÁ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (102, 7, 'CHALCHIHUITÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (103, 7, 'CHAMULA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (104, 7, 'CHANAL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (105, 7, 'CHAPULTENANGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (106, 7, 'CHENALHÓ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (107, 7, 'CHIAPA DE CORZO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (108, 7, 'CHIAPILLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (109, 7, 'CHICOASÉN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (110, 7, 'CHICOMUSELO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (111, 7, 'CHILÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (112, 7, 'ESCUINTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (113, 7, 'FRANCISCO LEÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (114, 7, 'FRONTERA COMALAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (115, 7, 'FRONTERA HIDALGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (116, 7, 'LA GRANDEZA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (117, 7, 'HUEHUETÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (118, 7, 'HUIXTÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (119, 7, 'HUITIUPÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (120, 7, 'HUIXTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (121, 7, 'LA INDEPENDENCIA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (122, 7, 'IXHUATÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (123, 7, 'IXTACOMITÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (124, 7, 'IXTAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (125, 7, 'IXTAPANGAJOYA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (126, 7, 'JIQUIPILAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (127, 7, 'JITOTOL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (128, 7, 'JUÁREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (129, 7, 'LARRÁINZAR', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (130, 7, 'LA LIBERTAD', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (131, 7, 'MAPASTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (132, 7, 'LAS MARGARITAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (133, 7, 'MAZAPA DE MADERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (134, 7, 'MAZATÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (135, 7, 'METAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (136, 7, 'MITONTIC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (137, 7, 'MOTOZINTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (138, 7, 'NICOLÁS RUÍZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (139, 7, 'OCOSINGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (140, 7, 'OCOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (141, 7, 'OCOZOCOAUTLA DE ESPINOSA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (142, 7, 'OSTUACÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (143, 7, 'OSUMACINTA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (144, 7, 'OXCHUC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (145, 7, 'PALENQUE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (146, 7, 'PANTELHÓ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (147, 7, 'PANTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (148, 7, 'PICHUCALCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (149, 7, 'PIJIJIAPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (150, 7, 'EL PORVENIR', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (151, 7, 'VILLA COMALTITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (152, 7, 'PUEBLO NUEVO SOLISTAHUACÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (153, 7, 'RAYÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (154, 7, 'REFORMA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (155, 7, 'LAS ROSAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (156, 7, 'SABANILLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (157, 7, 'SALTO DE AGUA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (158, 7, 'SAN CRISTÓBAL DE LAS CASAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (159, 7, 'SAN FERNANDO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (160, 7, 'SILTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (161, 7, 'SIMOJOVEL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (162, 7, 'SITALÁ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (163, 7, 'SOCOLTENANGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (164, 7, 'SOLOSUCHIAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (165, 7, 'SOYALÓ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (166, 7, 'SUCHIAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (167, 7, 'SUCHIATE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (168, 7, 'SUNUAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (169, 7, 'TAPACHULA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (170, 7, 'TAPALAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (171, 7, 'TAPILULA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (172, 7, 'TECPATÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (173, 7, 'TENEJAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (174, 7, 'TEOPISCA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (175, 7, 'TILA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (176, 7, 'TONALÁ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (177, 7, 'TOTOLAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (178, 7, 'LA TRINITARIA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (179, 7, 'TUMBALÁ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (180, 7, 'TUXTLA GUTIÉRREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (181, 7, 'TUXTLA CHICO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (182, 7, 'TUZANTÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (183, 7, 'TZIMOL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (184, 7, 'UNIÓN JUÁREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (185, 7, 'VENUSTIANO CARRANZA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (186, 7, 'VILLA CORZO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (187, 7, 'VILLAFLORES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (188, 7, 'YAJALÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (189, 7, 'SAN LUCAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (190, 7, 'ZINACANTÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (191, 7, 'SAN JUAN CANCUC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (192, 7, 'ALDAMA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (193, 7, 'BENEMÉRITO DE LAS AMÉRICAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (194, 7, 'MARAVILLA TENEJAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (195, 7, 'MARQUÉS DE COMILLAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (196, 7, 'MONTECRISTO DE GUERRERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (197, 7, 'SAN ANDRÉS DURAZNAL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (198, 7, 'SANTIAGO EL PINAR', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (199, 8, 'AHUMADA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (200, 8, 'ALDAMA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (201, 8, 'ALLENDE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (202, 8, 'AQUILES SERDÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (203, 8, 'ASCENSIÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (204, 8, 'BACHÍNIVA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (205, 8, 'BALLEZA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (206, 8, 'BATOPILAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (207, 8, 'BOCOYNA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (208, 8, 'BUENAVENTURA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (209, 8, 'CAMARGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (210, 8, 'CARICHÍ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (211, 8, 'CASAS GRANDES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (212, 8, 'CORONADO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (213, 8, 'COYAME DEL SOTOL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (214, 8, 'LA CRUZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (215, 8, 'CUAUHTÉMOC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (216, 8, 'CUSIHUIRIACHI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (217, 8, 'CHIHUAHUA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (218, 8, 'CHÍNIPAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (219, 8, 'DELICIAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (220, 8, 'DR. BELISARIO DOMÍNGUEZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (221, 8, 'GALEANA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (222, 8, 'SANTA ISABEL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (223, 8, 'GÓMEZ FARÍAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (224, 8, 'GRAN MORELOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (225, 8, 'GUACHOCHI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (226, 8, 'GUADALUPE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (227, 8, 'GUADALUPE Y CALVO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (228, 8, 'GUAZAPARES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (229, 8, 'GUERRERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (230, 8, 'HIDALGO DEL PARRAL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (231, 8, 'HUEJOTITÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (232, 8, 'IGNACIO ZARAGOZA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (233, 8, 'JANOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (234, 8, 'JIMÉNEZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (235, 8, 'JUÁREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (236, 8, 'JULIMES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (237, 8, 'LÓPEZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (238, 8, 'MADERA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (239, 8, 'MAGUARICHI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (240, 8, 'MANUEL BENAVIDES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (241, 8, 'MATACHÍ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (242, 8, 'MATAMOROS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (243, 8, 'MEOQUI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (244, 8, 'MORELOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (245, 8, 'MORIS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (246, 8, 'NAMIQUIPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (247, 8, 'NONOAVA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (248, 8, 'NUEVO CASAS GRANDES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (249, 8, 'OCAMPO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (250, 8, 'OJINAGA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (251, 8, 'PRAXEDIS G. GUERRERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (252, 8, 'RIVA PALACIO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (253, 8, 'ROSALES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (254, 8, 'ROSARIO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (255, 8, 'SAN FRANCISCO DE BORJA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (256, 8, 'SAN FRANCISCO DE CONCHOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (257, 8, 'SAN FRANCISCO DEL ORO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (258, 8, 'SANTA BÁRBARA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (259, 8, 'SATEVÓ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (260, 8, 'SAUCILLO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (261, 8, 'TEMÓSACHIC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (262, 8, 'EL TULE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (263, 8, 'URIQUE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (264, 8, 'URUACHI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (265, 8, 'VALLE DE ZARAGOZA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (266, 9, 'AZCAPOTZALCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (267, 9, 'COYOACÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (268, 9, 'CUAJIMALPA DE MORELOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (269, 9, 'GUSTAVO A. MADERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (270, 9, 'IZTACALCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (271, 9, 'IZTAPALAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (272, 9, 'LA MAGDALENA CONTRERAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (273, 9, 'MILPA ALTA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (274, 9, 'ÁLVARO OBREGÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (275, 9, 'TLÁHUAC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (276, 9, 'TLALPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (277, 9, 'XOCHIMILCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (278, 9, 'BENITO JUAREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (279, 9, 'CUAUHTÉMOC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (280, 9, 'MIGUEL HIDALGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (281, 9, 'VENUSTIANO CARRANZA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (282, 10, 'CANATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (283, 10, 'CANELAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (284, 10, 'CONETO DE COMONFORT', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (285, 10, 'CUENCAMÉ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (286, 10, 'DURANGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (287, 10, 'GENERAL SIMÓN BOLÍVAR', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (288, 10, 'GÓMEZ PALACIO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (289, 10, 'GUADALUPE VICTORIA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (290, 10, 'GUANACEVÍ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (291, 10, 'HIDALGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (292, 10, 'INDÉ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (293, 10, 'LERDO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (294, 10, 'MAPIMÍ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (295, 10, 'MEZQUITAL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (296, 10, 'NAZAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (297, 10, 'NOMBRE DE DIOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (298, 10, 'OCAMPO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (299, 10, 'EL ORO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (300, 10, 'OTÁEZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (301, 10, 'PÁNUCO DE CORONADO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (302, 10, 'PEÑÓN BLANCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (303, 10, 'POANAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (304, 10, 'PUEBLO NUEVO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (305, 10, 'RODEO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (306, 10, 'SAN BERNARDO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (307, 10, 'SAN DIMAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (308, 10, 'SAN JUAN DE GUADALUPE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (309, 10, 'SAN JUAN DEL RÍO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (310, 10, 'SAN LUIS DEL CORDERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (311, 10, 'SAN PEDRO DEL GALLO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (312, 10, 'SANTA CLARA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (313, 10, 'SANTIAGO PAPASQUIARO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (314, 10, 'SÚCHIL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (315, 10, 'TAMAZULA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (316, 10, 'TEPEHUANES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (317, 10, 'TLAHUALILO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (318, 10, 'TOPIA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (319, 10, 'VICENTE GUERRERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (320, 10, 'NUEVO IDEAL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (321, 11, 'ABASOLO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (322, 11, 'ACÁMBARO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (323, 11, 'SAN MIGUEL DE ALLENDE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (324, 11, 'APASEO EL ALTO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (325, 11, 'APASEO EL GRANDE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (326, 11, 'ATARJEA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (327, 11, 'CELAYA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (328, 11, 'MANUEL DOBLADO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (329, 11, 'COMONFORT', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (330, 11, 'CORONEO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (331, 11, 'CORTAZAR', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (332, 11, 'CUERÁMARO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (333, 11, 'DOCTOR MORA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (334, 11, 'DOLORES HIDALGO CUNA DE LA INDEPENDENCIA NACIONAL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (335, 11, 'GUANAJUATO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (336, 11, 'HUANÍMARO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (337, 11, 'IRAPUATO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (338, 11, 'JARAL DEL PROGRESO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (339, 11, 'JERÉCUARO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (340, 11, 'LEÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (341, 11, 'MOROLEÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (342, 11, 'OCAMPO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (343, 11, 'PÉNJAMO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (344, 11, 'PUEBLO NUEVO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (345, 11, 'PURÍSIMA DEL RINCÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (346, 11, 'ROMITA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (347, 11, 'SALAMANCA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (348, 11, 'SALVATIERRA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (349, 11, 'SAN DIEGO DE LA UNIÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (350, 11, 'SAN FELIPE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (351, 11, 'SAN FRANCISCO DEL RINCÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (352, 11, 'SAN JOSÉ ITURBIDE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (353, 11, 'SAN LUIS DE LA PAZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (354, 11, 'SANTA CATARINA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (355, 11, 'SANTA CRUZ DE JUVENTINO ROSAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (356, 11, 'SANTIAGO MARAVATÍO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (357, 11, 'SILAO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (358, 11, 'TARANDACUAO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (359, 11, 'TARIMORO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (360, 11, 'TIERRA BLANCA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (361, 11, 'URIANGATO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (362, 11, 'VALLE DE SANTIAGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (363, 11, 'VICTORIA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (364, 11, 'VILLAGRÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (365, 11, 'XICHÚ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (366, 11, 'YURIRIA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (367, 12, 'ACAPULCO DE JUÁREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (368, 12, 'AHUACUOTZINGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (369, 12, 'AJUCHITLÁN DEL PROGRESO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (370, 12, 'ALCOZAUCA DE GUERRERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (371, 12, 'ALPOYECA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (372, 12, 'APAXTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (373, 12, 'ARCELIA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (374, 12, 'ATENANGO DEL RÍO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (375, 12, 'ATLAMAJALCINGO DEL MONTE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (376, 12, 'ATLIXTAC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (377, 12, 'ATOYAC DE ÁLVAREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (378, 12, 'AYUTLA DE LOS LIBRES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (379, 12, 'AZOYÚ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (380, 12, 'BENITO JUÁREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (381, 12, 'BUENAVISTA DE CUÉLLAR', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (382, 12, 'COAHUAYUTLA DE JOSÉ MARÍA IZAZAGA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (383, 12, 'COCULA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (384, 12, 'COPALA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (385, 12, 'COPALILLO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (386, 12, 'COPANATOYAC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (387, 12, 'COYUCA DE BENÍTEZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (388, 12, 'COYUCA DE CATALÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (389, 12, 'CUAJINICUILAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (390, 12, 'CUALÁC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (391, 12, 'CUAUTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (392, 12, 'CUETZALA DEL PROGRESO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (393, 12, 'CUTZAMALA DE PINZÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (394, 12, 'CHILAPA DE ÁLVAREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (395, 12, 'CHILPANCINGO DE LOS BRAVO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (396, 12, 'FLORENCIO VILLARREAL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (397, 12, 'GENERAL CANUTO A. NERI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (398, 12, 'GENERAL HELIODORO CASTILLO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (399, 12, 'HUAMUXTITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (400, 12, 'HUITZUCO DE LOS FIGUEROA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (401, 12, 'IGUALA DE LA INDEPENDENCIA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (402, 12, 'IGUALAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (403, 12, 'IXCATEOPAN DE CUAUHTÉMOC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (404, 12, 'ZIHUATANEJO DE AZUETA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (405, 12, 'JUAN R. ESCUDERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (406, 12, 'LEONARDO BRAVO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (407, 12, 'MALINALTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (408, 12, 'MÁRTIR DE CUILAPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (409, 12, 'METLATÓNOC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (410, 12, 'MOCHITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (411, 12, 'OLINALÁ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (412, 12, 'OMETEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (413, 12, 'PEDRO ASCENCIO ALQUISIRAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (414, 12, 'PETATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (415, 12, 'PILCAYA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (416, 12, 'PUNGARABATO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (417, 12, 'QUECHULTENANGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (418, 12, 'SAN LUIS ACATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (419, 12, 'SAN MARCOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (420, 12, 'SAN MIGUEL TOTOLAPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (421, 12, 'TAXCO DE ALARCÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (422, 12, 'TECOANAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (423, 12, 'TÉCPAN DE GALEANA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (424, 12, 'TELOLOAPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (425, 12, 'TEPECOACUILCO DE TRUJANO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (426, 12, 'TETIPAC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (427, 12, 'TIXTLA DE GUERRERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (428, 12, 'TLACOACHISTLAHUACA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (429, 12, 'TLACOAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (430, 12, 'TLALCHAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (431, 12, 'TLALIXTAQUILLA DE MALDONADO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (432, 12, 'TLAPA DE COMONFORT', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (433, 12, 'TLAPEHUALA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (434, 12, 'LA UNIÓN DE ISIDORO MONTES DE OCA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (435, 12, 'XALPATLÁHUAC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (436, 12, 'XOCHIHUEHUETLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (437, 12, 'XOCHISTLAHUACA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (438, 12, 'ZAPOTITLÁN TABLAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (439, 12, 'ZIRÁNDARO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (440, 12, 'ZITLALA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (441, 12, 'EDUARDO NERI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (442, 12, 'ACATEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (443, 12, 'MARQUELIA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (444, 12, 'COCHOAPA EL GRANDE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (445, 12, 'JOSÉ JOAQUIN DE HERRERA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (446, 12, 'JUCHITÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (447, 12, 'ILIATENCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (448, 13, 'ACATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (449, 13, 'ACAXOCHITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (450, 13, 'ACTOPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (451, 13, 'AGUA BLANCA DE ITURBIDE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (452, 13, 'AJACUBA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (453, 13, 'ALFAJAYUCAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (454, 13, 'ALMOLOYA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (455, 13, 'APAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (456, 13, 'EL ARENAL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (457, 13, 'ATITALAQUIA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (458, 13, 'ATLAPEXCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (459, 13, 'ATOTONILCO EL GRANDE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (460, 13, 'ATOTONILCO DE TULA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (461, 13, 'CALNALI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (462, 13, 'CARDONAL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (463, 13, 'CUAUTEPEC DE HINOJOSA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (464, 13, 'CHAPANTONGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (465, 13, 'CHAPULHUACÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (466, 13, 'CHILCUAUTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (467, 13, 'ELOXOCHITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (468, 13, 'EMILIANO ZAPATA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (469, 13, 'EPAZOYUCAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (470, 13, 'FRANCISCO I. MADERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (471, 13, 'HUASCA DE OCAMPO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (472, 13, 'HUAUTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (473, 13, 'HUAZALINGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (474, 13, 'HUEHUETLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (475, 13, 'HUEJUTLA DE REYES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (476, 13, 'HUICHAPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (477, 13, 'IXMIQUILPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (478, 13, 'JACALA DE LEDEZMA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (479, 13, 'JALTOCÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (480, 13, 'JUÁREZ HIDALGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (481, 13, 'LOLOTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (482, 13, 'METEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (483, 13, 'SAN AGUSTÍN METZQUITITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (484, 13, 'METZTITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (485, 13, 'MINERAL DEL CHICO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (486, 13, 'MINERAL DEL MONTE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (487, 13, 'LA MISIÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (488, 13, 'MIXQUIAHUALA DE JUÁREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (489, 13, 'MOLANGO DE ESCAMILLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (490, 13, 'NICOLÁS FLORES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (491, 13, 'NOPALA DE VILLAGRÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (492, 13, 'OMITLÁN DE JUÁREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (493, 13, 'SAN FELIPE ORIZATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (494, 13, 'PACULA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (495, 13, 'PACHUCA DE SOTO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (496, 13, 'PISAFLORES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (497, 13, 'PROGRESO DE OBREGÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (498, 13, 'MINERAL DE LA REFORMA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (499, 13, 'SAN AGUSTÍN TLAXIACA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (500, 13, 'SAN BARTOLO TUTOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (501, 13, 'SAN SALVADOR', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (502, 13, 'SANTIAGO DE ANAYA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (503, 13, 'SANTIAGO TULANTEPEC DE LUGO GUERRERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (504, 13, 'SINGUILUCAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (505, 13, 'TASQUILLO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (506, 13, 'TECOZAUTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (507, 13, 'TENANGO DE DORIA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (508, 13, 'TEPEAPULCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (509, 13, 'TEPEHUACÁN DE GUERRERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (510, 13, 'TEPEJI DEL RÍO DE OCAMPO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (511, 13, 'TEPETITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (512, 13, 'TETEPANGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (513, 13, 'VILLA DE TEZONTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (514, 13, 'TEZONTEPEC DE ALDAMA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (515, 13, 'TIANGUISTENGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (516, 13, 'TIZAYUCA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (517, 13, 'TLAHUELILPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (518, 13, 'TLAHUILTEPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (519, 13, 'TLANALAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (520, 13, 'TLANCHINOL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (521, 13, 'TLAXCOAPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (522, 13, 'TOLCAYUCA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (523, 13, 'TULA DE ALLENDE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (524, 13, 'TULANCINGO DE BRAVO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (525, 13, 'XOCHIATIPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (526, 13, 'XOCHICOATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (527, 13, 'YAHUALICA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (528, 13, 'ZACUALTIPÁN DE ÁNGELES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (529, 13, 'ZAPOTLÁN DE JUÁREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (530, 13, 'ZEMPOALA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (531, 13, 'ZIMAPÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (532, 14, 'ACATIC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (533, 14, 'ACATLÁN DE JUÁREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (534, 14, 'AHUALULCO DE MERCADO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (535, 14, 'AMACUECA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (536, 14, 'AMATITÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (537, 14, 'AMECA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (538, 14, 'SAN JUANITO DE ESCOBEDO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (539, 14, 'ARANDAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (540, 14, 'EL ARENAL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (541, 14, 'ATEMAJAC DE BRIZUELA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (542, 14, 'ATENGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (543, 14, 'ATENGUILLO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (544, 14, 'ATOTONILCO EL ALTO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (545, 14, 'ATOYAC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (546, 14, 'AUTLÁN DE NAVARRO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (547, 14, 'AYOTLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (548, 14, 'AYUTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (549, 14, 'LA BARCA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (550, 14, 'BOLAÑOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (551, 14, 'CABO CORRIENTES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (552, 14, 'CASIMIRO CASTILLO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (553, 14, 'CIHUATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (554, 14, 'ZAPOTLÁN EL GRANDE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (555, 14, 'COCULA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (556, 14, 'COLOTLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (557, 14, 'CONCEPCIÓN DE BUENOS AIRES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (558, 14, 'CUAUTITLÁN DE GARCÍA BARRAGÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (559, 14, 'CUAUTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (560, 14, 'CUQUÍO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (561, 14, 'CHAPALA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (562, 14, 'CHIMALTITÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (563, 14, 'CHIQUILISTLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (564, 14, 'DEGOLLADO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (565, 14, 'EJUTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (566, 14, 'ENCARNACIÓN DE DÍAZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (567, 14, 'ETZATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (568, 14, 'EL GRULLO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (569, 14, 'GUACHINANGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (570, 14, 'GUADALAJARA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (571, 14, 'HOSTOTIPAQUILLO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (572, 14, 'HUEJÚCAR', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (573, 14, 'HUEJUQUILLA EL ALTO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (574, 14, 'LA HUERTA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (575, 14, 'IXTLAHUACÁN DE LOS MEMBRILLOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (576, 14, 'IXTLAHUACÁN DEL RÍO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (577, 14, 'JALOSTOTITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (578, 14, 'JAMAY', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (579, 14, 'JESÚS MARÍA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (580, 14, 'JILOTLÁN DE LOS DOLORES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (581, 14, 'JOCOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (582, 14, 'JUANACATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (583, 14, 'JUCHITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (584, 14, 'LAGOS DE MORENO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (585, 14, 'EL LIMÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (586, 14, 'MAGDALENA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (587, 14, 'SANTA MARÍA DEL ORO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (588, 14, 'LA MANZANILLA DE LA PAZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (589, 14, 'MASCOTA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (590, 14, 'MAZAMITLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (591, 14, 'MEXTICACÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (592, 14, 'MEZQUITIC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (593, 14, 'MIXTLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (594, 14, 'OCOTLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (595, 14, 'OJUELOS DE JALISCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (596, 14, 'PIHUAMO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (597, 14, 'PONCITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (598, 14, 'PUERTO VALLARTA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (599, 14, 'VILLA PURIFICACIÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (600, 14, 'QUITUPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (601, 14, 'EL SALTO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (602, 14, 'SAN CRISTÓBAL DE LA BARRANCA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (603, 14, 'SAN DIEGO DE ALEJANDRÍA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (604, 14, 'SAN JUAN DE LOS LAGOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (605, 14, 'SAN JULIÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (606, 14, 'SAN MARCOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (607, 14, 'SAN MARTÍN DE BOLAÑOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (608, 14, 'SAN MARTÍN HIDALGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (609, 14, 'SAN MIGUEL EL ALTO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (610, 14, 'GÓMEZ FARÍAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (611, 14, 'SAN SEBASTIÁN DEL OESTE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (612, 14, 'SANTA MARÍA DE LOS ÁNGELES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (613, 14, 'SAYULA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (614, 14, 'TALA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (615, 14, 'TALPA DE ALLENDE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (616, 14, 'TAMAZULA DE GORDIANO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (617, 14, 'TAPALPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (618, 14, 'TECALITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (619, 14, 'TECOLOTLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (620, 14, 'TECHALUTA DE MONTENEGRO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (621, 14, 'TENAMAXTLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (622, 14, 'TEOCALTICHE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (623, 14, 'TEOCUITATLÁN DE CORONA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (624, 14, 'TEPATITLÁN DE MORELOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (625, 14, 'TEQUILA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (626, 14, 'TEUCHITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (627, 14, 'TIZAPÁN EL ALTO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (628, 14, 'TLAJOMULCO DE ZÚÑIGA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (629, 14, 'TLAQUEPAQUE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (630, 14, 'TOLIMÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (631, 14, 'TOMATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (632, 14, 'TONALÁ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (633, 14, 'TONAYA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (634, 14, 'TONILA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (635, 14, 'TOTATICHE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (636, 14, 'TOTOTLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (637, 14, 'TUXCACUESCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (638, 14, 'TUXCUECA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (639, 14, 'TUXPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (640, 14, 'UNIÓN DE SAN ANTONIO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (641, 14, 'UNIÓN DE TULA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (642, 14, 'VALLE DE GUADALUPE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (643, 14, 'VALLE DE JUÁREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (644, 14, 'SAN GABRIEL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (645, 14, 'VILLA CORONA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (646, 14, 'VILLA GUERRERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (647, 14, 'VILLA HIDALGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (648, 14, 'CAÑADAS DE OBREGÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (649, 14, 'YAHUALICA DE GONZÁLEZ GALLO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (650, 14, 'ZACOALCO DE TORRES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (651, 14, 'ZAPOPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (652, 14, 'ZAPOTILTIC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (653, 14, 'ZAPOTITLÁN DE VADILLO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (654, 14, 'ZAPOTLÁN DEL REY', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (655, 14, 'ZAPOTLANEJO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (656, 14, 'SAN IGNACIO CERRO GORDO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (657, 15, 'TLALNEPANTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (658, 15, 'ACAMBAY', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (659, 15, 'ACOLMAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (660, 15, 'ACULCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (661, 15, 'ALMOLOYA DE ALQUISIRAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (662, 15, 'ALMOLOYA DE JUÁREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (663, 15, 'ALMOLOYA DEL RÍO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (664, 15, 'AMANALCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (665, 15, 'AMATEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (666, 15, 'AMECAMECA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (667, 15, 'APAXCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (668, 15, 'ATENCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (669, 15, 'ATIZAPÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (670, 15, 'ATIZAPÁN DE ZARAGOZA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (671, 15, 'ATLACOMULCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (672, 15, 'ATLAUTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (673, 15, 'AXAPUSCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (674, 15, 'AYAPANGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (675, 15, 'CALIMAYA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (676, 15, 'CAPULHUAC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (677, 15, 'COACALCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (678, 15, 'COATEPEC HARINAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (679, 15, 'COCOTITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (680, 15, 'COYOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (681, 15, 'CUAUTITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (682, 15, 'CHALCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (683, 15, 'CHAPA DE MOTA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (684, 15, 'CHAPULTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (685, 15, 'CHIAUTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (686, 15, 'CHICOLOAPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (687, 15, 'CHICONCUAC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (688, 15, 'CHIMALHUACÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (689, 15, 'DONATO GUERRA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (690, 15, 'ECATEPEC DE MORELOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (691, 15, 'ECATZINGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (692, 15, 'HUEHUETOCA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (693, 15, 'HUEYPOXTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (694, 15, 'HUIXQUILUCAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (695, 15, 'ISIDRO FABELA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (696, 15, 'IXTAPALUCA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (697, 15, 'IXTAPAN DE LA SAL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (698, 15, 'IXTAPAN DEL ORO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (699, 15, 'IXTLAHUACA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (700, 15, 'XALATLACO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (701, 15, 'JALTENCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (702, 15, 'JILOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (703, 15, 'JILOTZINGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (704, 15, 'JIQUIPILCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (705, 15, 'JOCOTITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (706, 15, 'JOQUICINGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (707, 15, 'JUCHITEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (708, 15, 'LERMA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (709, 15, 'MALINALCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (710, 15, 'MELCHOR OCAMPO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (711, 15, 'METEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (712, 15, 'MEXICALTZINGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (713, 15, 'MORELOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (714, 15, 'NAUCALPAN DE JUÁREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (715, 15, 'NEZAHUALCÓYOTL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (716, 15, 'NEXTLALPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (717, 15, 'NICOLÁS ROMERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (718, 15, 'NOPALTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (719, 15, 'OCOYOACAC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (720, 15, 'OCUILAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (721, 15, 'EL ORO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (722, 15, 'OTUMBA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (723, 15, 'OTZOLOAPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (724, 15, 'OTZOLOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (725, 15, 'OZUMBA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (726, 15, 'PAPALOTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (727, 15, 'LA PAZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (728, 15, 'POLOTITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (729, 15, 'RAYÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (730, 15, 'SAN ANTONIO LA ISLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (731, 15, 'SAN FELIPE DEL PROGRESO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (732, 15, 'SAN MARTÍN DE LAS PIRÁMIDES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (733, 15, 'SAN MATEO ATENCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (734, 15, 'SAN SIMÓN DE GUERRERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (735, 15, 'SANTO TOMÁS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (736, 15, 'SOYANIQUILPAN DE JUÁREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (737, 15, 'SULTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (738, 15, 'TECÁMAC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (739, 15, 'TEJUPILCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (740, 15, 'TEMAMATLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (741, 15, 'TEMASCALAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (742, 15, 'TEMASCALCINGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (743, 15, 'TEMASCALTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (744, 15, 'TEMOAYA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (745, 15, 'TENANCINGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (746, 15, 'TENANGO DEL AIRE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (747, 15, 'TENANGO DEL VALLE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (748, 15, 'TEOLOYUCÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (749, 15, 'TEOTIHUACÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (750, 15, 'TEPETLAOXTOC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (751, 15, 'TEPETLIXPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (752, 15, 'TEPOTZOTLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (753, 15, 'TEQUIXQUIAC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (754, 15, 'TEXCALTITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (755, 15, 'TEXCALYACAC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (756, 15, 'TEXCOCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (757, 15, 'TEZOYUCA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (758, 15, 'TIANGUISTENCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (759, 15, 'TIMILPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (760, 15, 'TLALMANALCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (761, 15, 'TLALNEPANTLA DE BAZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (762, 15, 'TLATLAYA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (763, 15, 'TOLUCA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (764, 15, 'TONATICO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (765, 15, 'TULTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (766, 15, 'TULTITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (767, 15, 'VALLE DE BRAVO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (768, 15, 'VILLA DE ALLENDE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (769, 15, 'VILLA DEL CARBÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (770, 15, 'VILLA GUERRERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (771, 15, 'VILLA VICTORIA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (772, 15, 'XONACATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (773, 15, 'ZACAZONAPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (774, 15, 'ZACUALPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (775, 15, 'ZINACANTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (776, 15, 'ZUMPAHUACÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (777, 15, 'ZUMPANGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (778, 15, 'CUAUTITLÁN IZCALLI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (779, 15, 'VALLE DE CHALCO SOLIDARIDAD', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (780, 15, 'LUVIANOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (781, 15, 'SAN JOSÉ DEL RINCÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (782, 15, 'TONANITLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (783, 16, 'ACUITZIO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (784, 16, 'AGUILILLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (785, 16, 'ÁLVARO OBREGÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (786, 16, 'ANGAMACUTIRO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (787, 16, 'ANGANGUEO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (788, 16, 'APATZINGÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (789, 16, 'APORO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (790, 16, 'AQUILA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (791, 16, 'ARIO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (792, 16, 'ARTEAGA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (793, 16, 'BRISEÑAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (794, 16, 'BUENAVISTA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (795, 16, 'CARÁCUARO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (796, 16, 'COAHUAYANA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (797, 16, 'COALCOMÁN DE VÁZQUEZ PALLARES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (798, 16, 'COENEO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (799, 16, 'CONTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (800, 16, 'COPÁNDARO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (801, 16, 'COTIJA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (802, 16, 'CUITZEO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (803, 16, 'CHARAPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (804, 16, 'CHARO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (805, 16, 'CHAVINDA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (806, 16, 'CHERÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (807, 16, 'CHILCHOTA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (808, 16, 'CHINICUILA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (809, 16, 'CHUCÁNDIRO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (810, 16, 'CHURINTZIO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (811, 16, 'CHURUMUCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (812, 16, 'ECUANDUREO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (813, 16, 'EPITACIO HUERTA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (814, 16, 'ERONGARÍCUARO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (815, 16, 'GABRIEL ZAMORA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (816, 16, 'HIDALGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (817, 16, 'LA HUACANA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (818, 16, 'HUANDACAREO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (819, 16, 'HUANIQUEO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (820, 16, 'HUETAMO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (821, 16, 'HUIRAMBA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (822, 16, 'INDAPARAPEO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (823, 16, 'IRIMBO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (824, 16, 'IXTLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (825, 16, 'JACONA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (826, 16, 'JIMÉNEZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (827, 16, 'JIQUILPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (828, 16, 'JUÁREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (829, 16, 'JUNGAPEO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (830, 16, 'LAGUNILLAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (831, 16, 'MADERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (832, 16, 'MARAVATÍO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (833, 16, 'MARCOS CASTELLANOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (834, 16, 'LÁZARO CÁRDENAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (835, 16, 'MORELIA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (836, 16, 'MORELOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (837, 16, 'MÚGICA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (838, 16, 'NAHUATZEN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (839, 16, 'NOCUPÉTARO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (840, 16, 'NUEVO PARANGARICUTIRO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (841, 16, 'NUEVO URECHO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (842, 16, 'NUMARÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (843, 16, 'OCAMPO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (844, 16, 'PAJACUARÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (845, 16, 'PANINDÍCUARO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (846, 16, 'PARÁCUARO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (847, 16, 'PARACHO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (848, 16, 'PÁTZCUARO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (849, 16, 'PENJAMILLO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (850, 16, 'PERIBÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (851, 16, 'LA PIEDAD', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (852, 16, 'PURÉPERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (853, 16, 'PURUÁNDIRO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (854, 16, 'QUERÉNDARO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (855, 16, 'QUIROGA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (856, 16, 'COJUMATLÁN DE RÉGULES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (857, 16, 'LOS REYES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (858, 16, 'SAHUAYO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (859, 16, 'SAN LUCAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (860, 16, 'SANTA ANA MAYA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (861, 16, 'SALVADOR ESCALANTE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (862, 16, 'SENGUIO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (863, 16, 'SUSUPUATO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (864, 16, 'TACÁMBARO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (865, 16, 'TANCÍTARO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (866, 16, 'TANGAMANDAPIO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (867, 16, 'TANGANCÍCUARO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (868, 16, 'TANHUATO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (869, 16, 'TARETAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (870, 16, 'TARÍMBARO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (871, 16, 'TEPALCATEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (872, 16, 'TINGAMBATO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (873, 16, 'TINGÜINDÍN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (874, 16, 'TIQUICHEO DE NICOLÁS ROMERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (875, 16, 'TLALPUJAHUA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (876, 16, 'TLAZAZALCA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (877, 16, 'TOCUMBO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (878, 16, 'TUMBISCATÍO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (879, 16, 'TURICATO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (880, 16, 'TUXPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (881, 16, 'TUZANTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (882, 16, 'TZINTZUNTZAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (883, 16, 'TZITZIO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (884, 16, 'URUAPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (885, 16, 'VENUSTIANO CARRANZA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (886, 16, 'VILLAMAR', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (887, 16, 'VISTA HERMOSA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (888, 16, 'YURÉCUARO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (889, 16, 'ZACAPU', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (890, 16, 'ZAMORA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (891, 16, 'ZINÁPARO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (892, 16, 'ZINAPÉCUARO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (893, 16, 'ZIRACUARETIRO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (894, 16, 'ZITÁCUARO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (895, 16, 'JOSÉ SIXTO VERDUZCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (896, 17, 'AMACUZAC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (897, 17, 'ATLATLAHUCAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (898, 17, 'AXOCHIAPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (899, 17, 'AYALA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (900, 17, 'COATLÁN DEL RÍO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (901, 17, 'CUAUTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (902, 17, 'CUERNAVACA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (903, 17, 'EMILIANO ZAPATA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (904, 17, 'HUITZILAC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (905, 17, 'JANTETELCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (906, 17, 'JIUTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (907, 17, 'JOJUTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (908, 17, 'JONACATEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (909, 17, 'MAZATEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (910, 17, 'MIACATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (911, 17, 'OCUITUCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (912, 17, 'PUENTE DE IXTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (913, 17, 'TEMIXCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (914, 17, 'TEPALCINGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (915, 17, 'TEPOZTLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (916, 17, 'TETECALA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (917, 17, 'TETELA DEL VOLCÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (918, 17, 'TLALNEPANTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (919, 17, 'TLALTIZAPÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (920, 17, 'TLAQUILTENANGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (921, 17, 'TLAYACAPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (922, 17, 'TOTOLAPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (923, 17, 'XOCHITEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (924, 17, 'YAUTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (925, 17, 'YECAPIXTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (926, 17, 'ZACATEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (927, 17, 'ZACUALPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (928, 17, 'TEMOAC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (929, 18, 'ACAPONETA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (930, 18, 'AHUACATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (931, 18, 'AMATLÁN DE CAÑAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (932, 18, 'COMPOSTELA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (933, 18, 'HUAJICORI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (934, 18, 'IXTLÁN DEL RÍO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (935, 18, 'JALA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (936, 18, 'XALISCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (937, 18, 'DEL NAYAR', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (938, 18, 'ROSAMORADA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (939, 18, 'RUÍZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (940, 18, 'SAN BLAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (941, 18, 'SAN PEDRO LAGUNILLAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (942, 18, 'SANTA MARÍA DEL ORO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (943, 18, 'SANTIAGO IXCUINTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (944, 18, 'TECUALA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (945, 18, 'TEPIC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (946, 18, 'TUXPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (947, 18, 'LA YESCA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (948, 18, 'BAHÍA DE BANDERAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (949, 19, 'ABASOLO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (950, 19, 'AGUALEGUAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (951, 19, 'LOS ALDAMAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (952, 19, 'ALLENDE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (953, 19, 'ANÁHUAC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (954, 19, 'APODACA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (955, 19, 'ARAMBERRI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (956, 19, 'BUSTAMANTE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (957, 19, 'CADEREYTA JIMÉNEZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (958, 19, 'CARMEN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (959, 19, 'CERRALVO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (960, 19, 'CIÉNEGA DE FLORES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (961, 19, 'CHINA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (962, 19, 'DR. ARROYO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (963, 19, 'DR. COSS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (964, 19, 'DR. GONZÁLEZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (965, 19, 'GALEANA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (966, 19, 'GARCÍA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (967, 19, 'SAN PEDRO GARZA GARCÍA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (968, 19, 'GRAL. BRAVO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (969, 19, 'GRAL. ESCOBEDO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (970, 19, 'GRAL. TERÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (971, 19, 'GRAL. TREVIÑO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (972, 19, 'GRAL. ZARAGOZA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (973, 19, 'GRAL. ZUAZUA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (974, 19, 'GUADALUPE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (975, 19, 'LOS HERRERAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (976, 19, 'HIGUERAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (977, 19, 'HUALAHUISES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (978, 19, 'ITURBIDE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (979, 19, 'JUÁREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (980, 19, 'LAMPAZOS DE NARANJO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (981, 19, 'LINARES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (982, 19, 'MARÍN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (983, 19, 'MELCHOR OCAMPO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (984, 19, 'MIER Y NORIEGA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (985, 19, 'MINA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (986, 19, 'MONTEMORELOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (987, 19, 'MONTERREY', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (988, 19, 'PARÁS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (989, 19, 'PESQUERÍA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (990, 19, 'LOS RAMONES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (991, 19, 'RAYONES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (992, 19, 'SABINAS HIDALGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (993, 19, 'SALINAS VICTORIA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (994, 19, 'SAN NICOLÁS DE LOS GARZA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (995, 19, 'HIDALGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (996, 19, 'SANTA CATARINA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (997, 19, 'SANTIAGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (998, 19, 'VALLECILLO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (999, 19, 'VILLALDAMA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1000, 20, 'ABEJONES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1001, 20, 'ACATLÁN DE PÉREZ FIGUEROA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1002, 20, 'ASUNCIÓN CACALOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1003, 20, 'ASUNCIÓN CUYOTEPEJI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1004, 20, 'ASUNCIÓN IXTALTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1005, 20, 'ASUNCIÓN NOCHIXTLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1006, 20, 'ASUNCIÓN OCOTLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1007, 20, 'ASUNCIÓN TLACOLULITA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1008, 20, 'AYOTZINTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1009, 20, 'EL BARRIO DE LA SOLEDAD', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1010, 20, 'CALIHUALÁ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1011, 20, 'CANDELARIA LOXICHA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1012, 20, 'CIÉNEGA DE ZIMATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1013, 20, 'CIUDAD IXTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1014, 20, 'COATECAS ALTAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1015, 20, 'COICOYÁN DE LAS FLORES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1016, 20, 'LA COMPAÑÍA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1017, 20, 'CONCEPCIÓN BUENAVISTA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1018, 20, 'CONCEPCIÓN PÁPALO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1019, 20, 'CONSTANCIA DEL ROSARIO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1020, 20, 'COSOLAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1021, 20, 'COSOLTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1022, 20, 'CUILÁPAM DE GUERRERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1023, 20, 'CUYAMECALCO VILLA DE ZARAGOZA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1024, 20, 'CHAHUITES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1025, 20, 'CHALCATONGO DE HIDALGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1026, 20, 'CHIQUIHUITLÁN DE BENITO JUÁREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1027, 20, 'HEROICA CIUDAD DE EJUTLA DE CRESPO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1028, 20, 'ELOXOCHITLÁN DE FLORES MAGÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1029, 20, 'EL ESPINAL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1030, 20, 'TAMAZULÁPAM DEL ESPÍRITU SANTO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1031, 20, 'FRESNILLO DE TRUJANO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1032, 20, 'GUADALUPE ETLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1033, 20, 'GUADALUPE DE RAMÍREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1034, 20, 'GUELATAO DE JUÁREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1035, 20, 'GUEVEA DE HUMBOLDT', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1036, 20, 'MESONES HIDALGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1037, 20, 'VILLA HIDALGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1038, 20, 'HEROICA CIUDAD DE HUAJUAPAN DE LEÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1039, 20, 'HUAUTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1040, 20, 'HUAUTLA DE JIMÉNEZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1041, 20, 'IXTLÁN DE JUÁREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1042, 20, 'HEROICA CIUDAD DE JUCHITÁN DE ZARAGOZA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1043, 20, 'LOMA BONITA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1044, 20, 'MAGDALENA APASCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1045, 20, 'MAGDALENA JALTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1046, 20, 'SANTA MAGDALENA JICOTLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1047, 20, 'MAGDALENA MIXTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1048, 20, 'MAGDALENA OCOTLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1049, 20, 'MAGDALENA PEÑASCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1050, 20, 'MAGDALENA TEITIPAC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1051, 20, 'MAGDALENA TEQUISISTLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1052, 20, 'MAGDALENA TLACOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1053, 20, 'MAGDALENA ZAHUATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1054, 20, 'MARISCALA DE JUÁREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1055, 20, 'MÁRTIRES DE TACUBAYA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1056, 20, 'MATÍAS ROMERO AVENDAÑO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1057, 20, 'MAZATLÁN VILLA DE FLORES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1058, 20, 'MIAHUATLÁN DE PORFIRIO DÍAZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1059, 20, 'MIXISTLÁN DE LA REFORMA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1060, 20, 'MONJAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1061, 20, 'NATIVIDAD', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1062, 20, 'NAZARENO ETLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1063, 20, 'NEJAPA DE MADERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1064, 20, 'IXPANTEPEC NIEVES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1065, 20, 'SANTIAGO NILTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1066, 20, 'OAXACA DE JUÁREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1067, 20, 'OCOTLÁN DE MORELOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1068, 20, 'LA PE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1069, 20, 'PINOTEPA DE DON LUIS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1070, 20, 'PLUMA HIDALGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1071, 20, 'SAN JOSÉ DEL PROGRESO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1072, 20, 'PUTLA VILLA DE GUERRERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1073, 20, 'SANTA CATARINA QUIOQUITANI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1074, 20, 'REFORMA DE PINEDA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1075, 20, 'LA REFORMA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1076, 20, 'REYES ETLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1077, 20, 'ROJAS DE CUAUHTÉMOC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1078, 20, 'SALINA CRUZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1079, 20, 'SAN AGUSTÍN AMATENGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1080, 20, 'SAN AGUSTÍN ATENANGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1081, 20, 'SAN AGUSTÍN CHAYUCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1082, 20, 'SAN AGUSTÍN DE LAS JUNTAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1083, 20, 'SAN AGUSTÍN ETLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1084, 20, 'SAN AGUSTÍN LOXICHA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1085, 20, 'SAN AGUSTÍN TLACOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1086, 20, 'SAN AGUSTÍN YATARENI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1087, 20, 'SAN ANDRÉS CABECERA NUEVA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1088, 20, 'SAN ANDRÉS DINICUITI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1089, 20, 'SAN ANDRÉS HUAXPALTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1090, 20, 'SAN ANDRÉS HUAYÁPAM', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1091, 20, 'SAN ANDRÉS IXTLAHUACA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1092, 20, 'SAN ANDRÉS LAGUNAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1093, 20, 'SAN ANDRÉS NUXIÑO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1094, 20, 'SAN ANDRÉS PAXTLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1095, 20, 'SAN ANDRÉS SINAXTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1096, 20, 'SAN ANDRÉS SOLAGA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1097, 20, 'SAN ANDRÉS TEOTILÁLPAM', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1098, 20, 'SAN ANDRÉS TEPETLAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1099, 20, 'SAN ANDRÉS YAÁ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1100, 20, 'SAN ANDRÉS ZABACHE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1101, 20, 'SAN ANDRÉS ZAUTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1102, 20, 'SAN ANTONINO CASTILLO VELASCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1103, 20, 'SAN ANTONINO EL ALTO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1104, 20, 'SAN ANTONINO MONTE VERDE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1105, 20, 'SAN ANTONIO ACUTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1106, 20, 'SAN ANTONIO DE LA CAL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1107, 20, 'SAN ANTONIO HUITEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1108, 20, 'SAN ANTONIO NANAHUATÍPAM', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1109, 20, 'SAN ANTONIO SINICAHUA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1110, 20, 'SAN ANTONIO TEPETLAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1111, 20, 'SAN BALTAZAR CHICHICÁPAM', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1112, 20, 'SAN BALTAZAR LOXICHA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1113, 20, 'SAN BALTAZAR YATZACHI EL BAJO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1114, 20, 'SAN BARTOLO COYOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1115, 20, 'SAN BARTOLOMÉ AYAUTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1116, 20, 'SAN BARTOLOMÉ LOXICHA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1117, 20, 'SAN BARTOLOMÉ QUIALANA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1118, 20, 'SAN BARTOLOMÉ YUCUAÑE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1119, 20, 'SAN BARTOLOMÉ ZOOGOCHO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1120, 20, 'SAN BARTOLO SOYALTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1121, 20, 'SAN BARTOLO YAUTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1122, 20, 'SAN BERNARDO MIXTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1123, 20, 'SAN BLAS ATEMPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1124, 20, 'SAN CARLOS YAUTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1125, 20, 'SAN CRISTÓBAL AMATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1126, 20, 'SAN CRISTÓBAL AMOLTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1127, 20, 'SAN CRISTÓBAL LACHIRIOAG', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1128, 20, 'SAN CRISTÓBAL SUCHIXTLAHUACA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1129, 20, 'SAN DIONISIO DEL MAR', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1130, 20, 'SAN DIONISIO OCOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1131, 20, 'SAN DIONISIO OCOTLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1132, 20, 'SAN ESTEBAN ATATLAHUCA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1133, 20, 'SAN FELIPE JALAPA DE DÍAZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1134, 20, 'SAN FELIPE TEJALÁPAM', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1135, 20, 'SAN FELIPE USILA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1136, 20, 'SAN FRANCISCO CAHUACUÁ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1137, 20, 'SAN FRANCISCO CAJONOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1138, 20, 'SAN FRANCISCO CHAPULAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1139, 20, 'SAN FRANCISCO CHINDÚA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1140, 20, 'SAN FRANCISCO DEL MAR', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1141, 20, 'SAN FRANCISCO HUEHUETLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1142, 20, 'SAN FRANCISCO IXHUATÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1143, 20, 'SAN FRANCISCO JALTEPETONGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1144, 20, 'SAN FRANCISCO LACHIGOLÓ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1145, 20, 'SAN FRANCISCO LOGUECHE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1146, 20, 'SAN FRANCISCO NUXAÑO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1147, 20, 'SAN FRANCISCO OZOLOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1148, 20, 'SAN FRANCISCO SOLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1149, 20, 'SAN FRANCISCO TELIXTLAHUACA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1150, 20, 'SAN FRANCISCO TEOPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1151, 20, 'SAN FRANCISCO TLAPANCINGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1152, 20, 'SAN GABRIEL MIXTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1153, 20, 'SAN ILDEFONSO AMATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1154, 20, 'SAN ILDEFONSO SOLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1155, 20, 'SAN ILDEFONSO VILLA ALTA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1156, 20, 'SAN JACINTO AMILPAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1157, 20, 'SAN JACINTO TLACOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1158, 20, 'SAN JERÓNIMO COATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1159, 20, 'SAN JERÓNIMO SILACAYOAPILLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1160, 20, 'SAN JERÓNIMO SOSOLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1161, 20, 'SAN JERÓNIMO TAVICHE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1162, 20, 'SAN JERÓNIMO TECÓATL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1163, 20, 'SAN JORGE NUCHITA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1164, 20, 'SAN JOSÉ AYUQUILA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1165, 20, 'SAN JOSÉ CHILTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1166, 20, 'SAN JOSÉ DEL PEÑASCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1167, 20, 'SAN JOSÉ ESTANCIA GRANDE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1168, 20, 'SAN JOSÉ INDEPENDENCIA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1169, 20, 'SAN JOSÉ LACHIGUIRI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1170, 20, 'SAN JOSÉ TENANGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1171, 20, 'SAN JUAN ACHIUTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1172, 20, 'SAN JUAN ATEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1173, 20, 'ÁNIMAS TRUJANO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1174, 20, 'SAN JUAN BAUTISTA ATATLAHUCA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1175, 20, 'SAN JUAN BAUTISTA COIXTLAHUACA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1176, 20, 'SAN JUAN BAUTISTA CUICATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1177, 20, 'SAN JUAN BAUTISTA GUELACHE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1178, 20, 'SAN JUAN BAUTISTA JAYACATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1179, 20, 'SAN JUAN BAUTISTA LO DE SOTO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1180, 20, 'SAN JUAN BAUTISTA SUCHITEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1181, 20, 'SAN JUAN BAUTISTA TLACOATZINTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1182, 20, 'SAN JUAN BAUTISTA TLACHICHILCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1183, 20, 'SAN JUAN BAUTISTA TUXTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1184, 20, 'SAN JUAN CACAHUATEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1185, 20, 'SAN JUAN CIENEGUILLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1186, 20, 'SAN JUAN COATZÓSPAM', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1187, 20, 'SAN JUAN COLORADO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1188, 20, 'SAN JUAN COMALTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1189, 20, 'SAN JUAN COTZOCÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1190, 20, 'SAN JUAN CHICOMEZÚCHIL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1191, 20, 'SAN JUAN CHILATECA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1192, 20, 'SAN JUAN DEL ESTADO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1193, 20, 'SAN JUAN DEL RÍO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1194, 20, 'SAN JUAN DIUXI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1195, 20, 'SAN JUAN EVANGELISTA ANALCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1196, 20, 'SAN JUAN GUELAVÍA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1197, 20, 'SAN JUAN GUICHICOVI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1198, 20, 'SAN JUAN IHUALTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1199, 20, 'SAN JUAN JUQUILA MIXES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1200, 20, 'SAN JUAN JUQUILA VIJANOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1201, 20, 'SAN JUAN LACHAO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1202, 20, 'SAN JUAN LACHIGALLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1203, 20, 'SAN JUAN LAJARCIA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1204, 20, 'SAN JUAN LALANA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1205, 20, 'SAN JUAN DE LOS CUÉS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1206, 20, 'SAN JUAN MAZATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1207, 20, 'SAN JUAN MIXTEPEC -DTO. 08 -', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1208, 20, 'SAN JUAN MIXTEPEC -DTO. 26 -', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1209, 20, 'SAN JUAN ÑUMÍ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1210, 20, 'SAN JUAN OZOLOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1211, 20, 'SAN JUAN PETLAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1212, 20, 'SAN JUAN QUIAHIJE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1213, 20, 'SAN JUAN QUIOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1214, 20, 'SAN JUAN SAYULTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1215, 20, 'SAN JUAN TABAÁ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1216, 20, 'SAN JUAN TAMAZOLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1217, 20, 'SAN JUAN TEITA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1218, 20, 'SAN JUAN TEITIPAC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1219, 20, 'SAN JUAN TEPEUXILA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1220, 20, 'SAN JUAN TEPOSCOLULA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1221, 20, 'SAN JUAN YAEÉ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1222, 20, 'SAN JUAN YATZONA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1223, 20, 'SAN JUAN YUCUITA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1224, 20, 'SAN LORENZO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1225, 20, 'SAN LORENZO ALBARRADAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1226, 20, 'SAN LORENZO CACAOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1227, 20, 'SAN LORENZO CUAUNECUILTITLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1228, 20, 'SAN LORENZO TEXMELÚCAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1229, 20, 'SAN LORENZO VICTORIA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1230, 20, 'SAN LUCAS CAMOTLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1231, 20, 'SAN LUCAS OJITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1232, 20, 'SAN LUCAS QUIAVINÍ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1233, 20, 'SAN LUCAS ZOQUIÁPAM', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1234, 20, 'SAN LUIS AMATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1235, 20, 'SAN MARCIAL OZOLOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1236, 20, 'SAN MARCOS ARTEAGA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1237, 20, 'SAN MARTÍN DE LOS CANSECOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1238, 20, 'SAN MARTÍN HUAMELÚLPAM', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1239, 20, 'SAN MARTÍN ITUNYOSO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1240, 20, 'SAN MARTÍN LACHILÁ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1241, 20, 'SAN MARTÍN PERAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1242, 20, 'SAN MARTÍN TILCAJETE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1243, 20, 'SAN MARTÍN TOXPALAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1244, 20, 'SAN MARTÍN ZACATEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1245, 20, 'SAN MATEO CAJONOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1246, 20, 'CAPULÁLPAM DE MÉNDEZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1247, 20, 'SAN MATEO DEL MAR', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1248, 20, 'SAN MATEO YOLOXOCHITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1249, 20, 'SAN MATEO ETLATONGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1250, 20, 'SAN MATEO NEJÁPAM', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1251, 20, 'SAN MATEO PEÑASCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1252, 20, 'SAN MATEO PIÑAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1253, 20, 'SAN MATEO RÍO HONDO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1254, 20, 'SAN MATEO SINDIHUI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1255, 20, 'SAN MATEO TLAPILTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1256, 20, 'SAN MELCHOR BETAZA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1257, 20, 'SAN MIGUEL ACHIUTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1258, 20, 'SAN MIGUEL AHUEHUETITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1259, 20, 'SAN MIGUEL ALOÁPAM', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1260, 20, 'SAN MIGUEL AMATITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1261, 20, 'SAN MIGUEL AMATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1262, 20, 'SAN MIGUEL COATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1263, 20, 'SAN MIGUEL CHICAHUA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1264, 20, 'SAN MIGUEL CHIMALAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1265, 20, 'SAN MIGUEL DEL PUERTO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1266, 20, 'SAN MIGUEL DEL RÍO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1267, 20, 'SAN MIGUEL EJUTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1268, 20, 'SAN MIGUEL EL GRANDE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1269, 20, 'SAN MIGUEL HUAUTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1270, 20, 'SAN MIGUEL MIXTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1271, 20, 'SAN MIGUEL PANIXTLAHUACA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1272, 20, 'SAN MIGUEL PERAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1273, 20, 'SAN MIGUEL PIEDRAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1274, 20, 'SAN MIGUEL QUETZALTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1275, 20, 'SAN MIGUEL SANTA FLOR', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1276, 20, 'VILLA SOLA DE VEGA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1277, 20, 'SAN MIGUEL SOYALTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1278, 20, 'SAN MIGUEL SUCHIXTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1279, 20, 'VILLA TALEA DE CASTRO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1280, 20, 'SAN MIGUEL TECOMATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1281, 20, 'SAN MIGUEL TENANGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1282, 20, 'SAN MIGUEL TEQUIXTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1283, 20, 'SAN MIGUEL TILQUIÁPAM', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1284, 20, 'SAN MIGUEL TLACAMAMA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1285, 20, 'SAN MIGUEL TLACOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1286, 20, 'SAN MIGUEL TULANCINGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1287, 20, 'SAN MIGUEL YOTAO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1288, 20, 'SAN NICOLÁS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1289, 20, 'SAN NICOLÁS HIDALGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1290, 20, 'SAN PABLO COATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1291, 20, 'SAN PABLO CUATRO VENADOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1292, 20, 'SAN PABLO ETLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1293, 20, 'SAN PABLO HUITZO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1294, 20, 'SAN PABLO HUIXTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1295, 20, 'SAN PABLO MACUILTIANGUIS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1296, 20, 'SAN PABLO TIJALTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1297, 20, 'SAN PABLO VILLA DE MITLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1298, 20, 'SAN PABLO YAGANIZA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1299, 20, 'SAN PEDRO AMUZGOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1300, 20, 'SAN PEDRO APÓSTOL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1301, 20, 'SAN PEDRO ATOYAC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1302, 20, 'SAN PEDRO CAJONOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1303, 20, 'SAN PEDRO COXCALTEPEC CÁNTAROS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1304, 20, 'SAN PEDRO COMITANCILLO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1305, 20, 'SAN PEDRO EL ALTO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1306, 20, 'SAN PEDRO HUAMELULA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1307, 20, 'SAN PEDRO HUILOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1308, 20, 'SAN PEDRO IXCATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1309, 20, 'SAN PEDRO IXTLAHUACA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1310, 20, 'SAN PEDRO JALTEPETONGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1311, 20, 'SAN PEDRO JICAYÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1312, 20, 'SAN PEDRO JOCOTIPAC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1313, 20, 'SAN PEDRO JUCHATENGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1314, 20, 'SAN PEDRO MÁRTIR', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1315, 20, 'SAN PEDRO MÁRTIR QUIECHAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1316, 20, 'SAN PEDRO MÁRTIR YUCUXACO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1317, 20, 'SAN PEDRO MIXTEPEC -DTO. 22 -', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1318, 20, 'SAN PEDRO MIXTEPEC -DTO. 26 -', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1319, 20, 'SAN PEDRO MOLINOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1320, 20, 'SAN PEDRO NOPALA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1321, 20, 'SAN PEDRO OCOPETATILLO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1322, 20, 'SAN PEDRO OCOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1323, 20, 'SAN PEDRO POCHUTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1324, 20, 'SAN PEDRO QUIATONI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1325, 20, 'SAN PEDRO SOCHIÁPAM', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1326, 20, 'SAN PEDRO TAPANATEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1327, 20, 'SAN PEDRO TAVICHE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1328, 20, 'SAN PEDRO TEOZACOALCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1329, 20, 'SAN PEDRO TEUTILA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1330, 20, 'SAN PEDRO TIDAÁ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1331, 20, 'SAN PEDRO TOPILTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1332, 20, 'SAN PEDRO TOTOLÁPAM', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1333, 20, 'VILLA DE TUTUTEPEC DE MELCHOR OCAMPO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1334, 20, 'SAN PEDRO YANERI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1335, 20, 'SAN PEDRO YÓLOX', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1336, 20, 'SAN PEDRO Y SAN PABLO AYUTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1337, 20, 'VILLA DE ETLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1338, 20, 'SAN PEDRO Y SAN PABLO TEPOSCOLULA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1339, 20, 'SAN PEDRO Y SAN PABLO TEQUIXTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1340, 20, 'SAN PEDRO YUCUNAMA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1341, 20, 'SAN RAYMUNDO JALPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1342, 20, 'SAN SEBASTIÁN ABASOLO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1343, 20, 'SAN SEBASTIÁN COATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1344, 20, 'SAN SEBASTIÁN IXCAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1345, 20, 'SAN SEBASTIÁN NICANANDUTA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1346, 20, 'SAN SEBASTIÁN RÍO HONDO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1347, 20, 'SAN SEBASTIÁN TECOMAXTLAHUACA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1348, 20, 'SAN SEBASTIÁN TEITIPAC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1349, 20, 'SAN SEBASTIÁN TUTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1350, 20, 'SAN SIMÓN ALMOLONGAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1351, 20, 'SAN SIMÓN ZAHUATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1352, 20, 'SANTA ANA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1353, 20, 'SANTA ANA ATEIXTLAHUACA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1354, 20, 'SANTA ANA CUAUHTÉMOC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1355, 20, 'SANTA ANA DEL VALLE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1356, 20, 'SANTA ANA TAVELA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1357, 20, 'SANTA ANA TLAPACOYAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1358, 20, 'SANTA ANA YARENI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1359, 20, 'SANTA ANA ZEGACHE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1360, 20, 'SANTA CATALINA QUIERÍ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1361, 20, 'SANTA CATARINA CUIXTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1362, 20, 'SANTA CATARINA IXTEPEJI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1363, 20, 'SANTA CATARINA JUQUILA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1364, 20, 'SANTA CATARINA LACHATAO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1365, 20, 'SANTA CATARINA LOXICHA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1366, 20, 'SANTA CATARINA MECHOACÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1367, 20, 'SANTA CATARINA MINAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1368, 20, 'SANTA CATARINA QUIANÉ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1369, 20, 'SANTA CATARINA TAYATA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1370, 20, 'SANTA CATARINA TICUÁ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1371, 20, 'SANTA CATARINA YOSONOTÚ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1372, 20, 'SANTA CATARINA ZAPOQUILA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1373, 20, 'SANTA CRUZ ACATEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1374, 20, 'SANTA CRUZ AMILPAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1375, 20, 'SANTA CRUZ DE BRAVO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1376, 20, 'SANTA CRUZ ITUNDUJIA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1377, 20, 'SANTA CRUZ MIXTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1378, 20, 'SANTA CRUZ NUNDACO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1379, 20, 'SANTA CRUZ PAPALUTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1380, 20, 'SANTA CRUZ TACACHE DE MINA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1381, 20, 'SANTA CRUZ TACAHUA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1382, 20, 'SANTA CRUZ TAYATA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1383, 20, 'SANTA CRUZ XITLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1384, 20, 'SANTA CRUZ XOXOCOTLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1385, 20, 'SANTA CRUZ ZENZONTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1386, 20, 'SANTA GERTRUDIS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1387, 20, 'SANTA INÉS DEL MONTE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1388, 20, 'SANTA INÉS YATZECHE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1389, 20, 'SANTA LUCÍA DEL CAMINO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1390, 20, 'SANTA LUCÍA MIAHUATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1391, 20, 'SANTA LUCÍA MONTEVERDE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1392, 20, 'SANTA LUCÍA OCOTLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1393, 20, 'SANTA MARÍA ALOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1394, 20, 'SANTA MARÍA APAZCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1395, 20, 'SANTA MARÍA LA ASUNCIÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1396, 20, 'HEROICA CIUDAD DE TLAXIACO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1397, 20, 'AYOQUEZCO DE ALDAMA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1398, 20, 'SANTA MARÍA ATZOMPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1399, 20, 'SANTA MARÍA CAMOTLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1400, 20, 'SANTA MARÍA COLOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1401, 20, 'SANTA MARÍA CORTIJO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1402, 20, 'SANTA MARÍA COYOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1403, 20, 'SANTA MARÍA CHACHOÁPAM', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1404, 20, 'VILLA DE CHILAPA DE DÍAZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1405, 20, 'SANTA MARÍA CHILCHOTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1406, 20, 'SANTA MARÍA CHIMALAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1407, 20, 'SANTA MARÍA DEL ROSARIO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1408, 20, 'SANTA MARÍA DEL TULE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1409, 20, 'SANTA MARÍA ECATEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1410, 20, 'SANTA MARÍA GUELACÉ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1411, 20, 'SANTA MARÍA GUIENAGATI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1412, 20, 'SANTA MARÍA HUATULCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1413, 20, 'SANTA MARÍA HUAZOLOTITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1414, 20, 'SANTA MARÍA IPALAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1415, 20, 'SANTA MARÍA IXCATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1416, 20, 'SANTA MARÍA JACATEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1417, 20, 'SANTA MARÍA JALAPA DEL MARQUÉS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1418, 20, 'SANTA MARÍA JALTIANGUIS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1419, 20, 'SANTA MARÍA LACHIXÍO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1420, 20, 'SANTA MARÍA MIXTEQUILLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1421, 20, 'SANTA MARÍA NATIVITAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1422, 20, 'SANTA MARÍA NDUAYACO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1423, 20, 'SANTA MARÍA OZOLOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1424, 20, 'SANTA MARÍA PÁPALO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1425, 20, 'SANTA MARÍA PEÑOLES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1426, 20, 'SANTA MARÍA PETAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1427, 20, 'SANTA MARÍA QUIEGOLANI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1428, 20, 'SANTA MARÍA SOLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1429, 20, 'SANTA MARÍA TATALTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1430, 20, 'SANTA MARÍA TECOMAVACA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1431, 20, 'SANTA MARÍA TEMAXCALAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1432, 20, 'SANTA MARÍA TEMAXCALTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1433, 20, 'SANTA MARÍA TEOPOXCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1434, 20, 'SANTA MARÍA TEPANTLALI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1435, 20, 'SANTA MARÍA TEXCATITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1436, 20, 'SANTA MARÍA TLAHUITOLTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1437, 20, 'SANTA MARÍA TLALIXTAC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1438, 20, 'SANTA MARÍA TONAMECA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1439, 20, 'SANTA MARÍA TOTOLAPILLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1440, 20, 'SANTA MARÍA XADANI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1441, 20, 'SANTA MARÍA YALINA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1442, 20, 'SANTA MARÍA YAVESÍA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1443, 20, 'SANTA MARÍA YOLOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1444, 20, 'SANTA MARÍA YOSOYÚA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1445, 20, 'SANTA MARÍA YUCUHITI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1446, 20, 'SANTA MARÍA ZACATEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1447, 20, 'SANTA MARÍA ZANIZA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1448, 20, 'SANTA MARÍA ZOQUITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1449, 20, 'SANTIAGO AMOLTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1450, 20, 'SANTIAGO APOALA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1451, 20, 'SANTIAGO APÓSTOL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1452, 20, 'SANTIAGO ASTATA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1453, 20, 'SANTIAGO ATITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1454, 20, 'SANTIAGO AYUQUILILLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1455, 20, 'SANTIAGO CACALOXTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1456, 20, 'SANTIAGO CAMOTLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1457, 20, 'SANTIAGO COMALTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1458, 20, 'SANTIAGO CHAZUMBA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1459, 20, 'SANTIAGO CHOÁPAM', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1460, 20, 'SANTIAGO DEL RÍO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1461, 20, 'SANTIAGO HUAJOLOTITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1462, 20, 'SANTIAGO HUAUCLILLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1463, 20, 'SANTIAGO IHUITLÁN PLUMAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1464, 20, 'SANTIAGO IXCUINTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1465, 20, 'SANTIAGO IXTAYUTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1466, 20, 'SANTIAGO JAMILTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1467, 20, 'SANTIAGO JOCOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1468, 20, 'SANTIAGO JUXTLAHUACA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1469, 20, 'SANTIAGO LACHIGUIRI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1470, 20, 'SANTIAGO LALOPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1471, 20, 'SANTIAGO LAOLLAGA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1472, 20, 'SANTIAGO LAXOPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1473, 20, 'SANTIAGO LLANO GRANDE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1474, 20, 'SANTIAGO MATATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1475, 20, 'SANTIAGO MILTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1476, 20, 'SANTIAGO MINAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1477, 20, 'SANTIAGO NACALTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1478, 20, 'SANTIAGO NEJAPILLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1479, 20, 'SANTIAGO NUNDICHE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1480, 20, 'SANTIAGO NUYOÓ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1481, 20, 'SANTIAGO PINOTEPA NACIONAL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1482, 20, 'SANTIAGO SUCHILQUITONGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1483, 20, 'SANTIAGO TAMAZOLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1484, 20, 'SANTIAGO TAPEXTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1485, 20, 'VILLA TEJÚPAM DE LA UNIÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1486, 20, 'SANTIAGO TENANGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1487, 20, 'SANTIAGO TEPETLAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1488, 20, 'SANTIAGO TETEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1489, 20, 'SANTIAGO TEXCALCINGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1490, 20, 'SANTIAGO TEXTITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1491, 20, 'SANTIAGO TILANTONGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1492, 20, 'SANTIAGO TILLO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1493, 20, 'SANTIAGO TLAZOYALTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1494, 20, 'SANTIAGO XANICA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1495, 20, 'SANTIAGO XIACUÍ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1496, 20, 'SANTIAGO YAITEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1497, 20, 'SANTIAGO YAVEO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1498, 20, 'SANTIAGO YOLOMÉCATL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1499, 20, 'SANTIAGO YOSONDÚA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1500, 20, 'SANTIAGO YUCUYACHI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1501, 20, 'SANTIAGO ZACATEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1502, 20, 'SANTIAGO ZOOCHILA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1503, 20, 'NUEVO ZOQUIÁPAM', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1504, 20, 'SANTO DOMINGO INGENIO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1505, 20, 'SANTO DOMINGO ALBARRADAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1506, 20, 'SANTO DOMINGO ARMENTA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1507, 20, 'SANTO DOMINGO CHIHUITÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1508, 20, 'SANTO DOMINGO DE MORELOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1509, 20, 'SANTO DOMINGO IXCATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1510, 20, 'SANTO DOMINGO NUXAÁ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1511, 20, 'SANTO DOMINGO OZOLOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1512, 20, 'SANTO DOMINGO PETAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1513, 20, 'SANTO DOMINGO ROAYAGA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1514, 20, 'SANTO DOMINGO TEHUANTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1515, 20, 'SANTO DOMINGO TEOJOMULCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1516, 20, 'SANTO DOMINGO TEPUXTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1517, 20, 'SANTO DOMINGO TLATAYÁPAM', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1518, 20, 'SANTO DOMINGO TOMALTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1519, 20, 'SANTO DOMINGO TONALÁ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1520, 20, 'SANTO DOMINGO TONALTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1521, 20, 'SANTO DOMINGO XAGACÍA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1522, 20, 'SANTO DOMINGO YANHUITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1523, 20, 'SANTO DOMINGO YODOHINO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1524, 20, 'SANTO DOMINGO ZANATEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1525, 20, 'SANTOS REYES NOPALA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1526, 20, 'SANTOS REYES PÁPALO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1527, 20, 'SANTOS REYES TEPEJILLO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1528, 20, 'SANTOS REYES YUCUNÁ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1529, 20, 'SANTO TOMÁS JALIEZA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1530, 20, 'SANTO TOMÁS MAZALTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1531, 20, 'SANTO TOMÁS OCOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1532, 20, 'SANTO TOMÁS TAMAZULAPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1533, 20, 'SAN VICENTE COATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1534, 20, 'SAN VICENTE LACHIXÍO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1535, 20, 'SAN VICENTE NUÑÚ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1536, 20, 'SILACAYOÁPAM', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1537, 20, 'SITIO DE XITLAPEHUA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1538, 20, 'SOLEDAD ETLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1539, 20, 'VILLA DE TAMAZULÁPAM DEL PROGRESO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1540, 20, 'TANETZE DE ZARAGOZA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1541, 20, 'TANICHE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1542, 20, 'TATALTEPEC DE VALDÉS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1543, 20, 'TEOCOCUILCO DE MARCOS PÉREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1544, 20, 'TEOTITLÁN DE FLORES MAGÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1545, 20, 'TEOTITLÁN DEL VALLE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1546, 20, 'TEOTONGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1547, 20, 'TEPELMEME VILLA DE MORELOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1548, 20, 'TEZOATLÁN DE SEGURA Y LUNA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1549, 20, 'SAN JERÓNIMO TLACOCHAHUAYA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1550, 20, 'TLACOLULA DE MATAMOROS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1551, 20, 'TLACOTEPEC PLUMAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1552, 20, 'TLALIXTAC DE CABRERA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1553, 20, 'TOTONTEPEC VILLA DE MORELOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1554, 20, 'TRINIDAD ZAACHILA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1555, 20, 'LA TRINIDAD VISTA HERMOSA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1556, 20, 'UNIÓN HIDALGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1557, 20, 'VALERIO TRUJANO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1558, 20, 'SAN JUAN BAUTISTA VALLE NACIONAL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1559, 20, 'VILLA DÍAZ ORDAZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1560, 20, 'YAXE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1561, 20, 'MAGDALENA YODOCONO DE PORFIRIO DÍAZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1562, 20, 'YOGANA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1563, 20, 'YUTANDUCHI DE GUERRERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1564, 20, 'VILLA DE ZAACHILA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1565, 20, 'ZAPOTITLÁN DEL RÍO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1566, 20, 'ZAPOTITLÁN LAGUNAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1567, 20, 'ZAPOTITLÁN PALMAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1568, 20, 'SANTA INÉS DE ZARAGOZA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1569, 20, 'ZIMATLÁN DE ÁLVAREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1570, 21, 'ACAJETE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1571, 21, 'ACATENO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1572, 21, 'ACATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1573, 21, 'ACATZINGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1574, 21, 'ACTEOPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1575, 21, 'AHUACATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1576, 21, 'AHUATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1577, 21, 'AHUAZOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1578, 21, 'AHUEHUETITLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1579, 21, 'AJALPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1580, 21, 'ALBINO ZERTUCHE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1581, 21, 'ALJOJUCA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1582, 21, 'ALTEPEXI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1583, 21, 'AMIXTLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1584, 21, 'AMOZOC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1585, 21, 'AQUIXTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1586, 21, 'ATEMPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1587, 21, 'ATEXCAL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1588, 21, 'ATLIXCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1589, 21, 'ATOYATEMPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1590, 21, 'ATZALA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1591, 21, 'ATZITZIHUACÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1592, 21, 'ATZITZINTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1593, 21, 'AXUTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1594, 21, 'AYOTOXCO DE GUERRERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1595, 21, 'CALPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1596, 21, 'CALTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1597, 21, 'CAMOCUAUTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1598, 21, 'CAXHUACAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1599, 21, 'COATEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1600, 21, 'COATZINGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1601, 21, 'COHETZALA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1602, 21, 'COHUECAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1603, 21, 'CORONANGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1604, 21, 'COXCATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1605, 21, 'COYOMEAPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1606, 21, 'COYOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1607, 21, 'CUAPIAXTLA DE MADERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1608, 21, 'CUAUTEMPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1609, 21, 'CUAUTINCHÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1610, 21, 'CUAUTLANCINGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1611, 21, 'CUAYUCA DE ANDRADE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1612, 21, 'CUETZALAN DEL PROGRESO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1613, 21, 'CUYOACO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1614, 21, 'CHALCHICOMULA DE SESMA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1615, 21, 'CHAPULCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1616, 21, 'CHIAUTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1617, 21, 'CHIAUTZINGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1618, 21, 'CHICONCUAUTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1619, 21, 'CHICHIQUILA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1620, 21, 'CHIETLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1621, 21, 'CHIGMECATITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1622, 21, 'CHIGNAHUAPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1623, 21, 'CHIGNAUTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1624, 21, 'CHILA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1625, 21, 'CHILA DE LA SAL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1626, 21, 'HONEY', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1627, 21, 'CHILCHOTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1628, 21, 'CHINANTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1629, 21, 'DOMINGO ARENAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1630, 21, 'ELOXOCHITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1631, 21, 'EPATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1632, 21, 'ESPERANZA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1633, 21, 'FRANCISCO Z. MENA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1634, 21, 'GENERAL FELIPE ÁNGELES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1635, 21, 'GUADALUPE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1636, 21, 'GUADALUPE VICTORIA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1637, 21, 'HERMENEGILDO GALEANA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1638, 21, 'HUAQUECHULA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1639, 21, 'HUATLATLAUCA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1640, 21, 'HUAUCHINANGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1641, 21, 'HUEHUETLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1642, 21, 'HUEHUETLÁN EL CHICO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1643, 21, 'HUEJOTZINGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1644, 21, 'HUEYAPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1645, 21, 'HUEYTAMALCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1646, 21, 'HUEYTLALPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1647, 21, 'HUITZILAN DE SERDÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1648, 21, 'HUITZILTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1649, 21, 'ATLEQUIZAYAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1650, 21, 'IXCAMILPA DE GUERRERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1651, 21, 'IXCAQUIXTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1652, 21, 'IXTACAMAXTITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1653, 21, 'IXTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1654, 21, 'IZÚCAR DE MATAMOROS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1655, 21, 'JALPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1656, 21, 'JOLALPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1657, 21, 'JONOTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1658, 21, 'JOPALA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1659, 21, 'JUAN C. BONILLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1660, 21, 'JUAN GALINDO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1661, 21, 'JUAN N. MÉNDEZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1662, 21, 'LAFRAGUA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1663, 21, 'LIBRES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1664, 21, 'LA MAGDALENA TLATLAUQUITEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1665, 21, 'MAZAPILTEPEC DE JUÁREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1666, 21, 'MIXTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1667, 21, 'MOLCAXAC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1668, 21, 'CAÑADA MORELOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1669, 21, 'NAUPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1670, 21, 'NAUZONTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1671, 21, 'NEALTICAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1672, 21, 'NICOLÁS BRAVO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1673, 21, 'NOPALUCAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1674, 21, 'OCOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1675, 21, 'OCOYUCAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1676, 21, 'OLINTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1677, 21, 'ORIENTAL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1678, 21, 'PAHUATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1679, 21, 'PALMAR DE BRAVO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1680, 21, 'PANTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1681, 21, 'PETLALCINGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1682, 21, 'PIAXTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1683, 21, 'PUEBLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1684, 21, 'QUECHOLAC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1685, 21, 'QUIMIXTLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1686, 21, 'RAFAEL LARA GRAJALES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1687, 21, 'LOS REYES DE JUÁREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1688, 21, 'SAN ANDRÉS CHOLULA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1689, 21, 'SAN ANTONIO CAÑADA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1690, 21, 'SAN DIEGO LA MESA TOCHIMILTZINGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1691, 21, 'SAN FELIPE TEOTLALCINGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1692, 21, 'SAN FELIPE TEPATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1693, 21, 'SAN GABRIEL CHILAC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1694, 21, 'SAN GREGORIO ATZOMPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1695, 21, 'SAN JERÓNIMO TECUANIPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1696, 21, 'SAN JERÓNIMO XAYACATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1697, 21, 'SAN JOSÉ CHIAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1698, 21, 'SAN JOSÉ MIAHUATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1699, 21, 'SAN JUAN ATENCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1700, 21, 'SAN JUAN ATZOMPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1701, 21, 'SAN MARTÍN TEXMELUCAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1702, 21, 'SAN MARTÍN TOTOLTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1703, 21, 'SAN MATÍAS TLALANCALECA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1704, 21, 'SAN MIGUEL IXITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1705, 21, 'SAN MIGUEL XOXTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1706, 21, 'SAN NICOLÁS BUENOS AIRES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1707, 21, 'SAN NICOLÁS DE LOS RANCHOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1708, 21, 'SAN PABLO ANICANO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1709, 21, 'SAN PEDRO CHOLULA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1710, 21, 'SAN PEDRO YELOIXTLAHUACA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1711, 21, 'SAN SALVADOR EL SECO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1712, 21, 'SAN SALVADOR EL VERDE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1713, 21, 'SAN SALVADOR HUIXCOLOTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1714, 21, 'SAN SEBASTIÁN TLACOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1715, 21, 'SANTA CATARINA TLALTEMPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1716, 21, 'SANTA INÉS AHUATEMPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1717, 21, 'SANTA ISABEL CHOLULA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1718, 21, 'SANTIAGO MIAHUATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1719, 21, 'HUEHUETLÁN EL GRANDE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1720, 21, 'SANTO TOMÁS HUEYOTLIPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1721, 21, 'SOLTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1722, 21, 'TECALI DE HERRERA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1723, 21, 'TECAMACHALCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1724, 21, 'TECOMATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1725, 21, 'TEHUACÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1726, 21, 'TEHUITZINGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1727, 21, 'TENAMPULCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1728, 21, 'TEOPANTLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1729, 21, 'TEOTLALCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1730, 21, 'TEPANCO DE LÓPEZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1731, 21, 'TEPANGO DE RODRÍGUEZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1732, 21, 'TEPATLAXCO DE HIDALGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1733, 21, 'TEPEACA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1734, 21, 'TEPEMAXALCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1735, 21, 'TEPEOJUMA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1736, 21, 'TEPETZINTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1737, 21, 'TEPEXCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1738, 21, 'TEPEXI DE RODRÍGUEZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1739, 21, 'TEPEYAHUALCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1740, 21, 'TEPEYAHUALCO DE CUAUHTÉMOC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1741, 21, 'TETELA DE OCAMPO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1742, 21, 'TETELES DE AVILA CASTILLO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1743, 21, 'TEZIUTLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1744, 21, 'TIANGUISMANALCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1745, 21, 'TILAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1746, 21, 'TLACOTEPEC DE BENITO JUÁREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1747, 21, 'TLACUILOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1748, 21, 'TLACHICHUCA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1749, 21, 'TLAHUAPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1750, 21, 'TLALTENANGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1751, 21, 'TLANEPANTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1752, 21, 'TLAOLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1753, 21, 'TLAPACOYA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1754, 21, 'TLAPANALÁ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1755, 21, 'TLATLAUQUITEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1756, 21, 'TLAXCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1757, 21, 'TOCHIMILCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1758, 21, 'TOCHTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1759, 21, 'TOTOLTEPEC DE GUERRERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1760, 21, 'TULCINGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1761, 21, 'TUZAMAPAN DE GALEANA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1762, 21, 'TZICATLACOYAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1763, 21, 'VENUSTIANO CARRANZA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1764, 21, 'VICENTE GUERRERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1765, 21, 'XAYACATLÁN DE BRAVO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1766, 21, 'XICOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1767, 21, 'XICOTLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1768, 21, 'XIUTETELCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1769, 21, 'XOCHIAPULCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1770, 21, 'XOCHILTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1771, 21, 'XOCHITLÁN DE VICENTE SUÁREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1772, 21, 'XOCHITLÁN TODOS SANTOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1773, 21, 'YAONÁHUAC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1774, 21, 'YEHUALTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1775, 21, 'ZACAPALA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1776, 21, 'ZACAPOAXTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1777, 21, 'ZACATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1778, 21, 'ZAPOTITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1779, 21, 'ZAPOTITLÁN DE MÉNDEZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1780, 21, 'ZARAGOZA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1781, 21, 'ZAUTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1782, 21, 'ZIHUATEUTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1783, 21, 'ZINACATEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1784, 21, 'ZONGOZOTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1785, 21, 'ZOQUIAPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1786, 21, 'ZOQUITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1787, 22, 'AMEALCO DE BONFIL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1788, 22, 'PINAL DE AMOLES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1789, 22, 'ARROYO SECO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1790, 22, 'CADEREYTA DE MONTES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1791, 22, 'COLÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1792, 22, 'CORREGIDORA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1793, 22, 'EZEQUIEL MONTES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1794, 22, 'HUIMILPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1795, 22, 'JALPAN DE SERRA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1796, 22, 'LANDA DE MATAMOROS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1797, 22, 'EL MARQUÉS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1798, 22, 'PEDRO ESCOBEDO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1799, 22, 'PEÑAMILLER', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1800, 22, 'QUERÉTARO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1801, 22, 'SAN JOAQUÍN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1802, 22, 'SAN JUAN DEL RÍO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1803, 22, 'TEQUISQUIAPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1804, 22, 'TOLIMÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1805, 23, 'COZUMEL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1806, 23, 'FELIPE CARRILLO PUERTO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1807, 23, 'ISLA MUJERES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1808, 23, 'OTHÓN P. BLANCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1809, 23, 'BENITO JUÁREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1810, 23, 'JOSÉ MARÍA MORELOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1811, 23, 'LÁZARO CÁRDENAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1812, 23, 'SOLIDARIDAD', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1813, 23, 'TULUM', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1814, 24, 'AHUALULCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1815, 24, 'ALAQUINES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1816, 24, 'AQUISMÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1817, 24, 'ARMADILLO DE LOS INFANTE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1818, 24, 'CÁRDENAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1819, 24, 'CATORCE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1820, 24, 'CEDRAL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1821, 24, 'CERRITOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1822, 24, 'CERRO DE SAN PEDRO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1823, 24, 'CIUDAD DEL MAÍZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1824, 24, 'CIUDAD FERNÁNDEZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1825, 24, 'TANCANHUITZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1826, 24, 'CIUDAD VALLES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1827, 24, 'COXCATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1828, 24, 'CHARCAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1829, 24, 'EBANO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1830, 24, 'GUADALCÁZAR', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1831, 24, 'HUEHUETLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1832, 24, 'LAGUNILLAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1833, 24, 'MATEHUALA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1834, 24, 'MEXQUITIC DE CARMONA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1835, 24, 'MOCTEZUMA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1836, 24, 'RAYÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1837, 24, 'RIOVERDE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1838, 24, 'SALINAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1839, 24, 'SAN ANTONIO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1840, 24, 'SAN CIRO DE ACOSTA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1841, 24, 'SAN LUIS POTOSÍ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1842, 24, 'SAN MARTÍN CHALCHICUAUTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1843, 24, 'SAN NICOLÁS TOLENTINO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1844, 24, 'SANTA CATARINA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1845, 24, 'SANTA MARÍA DEL RÍO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1846, 24, 'SANTO DOMINGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1847, 24, 'SAN VICENTE TANCUAYALAB', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1848, 24, 'SOLEDAD DE GRACIANO SÁNCHEZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1849, 24, 'TAMASOPO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1850, 24, 'TAMAZUNCHALE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1851, 24, 'TAMPACÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1852, 24, 'TAMPAMOLÓN CORONA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1853, 24, 'TAMUÍN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1854, 24, 'TANLAJÁS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1855, 24, 'TANQUIÁN DE ESCOBEDO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1856, 24, 'TIERRA NUEVA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1857, 24, 'VANEGAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1858, 24, 'VENADO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1859, 24, 'VILLA DE ARRIAGA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1860, 24, 'VILLA DE GUADALUPE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1861, 24, 'VILLA DE LA PAZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1862, 24, 'VILLA DE RAMOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1863, 24, 'VILLA DE REYES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1864, 24, 'VILLA HIDALGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1865, 24, 'VILLA JUÁREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1866, 24, 'AXTLA DE TERRAZAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1867, 24, 'XILITLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1868, 24, 'ZARAGOZA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1869, 24, 'VILLA DE ARISTA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1870, 24, 'MATLAPA', 'AC');

-- =============================================
-- Tablas académicas y datos de ejemplo
-- =============================================

-- Tabla de alumnos
DROP TABLE IF EXISTS `pro_alumnos`;
CREATE TABLE `pro_alumnos` (
  `eCodAlumno` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tMatricula` varchar(20) NOT NULL,
  `tNombre` varchar(100) NOT NULL,
  `tApellidoPaterno` varchar(100) NOT NULL,
  `tApellidoMaterno` varchar(100) DEFAULT NULL,
  `tGrupo` varchar(10) NOT NULL,
  `tTurno` varchar(2) NOT NULL,
  `fhFechaRegistro` datetime NOT NULL,
  `tCodEstatus` varchar(2) NOT NULL DEFAULT 'AC',
  PRIMARY KEY (`eCodAlumno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Datos de ejemplo para alumnos
INSERT INTO `pro_alumnos` (`tMatricula`, `tNombre`, `tApellidoPaterno`, `tApellidoMaterno`, `tGrupo`, `tTurno`, `fhFechaRegistro`, `tCodEstatus`) VALUES
('A0001', 'Juan', 'Pérez', 'García', '101', 'M', NOW(), 'AC'),
('A0002', 'María', 'López', 'Martínez', '101', 'M', NOW(), 'AC'),
('A0003', 'Carlos', 'Ramírez', 'Sánchez', '102', 'V', NOW(), 'AC'),
('A0004', 'Ana', 'Hernández', 'Torres', '102', 'V', NOW(), 'AC'),
('A0005', 'Luis', 'Gómez', 'Díaz', '103', 'M', NOW(), 'AC'),
('A0006', 'Laura', 'Jiménez', 'Ruiz', '103', 'M', NOW(), 'AC'),
('A0007', 'Miguel', 'Morales', 'Vega', '104', 'V', NOW(), 'AC'),
('A0008', 'Sofía', 'Castillo', 'Flores', '104', 'V', NOW(), 'AC'),
('A0009', 'Jorge', 'Ríos', 'Navarro', '105', 'M', NOW(), 'AC'),
('A0010', 'Valeria', 'Ortega', 'Cruz', '105', 'M', NOW(), 'AC'),
('A0011', 'Pedro', 'Mendoza', 'Silva', '106', 'V', NOW(), 'AC'),
('A0012', 'Fernanda', 'Soto', 'Aguilar', '106', 'V', NOW(), 'AC'),
('A0013', 'Diego', 'Vargas', 'Ponce', '107', 'M', NOW(), 'AC'),
('A0014', 'Paola', 'Reyes', 'Salinas', '107', 'M', NOW(), 'AC'),
('A0015', 'Ricardo', 'Cordero', 'Bravo', '108', 'V', NOW(), 'AC'),
('A0016', 'Andrea', 'Luna', 'Campos', '108', 'V', NOW(), 'AC'),
('A0017', 'Emilio', 'Serrano', 'Peña', '109', 'M', NOW(), 'AC'),
('A0018', 'Gabriela', 'León', 'Mora', '109', 'M', NOW(), 'AC'),
('A0019', 'Roberto', 'Cruz', 'Solís', '110', 'V', NOW(), 'AC'),
('A0020', 'Patricia', 'Ramos', 'Delgado', '110', 'V', NOW(), 'AC'),
('A0021', 'Hugo', 'Vega', 'Santos', '111', 'M', NOW(), 'AC'),
('A0022', 'Mónica', 'Paredes', 'Lara', '111', 'M', NOW(), 'AC'),
('A0023', 'Iván', 'Sánchez', 'Guzmán', '112', 'V', NOW(), 'AC'),
('A0024', 'Diana', 'Castañeda', 'Rangel', '112', 'V', NOW(), 'AC'),
('A0025', 'Oscar', 'García', 'Molina', '113', 'M', NOW(), 'AC'),
('A0026', 'Claudia', 'Martínez', 'Padilla', '113', 'M', NOW(), 'AC'),
('A0027', 'Manuel', 'Salazar', 'Franco', '114', 'V', NOW(), 'AC'),
('A0028', 'Alejandra', 'Campos', 'Soto', '114', 'V', NOW(), 'AC'),
('A0029', 'Enrique', 'Gutiérrez', 'López', '115', 'M', NOW(), 'AC'),
('A0030', 'Isabel', 'Mora', 'García', '115', 'M', NOW(), 'AC'),
('A0031', 'Raúl', 'Peña', 'Vargas', '116', 'V', NOW(), 'AC'),
('A0032', 'Teresa', 'Bravo', 'Cordero', '116', 'V', NOW(), 'AC'),
('A0033', 'Armando', 'Delgado', 'Ríos', '117', 'M', NOW(), 'AC'),
('A0034', 'Verónica', 'Santos', 'León', '117', 'M', NOW(), 'AC'),
('A0035', 'Francisco', 'Navarro', 'Reyes', '118', 'V', NOW(), 'AC'),
('A0036', 'Cecilia', 'Aguilar', 'Serrano', '118', 'V', NOW(), 'AC'),
('A0037', 'Guillermo', 'Silva', 'Ortega', '119', 'M', NOW(), 'AC'),
('A0038', 'Rosa', 'Lara', 'Vega', '119', 'M', NOW(), 'AC'),
('A0039', 'Jesús', 'Campos', 'Morales', '120', 'V', NOW(), 'AC'),
('A0040', 'Sandra', 'Guzmán', 'Paredes', '120', 'V', NOW(), 'AC'),
('A0041', 'Alberto', 'Molina', 'Castañeda', '121', 'M', NOW(), 'AC'),
('A0042', 'Lucía', 'Padilla', 'Salazar', '121', 'M', NOW(), 'AC'),
('A0043', 'Felipe', 'Franco', 'Gutiérrez', '122', 'V', NOW(), 'AC'),
('A0044', 'Marina', 'Soto', 'Mora', '122', 'V', NOW(), 'AC'),
('A0045', 'Esteban', 'López', 'Peña', '123', 'M', NOW(), 'AC'),
('A0046', 'Beatriz', 'García', 'Bravo', '123', 'M', NOW(), 'AC'),
('A0047', 'Mauricio', 'Cordero', 'Delgado', '124', 'V', NOW(), 'AC'),
('A0048', 'Silvia', 'León', 'Santos', '124', 'V', NOW(), 'AC'),
('A0049', 'Gerardo', 'Rangel', 'Navarro', '125', 'M', NOW(), 'AC'),
('A0050', 'Patricia', 'Vega', 'Aguilar', '125', 'M', NOW(), 'AC');

-- Tabla de materias
DROP TABLE IF EXISTS `cat_materias`;
CREATE TABLE `cat_materias` (
  `eCodMateria` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tClave` varchar(10) NOT NULL,
  `tNombre` varchar(100) NOT NULL,
  `eCreditos` int(11) NOT NULL,
  `tCodEstatus` varchar(2) NOT NULL DEFAULT 'AC',
  PRIMARY KEY (`eCodMateria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Datos de ejemplo para materias
INSERT INTO `cat_materias` (`tClave`, `tNombre`, `eCreditos`, `tCodEstatus`) VALUES
('MAT101', 'Matemáticas', 8, 'AC'),
('FIS101', 'Física', 8, 'AC'),
('QUI101', 'Química', 8, 'AC'),
('BIO101', 'Biología', 8, 'AC'),
('HIS101', 'Historia', 6, 'AC'),
('LEN101', 'Lengua Española', 6, 'AC'),
('ING101', 'Inglés', 6, 'AC'),
('INF101', 'Informática', 6, 'AC'),
('DEP101', 'Deportes', 4, 'AC'),
('ART101', 'Artes', 4, 'AC');

-- Tabla de calificaciones
DROP TABLE IF EXISTS `pro_calificaciones`;
CREATE TABLE `pro_calificaciones` (
  `eCodCalificacion` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `eCodAlumno` int(11) UNSIGNED NOT NULL,
  `eCodMateria` int(11) UNSIGNED NOT NULL,
  `eParcial` int(11) NOT NULL,
  `dCalificacion` decimal(5,2) NOT NULL,
  `tTipo` varchar(2) NOT NULL DEFAULT 'OR',
  `fhFecha` date NOT NULL,
  `tCodEstatus` varchar(2) NOT NULL DEFAULT 'AC',
  PRIMARY KEY (`eCodCalificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Ejemplo de datos de calificaciones (primeros 10 alumnos, 3 parciales, 2 materias)
INSERT INTO `pro_calificaciones` (`eCodAlumno`, `eCodMateria`, `eParcial`, `dCalificacion`, `tTipo`, `fhFecha`, `tCodEstatus`) VALUES
(1, 1, 1, 8.5, 'OR', '2025-09-01', 'AC'),
(1, 1, 2, 9.0, 'OR', '2025-10-01', 'AC'),
(1, 1, 3, 8.8, 'OR', '2025-11-01', 'AC'),
(1, 2, 1, 7.5, 'OR', '2025-09-01', 'AC'),
(1, 2, 2, 8.0, 'OR', '2025-10-01', 'AC'),
(1, 2, 3, 7.8, 'OR', '2025-11-01', 'AC'),
(2, 1, 1, 9.2, 'OR', '2025-09-01', 'AC'),
(2, 1, 2, 8.7, 'OR', '2025-10-01', 'AC'),
(2, 1, 3, 9.0, 'OR', '2025-11-01', 'AC'),
(2, 2, 1, 8.5, 'OR', '2025-09-01', 'AC'),
(2, 2, 2, 8.9, 'OR', '2025-10-01', 'AC'),
(2, 2, 3, 9.1, 'OR', '2025-11-01', 'AC');

-- Tabla de asistencias
DROP TABLE IF EXISTS `pro_asistencias`;
CREATE TABLE `pro_asistencias` (
  `eCodAsistencia` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `eCodAlumno` int(11) UNSIGNED NOT NULL,
  `eCodMateria` int(11) UNSIGNED NOT NULL,
  `fhFecha` date NOT NULL,
  `tEstatus` varchar(2) NOT NULL,
  `tCodEstatus` varchar(2) NOT NULL DEFAULT 'AC',
  PRIMARY KEY (`eCodAsistencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Ejemplo de asistencias (primeros 5 alumnos, 2 materias, 2 fechas)
INSERT INTO `pro_asistencias` (`eCodAlumno`, `eCodMateria`, `fhFecha`, `tEstatus`, `tCodEstatus`) VALUES
(1, 1, '2025-09-01', 'A', 'AC'),
(1, 2, '2025-09-01', 'A', 'AC'),
(2, 1, '2025-09-01', 'F', 'AC'),
(2, 2, '2025-09-01', 'A', 'AC'),
(3, 1, '2025-09-01', 'A', 'AC'),
(3, 2, '2025-09-01', 'A', 'AC'),
(4, 1, '2025-09-01', 'A', 'AC'),
(4, 2, '2025-09-01', 'F', 'AC'),
(5, 1, '2025-09-01', 'A', 'AC'),
(5, 2, '2025-09-01', 'A', 'AC');

-- Tabla de relación alumnos-materias
DROP TABLE IF EXISTS `rel_alumnosmaterias`;
CREATE TABLE `rel_alumnosmaterias` (
  `eCodAlumnosMaterias` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `eCodAlumno` int(11) UNSIGNED NOT NULL,
  `eCodMateria` int(11) UNSIGNED NOT NULL,
  `tCodEstatus` varchar(2) NOT NULL DEFAULT 'AC',
  PRIMARY KEY (`eCodAlumnosMaterias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Ejemplo de relación alumnos-materias (primeros 10 alumnos inscritos en las 2 primeras materias)
INSERT INTO `rel_alumnosmaterias` (`eCodAlumno`, `eCodMateria`, `tCodEstatus`) VALUES
(1, 1, 'AC'),
(1, 2, 'AC'),
(2, 1, 'AC'),
(2, 2, 'AC'),
(3, 1, 'AC'),
(3, 2, 'AC'),
(4, 1, 'AC'),
(4, 2, 'AC'),
(5, 1, 'AC'),
(5, 2, 'AC'),
(6, 1, 'AC'),
(6, 2, 'AC'),
(7, 1, 'AC'),
(7, 2, 'AC'),
(8, 1, 'AC'),
(8, 2, 'AC'),
(9, 1, 'AC'),
(9, 2, 'AC'),
(10, 1, 'AC'),
(10, 2, 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1871, 24, 'EL NARANJO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1872, 25, 'AHOME', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1873, 25, 'ANGOSTURA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1874, 25, 'BADIRAGUATO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1875, 25, 'CONCORDIA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1876, 25, 'COSALÁ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1877, 25, 'CULIACÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1878, 25, 'CHOIX', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1879, 25, 'ELOTA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1880, 25, 'ESCUINAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1881, 25, 'EL FUERTE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1882, 25, 'GUASAVE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1883, 25, 'MAZATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1884, 25, 'MOCORITO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1885, 25, 'ROSARIO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1886, 25, 'SALVADOR ALVARADO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1887, 25, 'SAN IGNACIO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1888, 25, 'SINALOA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1889, 25, 'NAVOLATO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1890, 26, 'ACONCHI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1891, 26, 'AGUA PRIETA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1892, 26, 'ALAMOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1893, 26, 'ALTAR', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1894, 26, 'ARIVECHI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1895, 26, 'ARIZPE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1896, 26, 'ATIL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1897, 26, 'BACADÉHUACHI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1898, 26, 'BACANORA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1899, 26, 'BACERAC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1900, 26, 'BACOACHI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1901, 26, 'BÁCUM', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1902, 26, 'BANÁMICHI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1903, 26, 'BAVIÁCORA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1904, 26, 'BAVISPE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1905, 26, 'BENJAMÍN HILL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1906, 26, 'CABORCA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1907, 26, 'CAJEME', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1908, 26, 'CANANEA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1909, 26, 'CARBÓ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1910, 26, 'LA COLORADA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1911, 26, 'CUCURPE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1912, 26, 'CUMPAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1913, 26, 'DIVISADEROS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1914, 26, 'EMPALME', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1915, 26, 'ETCHOJOA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1916, 26, 'FRONTERAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1917, 26, 'GRANADOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1918, 26, 'GUAYMAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1919, 26, 'HERMOSILLO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1920, 26, 'HUACHINERA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1921, 26, 'HUÁSABAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1922, 26, 'HUATABAMPO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1923, 26, 'HUÉPAC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1924, 26, 'IMURIS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1925, 26, 'MAGDALENA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1926, 26, 'MAZATÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1927, 26, 'MOCTEZUMA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1928, 26, 'NACO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1929, 26, 'NÁCORI CHICO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1930, 26, 'NACOZARI DE GARCÍA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1931, 26, 'NAVOJOA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1932, 26, 'NOGALES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1933, 26, 'ONAVAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1934, 26, 'OPODEPE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1935, 26, 'OQUITOA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1936, 26, 'PITIQUITO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1937, 26, 'PUERTO PEÑASCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1938, 26, 'QUIRIEGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1939, 26, 'RAYÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1940, 26, 'ROSARIO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1941, 26, 'SAHUARIPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1942, 26, 'SAN FELIPE DE JESÚS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1943, 26, 'SAN JAVIER', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1944, 26, 'SAN LUIS RÍO COLORADO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1945, 26, 'SAN MIGUEL DE HORCASITAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1946, 26, 'SAN PEDRO DE LA CUEVA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1947, 26, 'SANTA ANA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1948, 26, 'SANTA CRUZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1949, 26, 'SÁRIC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1950, 26, 'SOYOPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1951, 26, 'SUAQUI GRANDE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1952, 26, 'TEPACHE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1953, 26, 'TRINCHERAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1954, 26, 'TUBUTAMA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1955, 26, 'URES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1956, 26, 'VILLA HIDALGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1957, 26, 'VILLA PESQUEIRA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1958, 26, 'YÉCORA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1959, 26, 'GENERAL PLUTARCO ELÍAS CALLES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1960, 26, 'BENITO JUÁREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1961, 26, 'SAN IGNACIO RÍO MUERTO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1962, 27, 'BALANCÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1963, 27, 'CÁRDENAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1964, 27, 'CENTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1965, 27, 'CENTRO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1966, 27, 'COMALCALCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1967, 27, 'CUNDUACÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1968, 27, 'EMILIANO ZAPATA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1969, 27, 'HUIMANGUILLO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1970, 27, 'JALAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1971, 27, 'JALPA DE MÉNDEZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1972, 27, 'JONUTA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1973, 27, 'MACUSPANA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1974, 27, 'NACAJUCA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1975, 27, 'PARAÍSO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1976, 27, 'TACOTALPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1977, 27, 'TEAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1978, 27, 'TENOSIQUE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1979, 28, 'ABASOLO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1980, 28, 'ALDAMA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1981, 28, 'ALTAMIRA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1982, 28, 'ANTIGUO MORELOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1983, 28, 'BURGOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1984, 28, 'BUSTAMANTE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1985, 28, 'CAMARGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1986, 28, 'CASAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1987, 28, 'CIUDAD MADERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1988, 28, 'CRUILLAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1989, 28, 'GÓMEZ FARÍAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1990, 28, 'GONZÁLEZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1991, 28, 'GÜÉMEZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1992, 28, 'GUERRERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1993, 28, 'GUSTAVO DÍAZ ORDAZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1994, 28, 'HIDALGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1995, 28, 'JAUMAVE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1996, 28, 'JIMÉNEZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1997, 28, 'LLERA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1998, 28, 'MAINERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (1999, 28, 'EL MANTE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2000, 28, 'MATAMOROS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2001, 28, 'MÉNDEZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2002, 28, 'MIER', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2003, 28, 'MIGUEL ALEMÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2004, 28, 'MIQUIHUANA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2005, 28, 'NUEVO LAREDO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2006, 28, 'NUEVO MORELOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2007, 28, 'OCAMPO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2008, 28, 'PADILLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2009, 28, 'PALMILLAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2010, 28, 'REYNOSA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2011, 28, 'RÍO BRAVO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2012, 28, 'SAN CARLOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2013, 28, 'SAN FERNANDO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2014, 28, 'SAN NICOLÁS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2015, 28, 'SOTO LA MARINA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2016, 28, 'TAMPICO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2017, 28, 'TULA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2018, 28, 'VALLE HERMOSO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2019, 28, 'VICTORIA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2020, 28, 'VILLAGRÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2021, 28, 'XICOTÉNCATL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2022, 29, 'AMAXAC DE GUERRERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2023, 29, 'APETATITLÁN DE ANTONIO CARVAJAL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2024, 29, 'ATLANGATEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2025, 29, 'ATLTZAYANCA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2026, 29, 'APIZACO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2027, 29, 'CALPULALPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2028, 29, 'EL CARMEN TEQUEXQUITLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2029, 29, 'CUAPIAXTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2030, 29, 'CUAXOMULCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2031, 29, 'CHIAUTEMPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2032, 29, 'MUÑOZ DE DOMINGO ARENAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2033, 29, 'ESPAÑITA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2034, 29, 'HUAMANTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2035, 29, 'HUEYOTLIPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2036, 29, 'IXTACUIXTLA DE MARIANO MATAMOROS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2037, 29, 'IXTENCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2038, 29, 'MAZATECOCHCO DE JOSÉ MARÍA MORELOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2039, 29, 'CONTLA DE JUAN CUAMATZI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2040, 29, 'TEPETITLA DE LARDIZÁBAL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2041, 29, 'SANCTÓRUM DE LÁZARO CÁRDENAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2042, 29, 'NANACAMILPA DE MARIANO ARISTA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2043, 29, 'ACUAMANALA DE MIGUEL HIDALGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2044, 29, 'NATÍVITAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2045, 29, 'PANOTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2046, 29, 'SAN PABLO DEL MONTE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2047, 29, 'SANTA CRUZ TLAXCALA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2048, 29, 'TENANCINGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2049, 29, 'TEOLOCHOLCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2050, 29, 'TEPEYANCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2051, 29, 'TERRENATE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2052, 29, 'TETLA DE LA SOLIDARIDAD', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2053, 29, 'TETLATLAHUCA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2054, 29, 'TLAXCALA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2055, 29, 'TLAXCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2056, 29, 'TOCATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2057, 29, 'TOTOLAC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2058, 29, 'ZILTLALTÉPEC DE TRINIDAD SÁNCHEZ SANTOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2059, 29, 'TZOMPANTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2060, 29, 'XALOZTOC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2061, 29, 'XALTOCAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2062, 29, 'PAPALOTLA DE XICOHTÉNCATL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2063, 29, 'XICOHTZINCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2064, 29, 'YAUHQUEMEHCAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2065, 29, 'ZACATELCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2066, 29, 'BENITO JUÁREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2067, 29, 'EMILIANO ZAPATA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2068, 29, 'LÁZARO CÁRDENAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2069, 29, 'LA MAGDALENA TLALTELULCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2070, 29, 'SAN DAMIÁN TEXÓLOC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2071, 29, 'SAN FRANCISCO TETLANOHCAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2072, 29, 'SAN JERÓNIMO ZACUALPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2073, 29, 'SAN JOSÉ TEACALCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2074, 29, 'SAN JUAN HUACTZINCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2075, 29, 'SAN LORENZO AXOCOMANITLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2076, 29, 'SAN LUCAS TECOPILCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2077, 29, 'SANTA ANA NOPALUCAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2078, 29, 'SANTA APOLONIA TEACALCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2079, 29, 'SANTA CATARINA AYOMETLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2080, 29, 'SANTA CRUZ QUILEHTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2081, 29, 'SANTA ISABEL XILOXOXTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2082, 30, 'ACAJETE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2083, 30, 'ACATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2084, 30, 'ACAYUCAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2085, 30, 'ACTOPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2086, 30, 'ACULA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2087, 30, 'ACULTZINGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2088, 30, 'CAMARÓN DE TEJEDA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2089, 30, 'ALPATLÁHUAC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2090, 30, 'ALTO LUCERO DE GUTIÉRREZ BARRIOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2091, 30, 'ALTOTONGA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2092, 30, 'ALVARADO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2093, 30, 'AMATITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2094, 30, 'NARANJOS AMATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2095, 30, 'AMATLÁN DE LOS REYES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2096, 30, 'ANGEL R. CABADA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2097, 30, 'LA ANTIGUA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2098, 30, 'APAZAPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2099, 30, 'AQUILA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2100, 30, 'ASTACINGA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2101, 30, 'ATLAHUILCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2102, 30, 'ATOYAC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2103, 30, 'ATZACAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2104, 30, 'ATZALAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2105, 30, 'TLALTETELA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2106, 30, 'AYAHUALULCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2107, 30, 'BANDERILLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2108, 30, 'BENITO JUÁREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2109, 30, 'BOCA DEL RÍO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2110, 30, 'CALCAHUALCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2111, 30, 'CAMERINO Z. MENDOZA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2112, 30, 'CARRILLO PUERTO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2113, 30, 'CATEMACO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2114, 30, 'CAZONES DE HERRERA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2115, 30, 'CERRO AZUL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2116, 30, 'CITLALTÉPETL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2117, 30, 'COACOATZINTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2118, 30, 'COAHUITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2119, 30, 'COATEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2120, 30, 'COATZACOALCOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2121, 30, 'COATZINTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2122, 30, 'COETZALA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2123, 30, 'COLIPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2124, 30, 'COMAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2125, 30, 'CÓRDOBA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2126, 30, 'COSAMALOAPAN DE CARPIO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2127, 30, 'COSAUTLÁN DE CARVAJAL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2128, 30, 'COSCOMATEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2129, 30, 'COSOLEACAQUE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2130, 30, 'COTAXTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2131, 30, 'COXQUIHUI', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2132, 30, 'COYUTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2133, 30, 'CUICHAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2134, 30, 'CUITLÁHUAC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2135, 30, 'CHACALTIANGUIS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2136, 30, 'CHALMA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2137, 30, 'CHICONAMEL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2138, 30, 'CHICONQUIACO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2139, 30, 'CHICONTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2140, 30, 'CHINAMECA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2141, 30, 'CHINAMPA DE GOROSTIZA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2142, 30, 'LAS CHOAPAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2143, 30, 'CHOCAMÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2144, 30, 'CHONTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2145, 30, 'CHUMATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2146, 30, 'EMILIANO ZAPATA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2147, 30, 'ESPINAL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2148, 30, 'FILOMENO MATA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2149, 30, 'FORTÍN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2150, 30, 'GUTIÉRREZ ZAMORA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2151, 30, 'HIDALGOTITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2152, 30, 'HUATUSCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2153, 30, 'HUAYACOCOTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2154, 30, 'HUEYAPAN DE OCAMPO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2155, 30, 'HUILOAPAN DE CUAUHTÉMOC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2156, 30, 'IGNACIO DE LA LLAVE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2157, 30, 'ILAMATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2158, 30, 'ISLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2159, 30, 'IXCATEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2160, 30, 'IXHUACÁN DE LOS REYES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2161, 30, 'IXHUATLÁN DEL CAFÉ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2162, 30, 'IXHUATLANCILLO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2163, 30, 'IXHUATLÁN DEL SURESTE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2164, 30, 'IXHUATLÁN DE MADERO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2165, 30, 'IXMATLAHUACAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2166, 30, 'IXTACZOQUITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2167, 30, 'JALACINGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2168, 30, 'XALAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2169, 30, 'JALCOMULCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2170, 30, 'JÁLTIPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2171, 30, 'JAMAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2172, 30, 'JESÚS CARRANZA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2173, 30, 'XICO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2174, 30, 'JILOTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2175, 30, 'JUAN RODRÍGUEZ CLARA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2176, 30, 'JUCHIQUE DE FERRER', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2177, 30, 'LANDERO Y COSS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2178, 30, 'LERDO DE TEJADA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2179, 30, 'MAGDALENA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2180, 30, 'MALTRATA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2181, 30, 'MANLIO FABIO ALTAMIRANO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2182, 30, 'MARIANO ESCOBEDO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2183, 30, 'MARTÍNEZ DE LA TORRE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2184, 30, 'MECATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2185, 30, 'MECAYAPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2186, 30, 'MEDELLÍN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2187, 30, 'MIAHUATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2188, 30, 'LAS MINAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2189, 30, 'MINATITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2190, 30, 'MISANTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2191, 30, 'MIXTLA DE ALTAMIRANO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2192, 30, 'MOLOACÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2193, 30, 'NAOLINCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2194, 30, 'NARANJAL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2195, 30, 'NAUTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2196, 30, 'NOGALES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2197, 30, 'OLUTA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2198, 30, 'OMEALCA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2199, 30, 'ORIZABA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2200, 30, 'OTATITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2201, 30, 'OTEAPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2202, 30, 'OZULUAMA DE MASCAREÑAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2203, 30, 'PAJAPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2204, 30, 'PÁNUCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2205, 30, 'PAPANTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2206, 30, 'PASO DEL MACHO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2207, 30, 'PASO DE OVEJAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2208, 30, 'LA PERLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2209, 30, 'PEROTE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2210, 30, 'PLATÓN SÁNCHEZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2211, 30, 'PLAYA VICENTE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2212, 30, 'POZA RICA DE HIDALGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2213, 30, 'LAS VIGAS DE RAMÍREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2214, 30, 'PUEBLO VIEJO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2215, 30, 'PUENTE NACIONAL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2216, 30, 'RAFAEL DELGADO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2217, 30, 'RAFAEL LUCIO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2218, 30, 'LOS REYES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2219, 30, 'RÍO BLANCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2220, 30, 'SALTABARRANCA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2221, 30, 'SAN ANDRÉS TENEJAPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2222, 30, 'SAN ANDRÉS TUXTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2223, 30, 'SAN JUAN EVANGELISTA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2224, 30, 'SANTIAGO TUXTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2225, 30, 'SAYULA DE ALEMÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2226, 30, 'SOCONUSCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2227, 30, 'SOCHIAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2228, 30, 'SOLEDAD ATZOMPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2229, 30, 'SOLEDAD DE DOBLADO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2230, 30, 'SOTEAPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2231, 30, 'TAMALÍN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2232, 30, 'TAMIAHUA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2233, 30, 'TAMPICO ALTO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2234, 30, 'TANCOCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2235, 30, 'TANTIMA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2236, 30, 'TANTOYUCA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2237, 30, 'TATATILA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2238, 30, 'CASTILLO DE TEAYO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2239, 30, 'TECOLUTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2240, 30, 'TEHUIPANGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2241, 30, 'ÁLAMO TEMAPACHE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2242, 30, 'TEMPOAL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2243, 30, 'TENAMPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2244, 30, 'TENOCHTITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2245, 30, 'TEOCELO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2246, 30, 'TEPATLAXCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2247, 30, 'TEPETLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2248, 30, 'TEPETZINTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2249, 30, 'TEQUILA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2250, 30, 'JOSÉ AZUETA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2251, 30, 'TEXCATEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2252, 30, 'TEXHUACÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2253, 30, 'TEXISTEPEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2254, 30, 'TEZONAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2255, 30, 'TIERRA BLANCA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2256, 30, 'TIHUATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2257, 30, 'TLACOJALPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2258, 30, 'TLACOLULAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2259, 30, 'TLACOTALPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2260, 30, 'TLACOTEPEC DE MEJÍA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2261, 30, 'TLACHICHILCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2262, 30, 'TLALIXCOYAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2263, 30, 'TLALNELHUAYOCAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2264, 30, 'TLAPACOYAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2265, 30, 'TLAQUILPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2266, 30, 'TLILAPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2267, 30, 'TOMATLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2268, 30, 'TONAYÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2269, 30, 'TOTUTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2270, 30, 'TUXPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2271, 30, 'TUXTILLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2272, 30, 'URSULO GALVÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2273, 30, 'VEGA DE ALATORRE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2274, 30, 'VERACRUZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2275, 30, 'VILLA ALDAMA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2276, 30, 'XOXOCOTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2277, 30, 'YANGA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2278, 30, 'YECUATLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2279, 30, 'ZACUALPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2280, 30, 'ZARAGOZA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2281, 30, 'ZENTLA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2282, 30, 'ZONGOLICA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2283, 30, 'ZONTECOMATLÁN DE LÓPEZ Y FUENTES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2284, 30, 'ZOZOCOLCO DE HIDALGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2285, 30, 'AGUA DULCE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2286, 30, 'EL HIGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2287, 30, 'NANCHITAL DE LÁZARO CÁRDENAS DEL RÍO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2288, 30, 'TRES VALLES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2289, 30, 'CARLOS A. CARRILLO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2290, 30, 'TATAHUICAPAN DE JUÁREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2291, 30, 'UXPANAPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2292, 30, 'SAN RAFAEL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2293, 30, 'SANTIAGO SOCHIAPAN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2294, 31, 'ABALÁ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2295, 31, 'ACANCEH', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2296, 31, 'AKIL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2297, 31, 'BACA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2298, 31, 'BOKOBÁ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2299, 31, 'BUCTZOTZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2300, 31, 'CACALCHÉN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2301, 31, 'CALOTMUL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2302, 31, 'CANSAHCAB', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2303, 31, 'CANTAMAYEC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2304, 31, 'CELESTÚN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2305, 31, 'CENOTILLO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2306, 31, 'CONKAL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2307, 31, 'CUNCUNUL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2308, 31, 'CUZAMÁ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2309, 31, 'CHACSINKÍN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2310, 31, 'CHANKOM', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2311, 31, 'CHAPAB', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2312, 31, 'CHEMAX', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2313, 31, 'CHICXULUB PUEBLO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2314, 31, 'CHICHIMILÁ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2315, 31, 'CHIKINDZONOT', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2316, 31, 'CHOCHOLÁ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2317, 31, 'CHUMAYEL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2318, 31, 'DZÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2319, 31, 'DZEMUL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2320, 31, 'DZIDZANTÚN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2321, 31, 'DZILAM DE BRAVO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2322, 31, 'DZILAM GONZÁLEZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2323, 31, 'DZITÁS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2324, 31, 'DZONCAUICH', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2325, 31, 'ESPITA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2326, 31, 'HALACHÓ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2327, 31, 'HOCABÁ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2328, 31, 'HOCTÚN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2329, 31, 'HOMÚN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2330, 31, 'HUHÍ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2331, 31, 'HUNUCMÁ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2332, 31, 'IXIL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2333, 31, 'IZAMAL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2334, 31, 'KANASÍN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2335, 31, 'KANTUNIL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2336, 31, 'KAUA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2337, 31, 'KINCHIL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2338, 31, 'KOPOMÁ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2339, 31, 'MAMA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2340, 31, 'MANÍ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2341, 31, 'MAXCANÚ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2342, 31, 'MAYAPÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2343, 31, 'MÉRIDA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2344, 31, 'MOCOCHÁ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2345, 31, 'MOTUL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2346, 31, 'MUNA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2347, 31, 'MUXUPIP', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2348, 31, 'OPICHÉN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2349, 31, 'OXKUTZCAB', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2350, 31, 'PANABÁ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2351, 31, 'PETO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2352, 31, 'PROGRESO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2353, 31, 'QUINTANA ROO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2354, 31, 'RÍO LAGARTOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2355, 31, 'SACALUM', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2356, 31, 'SAMAHIL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2357, 31, 'SANAHCAT', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2358, 31, 'SAN FELIPE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2359, 31, 'SANTA ELENA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2360, 31, 'SEYÉ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2361, 31, 'SINANCHÉ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2362, 31, 'SOTUTA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2363, 31, 'SUCILÁ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2364, 31, 'SUDZAL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2365, 31, 'SUMA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2366, 31, 'TAHDZIÚ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2367, 31, 'TAHMEK', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2368, 31, 'TEABO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2369, 31, 'TECOH', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2370, 31, 'TEKAL DE VENEGAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2371, 31, 'TEKANTÓ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2372, 31, 'TEKAX', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2373, 31, 'TEKIT', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2374, 31, 'TEKOM', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2375, 31, 'TELCHAC PUEBLO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2376, 31, 'TELCHAC PUERTO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2377, 31, 'TEMAX', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2378, 31, 'TEMOZÓN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2379, 31, 'TEPAKÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2380, 31, 'TETIZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2381, 31, 'TEYA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2382, 31, 'TICUL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2383, 31, 'TIMUCUY', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2384, 31, 'TINUM', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2385, 31, 'TIXCACALCUPUL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2386, 31, 'TIXKOKOB', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2387, 31, 'TIXMEHUAC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2388, 31, 'TIXPÉHUAL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2389, 31, 'TIZIMÍN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2390, 31, 'TUNKÁS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2391, 31, 'TZUCACAB', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2392, 31, 'UAYMA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2393, 31, 'UCÚ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2394, 31, 'UMÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2395, 31, 'VALLADOLID', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2396, 31, 'XOCCHEL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2397, 31, 'YAXCABÁ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2398, 31, 'YAXKUKUL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2399, 31, 'YOBAÍN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2400, 32, 'APOZOL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2401, 32, 'APULCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2402, 32, 'ATOLINGA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2403, 32, 'BENITO JUÁREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2404, 32, 'CALERA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2405, 32, 'CAÑITAS DE FELIPE PESCADOR', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2406, 32, 'CONCEPCIÓN DEL ORO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2407, 32, 'CUAUHTÉMOC', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2408, 32, 'CHALCHIHUITES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2409, 32, 'FRESNILLO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2410, 32, 'TRINIDAD GARCÍA DE LA CADENA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2411, 32, 'GENARO CODINA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2412, 32, 'GENERAL ENRIQUE ESTRADA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2413, 32, 'GENERAL FRANCISCO R. MURGUÍA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2414, 32, 'EL PLATEADO DE JOAQUÍN AMARO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2415, 32, 'GENERAL PÁNFILO NATERA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2416, 32, 'GUADALUPE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2417, 32, 'HUANUSCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2418, 32, 'JALPA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2419, 32, 'JEREZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2420, 32, 'JIMÉNEZ DEL TEUL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2421, 32, 'JUAN ALDAMA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2422, 32, 'JUCHIPILA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2423, 32, 'LORETO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2424, 32, 'LUIS MOYA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2425, 32, 'MAZAPIL', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2426, 32, 'MELCHOR OCAMPO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2427, 32, 'MEZQUITAL DEL ORO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2428, 32, 'MIGUEL AUZA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2429, 32, 'MOMAX', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2430, 32, 'MONTE ESCOBEDO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2431, 32, 'MORELOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2432, 32, 'MOYAHUA DE ESTRADA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2433, 32, 'NOCHISTLÁN DE MEJÍA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2434, 32, 'NORIA DE ÁNGELES', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2435, 32, 'OJOCALIENTE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2436, 32, 'PÁNUCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2437, 32, 'PINOS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2438, 32, 'RÍO GRANDE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2439, 32, 'SAIN ALTO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2440, 32, 'EL SALVADOR', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2441, 32, 'SOMBRERETE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2442, 32, 'SUSTICACÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2443, 32, 'TABASCO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2444, 32, 'TEPECHITLÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2445, 32, 'TEPETONGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2446, 32, 'TEÚL DE GONZÁLEZ ORTEGA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2447, 32, 'TLALTENANGO DE SÁNCHEZ ROMÁN', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2448, 32, 'VALPARAÍSO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2449, 32, 'VETAGRANDE', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2450, 32, 'VILLA DE COS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2451, 32, 'VILLA GARCÍA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2452, 32, 'VILLA GONZÁLEZ ORTEGA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2453, 32, 'VILLA HIDALGO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2454, 32, 'VILLANUEVA', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2455, 32, 'ZACATECAS', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2456, 32, 'TRANCOSO', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2457, 32, 'SANTA MARÍA DE LA PAZ', 'AC');
INSERT INTO `cat_municipiosmx` VALUES (2458, 25, 'LOS MOCHIS', 'AC');

-- ----------------------------
-- Table structure for cat_paises
-- ----------------------------
DROP TABLE IF EXISTS `cat_paises`;
CREATE TABLE `cat_paises`  (
  `eCodPais` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tCodPais` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tNombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`eCodPais`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cat_paises
-- ----------------------------
INSERT INTO `cat_paises` VALUES (1, 'MX', 'MÉXICO');
INSERT INTO `cat_paises` VALUES (2, 'US', 'E.U.A');
INSERT INTO `cat_paises` VALUES (3, 'CA', 'CANADÁ');
INSERT INTO `cat_paises` VALUES (4, 'CL', 'CHILE');
INSERT INTO `cat_paises` VALUES (5, 'CN', 'CHINA');
INSERT INTO `cat_paises` VALUES (6, 'AU', 'AUSTRALIA');
INSERT INTO `cat_paises` VALUES (7, 'GT', 'GUATEMALA');

-- ----------------------------
-- Table structure for cat_perfiles
-- ----------------------------
DROP TABLE IF EXISTS `cat_perfiles`;
CREATE TABLE `cat_perfiles`  (
  `eCodPerfil` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tNombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tCodEstatus` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`eCodPerfil`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cat_perfiles
-- ----------------------------
INSERT INTO `cat_perfiles` VALUES (1, 'SuperAdministrador', 'AC');
INSERT INTO `cat_perfiles` VALUES (2, 'Director', 'AC');
INSERT INTO `cat_perfiles` VALUES (3, 'Usuario Normal', 'AC');
INSERT INTO `cat_perfiles` VALUES (4, 'Capturistas', 'AC');

-- ----------------------------
-- Table structure for cat_permisos
-- ----------------------------
DROP TABLE IF EXISTS `cat_permisos`;
CREATE TABLE `cat_permisos`  (
  `eCodPermiso` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `eCodSeccion` int(11) UNSIGNED NOT NULL,
  `tCodPermiso` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ePosicion` int(11) NULL DEFAULT NULL,
  `tNombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tBoton` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `aEstatus` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`eCodPermiso`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cat_permisos
-- ----------------------------
INSERT INTO `cat_permisos` VALUES (1, 1, 'm1_s1_p1', 1, 'Filtrar', '<button type=\'button\' class=\'btn btn-lg btn-info\' onclick=\'filtrar();\'><i class=\'fa fa-search-o\'></i> Filtrar</button>', NULL);
INSERT INTO `cat_permisos` VALUES (2, 3, 'm2_s1_p1', 1, 'Guardar', '<button type=\'button\' class=\'btn btn-lg btn-success\' onclick=\'guardar(this);\'><i class=\'fa fa-save\'></i> Guardar</button>', NULL);
INSERT INTO `cat_permisos` VALUES (3, 4, 'm2_s2_p1', NULL, 'Detalle de Información', '<a title=\'Detalle\' href=\'#divInfo\' onclick=\'info($(this).parent())\' data-toggle=\'tooltip\' class=\'modal-basic btn btn-sm btn-default\'><i class=\'fa fa-info-circle\'></i></a>', 'AC,CA,EL');
INSERT INTO `cat_permisos` VALUES (5, 4, 'm2_s2_p3', NULL, 'Eliminar', '<a title=\'Eliminar\' href=\'#divEliminar\' onclick=\'eliminar($(this).parent())\' data-toggle=\'tooltip\' class=\'modal-basic btn-sm btn btn-default\'><i class=\'fa fa-trash-o\'></i></a>', 'AC,CA,EL');
INSERT INTO `cat_permisos` VALUES (6, 4, 'm2_s2_p4', NULL, 'Cambiar Password', '<a title=\'Cambiar Password\' href=\'#divPassword\' onclick=\'password_id($(this).parent())\' data-toggle=\'tooltip\' class=\'modal-basic btn btn-sm btn-default\'><i class=\'fa fa-key\'></i></a>', 'AC,CA,EL');
INSERT INTO `cat_permisos` VALUES (7, 4, 'm2_s2_p5', NULL, 'Editar', '<button title=\'Editar\' type=\'button\' class=\'btn btn-sm btn-default\' onclick=\'editar($(this).parent());\' data-toggle=\'tooltip\'><i class=\'fa fa-pencil\'></i></button>', 'AC,CA,EL');
INSERT INTO `cat_permisos` VALUES (8, 5, 'm2_s3_p1', NULL, 'Nuevo', '<button type=\'button\' class=\'btn btn-lg btn-default\' onclick=\'nuevo();\'><i class=\'fa fa-plus\'></i> Nuevo</button>', NULL);
INSERT INTO `cat_permisos` VALUES (9, 5, 'm2_s3_p2', NULL, 'Editar', '<button type=\'button\' class=\'btn btn-lg btn-default\' onclick=\'editar();\'><i class=\'fa fa-pencil\'></i> Editar</button>', NULL);
INSERT INTO `cat_permisos` VALUES (10, 6, 'm3_s1_p1', 1, 'Guardar', '<button type=\'button\' class=\'btn btn-lg btn-success\' onclick=\'guardar(this);\'><i class=\'fa fa-save\'></i> Guardar</button>', NULL);
INSERT INTO `cat_permisos` VALUES (11, 7, 'm3_s2_p1', NULL, 'Detalle de Información', '<a title=\'Detalle\' href=\'#divInfo\' onclick=\'info($(this).parent())\' data-toggle=\'tooltip\' class=\'modal-basic btn btn-sm btn-default\'><i class=\'fa fa-info-circle\'></i></a>', 'AC,CA,EL');
INSERT INTO `cat_permisos` VALUES (12, 7, 'm3_s2_p2', 3, 'Eliminar', '<a title=\'Eliminar\' href=\'#divEliminarItem\' onclick=\'cargaritemeliminar($(this).parent())\' data-toggle=\'tooltip\' class=\'modal-basic btn-sm btn btn-default\'><i class=\'fa fa-trash-o\'></i></a>', 'AC,CA,EL');
INSERT INTO `cat_permisos` VALUES (13, 7, 'm3_s2_p3', NULL, 'Editar', '<button title=\'Editar\' type=\'button\' class=\'btn btn-sm btn-default\' onclick=\'editar($(this).parent());\' data-toggle=\'tooltip\'><i class=\'fa fa-pencil\'></i></button>', 'AC,CA,EL');

-- ----------------------------
-- Table structure for cat_personas
-- ----------------------------
DROP TABLE IF EXISTS `cat_personas`;
CREATE TABLE `cat_personas`  (
  `eCodPersona` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id principal de la tabla personas',
  `tNombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nombre(s) de la persona',
  `tApellidoPaterno` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Apellido Paterno',
  `tApellidoMaterno` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Apellido Materno',
  `eCodTipoPersona` int(11) NOT NULL COMMENT 'Id del catálogo de Tipo de Personas',
  `tCURP` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'CURP',
  `tRFC` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'RFC',
  `tNSS` bigint(11) NULL DEFAULT NULL COMMENT 'Número de Seguridad Social',
  `fhFechaNacimiento` date NOT NULL COMMENT 'Fecha de Nacimiento',
  `eCodGenero` int(11) NOT NULL COMMENT 'Género',
  `tCalle` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Calle',
  `tNumeroExterior` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Número Exterior',
  `tNumeroInterior` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Número Interior',
  `eCodMunicipio` int(11) NOT NULL COMMENT 'Id del Municipio',
  `eCodEstado` int(11) NOT NULL COMMENT 'Id del Estado',
  `eCodPais` int(11) NOT NULL COMMENT 'Id del Pais',
  `eCodigoPostal` bigint(11) NOT NULL COMMENT 'Código Postal',
  `tCorreo` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Correo Electrónico',
  `tTelefono` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Télefono Celular',
  `tImagen` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fhFechaActualizacion` datetime NULL DEFAULT NULL,
  `fhFechaRegistro` datetime NOT NULL,
  `tCodEstatus` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'AC' COMMENT 'Código del Estatus ejemplo AC = Activo',
  PRIMARY KEY (`eCodPersona`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cat_personas
-- ----------------------------

-- ----------------------------
-- Table structure for cat_secciones
-- ----------------------------
DROP TABLE IF EXISTS `cat_secciones`;
CREATE TABLE `cat_secciones`  (
  `eCodSeccion` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `eCodModulo` int(10) UNSIGNED NOT NULL,
  `tCodSeccion` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ePosicion` int(11) NULL DEFAULT NULL,
  `tIcono` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `tNombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tNombreCorto` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`eCodSeccion`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cat_secciones
-- ----------------------------
INSERT INTO `cat_secciones` VALUES (1, 1, 'm1_s1', 1, 'fa fa-bug', 'Log Evento', 'LogEvento');
INSERT INTO `cat_secciones` VALUES (3, 2, 'm2_s1', 1, 'fa fa-plus-square', 'Nuevo', 'Nuevo');
INSERT INTO `cat_secciones` VALUES (4, 2, 'm2_s2', 2, 'fa fa-list-alt', 'Listado', 'Listado');
INSERT INTO `cat_secciones` VALUES (5, 2, 'm2_s3', 3, 'fa fa-users', 'Perfiles', 'Perfiles');
INSERT INTO `cat_secciones` VALUES (6, 3, 'm3_s1', 1, 'fa fa-plus-square', 'Nuevo', 'Nuevo');
INSERT INTO `cat_secciones` VALUES (7, 3, 'm3_s2', 2, 'fa fa-list-alt', 'Listado', 'Listado');

-- ----------------------------
-- Table structure for cat_tipositems
-- ----------------------------
DROP TABLE IF EXISTS `cat_tipositems`;
CREATE TABLE `cat_tipositems`  (
  `eCodTipoItem` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tNombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tCodEstatus` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'AC',
  PRIMARY KEY (`eCodTipoItem`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cat_tipositems
-- ----------------------------
INSERT INTO `cat_tipositems` VALUES (1, 'Fruta', 'AC');
INSERT INTO `cat_tipositems` VALUES (2, 'Verdura', 'AC');
INSERT INTO `cat_tipositems` VALUES (3, 'Mueble', 'AC');
INSERT INTO `cat_tipositems` VALUES (4, 'Otros', 'AC');

-- ----------------------------
-- Table structure for cat_tipospersonas
-- ----------------------------
DROP TABLE IF EXISTS `cat_tipospersonas`;
CREATE TABLE `cat_tipospersonas`  (
  `eCodTipoPersona` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tDescripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fhFechaActualizacion` datetime NULL DEFAULT NULL,
  `fhFechaRegistro` datetime NOT NULL,
  `tCodEstatus` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'AC' COMMENT 'Código del Estatus ejemplo AC = Activo',
  PRIMARY KEY (`eCodTipoPersona`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cat_tipospersonas
-- ----------------------------
INSERT INTO `cat_tipospersonas` VALUES (1, 'Alumno', NULL, '2025-10-10 22:22:55', 'AC');
INSERT INTO `cat_tipospersonas` VALUES (2, 'Directivo', NULL, '2025-10-10 22:23:13', 'AC');
INSERT INTO `cat_tipospersonas` VALUES (3, 'Administrativo', NULL, '2025-10-10 22:23:26', 'AC');
INSERT INTO `cat_tipospersonas` VALUES (4, 'Docente', NULL, '2025-10-10 22:23:42', 'AC');
INSERT INTO `cat_tipospersonas` VALUES (5, 'Sistemas', NULL, '2025-10-10 22:24:28', 'AC');
INSERT INTO `cat_tipospersonas` VALUES (6, 'Operativo', NULL, '2025-10-10 22:25:27', 'AC');

-- ----------------------------
-- Table structure for cat_usuarios
-- ----------------------------
DROP TABLE IF EXISTS `cat_usuarios`;
CREATE TABLE `cat_usuarios`  (
  `eCodUsuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `eCodEmpresa` int(11) NULL DEFAULT NULL,
  `eCodDepartamento` int(10) UNSIGNED NULL DEFAULT NULL,
  `tTelefono` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `eCodPerfil` int(10) UNSIGNED NOT NULL,
  `bAdmin` tinyint(1) NOT NULL DEFAULT 0,
  `tNombre` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tCorreo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tUsuario` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tPassword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `eCodPersona` int(11) NULL DEFAULT NULL,
  `tPuesto` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tImagen` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fhFechaRegistro` datetime NOT NULL,
  `fhFechaActualizacion` datetime NULL DEFAULT NULL,
  `tCodEstatus` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'AC',
  PRIMARY KEY (`eCodUsuario`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cat_usuarios
-- ----------------------------
INSERT INTO `cat_usuarios` VALUES (1, 1, 1, '(449) 24 67395', 1, 1, 'Ing. Luis Vargas', 'jvargas@utma.edu.mx', 'jvargas', '03d6665042db1b68955174347dedfe107075cb5a', NULL, 'SuperAdmin', 'images/usuarios/user_man1.jpg', '2024-05-23 10:26:22', '2025-09-22 20:32:39', 'AC');
INSERT INTO `cat_usuarios` VALUES (2, 1, 2, '(449) 12 34321', 2, 1, 'Admin', 'director@utma.edu.mx', 'director', '5c8e6e9cb80f09a1faab30a61b6fbf7c838205b9', NULL, 'Director General', 'images/usuarios/user_man1.jpg', '2024-05-23 11:29:19', '2024-05-23 16:21:33', 'AC');
INSERT INTO `cat_usuarios` VALUES (3, 1, 3, '(449) 78 96541', 3, 0, 'Usuario Normal', 'prueba@utma.edu.mx', 'usuario', '5c8e6e9cb80f09a1faab30a61b6fbf7c838205b9', NULL, 'Usuario Normal', 'images/usuarios/user_man1.jpg', '2024-05-23 12:01:51', '2024-05-23 16:33:53', 'AC');
INSERT INTO `cat_usuarios` VALUES (4, 1, 1, '(449) 95 13573', 3, 0, 'Prueba 2', 'a@utma.edu.mx', 'prueba2', '5c8e6e9cb80f09a1faab30a61b6fbf7c838205b9', NULL, 'Otro', 'images/usuarios/user_man1.jpg', '2024-05-24 23:57:28', '2024-05-25 00:22:03', 'AC');

-- ----------------------------
-- Table structure for cog_correos
-- ----------------------------
DROP TABLE IF EXISTS `cog_correos`;
CREATE TABLE `cog_correos`  (
  `eCodCorreo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `eCodEmpresa` int(10) UNSIGNED NOT NULL,
  `tProtocolo` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tHost` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tPuerto` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tUsuario` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tPassword` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tEncabezado` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `tPie` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `tCodEstatus` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`eCodCorreo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cog_correos
-- ----------------------------

-- ----------------------------
-- Table structure for pro_logseventos
-- ----------------------------
DROP TABLE IF EXISTS `pro_logseventos`;
CREATE TABLE `pro_logseventos`  (
  `eCodLogEvento` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `eCodUsuario` int(10) UNSIGNED NOT NULL,
  `eCodEvento` int(11) NULL DEFAULT NULL,
  `tEvento` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fhFechaRegistro` datetime NOT NULL,
  `tCodEstatus` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`eCodLogEvento`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pro_logseventos
-- ----------------------------
INSERT INTO `pro_logseventos` VALUES (1, 1, 8, 'El Usuario: lvargas accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.1.66', '2024-05-24 15:05:15', 'AC');
INSERT INTO `pro_logseventos` VALUES (2, 1, 8, 'El Usuario: lvargas accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.1.66', '2024-05-24 15:11:43', 'AC');
INSERT INTO `pro_logseventos` VALUES (3, 1, 8, 'El Usuario: lvargas accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.1.66', '2024-05-24 15:31:01', 'AC');
INSERT INTO `pro_logseventos` VALUES (4, 1, 8, 'El Usuario: lvargas accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.1.66', '2024-05-24 15:44:08', 'AC');
INSERT INTO `pro_logseventos` VALUES (5, 1, 8, 'El Usuario: lvargas accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.1.66', '2024-05-24 17:16:56', 'AC');
INSERT INTO `pro_logseventos` VALUES (6, 1, 8, 'El Usuario: lvargas accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.1.66', '2024-05-24 18:11:05', 'AC');
INSERT INTO `pro_logseventos` VALUES (7, 1, 8, 'El Usuario: lvargas accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.1.66', '2024-05-24 18:13:00', 'AC');
INSERT INTO `pro_logseventos` VALUES (8, 1, 1, 'Se registró usuario con código #4', '2024-05-24 23:57:28', 'AC');
INSERT INTO `pro_logseventos` VALUES (9, 4, 8, 'El Usuario: prueba2 accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.1.66', '2024-05-25 00:22:26', 'AC');
INSERT INTO `pro_logseventos` VALUES (10, 1, 8, 'El Usuario: lvargas accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.1.66', '2024-05-25 00:22:39', 'AC');
INSERT INTO `pro_logseventos` VALUES (11, 1, 8, 'El Usuario: lvargas accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.1.66', '2024-05-25 09:42:10', 'AC');
INSERT INTO `pro_logseventos` VALUES (12, 1, 8, 'El Usuario: lvargas accedió al sistema desde la IP Pública: ::1 | IP Local: 10.10.2.79', '2025-09-22 20:27:51', 'AC');
INSERT INTO `pro_logseventos` VALUES (13, 0, 8, 'Intentaron acceder al sistema con el Usuario: \" lvarags \" | Contraseña: \" Kiubix_123. \" desde la IP Pública: ::1 | IP Local: 10.10.2.79', '2025-09-22 20:32:08', 'AC');
INSERT INTO `pro_logseventos` VALUES (14, 1, 8, 'El Usuario: lvargas accedió al sistema desde la IP Pública: ::1 | IP Local: 10.10.2.79', '2025-09-22 20:32:16', 'AC');
INSERT INTO `pro_logseventos` VALUES (15, 1, 8, 'El Usuario: lvargas accedió al sistema desde la IP Pública: ::1 | IP Local: 10.10.2.79', '2025-09-22 20:32:53', 'AC');
INSERT INTO `pro_logseventos` VALUES (16, 0, 8, 'Intentaron acceder al sistema con el Usuario: \" jvargas \" | Contraseña: \" Kiubix_123. \" desde la IP Pública: ::1 | IP Local: 192.168.18.5', '2025-09-23 20:17:21', 'AC');
INSERT INTO `pro_logseventos` VALUES (17, 0, 8, 'Intentaron acceder al sistema con el Usuario: \" jvargas \" | Contraseña: \" utma2025 \" desde la IP Pública: ::1 | IP Local: 192.168.18.5', '2025-09-23 20:17:29', 'AC');
INSERT INTO `pro_logseventos` VALUES (18, 0, 8, 'Intentaron acceder al sistema con el Usuario: \" jvargas \" | Contraseña: \" utma_academico \" desde la IP Pública: ::1 | IP Local: 192.168.18.5', '2025-09-23 20:19:35', 'AC');
INSERT INTO `pro_logseventos` VALUES (19, 0, 8, 'Intentaron acceder al sistema con el Usuario: \" jvargas \" | Contraseña: \" utma_academico \" desde la IP Pública: ::1 | IP Local: 192.168.18.5', '2025-09-23 20:20:02', 'AC');
INSERT INTO `pro_logseventos` VALUES (20, 1, 8, 'El Usuario: jvargas accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.18.5', '2025-09-23 20:20:15', 'AC');
INSERT INTO `pro_logseventos` VALUES (21, 1, 8, 'El Usuario: jvargas accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.18.5', '2025-09-23 20:21:56', 'AC');
INSERT INTO `pro_logseventos` VALUES (22, 0, 8, 'Intentaron acceder al sistema con el Usuario: \" jvargas \" | Contraseña: \" utma2025 \" desde la IP Pública: ::1 | IP Local: 192.168.18.5', '2025-09-26 13:42:37', 'AC');
INSERT INTO `pro_logseventos` VALUES (23, 0, 8, 'Intentaron acceder al sistema con el Usuario: \" jvargas \" | Contraseña: \" Utma2025 \" desde la IP Pública: ::1 | IP Local: 192.168.18.5', '2025-09-26 13:42:48', 'AC');
INSERT INTO `pro_logseventos` VALUES (24, 0, 8, 'Intentaron acceder al sistema con el Usuario: \" jvargas \" | Contraseña: \" Utma2025 \" desde la IP Pública: ::1 | IP Local: 192.168.18.5', '2025-09-26 13:43:29', 'AC');
INSERT INTO `pro_logseventos` VALUES (25, 0, 8, 'Intentaron acceder al sistema con el Usuario: \" jvargas \" | Contraseña: \" utma \" desde la IP Pública: ::1 | IP Local: 192.168.18.5', '2025-09-26 13:46:55', 'AC');
INSERT INTO `pro_logseventos` VALUES (26, 1, 8, 'El Usuario: jvargas accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.18.5', '2025-09-26 13:48:53', 'AC');
INSERT INTO `pro_logseventos` VALUES (27, 1, 8, 'El Usuario: jvargas accedió al sistema desde la IP Pública: ::1 | IP Local: 10.10.2.79', '2025-09-26 19:53:14', 'AC');
INSERT INTO `pro_logseventos` VALUES (28, 0, 8, 'Intentaron acceder al sistema con el Usuario: \" lvargas \" | Contraseña: \" pruebautma \" desde la IP Pública: ::1 | IP Local: 192.168.18.5', '2025-10-07 21:57:06', 'AC');
INSERT INTO `pro_logseventos` VALUES (29, 1, 8, 'El Usuario: jvargas accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.18.5', '2025-10-07 21:57:19', 'AC');
INSERT INTO `pro_logseventos` VALUES (30, 1, 8, 'El Usuario: jvargas accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.18.5', '2025-10-07 22:23:48', 'AC');
INSERT INTO `pro_logseventos` VALUES (31, 1, 8, 'El Usuario: jvargas accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.18.5', '2025-10-07 22:24:16', 'AC');
INSERT INTO `pro_logseventos` VALUES (32, 1, 8, 'El Usuario: jvargas accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.18.5', '2025-10-07 22:29:19', 'AC');
INSERT INTO `pro_logseventos` VALUES (33, 0, 8, 'Intentaron acceder al sistema con el Usuario: \" asdasd \" | Contraseña: \" asdasd \" desde la IP Pública: ::1 | IP Local: 192.168.18.5', '2025-10-07 22:34:05', 'AC');
INSERT INTO `pro_logseventos` VALUES (34, 1, 8, 'El Usuario: jvargas accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.18.5', '2025-10-07 22:36:20', 'AC');
INSERT INTO `pro_logseventos` VALUES (35, 1, 8, 'El Usuario: jvargas accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.18.5', '2025-10-10 22:49:42', 'AC');
INSERT INTO `pro_logseventos` VALUES (36, 0, 8, 'Intentaron acceder al sistema con el Usuario: \" jvargas \" | Contraseña: \" pruebasutma \" desde la IP Pública: ::1 | IP Local: 10.10.2.93', '2025-10-13 18:28:28', 'AC');
INSERT INTO `pro_logseventos` VALUES (37, 1, 8, 'El Usuario: jvargas accedió al sistema desde la IP Pública: ::1 | IP Local: 10.10.2.93', '2025-10-13 18:28:34', 'AC');
INSERT INTO `pro_logseventos` VALUES (38, 1, 8, 'El Usuario: jvargas accedió al sistema desde la IP Pública: ::1 | IP Local: 10.10.0.204', '2025-10-17 17:30:43', 'AC');
INSERT INTO `pro_logseventos` VALUES (39, 1, 8, 'El Usuario: jvargas accedió al sistema desde la IP Pública: ::1 | IP Local: 10.10.0.247', '2025-10-24 18:09:25', 'AC');
INSERT INTO `pro_logseventos` VALUES (40, 1, 8, 'El Usuario: jvargas accedió al sistema desde la IP Pública: ::1 | IP Local: 10.10.0.229', '2025-10-27 16:28:08', 'AC');
INSERT INTO `pro_logseventos` VALUES (41, 1, 8, 'El Usuario: jvargas accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.18.5', '2025-10-27 22:43:11', 'AC');
INSERT INTO `pro_logseventos` VALUES (42, 1, 8, 'El Usuario: jvargas accedió al sistema desde la IP Pública: ::1 | IP Local: 192.168.18.5', '2025-10-27 22:44:13', 'AC');

-- ----------------------------
-- Table structure for rel_perfilespermisos
-- ----------------------------
DROP TABLE IF EXISTS `rel_perfilespermisos`;
CREATE TABLE `rel_perfilespermisos`  (
  `eCodPerfilPermiso` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `eCodPerfil` int(10) UNSIGNED NOT NULL,
  `eCodPermiso` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`eCodPerfilPermiso`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rel_perfilespermisos
-- ----------------------------
INSERT INTO `rel_perfilespermisos` VALUES (1, 1, 1);
INSERT INTO `rel_perfilespermisos` VALUES (2, 1, 2);
INSERT INTO `rel_perfilespermisos` VALUES (3, 1, 3);
INSERT INTO `rel_perfilespermisos` VALUES (4, 1, 4);
INSERT INTO `rel_perfilespermisos` VALUES (5, 1, 5);
INSERT INTO `rel_perfilespermisos` VALUES (6, 1, 6);
INSERT INTO `rel_perfilespermisos` VALUES (7, 1, 7);
INSERT INTO `rel_perfilespermisos` VALUES (8, 1, 8);
INSERT INTO `rel_perfilespermisos` VALUES (9, 1, 9);
INSERT INTO `rel_perfilespermisos` VALUES (10, 1, 10);
INSERT INTO `rel_perfilespermisos` VALUES (11, 1, 11);
INSERT INTO `rel_perfilespermisos` VALUES (12, 1, 12);
INSERT INTO `rel_perfilespermisos` VALUES (17, 4, 10);
INSERT INTO `rel_perfilespermisos` VALUES (18, 4, 11);
INSERT INTO `rel_perfilespermisos` VALUES (19, 4, 12);

-- ----------------------------
-- View structure for vestados
-- ----------------------------
DROP VIEW IF EXISTS `vestados`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vestados` AS select `cat_estadosmx`.`eCodEstado` AS `eCodEstado`,`cat_estadosmx`.`tNombre` AS `tNombre`,`cat_estadosmx`.`tCodEstatus` AS `tCodEstatus` from `cat_estadosmx`;

-- ----------------------------
-- View structure for vgeneros
-- ----------------------------
DROP VIEW IF EXISTS `vgeneros`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vgeneros` AS select `cat_generos`.`eCodGenero` AS `eCodGenero`,`cat_generos`.`tNombre` AS `tNombre` from `cat_generos`;

-- ----------------------------
-- View structure for vmunicipios
-- ----------------------------
DROP VIEW IF EXISTS `vmunicipios`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vmunicipios` AS select `cat_municipiosmx`.`eCodMunicipio` AS `eCodMunicipio`,`cat_municipiosmx`.`eCodEstado` AS `eCodEstado`,`cat_municipiosmx`.`tNombre` AS `tNombre`,`cat_municipiosmx`.`tCodEstatus` AS `tCodEstatus` from `cat_municipiosmx`;

-- ----------------------------
-- View structure for vpaises
-- ----------------------------
DROP VIEW IF EXISTS `vpaises`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vpaises` AS select `cat_paises`.`eCodPais` AS `eCodPais`,`cat_paises`.`tCodPais` AS `tCodPais`,`cat_paises`.`tNombre` AS `tNombre` from `cat_paises`;

-- ----------------------------
-- View structure for vtipospersonas
-- ----------------------------
DROP VIEW IF EXISTS `vtipospersonas`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vtipospersonas` AS select `cat_tipospersonas`.`eCodTipoPersona` AS `eCodTipoPersona`,`cat_tipospersonas`.`tDescripcion` AS `tTipoPersona`,`cat_tipospersonas`.`fhFechaActualizacion` AS `fhFechaActualizacion`,`cat_tipospersonas`.`fhFechaRegistro` AS `fhFechaRegistro`,`cat_tipospersonas`.`tCodEstatus` AS `tCodEstatus` from `cat_tipospersonas`;

-- ----------------------------
-- View structure for vusuarios
-- ----------------------------
DROP VIEW IF EXISTS `vusuarios`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vusuarios` AS select `cu`.`eCodUsuario` AS `eCodUsuario`,`cu`.`eCodEmpresa` AS `eCodEmpresa`,`cu`.`eCodDepartamento` AS `eCodDepartamento`,`cu`.`eCodPerfil` AS `eCodPerfil`,`cu`.`bAdmin` AS `bAdmin`,`cu`.`tNombre` AS `tNombre`,`cu`.`tCorreo` AS `tCorreo`,`cu`.`tTelefono` AS `tTelefono`,`cu`.`tUsuario` AS `tUsuario`,`cu`.`tPassword` AS `tPassword`,`cu`.`tPuesto` AS `tPuesto`,`cu`.`tImagen` AS `tImagen`,`cu`.`tCodEstatus` AS `tCodEstatus`,`ce`.`tNombre` AS `tEmpresa`,`cd`.`tNombre` AS `tDepartamento`,`cp`.`tNombre` AS `tPerfil`,date_format(`cu`.`fhFechaRegistro`,'%d.%m.%Y %H:%i:%s') AS `fhFechaRegistro`,date_format(`cu`.`fhFechaActualizacion`,'%d.%m.%Y %H:%i:%s') AS `fhFechaActualizacion`,`ces`.`tNombre` AS `tEstatus` from ((((`cat_usuarios` `cu` left join `cat_empresas` `ce` on((`ce`.`eCodEmpresa` = `cu`.`eCodEmpresa`))) left join `cat_departamentos` `cd` on((`cd`.`eCodDepartamento` = `cu`.`eCodDepartamento`))) left join `cat_perfiles` `cp` on((`cp`.`eCodPerfil` = `cu`.`eCodPerfil`))) left join `cat_estatus` `ces` on((`ces`.`tCodEstatus` = `cu`.`tCodEstatus`)));

SET FOREIGN_KEY_CHECKS = 1;
