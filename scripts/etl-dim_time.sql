use adw;

INSERT INTO adw_dwh.dim_time (
    date_key,
    date_value,
    month_number,
    year4,
    day_of_week,
    day_of_week_name
)
SELECT
    TO_DAYS(fecha) AS date_key,
    fecha,
    MONTH(fecha) AS month,
    YEAR(fecha) AS year4,
    DAY(fecha) as day,
    DATE_FORMAT(fecha, '%W')
FROM (
select distinct DATE(OrderDate) as fecha
from Sales_SalesOrderHeader
) as fechas