CREATE DATABASE ventas_productos_escolares;
USE ventas_productos_escolares;
drop database ventas_productos_escolares;
drop table productos;

-- Tabla para almacenar la información común de los usuarios
CREATE TABLE usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  telefono VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  contrasena VARCHAR(255) NOT NULL,
  categoria ENUM('empleado', 'administrador') NOT NULL
);

-- Tabla para almacenar información específica de los empleados
CREATE TABLE empleados (
  codigo INT NOT NULL PRIMARY KEY,
  usuario_id INT UNIQUE,
  departamento VARCHAR(50) NOT NULL,
  FOREIGN KEY (codigo) REFERENCES usuarios(id)
);

-- Tabla para almacenar información específica de los administradores
CREATE TABLE administradores (
  codigo INT NOT NULL PRIMARY KEY,
  usuario_id INT UNIQUE,
  privilegios VARCHAR(100) NOT NULL,
  FOREIGN KEY (codigo) REFERENCES usuarios(id)
);

-- Tabla para almacenar información de compras
CREATE TABLE compra (
  id INT AUTO_INCREMENT PRIMARY KEY,
  fecha DATE NOT NULL,
  proveedor_id INT NOT NULL,
  empleado_id INT NOT NULL,
  FOREIGN KEY (proveedor_id) REFERENCES proveedores(id),
  FOREIGN KEY (empleado_id) REFERENCES usuarios(id)
);

-- Tabla para almacenar información de ventas
CREATE TABLE venta (
  id INT AUTO_INCREMENT PRIMARY KEY,
  fecha DATE NOT NULL,
  empleado_id INT NOT NULL,
  FOREIGN KEY (empleado_id) REFERENCES usuarios(id)
);

-- Tabla para almacenar el detalle de ventas
CREATE TABLE detalle_venta (
  id INT AUTO_INCREMENT PRIMARY KEY,
  venta_id INT NOT NULL,
  producto_id INT NOT NULL,
  cantidad INT NOT NULL,
  precio_unitario DECIMAL(12, 2) NOT NULL,
  subtotal DECIMAL(12, 2) NOT NULL,
  FOREIGN KEY (venta_id) REFERENCES venta(id),
  FOREIGN KEY (producto_id) REFERENCES productos(id)
);

-- Tabla para almacenar el detalle de compras
CREATE TABLE detalle_compra (
  id INT AUTO_INCREMENT PRIMARY KEY,
  compra_id INT NOT NULL,
  producto_id INT NOT NULL,
  cantidad INT NOT NULL,
  precio_unitario DECIMAL(12, 2) NOT NULL,
  subtotal DECIMAL(12, 2) NOT NULL,
  FOREIGN KEY (compra_id) REFERENCES compra(id),
  FOREIGN KEY (producto_id) REFERENCES productos(id)
);

-- Tabla para almacenar información de almacen


CREATE TABLE Proveedores (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  direccion VARCHAR(500),
  telefono VARCHAR(15),
  email VARCHAR(50)
);

-- Crear tabla Productos
CREATE TABLE Productos (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  descripcion VARCHAR(500),
  precio DECIMAL(10, 2) NOT NULL,
  PRIMARY KEY (id)
);

-- Crear tabla Almacen
CREATE TABLE Almacen (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  ubicacion VARCHAR(500),
  capacidad INT
);

-- Crear tabla intermedia Productos_Almacen
CREATE TABLE Productos_Almacen (
  id INT AUTO_INCREMENT PRIMARY KEY,
  producto_ID INT NOT NULL,
  almacen_ID INT NOT NULL,
  cantidad INT NOT NULL,
  FOREIGN KEY (producto_ID) REFERENCES Productos(id),
  FOREIGN KEY (almacen_ID) REFERENCES Almacen(id)
);


CREATE TABLE Productos_Proveedores (
  id INT PRIMARY KEY AUTO_INCREMENT,
  producto_ID INT NOT NULL,
  proveedor_ID INT NOT NULL,
  FOREIGN KEY (producto_ID) REFERENCES Productos(id),
  FOREIGN KEY (proveedor_ID) REFERENCES Proveedores(id)
);


