select
    dim_cliente.cliente_key,
    dim_territorio.territory_key,
    store_key

from adw.Sales_Customer as Customer
    join adw_dwh.dim_cliente as dim_cliente
        on Customer.CustomerID = dim_cliente.cliente_id
    join adw_dwh.dim_territorio as dim_territorio
        on Customer.TerritoryID = dim_territorio.territory_id
    join Sales_Store as Store
        on Customer.PersonID = Store.SalesPersonID
    join adw_dwh.dim_tienda as dim_tienda
         on Store.BusinessEntityID = dim_tienda.store_id

limit 10;