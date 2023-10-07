
use adw_dwh

--     
select name_territory as Pais,round(avg(SubTotal),0) as Pomedio_Ventas, sum(count_sales) as Num_Ventas 
from fact_ventas as fv
    join dim_territorio as dimt 
        on dimt.territory_key=fv.territory_key
group by name_territory

;

-- Top 10 Vendedores
select salesperson_name as vendedor, sum(count_sales) as Num_Ventas 
from fact_ventas as fv 
    join dim_vendedor as dimv 
        on dimv.salesperson_key=fv.salesperson_key

group by salesperson_name
order by Num_Ventas desc
limit 10

;

-- Promedio Compras por Genero
select case when gender as genero, round(avg(SubTotal),0) as Promedio_Ventas
from fact_ventas as fv 
    join dim_vendedor as dimv 
        on dimv.salesperson_key=fv.salesperson_key

group by genero
