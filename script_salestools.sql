CREATE DATABASE salestools;

USE salestools;

# Tabla proveedores
CREATE TABLE proveedores (
  id INT NOT NULL ,
  nombre VARCHAR(50),
  CONSTRAINT PK_proveedores PRIMARY KEY (id)
);

# Tabla turnos
CREATE TABLE turnos (
  id INT NOT NULL ,
  hora_inicio TIME,
  hora_fin TIME,
  CONSTRAINT PK_turnos PRIMARY KEY (id)
);

# Tabla remuneraciones
CREATE TABLE remuneraciones (
  id INT NOT NULL ,
  tipos VARCHAR(50),
  cantidad FLOAT,
  CONSTRAINT PK_remuneraciones PRIMARY KEY (id)
);

# Tabla Seguros
CREATE TABLE seguros (
  id INT NOT NULL,
  tipo VARCHAR(50),
  CONSTRAINT PK_seguros PRIMARY KEY (id)
);

# Tabla cupones
CREATE TABLE cupones (
  id INT NOT NULL,
  descuento INT,
  fecha_caducidad DATE,
  cantidad INT,
  CONSTRAINT PK_cupones PRIMARY KEY (id)
);

# Tabla departamentos
CREATE TABLE departamentos (
  id   INT NOT NULL,
  nombre VARCHAR(50),
  CONSTRAINT PK_departamentos PRIMARY KEY (id)
);

# Tabla documentos
CREATE TABLE documentos (
  id   INT NOT NULL,
  tipo VARCHAR(50),
  CONSTRAINT PK_documentos PRIMARY KEY (id)
);

# Tabla metodos_pago
CREATE TABLE metodos_pago (
  id   INT NOT NULL,
  tipo VARCHAR(50),
  CONSTRAINT PK_metodos_pago PRIMARY KEY (id)
);

# Tabla pedidos
CREATE TABLE pedidos (
  id   INT NOT NULL,
  proveedor_id INT NOT NULL,
  monto_total FLOAT,
  fecha date,
  CONSTRAINT PK_pedidos PRIMARY KEY (id),
  CONSTRAINT FK_pedidos_proveedores FOREIGN KEY (proveedor_id) REFERENCES proveedores(id)
);

# Tabla categorias
CREATE TABLE categorias (
  id INT NOT NULL,
  nombre VARCHAR(50),
  CONSTRAINT PK_categorias PRIMARY KEY (id)
);

# Tabla productos
CREATE TABLE productos (
  id INT NOT NULL,
  nombre VARCHAR(50),
  categoria_id INT NOT NULL,
  CONSTRAINT PK_productos PRIMARY KEY (id),
  FOREIGN KEY FK_categorias_productos (categoria_id) REFERENCES categorias(id)
);

# Tabla productos_pedido
CREATE TABLE productos_pedido (
  producto_id INT NOT NULL,
  pedido_id INT NOT NULL,
  cantidad INT,
  monto_parcial FLOAT,
  CONSTRAINT FK_productos_productos_pedido FOREIGN KEY (producto_id) REFERENCES productos(id),
  CONSTRAINT FK_pedidos_productos_pedido FOREIGN KEY (pedido_id) REFERENCES pedidos(id)
);

# Tabla clientes
CREATE TABLE clientes (
  id INT NOT NULL,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  documento_id INT NULL,
  CONSTRAINT PK_clientes PRIMARY KEY (id),
  FOREIGN KEY FK_documentos_clientes (documento_id) REFERENCES documentos(id)
);

#Tabla provincias
CREATE TABLE provincias (
  id INT NOT NULL,
  departamento_id INT NOT NULL,
  nombre VARCHAR(50),
  CONSTRAINT PK_provincias PRIMARY KEY (id),
  CONSTRAINT FK_departamentos_provincias FOREIGN KEY (departamento_id)REFERENCES departamentos (id)
);

# Tabla distritos
CREATE TABLE distritos (
  id INT NOT NULL,
  provincia_id INT NOT NULL,
  nombre VARCHAR(50),
  CONSTRAINT PK_distritos PRIMARY KEY (id),
  CONSTRAINT FK_provincias_distritos FOREIGN KEY (provincia_id) REFERENCES provincias (id)
);

