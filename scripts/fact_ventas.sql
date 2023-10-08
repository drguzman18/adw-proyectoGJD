use adw

insert into adw_dwh.fact_ventas (
ventas_id,
date_key,
salesperson_key,
store_key,
product_key,
territory_key,
cliente_key,
count_sales,
SubTotal,
TaxAmt,
Unit_Price,
UnitPriceDiscount,
Line_Total,
OrderQty
)
select
  -- customer.CustomerID,
  -- store.Name,
  -- store.BusinessEntityID,
  -- sales.SalesPersonID,
    detail.SalesOrderDetailID as detailorder,
  -- sales.OrderDate,
    to_days(OrderDate) as date_key,
    salesperson_key,
    store_key,
  -- detail.SalesOrderID,
  -- detail.ProductID,
    product_key,
 -- proveedor_key,
    territory_key,
    cliente_key,
    1 as count_sales,
    SubTotal,
    TaxAmt,
    UnitPrice,
    UnitPriceDiscount,
    LineTotal,
    OrderQty

from Sales_SalesOrderDetail as detail
    join Sales_SalesOrderHeader as sales
        on detail.SalesOrderID = sales.SalesOrderID
    join Sales_Customer as customer
        on sales.CustomerID = customer.CustomerID
    join Sales_Store as store 
        on customer.StoreID = store.BusinessEntityID
    join adw_dwh.dim_tienda as dimt 
        on store.BusinessEntityID=dimt.store_id
    join adw_dwh.dim_vendedor as dimv
        on sales.SalesPersonID=dimv.salesperson_id
     join adw_dwh.dim_producto as dimp
        on detail.ProductID=dimp.product_id
 
    -- join Purchasing_ProductVendor as vendor
       -- on detail.ProductID=vendor.ProductID
 -- join adw_dwh.dim_proveedor as dimpv
 -- on vendor.BusinessEntityID=dimpv.proveedor_id
 
    join Sales_SalesTerritory as st
        on sales.TerritoryID=st.TerritoryID
    join adw_dwh.dim_territorio as dimty
        on st.TerritoryID=dimty.territory_id
    join adw_dwh.dim_cliente as dimcl
        on sales.CustomerID=dimcl.cliente_id
;