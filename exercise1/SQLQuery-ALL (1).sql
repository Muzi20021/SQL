
###ZAD.1

SELECT        Production.ProductCategory.Name COLLATE SQL_Latin1_General_CP1_CI_AS AS Category, Production.ProductSubcategory.Name COLLATE SQL_Latin1_General_CP1_CI_AS AS Subcategory, 
                         COUNT(Production.Product.ProductNumber) AS [Number of Products], AVG(DISTINCT Production.Product.StandardCost) AS [Average Cost]
FROM            Production.Product INNER JOIN
                         Production.ProductSubcategory ON Production.Product.ProductSubcategoryID = Production.ProductSubcategory.ProductSubcategoryID INNER JOIN
                         Production.ProductCategory ON Production.ProductSubcategory.ProductCategoryID = Production.ProductCategory.ProductCategoryID
GROUP BY Production.ProductCategory.Name COLLATE SQL_Latin1_General_CP1_CI_AS, Production.ProductSubcategory.Name COLLATE SQL_Latin1_General_CP1_CI_AS



###ZAD.2
SELECT        HumanResources.Department.Name COLLATE SQL_Latin1_General_CP1_CI_AS AS Department, Person.Person.LastName COLLATE SQL_Latin1_General_CP1_CI_AS AS [L.Name], 
                         Person.Person.FirstName COLLATE SQL_Latin1_General_CP1_CI_AS AS [F.Name], HumanResources.Shift.StartTime AS StartDate
FROM            HumanResources.Department INNER JOIN
                         HumanResources.EmployeeDepartmentHistory ON HumanResources.Department.DepartmentID = HumanResources.EmployeeDepartmentHistory.DepartmentID INNER JOIN
                         HumanResources.Employee AS Employee_1 ON HumanResources.EmployeeDepartmentHistory.BusinessEntityID = Employee_1.BusinessEntityID INNER JOIN
                         Person.Person ON Employee_1.BusinessEntityID = Person.Person.BusinessEntityID INNER JOIN
                         HumanResources.Shift ON HumanResources.EmployeeDepartmentHistory.ShiftID = HumanResources.Shift.ShiftID AND HumanResources.EmployeeDepartmentHistory.ShiftID = HumanResources.Shift.ShiftID
WHERE        (HumanResources.Shift.StartTime = N'23:00:00.0000000')






###ZAD.3
SELECT        Production.Product.Name COLLATE SQL_Latin1_General_CP1_CI_AS AS Product, Purchasing.Vendor.Name COLLATE SQL_Latin1_General_CP1_CI_AS AS Vendor, Purchasing.ProductVendor.StandardPrice, 
                         Production.ProductCategory.Name COLLATE SQL_Latin1_General_CP1_CI_AS AS Category
FROM            Production.Product INNER JOIN
                         Production.ProductSubcategory ON Production.Product.ProductSubcategoryID = Production.ProductSubcategory.ProductSubcategoryID INNER JOIN
                         Production.ProductCategory ON Production.ProductSubcategory.ProductCategoryID = Production.ProductCategory.ProductCategoryID INNER JOIN
                         Purchasing.ProductVendor ON Production.Product.ProductID = Purchasing.ProductVendor.ProductID INNER JOIN
                         Purchasing.Vendor ON Purchasing.ProductVendor.BusinessEntityID = Purchasing.Vendor.BusinessEntityID AND Purchasing.ProductVendor.BusinessEntityID = Purchasing.Vendor.BusinessEntityID AND 
                         Purchasing.ProductVendor.BusinessEntityID = Purchasing.Vendor.BusinessEntityID
WHERE        (Production.ProductCategory.Name COLLATE SQL_Latin1_General_CP1_CI_AS = N'clothing') OR
                         (Production.ProductCategory.Name COLLATE SQL_Latin1_General_CP1_CI_AS = N'accessories')



