-- INIT database
CREATE TABLE detalle ( 
  nroTicket VARCHAR(100),
  idProducto VARCHAR(100),
  cantidad VARCHAR(100),
  preciounitario VARCHAR(100)
); 

CREATE TABLE factura ( 
  nroTicket VARCHAR(100),
  total VARCHAR(100),
  fecha INTEGER,
  hora VARCHAR(100),
  idCliente VARCHAR(100)
); 

CREATE TABLE cliente ( 
  idCliente VARCHAR(100),
  nombre VARCHAR(100),
  apellido VARCHAR(100),
  DNI VARCHAR(100),
  telefono VARCHAR(100),
  direccion VARCHAR(100)
); 

CREATE TABLE producto (
  idProducto VARCHAR(100),
  nombreP VARCHAR(100),
  descripcion VARCHAR(100),
  precio VARCHAR(100),
  stock VARCHAR(100)
);

-- Tablas generadas con ChatGPT
INSERT INTO cliente (idCliente, nombre, apellido, DNI, telefono, direccion) VALUES 
('C001', 'Juan', 'Perez', '12345678', '123456789', 'Calle Falsa 123'),
('C002', 'María', 'Peceño', '87654321', '987654321', 'Av. Siempreviva 742'),
('C003', 'Carlos', 'Martínez', '11223344', '567890123', 'Calle Luna 567'),
('C004', 'Laura', 'García', '44332211', '456789012', 'Av. Sol 890'),
('C005', 'Ana', 'López', '22334455', '789012345', 'Calle Estrella 345');

INSERT INTO producto (idProducto, nombreP, descripcion, precio, stock) VALUES 
('P001', 'Laptop', 'Laptop HP 15"', '800', '10'),
('P002', 'Mouse', 'Mouse inalámbrico Logitech', '20', '50'),
('P003', 'Teclado', 'Teclado mecánico RGB', '50', '30'),
('P004', 'Monitor', 'Monitor LED 24" Samsung', '150', '15'),
('P005', 'Impresora', 'Impresora multifunción Epson', '120', '8');

INSERT INTO factura (nroTicket, total, fecha, hora, idCliente) VALUES 
('T001', '870', 2024, '10:30', 'C001'),
('T002', '170', 2023, '14:45', 'C002'),
('T003', '50', 2020, '16:15', 'C003'),
('T004', '950', 2017, '11:20', 'C004'),
('T005', '340', 2015, '09:50', 'C005');

INSERT INTO detalle (nroTicket, idProducto, cantidad, preciounitario) VALUES 
('T001', 'P001', '1', '800'),
('T001', 'P002', '1', '20'),
('T002', 'P003', '3', '50'),
('T003', 'P003', '1', '50'),
('T004', 'P001', '1', '800'),
('T004', 'P004', '1', '150'),
('T005', 'P002', '4', '20'),
('T005', 'P005', '1', '120');

-- QUERY database
SELECT nombre, apellido, DNI, telefono, direccion 
FROM cliente c INNER JOIN factura f ON (c.idCliente = f.idCliente) 
WHERE (f.fecha = 2017)