# Tabla direcciones
CREATE TABLE direcciones (
  id INT NOT NULL,
  calle VARCHAR(50),
  distrito_id INT NOT NULL,
  CONSTRAINT PK_direcciones PRIMARY KEY (id),
  CONSTRAINT FK_distritos_direcciones FOREIGN KEY (distrito_id) REFERENCES distritos (id)
);

# Tabla empleados
CREATE TABLE empleados (
  id INT NOT NULL,
  nombre VARCHAR(50),
  apellidos VARCHAR(50),
  turno_id INT NOT NULL,
  seguro_id INT NOT NULL,
  remuneracion_id INT NOT NULL,
  direccion_id INT NOT NULL,
  CONSTRAINT PK_empleados PRIMARY KEY (id),
  FOREIGN KEY FK_turnos_empleados (turno_id) REFERENCES turnos (id),
  FOREIGN KEY FK_seguros_empleados (seguro_id) REFERENCES seguros (id),
  FOREIGN KEY FK_remuneraciones_empleados (remuneracion_id) REFERENCES remuneraciones (id),
  FOREIGN KEY FK_direcciones_empleados (direccion_id) REFERENCES direcciones (id)
);

# Tabla ventas
CREATE TABLE ventas (
  id INT NOT NULL ,
  cliente_id INT NOT NULL,
  cupon_id INT NOT NULL,
  metodo_pago_id INT NOT NULL,
  empleados_id INT NOT NULL,
  monto FLOAT,
  fecha DATE,
  CONSTRAINT PK_ventas PRIMARY KEY (id),
  CONSTRAINT FK_clientes_ventas FOREIGN KEY (cliente_id) REFERENCES clientes(id),
  CONSTRAINT FK_cupones_ventas FOREIGN KEY (cupon_id) REFERENCES cupones(id),
  CONSTRAINT FK_metodos_pago_ventas FOREIGN KEY (metodo_pago_id) REFERENCES metodos_pago (id),
  CONSTRAINT FK_empleados_ventas FOREIGN KEY (empleados_id) REFERENCES empleados (id)
) ;

# Tabla venta_productos
CREATE TABLE venta_productos (
  venta_id INT NOT NULL,
  producto_id INT NOT NULL,
  monto_parcial FLOAT,
  cantidad INT,
  CONSTRAINT FK_ventas_venta_productos FOREIGN KEY (venta_id) REFERENCES ventas(id),
  CONSTRAINT FK_productos_venta_productos FOREIGN KEY (producto_id) REFERENCES  productos(id)
);

# Inserción de categorias
INSERT INTO categorias (id, nombre) VALUES
(1, 'Abarrotes'),
(2, 'Productos Enlatados'),
(3, 'Lácteos'),
(4, 'Botanas'),
(5, 'Dulceria'),
(6, 'Harinas'),
(7, 'Frutas'),
(8, 'Verduras'),
(9, 'Bebidas'),
(10, 'Salud'),
(11, 'Limpieza'),
(12, 'Uso doméstico');

# Inserción de seguros
INSERT INTO seguros (id, tipo) VALUES
(1, 'Vida'),
(2, 'Riesgo');

# Inserción de turnos
INSERT INTO turnos (id, hora_inicio, hora_fin) VALUES
(1, '06:00:00', '14:00:00'),
(2, '14:00:00', '22:00:00');

# Inserción de cupones
INSERT INTO cupones (id, descuento, fecha_caducidad, cantidad) VALUES
(1, 10, '2022-07-29', 50),
(2, 15, '2022-07-29', 50),
(3, 20, '2022-05-14', 40),
(4, 25, '2022-06-19', 40),
(5, 30, '2022-12-25', 40),
(6, 35, '2022-05-14', 20),
(7, 40, '2022-12-25', 20),
(8, 45, '2022-07-29', 10),
(9, 50, '2022-12-25', 10);

# Inserción de proveedores
INSERT INTO proveedores (id, nombre) VALUES
(1, 'Alicorp'),
(2, 'Braedt'),
(3, 'Gloria'),
(4, 'Bimbo'),
(5, 'Molitalia'),
(6, 'Otto-Kunz'),
(7, 'Nestlé');

