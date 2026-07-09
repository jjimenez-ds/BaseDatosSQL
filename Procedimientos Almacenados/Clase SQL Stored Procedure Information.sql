-- Ejercicio 1: Crear un P.A. donde llamado "pa_empleados_sueldo" que seleccione los Nombres, Apellidos y Ciudad de los empleados.
-- USE Northwind
DROP PROCEDURE IF EXISTS pa_empleados;
GO
CREATE PROCEDURE pa_empleados
	@nombre NVARCHAR(50),
	@apellido NVARCHAR(50),
	@ciudad NVARCHAR(50)
AS
BEGIN
  SELECT @nombre AS LastName,
  	   @apellido AS FirstName,
  	   @ciudad  AS City
  FROM Employees
  WHERE @nombre = LastName AND @apellido = FirstName AND @ciudad  = City;
END;

EXEC pa_empleados Suyama, Michael, London;

-- Ejercicio 2: Crear un P.A. donde muestre empleados por Pais
DROP PROCEDURE IF EXISTS PA_EMPLEADOS_PAIS;
GO
CREATE PROCEDURE PA_EMPLEADOS_PAIS
	@pais NVARCHAR(25)
AS
BEGIN
  SELECT country,Lastname, Firstname  FROM Employees
  WHERE @pais = country;
END;

EXEC PA_EMPLEADOS_PAIS USA;

-- Ejercicio 3: (USAR CONDICIONAL CASE)
-- Confeccionar un P.A. que le enviemos un entero comprendido entre 1 y 3. 
-- debe retornar el tipo de medalla que representa dicho n�mero, sabiendo que:
-- 1 - oro
-- 2 - plata
-- 3 - bronce
DROP PROCEDURE IF EXISTS PA_MEDALLA;
GO
CREATE PROCEDURE PA_MEDALLA
	@TIPO INT
AS
BEGIN
  SELECT  CASE @TIPO
  				WHEN 1 THEN 'ORO'
  				WHEN 2 THEN 'PLATA'
  				WHEN 3 THEN 'BRONCE'
  				ELSE 'SIN MEDALLA'
  		END;
END;

EXECUTE PA_MEDALLA 299;

-- Ejercicio 4: (USAR CONDICIONAL IF)
-- Podemos utilizar operadores l�gicos en una condici�n de un if, crear un P.A. que muestre el mayor de 3 enteros:
DROP PROCEDURE IF EXISTS PA_MAYOR_3_ENTEROS;
GO
CREATE PROCEDURE PA_MAYOR_3_ENTEROS
	@VALOR1 INT,
	@VALOR2 INT,
	@VALOR3 INT
AS
BEGIN
	   IF @VALOR1>@VALOR2 AND @VALOR1>@VALOR3 SELECT @VALOR1 AS MAYOR
	   ELSE IF @VALOR2 > @VALOR3 SELECT @VALOR2 AS MAYOR
	   ELSE SELECT @VALOR3 AS MAYOR;
END;

EXEC PA_MAYOR_3_ENTEROS 8,3,24;

-- Ejercicio 5: Crear un P.A. donde muestre el total del Ordenes de un cliente
DROP PROCEDURE IF EXISTS PA_ORDENES_TOTAL;
GO
CREATE PROCEDURE PA_ORDENES_TOTAL
	@cliente VARCHAR(50)
AS
BEGIN
  SELECT 
  CustomerID,COUNT(*) AS TOTAL_ORDENES
  FROM Orders
  WHERE CustomerID = @cliente 
  GROUP BY CustomerID;
END;

EXEC PA_ORDENES_TOTAL 'VINET';
