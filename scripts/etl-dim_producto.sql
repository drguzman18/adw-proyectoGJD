use adw;

insert into adw_dwh.dim_producto(
    product_id,
    product,
    localizacion,
    costrate,
    class,
    category,
    subcategory
)
select 
    Product.ProductID as product_id,
    Product.Name as product,
    Location.Name as localizacion,
    Location.CostRate as costrate,
    Product.Class as class,
    Category.Name as category,
    Subcategory.Name as subcategory
    
from Production_Product as Product
    join Production_ProductSubcategory as Subcategory 
        on Product.ProductSubcategoryID = Subcategory.ProductSubcategoryID
    join Production_ProductCategory as Category
        on Subcategory.ProductCategoryID = Category.ProductCategoryID
    join Production_ProductInventory as Inventory
         on Product.ProductID = Inventory.ProductID
    join Production_Location as Location 
         on Inventory.LocationID = Location.LocationID
;