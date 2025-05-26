use Ecommerce;

insert into category (code, name, active) values 
("CAT001", "Electronics and Gadgets", true),
("CAT002", "Home and Kitchen Appliances", true),
("CAT003", "Men's Fashion and Accessories", true),
("CAT004", "Women's Clothing and Footwear", false),
("CAT005", "Outdoor Sports and Camping Gear", true);

select * from category;