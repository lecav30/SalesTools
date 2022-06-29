USE salestools;

# Datos de los clientes
SELECT * FROM clientes;

# Proveedor al que más se le hizo pedidos
SELECT nombre FROM (
SELECT nombre, COUNT(proveedor_id) AS Cantidad
    FROM proveedores
    JOIN pedidos ON proveedores.id = pedidos.proveedor_id
    GROUP BY nombre
    ORDER BY Cantidad DESC
    ) AS p_mas_pedidos LIMIT 1;

# Método de pago más utilizado por los clientes
SELECT tipo FROM (
SELECT tipo, COUNT(metodo_pago_id) AS Cantidad
    FROM metodos_pago
    JOIN ventas ON metodos_pago.id = ventas.metodo_pago_id
    GROUP BY tipo
    ORDER BY Cantidad DESC
    ) AS mp_mas_utilizado LIMIT 1;

# Tipo de seguro más común para los empleados
SELECT tipo FROM (
SELECT tipo, COUNT(seguro_id) AS Cantidad
    FROM seguros
    JOIN empleados ON seguros.id = empleados.seguro_id
    GROUP BY tipo
    ORDER BY Cantidad DESC
    ) AS ts_mas_utilizado LIMIT 1;

# Consultar el empleado que más ventas a realizado
SELECT nombre, apellidos, MAX(Quantity) FROM
(SELECT nombre, apellidos, COUNT(empleados_id) Quantity
FROM empleados E JOIN ventas V ON E.id=V.empleados_id
GROUP BY E.id
ORDER BY E.id desc) Resultado;

# Consultar la cantidad de productos en cada categoría
SELECT C.nombre, COUNT(P.id)
FROM productos P JOIN categorias C ON P.categoria_id=C.id
GROUP BY 1;

# Consultar cual es el tipo de remuneración más común para los empleados
SELECT tipos,MAX(Cant) FROM (
SELECT R.tipos, COUNT(R.id) Cant
FROM empleados E
JOIN remuneraciones R  ON E.remuneracion_id = R.id
GROUP BY R.tipos
order by R.tipos desc) Resultado;

# Consultar el proveedor de un producto
CREATE PROCEDURE p_mostar_proveedor_de_producto (IN parametro NVARCHAR(15))
   BEGIN
       SELECT Pr.nombre FROM productos P
           JOIN productos_pedido PP ON P.id = PP.producto_id
           JOIN pedidos Pd ON PP.pedido_id= Pd.id
           JOIN proveedores Pr ON Pd.proveedor_id = Pr.id
       WHERE P.nombre= parametro;
   END;

CALL p_mostar_proveedor_de_producto('Leche');

# Consultar las ventas
SELECT * FROM ventas;

# Consultar el/los  cliente(s) que compro más en un intervalo de tiempo
SELECT c.id, nombre, apellido , fecha FROM clientes c
    JOIN ventas v ON c.id = v.cliente_id
WHERE (v.fecha < '2022-04-15' AND v.fecha > '2022-04-10');

# Consultar los datos de los empleados con mayor remuneración
SELECT e.id, nombre, apellidos,Max(cantidad) FROM empleados e
JOIN  remuneraciones r ON e.remuneracion_id = r.id;

# Consultar cual es la cantidad de empleados por cada distrito.
SELECT e.id, e.nombre, apellidos FROM empleados e
    JOIN direcciones d ON e.direccion_id = d.id
    JOIN distritos d2 ON d.distrito_id = d2.id
WHERE d2.nombre = 'Comas';

# Consultar el producto más vendido
SELECT MAX(total)
FROM (
    SELECT p.nombre, SUM(cantidad) total
    FROM productos p
        JOIN venta_productos vp ON p.id = vp.producto_id
    GROUP BY p.nombre) Resultado;

# Consultar por cada cliente, indicar el nombre del cliente, los nombres de los productos adquiridos y
# la cantidad de cada producto.
SELECT c.nombre, p.nombre, SUM(vp.cantidad) total
FROM clientes c
    JOIN ventas v ON c.id = v.cliente_id
    JOIN venta_productos vp ON v.id = vp.venta_id
    JOIN productos p ON p.id = vp.producto_id
GROUP BY c.nombre, p.nombre;

# Consultar la cantidad de ventas realizadas con cupones
SELECT COUNT(id) cantidad
FROM ventas
WHERE cupon_id>=1;

# Consultar el cupón más utilizado en las ventas
SELECT MAX(ventas)
FROM (SELECT c.descuento, COUNT(v.id) ventas
      FROM cupones c
               JOIN ventas v ON c.id = v.cupon_id
      GROUP BY c.descuento) resultado;

# Consultar el turno en donde trabajan el mayor número de empleados
SELECT turno_id, MAX(Total)  FROM (
   SELECT count(*)Total, turno_id  FROM empleados
   GROUP BY turno_id)
AS Resultado;

# Consultar los ingresos por cada producto vendido
SELECT producto_id, SUM(monto_parcial*cantidad) Ingreso
FROM venta_productos GROUP BY producto_id;

# Consultar cual es la categoría que más vende
SELECT categoria_id, Total FROM(
       SELECT categoria_id, count(*) Total FROM venta_productos VP
           JOIN productos P ON VP.producto_id = P.id
           JOIN categorias C on P.categoria_id = C.id
       GROUP BY categoria_id)
       AS RESULTADO
       WHERE Total = (SELECT MAX(Total) FROM (
           SELECT categoria_id, count(*) Total FROM venta_productos VP
           JOIN productos P ON VP.producto_id = P.id
           JOIN categorias C on P.categoria_id = C.id
       GROUP BY categoria_id) AS MAXIMO);
       
# Consultar cual es la cantidad de un determinado producto que fue provista por los proveedores.
SELECT pro.nombre AS Producto, pr.nombre AS Proveedor, cantidad AS Cantidad FROM productos pro
    JOIN productos_pedido pp ON pro.id = pp.producto_id
    JOIN pedidos p ON pp.pedido_id = p.id
    JOIN proveedores pr on p.proveedor_id = pr.id
GROUP BY producto_id;
