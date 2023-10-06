use adw

select 
    customer.CustomerID,
    store.Name,
    store.BusinessEntityID,
    sales.SalesPersonID,
    sales.SalesOrderID,
    sales.OrderDate,
    to_days(OrderDate) as date_key,
    salesperson_key,
    store_key,
    detail.SalesOrderID,
    detail.ProductID,
    product_key,
    proveedor_key,
    territory_key,
    cliente_key,
    SubTotal,
    TaxAmt,
    UnitPrice,
    UnitPriceDiscount,
    LineTotal,
    OrderQty,
    pp.Size,
    pp.Weight,
    pwk.ActualCost

from Sales_Customer as customer
 join Sales_Store as store 
 on customer.CustomerID=store.BusinessEntityID
 join adw_dwh.dim_tienda as dimt 
 on store.BusinessEntityID=dimt.store_id
 join Sales_SalesOrderHeader as sales
 on store.SalesPersonID=sales.SalesPersonID
 join adw_dwh.dim_vendedor as dimv
 on sales.SalesPersonID=dimv.salesperson_id
 join Sales_SalesOrderDetail as detail
 on sales.SalesOrderID=detail.SalesOrderID
 join adw_dwh.dim_producto as dimp
 on detail.ProductID=dimp.product_id
 join Purchasing_ProductVendor as vendor
 on detail.ProductID=vendor.ProductID
 join adw_dwh.dim_proveedor as dimpv
 on vendor.BusinessEntityID=dimpv.proveedor_id
 join Sales_SalesTerritory as st
 on sales.TerritoryID=st.TerritoryID
 join adw_dwh.dim_territorio as dimty
 on st.TerritoryID=dimty.territory_id
 join adw_dwh.dim_cliente as dimcl
 on sales.CustomerID=dimcl.cliente_id
 join Production_Product as pp
 on vendor.ProductID=pp.ProductID
 join Production_WorkOrderRouting as pwk
 on vendor.ProductID=pwk.ProductID



limit 5;

