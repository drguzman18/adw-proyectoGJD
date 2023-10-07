use adw;


insert into adw_dwh.dim_proveedor(
    proveedor_id,
    proveedor,
    credit_rating
)
select distinct
    BusinessEntityID,
    vendor.Name as vendorName, 
    CreditRating
 from Purchasing_Vendor as vendor
;


