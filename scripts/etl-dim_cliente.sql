use adw;

insert into adw_dwh.dim_cliente (
    cliente_id,
    cliente,
    city,
    province,
    country,
    email
)
select
    Customer.CustomerID as cliente_id,
    CONCAT(Person.FirstName, ' ',Person.LastName) AS cliente,
    Address.City as city,
    Prov.Name as province,
    Region.Name as country,
    Email.EmailAddress as email

from Sales_Customer as Customer
    join Person_Person as Person
        on Customer.PersonID = Person.BusinessEntityID
    join Person_EmailAddress as Email
        on Person.BusinessEntityID = Email.BusinessEntityID
    join Person_Address as Address
        on Person.BusinessEntityID = Address.AddressID
    join Person_StateProvince as Prov
        on Address.StateProvinceID = Prov.StateProvinceID
    join Person_CountryRegion as Region
        on Prov.CountryRegionCode = Region.CountryRegionCode
;