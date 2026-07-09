-- Ejercicio 1: Crear un P.A. donde llamado "pa_crear_libros" que contenga las siguientes instrucciones:
-- eliminaci�n de la tabla "libros" si existe;
-- creaci�n de la tabla "libros" con: codigo, titulo, autor, editorial, precio, cantidad;
-- ingreso de algunos registros.
DROP PROCEDURE IF EXISTS pa_crear_libros;
GO
CREATE PROCEDURE pa_crear_libros 
AS
BEGIN
	  CREATE TABLE libros(
	   codigo int identity,
	   titulo varchar(40),
	   autor varchar(30),
	   editorial varchar(20),
	   precio decimal(5,2),
	   cantidad smallint,
	   primary key(codigo)
	  )
	INSERT INTO libros VALUES('Cien a�os de soledad','Gabriel Garcia Marquez','Sudamericana',25.90,15);
	INSERT INTO libros VALUES('Don Quijote de la Mancha','Miguel de Cervantes','Espasa',30.50,10);
	INSERT INTO libros VALUES('1984','George Orwell','Secker & Warburg',18.75,20);
	INSERT INTO libros VALUES('Orgullo y prejuicio','Jane Austen','T. Egerton',22.40,12);
	INSERT INTO libros VALUES('La Odisea','Homero','Gredos',19.99,18);
	INSERT INTO libros VALUES('El principito','Antoine de Saint-Exupery','Reynal & Hitchcock',15.60,25);
	INSERT INTO libros VALUES('Crimen y castigo','Fiodor Dostoievski','The Russian Messenger',27.30,8);
	INSERT INTO libros VALUES('Rayuela','Julio Cortazar','Sudamericana',23.80,14);
	INSERT INTO libros VALUES('La sombra del viento','Carlos Ruiz Zafon','Planeta',21.45,16);
	INSERT INTO libros VALUES('Harry Potter y la piedra filosofal','J.K. Rowling','Bloomsbury',24.99,30);
END;

EXEC pa_crear_libros;

-- Ejercicio 2: Crear un P.A. donde llamado "pa_libros_limite_stock" que muestre los libros de los cuales hay menos de 15.
DROP PROCEDURE IF EXISTS pa_libros_limite_stock;
GO
CREATE PROCEDURE pa_libros_limite_stock
AS
BEGIN
   SELECT * FROM libros
   WHERE cantidad <= 15
END;

EXEC pa_libros_limite_stock;

-- Probar 1: Si ejecutamos el P.A. del sistema "sp_help" junto al nombre del procedimiento (exec sp_help pa_libros_limite_stock;)
-- Probar 2: Si modificamos alg�n registro de la tabla y volvemos a ejecutar el P.A. (update libros set cantidad=13 where codigo=10;)

-- Ejercicio 3: Crear un P.A. donde llamado "pa_libros_autor" que reciba el nombre de un autor y muestre todos los libros del autor solicitado
DROP PROCEDURE IF EXISTS pa_libros_autor;
GO
CREATE PROCEDURE pa_libros_autor
	@autor VARCHAR(30)
AS
BEGIN
	SELECT *
	FROM libros
	WHERE autor = @autor;
END;

EXEC pa_libros_autor 'Jane Austen';

-- Ejercicio 4: Crear un P.A. donde llamado "pa_libros_autor_editorial" que recibe 2 parametros, el nombre de un autor y el de una editorial 
DROP PROCEDURE IF EXISTS pa_libros_autor_editorial;
GO
CREATE PROCEDURE pa_libros_autor_editorial
	@autor VARCHAR(30),
	@editorial VARCHAR(30)
AS
BEGIN
	SELECT *
	FROM libros
	WHERE autor = @autor and editorial = @editorial
END;

EXEC pa_libros_autor_editorial 'Homero', 'Gredos';

-- Ejercicio 5: Crear un P.A. donde llamado "pa_autor_promedio" para que reciba el nombre de un autor y nos retorne el promedio de
-- los precios de todos los libros de tal autor

DROP PROCEDURE IF EXISTS pa_autor_promedio;
GO
CREATE PROCEDURE pa_autor_promedio
	@autor VARCHAR(30) = '%',
	@promedio decimal(6,2) output
AS
BEGIN
	SELECT @promedio = AVG(precio) 
	FROM libros
	WHERE autor LIKE @autor;
END;

-- parametro de salida
DECLARE @resultado DECIMAL(6,2);
EXEC pa_autor_promedio 'Jane Austen', @resultado OUTPUT;

SELECT @resultado AS Promedio;

-- Ejercicio 6: Crear un P.A. donde llamado "pa_promedio" al cual le enviamos 2 n�meros decimales y retorna el promedio
DROP PROCEDURE IF EXISTS pa_promedio;
GO
CREATE PROCEDURE pa_promedio
	@n1 DECIMAL(4,2),
	@n2 DECIMAL(4,2),
	@resultado DECIMAL(4,2) OUTPUT
AS
BEGIN
	SELECT @resultado=(@n1+@n2)/2;
END 

-- parametro de salida
DECLARE @variable DECIMAL(4,2)
EXEC pa_promedio 5,6, @variable OUTPUT
SELECT @variable

EXEC pa_promedio 5.3,4.7, @variable OUTPUT
SELECT @variable