# Inserción de departamentos
INSERT INTO departamentos (id, nombre) VALUES
(7, 'Callao'),
(15, 'Lima');

# Inserción de documentos
INSERT INTO documentos(id, tipo) VALUES
(1, 'DNI'),
(2, 'Carnet de extranjería'),
(3, 'Pasaporte');

# Inserción de metodos_pago
INSERT INTO metodos_pago(id, tipo) VALUES
(1, 'Tarjeta'),
(2, 'Efectivo'),
(3, 'Yape'),
(4, 'Plin');

# Inserción de remuneraciones
INSERT INTO remuneraciones(id, tipos, cantidad) VALUES
(1, 'Honorario', 10),
(2, 'Salario', 7.50),
(3, 'Sueldo', 9.38),
(4, 'Sin sueldo', 0.00),
(5, 'Comisión', 0.05);

# Inserción de clientes
INSERT INTO clientes(id, nombre, apellido, documento_id) VALUES
(12423534, 'Carlos', 'Sanchez', 1),
(67865645, 'Lucas', 'Sosa', 1),
(67867992, 'Mateo', 'Torres', 1),
(45645676, 'Leo', 'Vera', 1),
(56786896, 'Daniel', 'Villalba', 1),
(96568766, 'Alejandro', 'Zambrano', 1),
(45346434, 'Pablo', 'Duarte', 1),
(24536364, 'Mario', 'Quizpe', 1),
(13464543, 'Enzo', 'Quizpe', 1),
(1346435634, 'Hugo', 'Sanchez', 2),
(1353464564, 'Martín', 'Sanchez', 3),
(1674634535, 'Diego', 'Quizpe', 2),
(1242453566, 'Marcos', 'Quizpe', 3),
(10100101, 'Izan', 'Díaz', 1),
(12312414, 'Javier', 'Sanchez', 1),
(78675685, 'Marco', 'De León', 1),
(13453466, 'Álex', 'Contreras', 1),
(35645647, 'Bruno', 'Castro', 1),
(67867996, 'Oliver', 'Castillo', 1),
(28797979, 'Miguel', 'Benítez', 1);

# Inserción de productos
INSERT INTO productos (id, nombre, categoria_id) VALUES
(1, 'Aceite Cocinero', 1), (2, 'Atún Primor', 2),
(3, 'Leche', 3),
(4, 'Fideos', 1),
(5, 'Jamón de pavo', 1),
(6, 'Chocolate Sublime', 5),
(7, 'Pan tostado cero', 6),
(8, 'Cereal Nesquik', 6),
(9, 'Desinfectante Sapolio', 11),
(10, 'Insecticida Sapolio', 11),
(11, 'Lavavajillas Sapolio', 11),
(12, 'Spaghetti Don Vittorio', 1),
(13, 'Galleta Casino', 5),
(14, 'Galleta Glacitas', 5),
(15, 'Galleta Margarita', 5),
(16, 'Harina Blanca Flor', 6),
(17, 'Milo', 2),
(18, 'Leche condensada', 3),
(19, 'Galleta Tentación', 5),
(20, 'Filete de Atún Nicolini', 2);

# Inserción de provincias
INSERT INTO provincias(id, departamento_id, nombre) VALUES
(66, 7,'Callao'),
(127, 15, 'Lima'),
(128, 15, 'Barranca'),
(129, 15, 'Cajatambo'),
(130, 15, 'Canta'),
(131, 15, 'Cañete'),
(132, 15, 'Huaral'),
(133, 15, 'Huarochiri'),
(134, 15, 'Huaura'),
(135, 15, 'Oyón'),
(136, 15, 'Yauyos');

