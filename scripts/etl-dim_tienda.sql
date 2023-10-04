use adw;
 INSERT INTO adw_dwh.dim_tienda (
    store_id,
    store
 )

select 
    BusinessEntityID,
    Name
from Sales_Store
;