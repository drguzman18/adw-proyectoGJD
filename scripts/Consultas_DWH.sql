
use adw_dwh

--   Ventas por País  
select name_territory as Pais,round(avg(SubTotal),0) as Pomedio_Ventas, sum(count_sales) as Num_Ventas 
from fact_ventas as fv
    join dim_territorio as dimt 
        on dimt.territory_key=fv.territory_key
group by name_territory
order by Pomedio_Ventas desc

;

-- Top 10 Vendedores
select salesperson_name as Vendedor, sum(count_sales) as Num_Ventas 
from fact_ventas as fv 
    join dim_vendedor as dimv 
        on dimv.salesperson_key=fv.salesperson_key

group by salesperson_name
order by Num_Ventas desc
limit 10

;

-- Top 5 de Tiendas con mayores ventas
select store as Tienda,round(sum(SubTotal),0) as Ventas, sum(count_sales) as Num_Ventas 
from fact_ventas as fv
    join dim_tienda as dimtienda
        on dimtienda.store_key=fv.store_key
group by store
order by Ventas desc
limit 5
;

-- Promedio Compras por Genero
select case when gender='M' then 'Hombres'
            when gender='F' then 'Mujeres'
            else gender end as Genero, 
            round(avg(SubTotal),0) as Promedio_Ventas
from fact_ventas as fv 
    join dim_vendedor as dimv 
        on dimv.salesperson_key=fv.salesperson_key

group by genero

;

-- Ventas por Año
select year4 as Anno,sum(count_sales) as Num_Ventas
from fact_ventas as fv
    join dim_time as dimtime 
        on fv.date_key=dimtime.date_key
group by year4

;

-- Variación ventas por año 
with datos as 
(select sum(case when year4=2011 then count_sales else 0 end) as ventas11,
        sum(case when year4=2012 then count_sales else 0 end) as ventas12,
        sum(case when year4=2013 then count_sales else 0 end) as ventas13,
        sum(case when year4=2014 then count_sales else 0 end) as ventas14
from fact_ventas as fv
join dim_time as dimtime
    on fv.date_key=dimtime.date_key
)
select ((ventas12 - ventas11)/ventas11)*100 as varventas12,
       ((ventas13 - ventas12)/ventas12)*100 as varventas13,
       ((ventas14 - ventas13)/ventas13)*100 as varventas14
from datos

;
-- Impuesto promedio por Subcategoría de producto
select Subcategory as Subcategoria, avg (TaxAmt) as Promedio_Impuesto
from fact_ventas as fv
    join dim_producto as dimp 
        on fv.product_key=dimp.product_key
group by Subcategory
order by Promedio_Impuesto desc