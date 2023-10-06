
    select
    SalesOrderID as ventas_id,
    OrderDate,
    to_days(OrderDate) as date_key,
    sales.SalesPersonID as salesperson_id,
    salesperson_key,
    sdet.ProductID as product_id,
    product_key,
    -- store_key,
    customer_key,
    SubTotal,
    TaxAmt,
    UnitPrice,
    UnitPriceDiscount,
    LineTotal,
    OrderQty,
    products.Size,
    products.Weight,
    wr.ActualCost
    
    from adw.Sales_SalesOrderHeader as sales
        join adw_dwh.dim_vendedor as dimv on sales.SalesPersonID=dimv.salesperson_id 
        join Sales_SalesOrderDetail as sdet using (SalesOrderID)
        join Production_Product as products using (ProductID)
        join Production_WorkOrderRouting as wr using (ProductID)
        join adw_dwh.dim_producto as dimp on sdet.ProductID=dimp.product_id
       -- join adw_dwh.dim_tienda as dimt on adw.Sales_Store.BusinessEntityID=dimt.store_id
        join adw_dwh.dim_cliente as dimc on adw.Sales_Customer.PersonID=dimc.cliente_id
limit 5;