# Inserción de distritos
INSERT INTO distritos(id, provincia_id, nombre) VALUES
(668, 66, 'Santa Cruz'),
(669, 66, 'Andabamba'),
(670, 66, 'Catache'),
(671, 66, 'Chancaybaños'),
(672, 66, 'La Esperanza'),
(673, 66, 'Ninabamba'),
(674, 66, 'Pulan'),
(675, 66, 'Saucepampa'),
(676, 66, 'Sexi'),
(677, 66, 'Uticyacu'),
(678, 66, 'Yauyucan'),
(1251, 127, 'Lima'),
(1252, 127, 'Ancón'),
(1253, 127, 'Ate'),
(1254, 127, 'Barranco'),
(1255, 127, 'Breña'),
(1256, 127, 'Carabayllo'),
(1257, 127, 'Chaclacayo'),
(1258, 127, 'Chorrillos'),
(1259, 127, 'Cieneguilla'),
(1260, 127, 'Comas'),
(1261, 127, 'El Agustino'),
(1262, 127, 'Independencia'),
(1263, 127, 'Jesús María'),
(1264, 127, 'La Molina'),
(1265, 127, 'La Victoria'),
(1266, 127, 'Lince'),
(1267, 127, 'Los Olivos'),
(1268, 127, 'Lurigancho'),
(1269, 127, 'Lurin'),
(1270, 127, 'Magdalena del Mar'),
(1271, 127, 'Magdalena Vieja'),
(1272, 127, 'Miraflores'),
(1273, 127, 'Pachacamac'),
(1274, 127, 'Pucusana'),
(1275, 127, 'Puente Piedra'),
(1276, 127, 'Punta Hermosa'),
(1277, 127, 'Punta Negra'),
(1278, 127, 'Rimac'),
(1279, 127, 'San Bartolo'),
(1280, 127, 'San Borja'),
(1281, 127, 'San Isidro'),
(1282, 127, 'San Juan de Lurigancho'),
(1283, 127, 'San Juan de Miraflores'),
(1284, 127, 'San Luis'),
(1285, 127, 'San Martin de Porres'),
(1286, 127, 'San Miguel'),
(1287, 127, 'Santa Anita'),
(1288, 127, 'Santa María del Mar'),
(1289, 127, 'Santa Rosa'),
(1290, 127, 'Santiago de Surco'),
(1291, 127, 'Surquillo'),
(1292, 127, 'Villa El Salvador'),
(1293, 127, 'Villa María del Triunfo');

# Inserción de direcciones
INSERT INTO direcciones(id, calle, distrito_id) VALUES
(1, 'Los Incas', 1260), # Comas
(2, 'Laura Caller', 1267), # Los Olivos
(3, 'Los Sauces', 1256), # Carabayllo
(4, 'Luis Nieto', 1261), # El Agustino
(5, 'San Felipe', 1260), # Comas
(6, 'Naranjal', 1267), # Los Olivos
(7, 'Jr. Francia', 1265), # La Victoria
(8, 'Juan Ruiz De Arce', 1286), # San Miguel
(9, 'G. Moreau', 1280), # San Borja
(10, 'Florales', 1256); # Carabayllo

# Inserción de empleados
INSERT INTO empleados (id, nombre, apellidos, turno_id, seguro_id, remuneracion_id, direccion_id) VALUES
(73529675, 'Ander', 'Villar', 2, 1, 5, 4),
(22459103, 'Lionel', 'Saravia', 1, 2, 3, 2),
(71402515, 'Alejandra', 'Taboada', 1, 1, 3, 6),
(35975910, 'Bernardo', 'Silva', 2, 2, 2, 1),
(84150487, 'Mauricio', 'Garcilazo', 2, 2, 2, 8),
(19917471, 'Marta', 'Alcacer', 1, 1, 3, 5),
(62530189, 'Jesús', 'Chavez', 1, 2, 1, 3),
(58913474, 'Piero', 'Benedetto', 2, 2, 2, 3),
(14957015, 'Fernando', 'Díaz', 2, 2, 2, 3),
(49881130, 'Rubén', 'Almenara', 1, 1, 2, 6),
(24597501, 'Silvia', 'Alva', 1, 1, 3, 1),
(76309157, 'Pedro', 'Castillo', 2, 2, 2, 2),
(43355910, 'Antony', 'García', 1, 2, 1, 4),
(59748065, 'Melissa', 'Calixto', 1, 1, 3, 5),
(79917471, 'Miguel', 'Balbin', 2, 2, 2, 7),
(99832210, 'Alexis', 'Aguilar', 1, 1, 3, 10),
(33451957, 'Mario', 'Gomez', 1, 2, 3, 9),
(66782927, 'Iván', 'De Paul', 2, 2, 2, 8),
(23322579, 'Alexia', 'Miranda', 1, 1, 3, 1),
(99847005, 'María', 'Benitez', 1, 1, 3, 7);

