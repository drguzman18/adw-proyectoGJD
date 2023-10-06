use adw 

select
    SalesOrderID as ventas_id,
    OrderDate,
    to_days(OrderDate) as date_key,
    sales.SalesPersonID as salesperson_id,
    salesperson_key,
    salesc.CustomerID,
    salesc.PersonID
   
 
    from adw.Sales_SalesOrderHeader as sales
        join adw_dwh.dim_vendedor as dimv on sales.SalesPersonID=dimv.salesperson_id 
        join adw.Sales_Customer as salesc on sales.CustomerID=salesc.CustomerID
        
limit 5;

