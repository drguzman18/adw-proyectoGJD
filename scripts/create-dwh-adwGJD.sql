# Creación del esquema de la bodega de datos

create database if not exists adw_dwh;
use adw_dwh;

-- Dimension de tiempo
create table if not exists dim_time(
    date_key         int(8)     not null,
    date_value       date       not null,
    month_number     int(3)     not null,
    year4            int(5)     not null,
    day_of_week      int(5)     not null,
    day_of_week_name char(12)   not null,
 
    primary key(date_key),
    unique index date_value (date_value)
);

-- Dimension Vendedor
create table if not exists dim_vendedor(
    salesperson_key       int not null AUTO_INCREMENT,
    salesperson_id        int not null, 
    salesperson_name      varchar(50) not null,
    city                  varchar(30) not null,
    country               varchar(30) not null,
    gender                varchar(5)  not null, 
    paymentfreq           tinyint(8)  not null,    
    department            varchar(30)  not null,
    last_update           timestamp not null default CURRENT_TIMESTAMP,

    primary key (salesperson_key),
    unique index (salesperson_id)

);

-- Dimension Tienda
create table if not exists dim_tienda(
    store_key   int not null AUTO_INCREMENT,
    store_id    int not null, 
    store       varchar(100) not null, 
    last_update timestamp not null default CURRENT_TIMESTAMP,

    primary key (store_key),
    unique index (store_id)
);

-- Dimension Producto
create table if not exists dim_producto(
    product_key   int not null AUTO_INCREMENT,
    product_id    int not null, 
    product       varchar(100) not null,
    localizacion  varchar(100) not null,
    costrate      decimal(10,4) not null,
    class         char(2), 
    category      varchar(100) not null,
    subcategory   varchar(100) not null,
    last_update timestamp not null default CURRENT_TIMESTAMP,

    primary key (product_key),
    unique index (product_id)
);

-- Dimension Proveedor
create table if not exists dim_proveedor(
    proveedor_key   int not null AUTO_INCREMENT,
    proveedor_id    int not null, 
    proveedor       varchar(100) not null,
    credit_rating   tinyint(1) not null,
    ship_method     varchar(100) not null,
    last_update timestamp not null default CURRENT_TIMESTAMP,

    primary key (proveedor_key),
    unique index (proveedor_id)
);

-- Dimension Territorio
create table if not exists dim_territorio(
    territory_key   int not null AUTO_INCREMENT,
    territory_id    int not null, 
    name_territory  varchar(100) not null,
    last_update timestamp not null default CURRENT_TIMESTAMP,

    primary key (territory_key),
    unique index (territory_id)
);

-- Dimension Cliente
create table if not exists dim_cliente(
    cliente_key int not null AUTO_INCREMENT,
    cliente_id  smallint(8) not null, 
    cliente     varchar(200) not null,
    city        varchar(50) not null,
    province    varchar(50) not null,
    country     varchar(50) not null,
    email       varchar(50) not null,
    last_update timestamp not null default CURRENT_TIMESTAMP,

    primary key (cliente_key),
    unique index (cliente_id)

);

-- Hechos de las ventas
create table if not exists fact_ventas(
    -- llaves
    ventas_key       int(8)     not null AUTO_INCREMENT,
    ventas_id        int(11)    not null,
    
    -- foreign keys
    date_key         int(8)     not null,
    salesperson_key  int(8)     not null,
    store_key        int(8)     not null,
    product_key      int(8)     not null,
    proveedor_key    int(8)     not null,
    territory_key    int(8)     not null,
    cliente_key      int(8)     not null,

    -- datos
    count_sales       int(11)       not null, 
    SubTotal          decimal(19,4) not null,
    TaxAmt            decimal(19,4) not null,
    Unit_Price        decimal(19,4) not null,
    UnitPriceDiscount decimal(19,4) not null,
    Line_Total        decimal(38,6) not null,
    OrderQty          smallint(8)   not null,
    Tamano            varchar(5)    not null,
    Peso              decimal(8,2)  not null,
    Actual_Cost       decimal(19,4) not null,


    primary key (ventas_key),
    unique index ventas_id(ventas_id),

    index date_key (date_key),
    foreign key(date_key) references dim_time(date_key),
    index salesperson_key (salesperson_key),
    foreign key(salesperson_key) references dim_vendedor(salesperson_key),
    index store_key (store_key),
    foreign key (store_key) references dim_tienda(store_key),
    index product_key (product_key),
    foreign key(product_key) references dim_producto(product_key),
    index proveedor_key (proveedor_key),
    foreign key(proveedor_key) references dim_proveedor(proveedor_key),
    index territory_key (territory_key),
    foreign key(territory_key) references dim_territorio(territory_key),
    index cliente_key (cliente_key),
    foreign key (cliente_key) references dim_cliente(cliente_key)
);