# Inserción de ventas
INSERT INTO ventas(id,cliente_id,cupon_id,metodo_pago_id,empleados_id,monto,fecha) VALUES
(1, 12423534, 1, 1, 99847005, 113, '2022-05-29'),
(2, 12423534, 1, 2, 99847005, 200, '2022-04-10'),
(3, 12423534, 1, 1, 43355910, 11.5, '2022-04-10'),
(4, 12312414, 1, 1, 79917471, 54, '2022-05-29'),
(5, 13453466, 1, 1, 62530189, 76, '2022-04-29'),
(6, 13453466, 2, 2, 71402515, 87.5, '2022-05-23'),
(7, 1353464564, 2, 2, 43355910, 45, '2022-05-15'),
(8, 1353464564, 3, 2, 19917471, 45.5, '2022-05-12'),
(9, 13464543, 9, 2, 14957015, 65.5, '2022-05-28'),
(10, 24536364, 2, 2, 22459103, 134, '2022-02-28'),
(11, 56786896, 2, 1, 73529675, 34, '2022-02-27'),
(12, 45645676, 3, 1, 58913474, 56, '2022-03-27'),
(13, 45645676, 5, 3, 71402515, 12, '2022-04-27'),
(14, 67867992, 4, 3, 99832210, 11, '2022-05-26'),
(15, 96568766, 3, 4, 84150487, 10, '2022-04-21'),
(16, 45645676, 2, 4, 19917471, 21, '2022-04-12'),
(17, 45645676, 2, 4, 59748065, 165.5,'2022-05-04'),
(18, 1674634535, 1, 1, 43355910, 145.5, '2022-03-09'),
(19, 1674634535, 4, 2, 84150487, 234, '2022-03-21'),
(20, 96568766, 5, 2, 71402515, 123, '2022-04-11'),
(21, 67867992, 1, 3, 35975910, 165, '2022-04-11'),
(22, 12312414, 2, 4, 14957015, 243, '2022-03-12'),
(23, 56786896, 1, 2, 49881130, 59.5, '2022-03-24');

# Inserción de pedidos
INSERT INTO pedidos (id, proveedor_id, monto_total, fecha) VALUES
(1, 3, 110, '2022-05-10'),
(2, 5, 45, '2022-05-11'),
(3, 1, 265, '2022-05-15'),
(4, 4, 80, '2022-05-16'),
(5, 7, 230, '2022-05-25'),
(6, 1, 166, '2022-06-05'),
(7, 2, 45, '2022-06-06'),
(8, 6, 45, '2022-06-07'),
(9, 1, 195, '2022-06-10');

# Inserción de productos_pedido
INSERT INTO productos_pedido (producto_id, pedido_id, cantidad, monto_parcial) VALUES
(3, 1, 20, 80),
(18, 1, 10, 30),
(4, 2, 15, 45),
(2, 3, 10, 25),
(1, 3, 50, 200),
(12, 3, 20, 40),
(7, 4, 20, 80),
(6, 5, 20, 40),
(16, 5, 20, 80),
(17, 5, 50, 75),
(8, 5, 50, 35),
(19, 6, 20, 60),
(15, 6, 20, 30),
(14, 6, 20, 36),
(13, 6, 20, 40),
(5, 7, 15, 45),
(20, 8, 15, 45),
(9, 9, 10, 30),
(10, 9, 10, 35),
(11, 9, 10, 20);

# Inserción de venta_productos
INSERT INTO venta_productos(venta_id, producto_id, monto_parcial, cantidad) VALUES
(15, 7, 2, 1),
(15, 11, 4, 2),
(15, 20, 4, 1),
(13, 3, 4, 1),
(13, 5, 3, 3),
(13, 17, 3, 1),
(13, 6, 2, 2),
(11, 12, 10, 2),
(11, 20, 12, 3),
(11, 8, 6, 2),
(11, 18, 6, 3);