-- Población de la tabla usuarios
INSERT INTO usuarios (nombre, apellido, telefono, email, contrasena, categoria) VALUES
('Laura', 'González', '111111111', 'laura@example.com', 'contrasena111', 'empleado'),
('Roberto', 'Hernández', '222222222', 'roberto@example.com', 'contrasena222', 'empleado'),
('María', 'López', '333333333', 'maria@example.com', 'contrasena333', 'empleado'),
('Carlos', 'Sánchez', '444444444', 'carlos@example.com', 'contrasena444', 'empleado'),
('Ana', 'Martínez', '555555555', 'ana@example.com', 'contrasena555', 'empleado'),
('Pedro', 'Ramírez', '666666666', 'pedro@example.com', 'contrasena666', 'administrador'),
('Isabel', 'Fernández', '777777777', 'isabel@example.com', 'contrasena777', 'administrador'),
('Juan', 'Gómez', '888888888', 'juan@example.com', 'contrasena888', 'administrador'),
('Elena', 'Morales', '999999999', 'elena@example.com', 'contrasena999', 'administrador'),
('Alejandro', 'Díaz', '000000000', 'alejandro@example.com', 'contrasena000', 'administrador');

-- Población de la tabla empleados
INSERT INTO empleados (codigo, usuario_id, departamento) VALUES
(1, 1, 'Ventas'),
(2, 2, 'Logística'),
(3, 3, 'Recursos Humanos'),
(4, 4, 'Contabilidad'),
(5, 5, 'Administración');

-- Población de la tabla administradores
INSERT INTO administradores (codigo, usuario_id, privilegios) VALUES
(6, 6, 'Administrar Usuarios'),
(7, 7, 'Administrar Finanzas'),
(8, 8, 'Administrar Recursos'),
(9, 9, 'Administrar Inventarios'),
(10, 10, 'Administrar Ventas');



-- Población de la tabla Proveedores
INSERT INTO Proveedores (nombre, direccion, telefono, email) VALUES
('Proveedor1', 'Dirección Proveedor1', '123456789', 'proveedor1@example.com'),
('Proveedor2', 'Dirección Proveedor2', '987654321', 'proveedor2@example.com'),
('Proveedor3', 'Dirección Proveedor3', '111222333', 'proveedor3@example.com'),
('Proveedor4', 'Dirección Proveedor4', '444555666', 'proveedor4@example.com'),
('Proveedor5', 'Dirección Proveedor5', '777888999', 'proveedor5@example.com');

-- Población de la tabla Productos
INSERT INTO Productos (nombre, descripcion, precio) VALUES
('Producto1', 'Descripción Producto1', 10.50),
('Producto2', 'Descripción Producto2', 25.99),
('Producto3', 'Descripción Producto3', 5.75),
('Producto4', 'Descripción Producto4', 15.00),
('Producto5', 'Descripción Producto5', 8.95);

-- Población de la tabla Almacen
INSERT INTO Almacen (nombre, ubicacion, capacidad) VALUES
('Almacen1', 'Ubicación Almacen1', 100),
('Almacen2', 'Ubicación Almacen2', 200),
('Almacen3', 'Ubicación Almacen3', 150),
('Almacen4', 'Ubicación Almacen4', 300),
('Almacen5', 'Ubicación Almacen5', 250);

-- Población de la tabla Productos_Almacen (Tabla Intermedia)
INSERT INTO Productos_Almacen (producto_ID, almacen_ID, cantidad) VALUES
(1, 1, 50),
(1, 2, 30),
(2, 3, 20),
(3, 2, 15),
(4, 4, 40);

-- Población de la tabla Productos_Proveedores (Tabla Intermedia)
INSERT INTO Productos_Proveedores (producto_ID, proveedor_ID) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5);

-- Población de la tabla compra
INSERT INTO compra (fecha, proveedor_id, empleado_id) VALUES
('2023-08-01', 1, 6),
('2023-08-02', 2, 7),
('2023-08-03', 3, 8),
('2023-08-04', 4, 9),
('2023-08-05', 5, 10);

-- Población de la tabla detalle_compra
INSERT INTO detalle_compra (compra_id, producto_id, cantidad, precio_unitario, subtotal) VALUES
(1, 1, 10, 10.00, 100.00),
(1, 2, 5, 25.99, 129.95),
(2, 3, 8, 5.75, 46.00),
(3, 4, 15, 15.00, 225.00),
(4, 5, 20, 8.95, 179.00);

-- Población de la tabla venta
INSERT INTO venta (fecha, empleado_id) VALUES
('2023-08-01', 1),
('2023-08-02', 2),
('2023-08-03', 3),
('2023-08-04', 4),
('2023-08-05', 5);

-- Población de la tabla detalle_venta
INSERT INTO detalle_venta (venta_id, producto_id, cantidad, precio_unitario, subtotal) VALUES
(1, 1, 2, 10.50, 21.00),
(1, 2, 3, 25.99, 77.97),
(2, 3, 5, 5.75, 28.75),
(3, 4, 10, 15.00, 150.00),
(4, 5, 8, 8.95, 71.60);