create DATABASE if not exists Ecommerce;

-- drop database if exists Ecommerce; --

use Ecommerce;

create table if not exists category (
    id int auto_increment  primary key,
    code varchar(10) not null,
    name varchar(60) not null,
    description text,
    active bool
);

CREATE UNIQUE INDEX indx_category_code ON category(code);
CREATE INDEX indx_category_name ON category(name);

create table if not exists paymentMethod (
    id int auto_increment  primary key,
    code varchar(10) not null,
    name varchar(60) not null,
    description text,
    active bool
);

CREATE UNIQUE INDEX indx_pay_code ON paymentMethod(code);
CREATE INDEX indx_pay_name ON paymentMethod(name);

create table if not exists city (
    id int auto_increment  primary key,
    code varchar(60) not null,
    name varchar(60) not null,
    country varchar(60) not null
);

CREATE UNIQUE INDEX indx_city_code ON city(code);
CREATE INDEX indx_city_name ON city(name);

create table if not exists user (
    id int auto_increment  primary key,
    firstName varchar(60) not null,
    lastName varchar(60) not null,
    password varchar(60) not null,
    documentType varchar(4) not null,
    documentNumber varchar(60) not null,
    email varchar(100) not null,
    phone varchar(20),
    city_id int not null,
    address varchar(80),
    zipCode int,
    userType enum("C", "S", "A") not null,
    registeredDate date not null,
    active bool,
    foreign key (city_id) references city (id)
);

CREATE UNIQUE INDEX indx_user_idNumber ON user(documentNumber);
CREATE INDEX indx_user_city ON paymentMethod(city_id);

create table if not exists product (
    id int auto_increment primary key,
    code varchar(10) not null,
    name varchar(60) not null,
    description text,
    price double not null,
    stock int not null,
    category_id int not null,
    brand  varchar(60),
    cond  varchar(60),
    vat int not null,
    active bool,
    foreign key (category_id) references category (id)
);

CREATE UNIQUE INDEX indx_product_code ON product(code);
CREATE INDEX indx_product_name ON product(name);
CREATE INDEX indx_product_category ON product(category_id);
CREATE INDEX indx_product_brand ON product(brand);

create table if not exists bill (
    id int auto_increment primary key,
    code varchar(10) not null,
    date date not null,
    client_id int not null,
    paymentMethod_id int not null,
    seller_id int not null,
    foreign key (client_id) references user (id),
    foreign key (paymentMethod_id) references paymentMethod (id),
    foreign key (seller_id) references user (id)
);

CREATE UNIQUE INDEX indx_bill_code ON bill(code);
CREATE INDEX indx_bill_date ON bill(date);

create table if not exists bill_detail (
    bill_id int not null,
    product_id int not null,
    quantity int not null,
    price double not null,
    foreign key (bill_id) references bill (id),
    foreign key (product_id) references product (id)
);