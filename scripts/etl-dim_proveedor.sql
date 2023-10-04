use adw;

insert into adw_dwh.dim_proveedor(
    proveedor_id,
    proveedor,
    credit_rating,
    ship_method
)
select
    BusinessEntityID,
    vendor.Name,
    CreditRating,
    sm.Name
 from Purchasing_Vendor as vendor
  join Purchasing_PurchaseOrderHeader as po
   on vendor.BusinessEntityID=po.VendorID
  join Purchasing_ShipMethod as sm 
   on po.ShipMethodID = sm.ShipMethodID
;


