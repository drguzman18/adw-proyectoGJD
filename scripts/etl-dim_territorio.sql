use adw;

INSERT INTO adw_dwh.dim_territorio (
    territory_id,
    name_territory
)
select
TerritoryID,
case when Name in ('Southwest','Northwest','Southeast','Central','Northeast') then 'USA' else Name end as name_territory
from Sales_SalesTerritory
;

 