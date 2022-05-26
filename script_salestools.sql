CREATE DATABASE salestools;

USE salestools;

# Tabla proveedores
CREATE TABLE proveedores (
   id int NOT NULL ,
   nombre VARCHAR(50),
   CONSTRAINT PK_proveedores PRIMARY KEY (id)
);

# Tabla turnos
CREATE TABLE turnos (
   id int NOT NULL ,
   hora_inicio TIME,
   hora_fin TIME,
   CONSTRAINT PK_turnos PRIMARY KEY (id)
);

# Tabla remuneraciones
CREATE TABLE remuneraciones (
   id int NOT NULL ,
   tipos VARCHAR(50),
   cantidad DECIMAL(2),
   CONSTRAINT PK_remuneraciones PRIMARY KEY (id)
);

# Tabla seguros
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
   monto_total DECIMAL(2),
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
   monto_parcial DECIMAL(2),
   CONSTRAINT PK_productos_pedido PRIMARY KEY (producto_id, pedido_id),
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
   CONSTRAINT FK_departamentos_provincias FOREIGN KEY (id)REFERENCES departamentos (id)
);

# Tabla distritos
CREATE TABLE distritos (
   id INT NOT NULL,
   provincia_id INT NOT NULL,
   nombre VARCHAR(50),
   CONSTRAINT PK_distritos PRIMARY KEY (id),
   CONSTRAINT FK_provincias_distritos FOREIGN KEY (id) REFERENCES provincias (id)
);

# Tabla direcciones
CREATE TABLE direcciones (
   id INT NOT NULL,
   calle VARCHAR(50),
   distrito_id INT NOT NULL,
   CONSTRAINT PK_direcciones PRIMARY KEY (id),
   CONSTRAINT FK_distritos_direcciones FOREIGN KEY (id) REFERENCES distritos (id)
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
   monto DECIMAL(2),
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
   monto_parcial DECIMAL(2),
   cantidad INT,
   CONSTRAINT PK_venta_productos PRIMARY KEY (venta_id, producto_id),
   CONSTRAINT FK_ventas_venta_productos FOREIGN KEY (venta_id) REFERENCES ventas(id),
   CONSTRAINT FK_productos_venta_productos FOREIGN KEY (producto_id) REFERENCES  productos(id)
);
