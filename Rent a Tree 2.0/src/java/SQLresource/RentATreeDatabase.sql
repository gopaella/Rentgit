
CREATE TABLE Customer(
	CustomerId int GENERATED AS IDENTITY,
	Email VARCHAR2 (50)NOT NULL,
	UserPassword VARCHAR2(30)NOT NULL,
	FirstName VARCHAR2 (30)NOT NULL,
	LastName VARCHAR2 (30)NOT NULL,
	Address VARCHAR2 (50)NOT NULL,
	City VARCHAR2 (20)NOT NULL,
	CONSTRAINT CustomerID PRIMARY KEY (CustomerID));
	


CREATE OR REPLACE PROCEDURE insertCustomer(
	vEmail in Customer.Email%Type,
	vUserPassword in Customer.UserPassword%Type,
	vFirstName in Customer.FirstName%Type,
	vLastName in Customer.LastName%Type,
	vAddress in Customer.Address%Type,
	vCity in Customer.City%Type
)

IS

BEGIN
	INSERT INTO Customer (Email, UserPassword, FirstName, LastName, Address, City)
	VALUES(vEmail, vUserPassword, vFirstName, vLastName, vAddress, vCity);
END;
/
BEGIN
	insertCustomer('VPatel@outlook.co.uk', '123', 'Vishal', 'Patel', '34 near park', 'Birmingham');
	insertCustomer('DDavies.co.uk', '456', 'Dan', 'Davies', '21 Church Streer', 'Cardiff');
	insertCustomer('CStanley@Yahoo.co.uk', '789', 'Cuba', 'Stanley', '45 peeper Street', 'London');
	insertCustomer('ARoth@icloud.co.uk', '987', 'Alan', 'Roth', 'hodge house road', 'Reading');
END;
/

SELECT * FROM Customer;
----------------------------------------------------------------------------------------------------------------
CREATE TABLE OrderT(
OrderID INT GENERATED AS IDENTITY,
CustomerID INT,
CONSTRAINT OrderID PRIMARY KEY (OrderID),
CONSTRAINT fk_cus FOREIGN KEY (CustomerId) REFERENCES Customer
);

CREATE OR REPLACE PROCEDURE insertOrderT(
	vCustomerID in Customer.CustomerID%Type,
	VOrderID OUT OrderT.OrderID%Type
)

IS

BEGIN
	INSERT INTO OrderT(CustomerID)
	VALUES(vCustomerID) RETURNING OrderID INTO vOrderID;
END;
/
DECLARE
	OrderID int;
BEGIN
	insertOrderT(1,OrderID);
END;
/

SELECT * FROM OrderT;


---------------------------------------------------------------------------------
CREATE TABLE Material(
MaterialID INT GENERATED AS IDENTITY,
MaterialName VARCHAR2 (30),
CONSTRAINT MaterialID PRIMARY KEY (MaterialID));

CREATE OR REPLACE PROCEDURE insertMaterial(
	vMaterialName in Material.MaterialName%Type
)

IS

BEGIN
	INSERT INTO Material (MaterialName)
	VALUES(vMaterialName);
END;
/
BEGIN
	insertMaterial('WOOD');
	insertMaterial('PLASTIC');
	insertMaterial('PVC');
	insertMaterial('OAK');
END;
/

SELECT * FROM Material;

-----------------------------------------------------------------------------------------------------

CREATE TABLE Supplier(
SupplierID INT GENERATED AS IDENTITY,
SupplierName VARCHAR2 (30),
CONSTRAINT pkSuppID PRIMARY KEY (SupplierID));

CREATE OR REPLACE PROCEDURE insertSupplier(
	vSupplierName in Supplier.SupplierName%Type
)

IS

BEGIN
	INSERT INTO Supplier (SupplierName)
	VALUES(vSupplierName);
END;
/
BEGIN
	insertSupplier('TREE and CO');
	insertSupplier('GREEN COMPANY');
	insertSupplier('FIX TREE');
	insertSupplier('CHRISTMAS CO');
END;
/

SELECT * FROM Supplier;
-----------------------------------------------------------------------------------------------------

CREATE TABLE Product(
ProductID INT GENERATED AS IDENTITY,
MaterialID INT, 
SupplierID INT, 
ProductName VARCHAR2 (30),
ProductType VARCHAR2 (50),
ProductHeight FLOAT,
PricePerDay FLOAT,
CONSTRAINT pkProductID PRIMARY KEY (ProductID),
CONSTRAINT fk_MatID FOREIGN KEY (MaterialId) REFERENCES Material,
CONSTRAINT fk_SupID FOREIGN KEY (SupplierId) REFERENCES Supplier
);
CREATE OR REPLACE PROCEDURE insertProduct(
	vMaterialID in Material.MaterialID%Type,
	vSupplierID in Supplier.SupplierID%Type,
	VProductID OUT Product.ProductID%Type,
	vProductName in Product.ProductName%Type,
	vProductType in Product.ProductName%Type,
	vProductHeight in Product.ProductName%Type,
	vPricePerDay in Product.PricePerDay%Type
)

IS

BEGIN
	INSERT INTO Product (MaterialID, SupplierID, ProductName, ProductType, ProductHeight, PricePerDay)
	VALUES(vMaterialID, vSupplierID, vProductName, vProductType, vProductHeight, vPricePerDay)RETURNING ProductID INTO vProductID;
END;
/
DECLARE
	ProductID INT;
BEGIN
	insertProduct(1,1, ProductID, 'Best TREES', 'OAK', 6.8, 3.99);
END;
/

SELECT * FROM Product;
------------------------------------------------------------------------------------------------------
CREATE TABLE ORPROD (
OrderID INT,
ProductID INT,
StartDate DATE,
EndDate DATE,
DeliveryOption VARCHAR2 (30),
CONSTRAINT fk_ORDID FOREIGN KEY (OrderId) REFERENCES OrderT,
CONSTRAINT fk_PRODID FOREIGN KEY (ProductId) REFERENCES Product
);
CREATE OR REPLACE PROCEDURE insertORPROD(
	vProductName in Product.ProductName%Type,
	vProductType in Product.ProductName%Type,
	vProductHeight in Product.ProductName%Type,
	vPricePerDay in Product.PricePerDay%Type
)

IS

BEGIN
	INSERT INTO Product (ProductName,ProductType, ProductHeight, PricePerDay)
	VALUES(vProductName, vProductType, vProductHeight, vPricePerDay);
END;
/
BEGIN
	insertProduct('Green Tree', 'Christmas tree', 6.0, 3.99);
END;
/

SELECT * FROM Product;
SELECT * FROM OrderT;



-----------------------------------------------------------------------------------------------------

