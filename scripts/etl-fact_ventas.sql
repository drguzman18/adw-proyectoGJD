
    select
    SalesOrderID as ventas_id,
    OrderDate,
    to_days(OrderDate) as date_key,
    sales.SalesPersonID as salesperson_id,
    salesperson_key,
    sdet.ProductID as product_id,
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
    limit 5;