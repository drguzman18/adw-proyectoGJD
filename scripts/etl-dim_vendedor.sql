use adw;

insert into adw_dwh.dim_vendedor (
    salesperson_id,
    salesperson_name,
    city,
    country,
    gender,
    paymentfreq,
    department
)
select
    BusinessEntityID as salesperson_id,
    CONCAT(person.FirstName,' ',person.LastName) as salesperson_name,
    ad.City as city,
    cregion.Name as country,
    hr.gender as gender,
    hrpay.PayFrequency as paymentfreq,
    hrdept.Name as department 
from Sales_SalesPerson as sp
    join HumanResources_Employee as hr using(BusinessEntityID)
    join Person_Person as person using(BusinessEntityID)
    join Person_BusinessEntityAddress as badd using(BusinessEntityID)
    join Person_Address as ad using (AddressID)
    join Person_StateProvince as sprov using (StateProvinceID)
    join Person_CountryRegion as cregion using (CountryRegionCode)
    join HumanResources_EmployeePayHistory as hrpay using (BusinessEntityID)
    join HumanResources_EmployeeDepartmentHistory as hrhist using (BusinessEntityID)
    join HumanResources_Department as hrdept using (DepartmentID)
;

