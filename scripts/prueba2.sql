with datos as(

select
    Product.ProductID as product_id,
    Product.Name as product,
    Product.Class as class,
    Category.Name as category,
    Subcategory.Name as subcategory
    
from Production_Product as Product
    join Production_ProductSubcategory as Subcategory on Product.ProductSubcategoryID = Subcategory.ProductSubcategoryID
    join Production_ProductCategory as Category on Subcategory.ProductCategoryID = Category.ProductCategoryID

)


