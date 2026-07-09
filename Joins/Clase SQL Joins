-- Ejercicio 1: Obtener los 5 productos con mayor cantidad total vendida, ordenados de mayor a menor.
-- de la tabla Northwind
-- USE Northwind
SELECT TOP 5 
	   p.ProductName,
       SUM(o.Quantity)	AS cant_ventas
FROM Products p
JOIN [Order Details] o
ON p.ProductID = o.ProductID
GROUP BY ProductName
ORDER BY cant_ventas DESC;

-- Ejercicio 2: Obtener los 3 meses con mayor importe total vendido, calculado como la suma de (cantidad � precio unitario) 
-- de cada orden, agrupado por a�o y mes.
SELECT TOP 3
       YEAR(o.OrderDate) AS a�o_venta,
       MONTH(o.OrderDate) AS mes_venta,
       SUM(od.Quantity * od.UnitPrice) AS importe
FROM Orders o
INNER JOIN [Order Details] od
       ON o.OrderID = od.OrderID
GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate)
ORDER BY importe DESC;

-- Ejercicio 3: Obtener los 5 empleados que han gestionado la mayor cantidad de �rdenes, 
-- considerando las �rdenes realizadas por los clientes asignados a cada empleado.
SELECT TOP 5
       CONCAT(e.FirstName, ' ', e.LastName) AS nombre_empleado,
       e.EmployeeID AS id_empleado,
       COUNT(DISTINCT o.OrderID) AS cant_ordenes
FROM Employees e
JOIN orders o
       ON o.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY cant_ordenes DESC;

-- Ejercicio 4: Obtener los 15 pa�ses con mayor cantidad de �rdenes realizadas,  
-- contando cada orden �nica y ordenando de mayor a menor.
SELECT TOP 15
       COUNT(DISTINCT o.OrderID) AS cant_ventas,
       c.country AS pais
FROM Customers c
JOIN Orders o
       ON o.CustomerID = c.CustomerID
GROUP BY c.Country
ORDER BY cant_ventas DESC;

-- Ejercicio 5: Obtener las 15 combinaciones de pa�s y ciudad con mayor cantidad de �rdenes realizadas,  
-- contando �rdenes �nicas y ordenadas de mayor a menor.
SELECT TOP 15
       COUNT(DISTINCT o.OrderID) AS cant_ventas,
       c.Country AS pais,
       c.City AS ciudad
FROM Customers c
JOIN Orders o
       ON o.CustomerID = c.CustomerID
GROUP BY c.Country, c.City
ORDER BY cant_ventas DESC;

-- Ejercicio 6: �Cu�l es el cliente que ha realizado la mayor cantidad de �rdenes, considerando cada orden �nica?.
SELECT TOP 1
       COUNT(DISTINCT o.OrderID) AS cant_ventas,
       c.ContactName AS cliente
FROM Customers c
JOIN Orders o
       ON o.CustomerID = c.CustomerID
GROUP BY c.ContactName
ORDER BY cant_ventas DESC;

-- Ejercicio 7: Calcular el precio promedio y Diferencia entre el m�ximo y minimo de compra de todos los productos.
SELECT 
    AVG(UnitPrice) AS promedio_precios,
    (MAX(UnitPrice) - MIN(UnitPrice)) AS diferencia_precios
FROM Products;

-- Ejercicio 8: Obtener, para el producto con c�digo �S12_1108�, la cantidad total de unidades vendidas por a�o y mes, 
-- ordenadas cronol�gicamente.
SELECT 
       SUM(od.Quantity) AS unidades_vendidas,
       p.ProductName AS producto,
       YEAR(o.OrderDate) AS a�o_venta,
       MONTH(o.OrderDate) AS mes_venta
FROM [Order Details] od
JOIN Orders o
       ON o.OrderID = od.OrderID
JOIN Products p
       ON p.ProductID = od.ProductID
WHERE p.ProductID = 43
GROUP BY p.ProductName, YEAR(o.OrderDate), MONTH(o.OrderDate)
ORDER BY a�o_venta, mes_venta ASC;

-- Ejercicio 9: Determinar cu�ntos productos est�n registrados en el cat�logo y cu�ntos de ellos han sido vendidos al menos una vez
SELECT 
    COUNT(DISTINCT p.ProductID) AS cant_productos_registrados,
    COUNT(DISTINCT od.ProductID) AS cant_productos_vendidos
FROM Products p
LEFT JOIN [Order Details] od 
       ON p.ProductID = od.ProductID;

-- Ejercicio 10: Determinar qu� empleado tiene m�s clientes asignados a su c�digo de vendedor.
SELECT TOP 1
    CONCAT(e.FirstName, ' ', e.LastName) AS empleado,
    COUNT(DISTINCT CustomerID) AS clientes_asignados
FROM Employees e
JOIN Orders c ON e.EmployeeID = c.EmployeeID
GROUP BY e.FirstName, e.LastName
ORDER BY clientes_asignados DESC;