###ZAD.4
SELECT        Person.Person.FirstName COLLATE SQL_Latin1_General_CP1_CI_AS AS Imie, Person.Person.LastName COLLATE SQL_Latin1_General_CP1_CI_AS AS Nazwisko, Sales.SalesPerson.SalesLastYear AS [Wartoœæ zam], 
                         COUNT(Sales.SalesOrderHeader.SalesOrderID) AS [Liczba zam]
FROM            Sales.SalesOrderHeader INNER JOIN
                         HumanResources.EmployeeDepartmentHistory INNER JOIN
                         Person.Person ON HumanResources.EmployeeDepartmentHistory.BusinessEntityID = Person.Person.BusinessEntityID INNER JOIN
                         Sales.SalesPerson ON HumanResources.EmployeeDepartmentHistory.BusinessEntityID = Sales.SalesPerson.BusinessEntityID ON Sales.SalesOrderHeader.SalesPersonID = Sales.SalesPerson.BusinessEntityID AND 
                         Sales.SalesOrderHeader.SalesPersonID = Sales.SalesPerson.BusinessEntityID AND Sales.SalesOrderHeader.SalesPersonID = Sales.SalesPerson.BusinessEntityID AND 
                         Sales.SalesOrderHeader.SalesPersonID = Sales.SalesPerson.BusinessEntityID
GROUP BY Person.Person.FirstName COLLATE SQL_Latin1_General_CP1_CI_AS, Person.Person.LastName COLLATE SQL_Latin1_General_CP1_CI_AS, Sales.SalesPerson.SalesLastYear
ORDER BY [Liczba zam] DESC


###ZAD.5
SELECT       Person.Person.FirstName COLLATE SQL_Latin1_General_CP1_CI_AS AS Imiê, Person.Person.LastName COLLATE SQL_Latin1_General_CP1_CI_AS AS Nazwisko, 
                         Person.PersonPhone.PhoneNumber COLLATE SQL_Latin1_General_CP1_CI_AS AS [Numer.tel]
FROM            HumanResources.Employee AS Employee_1 INNER JOIN
                         Person.Person ON Employee_1.BusinessEntityID = Person.Person.BusinessEntityID AND Employee_1.BusinessEntityID = Person.Person.BusinessEntityID AND 
                         Employee_1.BusinessEntityID = Person.Person.BusinessEntityID INNER JOIN
                         Person.PersonPhone ON Person.Person.BusinessEntityID = Person.PersonPhone.BusinessEntityID INNER JOIN
                         Person.PhoneNumberType ON Person.PersonPhone.PhoneNumberTypeID = Person.PhoneNumberType.PhoneNumberTypeID
WHERE        (Person.PhoneNumberType.Name COLLATE SQL_Latin1_General_CP1_CI_AS = N'Cell')
ORDER BY Imiê



###ZAD.6
SELECT HumanResources.Department.Name COLLATE SQL_Latin1_General_CP1_CI_AS AS Departament, COUNT(HumanResources.EmployeeDepartmentHistory.DepartmentID) AS [Liczba pracowników]
FROM     HumanResources.Department INNER JOIN
                  HumanResources.EmployeeDepartmentHistory ON HumanResources.Department.DepartmentID = HumanResources.EmployeeDepartmentHistory.DepartmentID AND 
                  HumanResources.Department.DepartmentID = HumanResources.EmployeeDepartmentHistory.DepartmentID AND HumanResources.Department.DepartmentID = HumanResources.EmployeeDepartmentHistory.DepartmentID AND 
                  HumanResources.Department.DepartmentID = HumanResources.EmployeeDepartmentHistory.DepartmentID AND HumanResources.Department.DepartmentID = HumanResources.EmployeeDepartmentHistory.DepartmentID AND 
                  HumanResources.Department.DepartmentID = HumanResources.EmployeeDepartmentHistory.DepartmentID INNER JOIN
                  Person.Person ON HumanResources.EmployeeDepartmentHistory.BusinessEntityID = Person.Person.BusinessEntityID
GROUP BY HumanResources.Department.Name COLLATE SQL_Latin1_General_CP1_CI_AS
ORDER BY [Liczba pracowników] DESC
