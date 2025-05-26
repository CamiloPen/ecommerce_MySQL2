use Ecommerce;

CREATE TABLE product_temp AS
SELECT code, name, description, price, stock, null AS category, brand, cond, vat, active FROM product WHERE false;

ALTER TABLE product_temp MODIFY COLUMN category VARCHAR(10);

insert into product_temp (code, name, description, price, stock, category, brand, cond, vat, active) values 
("PROD001", "Ultra HD Smart Television 55 Inch", "High-definition smart TV with voice control and built-in streaming services, ideal for home entertainment.", 2500000, 20, "CAT001", "VisionTech Electronics", "Brand New with Manufacturer Warranty", 19, true),
("PROD002", "Ergonomic Executive Office Chair", "Comfortable and adjustable office chair with lumbar support, ideal for long working hours at home or office.", 750000, 15, "CAT002", "ErgoComfort Seating", "New with Packaging", 19, true),
("PROD003", "Men's Waterproof Running Sneakers", "Durable and stylish running shoes designed for maximum comfort and water resistance, perfect for outdoor sports.", 350000, 40, "CAT003", "SportX Footwear", "New with Original Box", 19, true),
("PROD004", "Digital SLR Professional Camera Lens Kit", "Full professional DSLR camera lens kit with 4 zoom lenses, carrying case and cleaning accessories included.", 4500000, 10, "CAT001", "PhotoPro Gear", "Brand New Factory Sealed", 19, true),
("PROD005", "All-Terrain Mountain Bicycle", "Rugged mountain bike with dual suspension system, perfect for off-road adventures and city commuting alike.", 1850000, 12, "CAT005", "AdventureWheels Bikes", "Brand New Fully Assembled", 19, true);

INSERT INTO product (code, name, description, price, stock, category_id, brand, cond, vat, active)
(SELECT code, name, description, price, stock, (SELECT id FROM category WHERE code = P.category), brand, cond, vat, active FROM product_temp P);

DROP TABLE product_temp;

select * from product;