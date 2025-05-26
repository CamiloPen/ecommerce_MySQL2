use Ecommerce;

CREATE TABLE bill_detail_temp AS
SELECT null as bill, null as product, quantity, price FROM bill_detail WHERE false;

ALTER TABLE bill_detail_temp MODIFY COLUMN bill VARCHAR(10);
ALTER TABLE bill_detail_temp MODIFY COLUMN product VARCHAR(10);

insert into bill_detail_temp (bill, product, quantity, price) values 
("SALE001", "PROD001", 1, 2500000),	
("SALE002", "PROD003", 1, 350000),	
("SALE003", "PROD004", 1, 4500000),	
("SALE004", "PROD005", 3, 750000),	
("SALE001", "PROD002", 2, 750000),
("SALE003", "PROD005", 1, 1850000),
("SALE004", "PROD003", 2, 350000);

INSERT INTO bill_detail (bill_id, product_id, quantity, price)
(SELECT (SELECT id FROM bill WHERE code = B.bill), (SELECT id FROM product WHERE code = B.product), quantity, price FROM bill_detail_temp B);

DROP TABLE bill_detail_temp;

select * from bill_detail B order by B.bill_id;