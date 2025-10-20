-- *******************************************************************
--             Creacion y Seleccion del Esquema
-- *******************************************************************

DROP SCHEMA IF EXISTS eClothesDB;
CREATE SCHEMA eClothesDB;
USE eClothesDB;

-- *******************************************************************
--             Creacion de las Tablas
-- *******************************************************************

CREATE TABLE Categoria (
	id_categoria INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Proveedor (
	id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
	empresa VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Producto (
	id_producto INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT NOT NULL,
    id_proveedor INT,
	nombre VARCHAR(100) NOT NULL,
	descripcion VARCHAR(100) NOT NULL,
	precio DECIMAL(10,2) NOT NULL,
	stock INT NOT NULL
);

CREATE TABLE Cliente (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    direccion VARCHAR(150) NOT NULL
);

CREATE TABLE Pago (
	id_pago INT AUTO_INCREMENT PRIMARY KEY,
	metodo VARCHAR(100) NOT NULL,
    estado VARCHAR(100) NOT NULL,
    total DECIMAL(10,2) DEFAULT 0.00
);

CREATE TABLE Pedido (
	id_pedido INT AUTO_INCREMENT PRIMARY KEY,
	id_cliente INT NOT NULL,
	id_pago INT NOT NULL,
    fecha DATE NOT NULL
);

CREATE TABLE Detalle_Pedido (
	id_detalle INT AUTO_INCREMENT PRIMARY KEY,
	id_producto INT NOT NULL,
	id_pedido INT NOT NULL,
    cantidad_item INT NOT NULL
);

CREATE TABLE Auditoria_Precio_Prod (
	id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
	id_producto INT NOT NULL,
	precio_antiguo DECIMAL(10,2),
    precio_nuevo DECIMAL(10,2),
    fecha DATETIME,
	usuario VARCHAR(100)
);

-- *******************************************************************
--             Relacion entre tablas
-- *******************************************************************

ALTER TABLE Producto ADD CONSTRAINT fk_producto_categoria
	FOREIGN KEY (id_categoria) REFERENCES Categoria (id_categoria)
    ON DELETE RESTRICT ON UPDATE CASCADE;
    
ALTER TABLE Producto ADD CONSTRAINT fk_producto_proveedor
	FOREIGN KEY (id_proveedor) REFERENCES Proveedor (id_proveedor)
    ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE Pedido ADD CONSTRAINT fk_pedido_cliente
	FOREIGN KEY (id_cliente) REFERENCES Cliente (id_cliente)
     ON DELETE CASCADE ON UPDATE CASCADE;
     
ALTER TABLE Pedido ADD CONSTRAINT fk_pedido_pago
	FOREIGN KEY (id_pago) REFERENCES Pago (id_pago)
    ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE Detalle_Pedido ADD CONSTRAINT fk_detalle_producto
	FOREIGN KEY (id_producto) REFERENCES Producto (id_producto)
    ON DELETE RESTRICT ON UPDATE CASCADE;
    
ALTER TABLE Detalle_Pedido ADD CONSTRAINT fk_detalle_pedido
	FOREIGN KEY (id_pedido) REFERENCES Pedido (id_pedido)
    ON DELETE CASCADE ON UPDATE CASCADE;
    
-- *******************************************************************
--              Insercion de datos
-- *******************************************************************

INSERT INTO Categoria (nombre) VALUES
('Remeras'),
('Buzos'),
('Camperas'),
('Pantalones'),
('Vestidos'),
('Camisas'),
('Faldas'),
('Accesorios'),
('Calzado'),
('Chalecos');
 
INSERT INTO Proveedor (empresa, telefono, email) VALUES
('Moda Urbana SA', '+54 9 011-4567890', 'contacto@modaurbana.com'),
('Estilo & Confort SRL', '+54 9 351-4728391', 'ventas@estiloconfort.com'),
('Textiles Andinos', '+54 9 261-4938274', 'info@textilesandinos.com'),
('Calzado del Sur', '+54 9 223-4783920', 'pedidos@calzadodelsur.com'),
('Fashion Import', '+54 9 381-4748293', 'ventas@fashionimport.com'),
('Distribuidora Ropa Joven', '+54 9 299-4629382', 'ventas@ropajoven.com'),
('Accesorios Glamour', '+54 9 011-4372981', 'contacto@accesoriosglamour.com'),
('Deportes Total', '+54 9 379-4293842', 'ventas@deportestotal.com'),
('Abrigos Patagonia', '+54 9 351-4738295', 'info@abrigospatagonia.com'),
('Indumentaria Premium', '+54 9 223-4962837', 'ventas@indumentariapremium.com');

INSERT INTO Producto (id_categoria, id_proveedor, nombre, descripcion, precio, stock) VALUES
-- Remeras (Categoria 1)
(1, 2, 'Remera basica blanca', 'Remera de algodon con cuello redondo', 4500.00, 120),
(1, 1, 'Remera estampada urbana', 'Remera de algodon con estampado grafico', 5200.00, 80),
(1, 6, 'Remera negra slim fit', 'Remera de corte ajustado, color negro', 3900.00, 100),
(1, 1, 'Remera oversize gris', 'Remera estilo urbano, corte ancho', 4600.00, 60),
(1, 8, 'Remera deportiva', 'Remera para running', 5300.00, 75),

-- Buzos (Categoria 2)
(2, 9, 'Buzo canguro gris', 'Buzo de algodon con capucha y bolsillo frontal', 85000.00, 80),
(2, 1, 'Buzo basico negro', 'Buzo liso de algodon, cuello redondo', 50000.00, 100),
(2, 8, 'Buzo deportivo', 'Buzo liviano para entrenamiento', 42000.00, 70),
(2, 3, 'Buzo oversize beige', 'Buzo estilo urbano de corte ancho', 65000.00, 50),
(2, 10, 'Buzo estampado retro', 'Buzo con estampado vintage', 95000.00, 40),

-- Camperas (Categoria 3)
(3, 2, 'Campera de jean', 'Campera de jean azul clasico', 90000.00, 30),
(3, 9, 'Campera bomber verde', 'Campera bomber con cierre metalico', 100000.00, 45),
(3, 5, 'Campera de cuero', 'Campera de cuero sintetico negra', 185000.00, 20),
(3, 1, 'Campera rompeviento', 'Campera ligera impermeable', 80000.00, 55),
(3, 3, 'Campera abrigada', 'Campera acolchada para invierno', 130000.00, 25),

-- Pantalones (Categoria 4)
(4, 2, 'Jeans azul clasico', 'Pantalon de jean corte recto', 42000.00, 70),
(4, 6, 'Pantalon cargo verde', 'Pantalon cargo con multiples bolsillos', 35000.00, 40),
(4, 8, 'Jogger gris', 'Pantalon deportivo con puño elastizado', 38000.00, 90),
(4, 10, 'Pantalon formal negro', 'Pantalon de vestir slim fit', 50000.00, 50),
(4, 6, 'Pantalon de lino beige', 'Pantalon liviano de verano', 35000.00, 35),

-- Vestidos (Categoria 5)
(5, 5, 'Vestido largo floral', 'Vestido de verano con estampado floral', 25000.00, 40),
(5, 5, 'Vestido corto negro', 'Vestido elegante color negro', 30000.00, 30),
(5, 2, 'Vestido camisero', 'Vestido estilo camisa, manga larga', 32000.00, 25),
(5, 10, 'Vestido de fiesta rojo', 'Vestido de noche', 38000.00, 15),
(5, 2, 'Vestido casual', 'Vestido suelto de algodon', 15000.00, 35),

-- Camisas (Categoria 6)
(6, 10, 'Camisa blanca formal', 'Camisa manga larga, botones clasicos', 11000.00, 50),
(6, 6, 'Camisa a cuadros', 'Camisa de algodon, estilo leñador', 9800.00, 60),
(6, 1, 'Camisa celeste', 'Camisa manga larga slim fit', 11500.00, 40),
(6, 2, 'Camisa de jean', 'Camisa de jean manga larga', 12500.00, 35),
(6, 6, 'Camisa lino beige', 'Camisa fresca para verano', 10500.00, 45),

-- Faldas (Categoria 7)
(7, 1, 'Falda de jean', 'Falda corta de jean azul', 26000.00, 40),
(7, 5, 'Falda negra', 'Falda larga suelta', 34000, 25),
(7, 6, 'Falda estampada', 'Falda corta con estampado floral', 27000, 30),
(7, 1, 'Falda larga beige', 'Falda de lino suelta', 18500, 20),
(7, 5, 'Falda de cuero sintetico', 'Falda corta de cuero negro', 35000, 15),

-- Accesorios (Categoria 8)
(8, 7, 'Cinturon de cuero', 'Cinturon marron con hebilla metalica', 45000.00, 80),
(8, 7, 'Gorra deportiva', 'Gorra ajustable', 32000.00, 100),
(8, 7, 'Bufanda lana', 'Bufanda tejida color gris', 18000.00, 70),
(8, 7, 'Mochila urbana', 'Mochila negra con bolsillos multiples', 90000.00, 30),
(8, 7, 'Bolso de tela', 'Bolso de tela estampado', 65000.00, 40),

-- Calzado (Categoria 9)
(9, 4, 'Zapatillas urbanas blancas', 'Zapatillas casuales de tela', 91500.00, 60),
(9, 4, 'Botines negros', 'Botines de cuero con cierre lateral', 67000.00, 25),
(9, 4, 'Sandalias marrones', 'Sandalias de cuero, hebilla metalica', 50000.00, 35),
(9, 4, 'Ojotas playeras', 'Ojotas de goma estampadas', 27000.00, 100),
(9, 4, 'Zapatillas running', 'Zapatillas deportivas livianas', 70000.00, 50),

-- Chalecos (Categoria 10)
(10, 9, 'Chaleco acolchado negro', 'Chaleco abrigado', 11800.00, 45),
(10, 10, 'Chaleco de lana gris', 'Chaleco tejido para invierno', 9800.00, 35),
(10, 2, 'Chaleco formal azul', 'Chaleco elegante para traje', 13500.00, 25),
(10, 8, 'Chaleco deportivo', 'Chaleco liviano para entrenamiento', 8900.00, 30),
(10, 1, 'Chaleco de jean', 'Chaleco clasico de jean azul', 10500.00, 40);

INSERT INTO Cliente (nombre, apellido, telefono, email, direccion) VALUES
('Carlos', 'Perez', '+54 9 351-4827310', 'carlos.perez@gmail.com', 'Av. Libertad 101'),
('Maria', 'Gomez', '+54 9 011-3256998', 'maria.gomez@gmail.com', 'Calle Falsa 123'),
('Javier', 'Fernandez', '+54 9 261-4478921', 'javier.fernandez@gmail.com', 'Callejon San Martin 303'),
('Lucia', 'Martinez', '+54 9 223-4782210', 'lucia.martinez@gmail.com', 'Av. Plaza Central 514'),
('Andres', 'Sanchez', '+54 9 381-4790033', 'andres.sanchez@gmail.com', 'Av. Rivadavia 625'),
('Sofia', 'Ramirez', '+54 9 299-4637281', 'sofia.ramirez@gmail.com', 'Boulevard Mitre 845'),
('Mateo', 'Lopez', '+54 9 011-4385621', 'mateo.lopez@gmail.com', 'Calle Belgrano 148'),
('Valentina', 'Torres', '+54 9 351-4216583', 'valentina.torres@gmail.com', 'Paseo del Prado 78'),
('Martin', 'Ruiz', '+54 9 223-4981220', 'martin.ruiz@gmail.com', 'Av. Alem 1100'),
('Camila', 'Morales', '+54 9 381-4756329', 'camila.morales@gmail.com', 'Calle Moreno 250');

INSERT INTO Pago (metodo, estado) VALUES
('Tarjeta de credito', 'Pagado'),
('Transferencia bancaria', 'Pagado'),
('Transferencia bancaria', 'Pendiente'),
('Tarjeta de debito', 'Pagado'),
('Efectivo', 'Pagado'),
('Transferencia bancaria', 'Cancelado'),
('Tarjeta de credito', 'Pagado'),
('Transferencia bancaria', 'Pagado'),
('Tarjeta de debito', 'Pendiente'),
('Efectivo', 'Pagado');

INSERT INTO Pedido (id_cliente, id_pago, fecha) VALUES
(6, 8, '2025-08-18'),
(4, 7, '2025-07-14'),
(9, 3, '2025-09-21'),
(10, 10, '2025-07-30'),
(2, 4, '2025-09-11'),
(1, 6, '2025-07-09'),
(3, 1, '2025-09-01'),
(8, 9, '2025-08-17'),
(5, 2, '2025-09-19'),
(7, 5, '2025-07-27');

INSERT INTO Detalle_Pedido (id_producto, id_pedido, cantidad_item) VALUES
-- Pedido 1
(1, 1, 2),
(21, 1, 1),
(36, 1, 1),

-- Pedido 2
(6, 2, 1),
(12, 2, 1),
(33, 2, 2),

-- Pedido 3
(16, 3, 1),
(26, 3, 1),
(31, 3, 1),

-- Pedido 4
(3, 4, 1), 
(8, 4, 1), 
(37, 4, 1), 

-- Pedido 5
(5, 5, 1), 
(28, 5, 2),
(39, 5, 1),

-- Pedido 6
(10, 6, 1),
(23, 6, 1),
(42, 6, 1),

-- Pedido 7
(2, 7, 1),
(32, 7, 1),
(35, 7, 2),

-- Pedido 8
(13, 8, 1),
(18, 8, 1),
(41, 8, 1),

-- Pedido 9
(4, 9, 1),
(19, 9, 1),
(29, 9, 1),
(45, 9, 1),

-- Pedido 10
(7, 10, 1),
(25, 10, 1),
(38, 10, 1),
(44, 10, 1);

-- *******************************************************************
--             Vistas
-- *******************************************************************

-- Vista 1: Muestra el nombre completo de los clientes junto a sus pedidos realizados, ordenados por numero de pedido.
CREATE OR REPLACE VIEW vw_clientes_pedidos AS
	SELECT p.id_pedido, CONCAT(c.nombre, ' ', c.apellido) AS cliente, c.id_cliente
	FROM cliente AS c
	LEFT JOIN pedido AS p
		ON c.id_cliente = p.id_cliente
	ORDER BY p.id_pedido;

-- Ejecucion Vista 1:
-- SELECT * FROM vw_clientes_pedidos;

-- Vista 2: Lista los productos que no se han vendido.
CREATE OR REPLACE VIEW vw_productos_sin_vender AS
	SELECT p.id_producto, p.nombre, p.descripcion
	FROM producto AS p
	LEFT JOIN detalle_pedido as d
		ON p.id_producto = d.id_producto
	WHERE p.id_producto NOT IN
		(SELECT id_producto FROM detalle_pedido);

-- Ejecucion Vista 2:
-- SELECT * FROM vw_productos_sin_vender;

-- Vista 3: Detalla el estado y metodo de pago de cada pedido
CREATE OR REPLACE VIEW vw_estado_pedido AS
	SELECT pe.id_pedido, pe.id_pago, pa.metodo, pa.estado
    FROM Pedido AS pe
    LEFT JOIN pago AS pa 
		ON pe.id_pago = pa.id_pago;
        
-- Ejecucion Vista 3:
-- SELECT * FROM vw_estado_pedido;        
	
-- Vista 4: Indica la cantidad de productos que tiene cada pedido.
CREATE OR REPLACE VIEW vw_cant_productos_pedido AS
	SELECT id_pedido AS Nro_Pedido, SUM(cantidad_item) AS Total_Items
	FROM detalle_pedido
	GROUP BY id_pedido;
    
-- Ejecucion Vista 4:
-- SELECT * FROM vw_cant_productos_pedido;      

-- Vista 5: Muestra los productos mas vendidos
CREATE OR REPLACE VIEW vw_productos_mas_vendidos AS
	SELECT p.id_producto, p.nombre, SUM(d.cantidad_item) AS total_vendido
	FROM detalle_pedido AS d
	JOIN producto AS p
		ON d.id_producto = p.id_producto
	GROUP BY p.id_producto, p.nombre
	ORDER BY total_vendido DESC;

-- Ejecucion Vista 5:
-- SELECT * FROM vw_productos_mas_vendidos;   

-- *******************************************************************
--             Funciones
-- *******************************************************************

-- Funcion 1: Calcula el precio de venta al publico, en funcion del porcentaje de ganancia deseado. 
DROP FUNCTION IF EXISTS f_calcular_precio_venta;
DELIMITER $$
	CREATE FUNCTION f_calcular_precio_venta(p_monto DECIMAL(10,2), p_porc_ganancia DECIMAL(10,2))
	RETURNS DECIMAL(10,2)
	NO SQL
	BEGIN
		DECLARE precio_venta DECIMAL(10,2);
        SET precio_venta = p_monto + p_monto * (p_porc_ganancia/100);
        RETURN precio_venta;
	END $$
DELIMITER ;

-- Ejecucion Funcion 1:
-- SELECT f_calcular_precio_venta(50000,10);

-- Funcion 2: Calcula el valor de la venta total de un pedido
DROP FUNCTION IF EXISTS f_calcular_total_pedido;
DELIMITER $$
	CREATE FUNCTION f_calcular_total_pedido(p_id_pedido INT)
    RETURNS DECIMAL(10,2)
	READS SQL DATA
	BEGIN
		DECLARE total_pedido DECIMAL(10,2);
		SELECT SUM(d.cantidad_item * p.precio) INTO total_pedido
        FROM detalle_pedido AS d
        JOIN producto AS p
			ON d.id_producto = p.id_producto
        WHERE id_pedido = p_id_pedido;
		RETURN total_pedido;
	END $$
DELIMITER ;

-- Ejecucion Funcion 2:
-- SELECT f_calcular_total_pedido(7);

-- *******************************************************************
--             Stored Procedures
-- *******************************************************************

-- SP 1: Actualizar el stock de productos
DROP PROCEDURE IF EXISTS sp_actualizar_stock_productos;
DELIMITER $$
	CREATE PROCEDURE sp_actualizar_stock_productos(IN p_id_producto INT, IN p_cantidad INT)
	BEGIN
		DECLARE v_stock_actual INT;
        DECLARE v_nuevo_stock INT;
        
        SELECT stock INTO v_stock_actual
        FROM producto
        WHERE id_producto = p_id_producto;
        
        SET v_nuevo_stock = v_stock_actual + p_cantidad;
        
        IF v_nuevo_stock < 0 THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Error: El stock no puede ser negativo';
        ELSE    
			UPDATE producto
			SET stock = v_nuevo_stock
			WHERE id_producto = p_id_producto;
		END IF;   
    END $$;
DELIMITER ;

-- Ejecucion Stored Procedure 1:
-- CALL sp_actualizar_stock_productos(5,10);
-- CALL sp_actualizar_stock_productos(5,-10);

-- SP 2: Actualizar el total de un pedido
DROP PROCEDURE IF EXISTS sp_actualizar_total_pedido;
DELIMITER $$
	CREATE PROCEDURE sp_actualizar_total_pedido(IN p_id_pedido INT)
	BEGIN
		DECLARE v_total DECIMAL(10,2);
        DECLARE v_num_pago INT;
        
		SELECT f_calcular_total_pedido(p_id_pedido) INTO v_total;
        
        SELECT id_pago INTO v_num_pago
        FROM pedido
        WHERE id_pedido = p_id_pedido;
       
		IF v_num_pago IS NULL THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Error: El pedido no existe o no tiene un pago asociado';
		ELSE
			UPDATE pago
			SET total = v_total
			WHERE id_pago = v_num_pago;
		END IF;  
	END $$
DELIMITER ;

-- Ejecucion Stored Procedure 2:
-- CALL sp_actualizar_total_pedido(7);

-- *******************************************************************
--             Triggers
-- *******************************************************************

-- Trigger 1: Actualizacion automatica del stock al agregar una venta
DROP TRIGGER IF EXISTS tr_actualizar_stock_after_ins;
DELIMITER $$
	CREATE TRIGGER tr_actualizar_stock_after_ins
    AFTER INSERT ON Detalle_Pedido
    FOR EACH ROW
    BEGIN
		CALL sp_actualizar_stock_productos(NEW.id_producto, - NEW.cantidad_item);
    END $$
DELIMITER ;

-- Trigger 2: Actualizacion automatica del total de una venta
DROP TRIGGER IF EXISTS tr_calcular_total_after_ins;
DELIMITER $$
	CREATE TRIGGER tr_calcular_total_after_ins
    AFTER INSERT ON Detalle_Pedido
    FOR EACH ROW
    BEGIN
		CALL sp_actualizar_total_pedido(NEW.id_pedido);
    END $$
DELIMITER ;

-- INSERT INTO Detalle_Pedido (id_producto, id_pedido, cantidad_item) 
-- VALUES (6, 2, 4);

-- Trigger 3: Auditoria de cambios en los precios de los productos
DROP TRIGGER IF EXISTS tr_registrar_precio_after_upd;
DELIMITER $$
	CREATE TRIGGER tr_registrar_precio_after_upd
    AFTER UPDATE ON Producto
    FOR EACH ROW
    BEGIN
		IF OLD.precio <> NEW.precio THEN
        INSERT INTO Auditoria_Precio_Prod (id_producto, precio_antiguo, precio_nuevo, fecha, usuario)
        VALUES (NEW.id_producto, OLD.precio, NEW.precio, NOW(), CURRENT_USER());
        END IF;
    END $$
DELIMITER ;

-- UPDATE producto
-- SET precio = 75000
-- WHERE id_producto = 45;