use Ecommerce;

CREATE TABLE bill_temp AS
SELECT code, date, null as client, null as paymentMethod, null as seller FROM bill WHERE false;

ALTER TABLE bill_temp MODIFY COLUMN client VARCHAR(50);
ALTER TABLE bill_temp MODIFY COLUMN paymentMethod VARCHAR(50);
ALTER TABLE bill_temp MODIFY COLUMN seller VARCHAR(50);

insert into bill_temp (code, date, client, paymentMethod, seller) values 
("SALE001", "2025-01-15", "1234567890", "PAY001", "9876543210"),
("SALE002", "2025-02-20", "PEP2023456", "PAY002", "PS1234567"),
("SALE003", "2025-03-10", "CE9832471", "PAY003", "PEP2023456"),
("SALE004", "2025-04-05", "PEP9876543", "PAY004", "1029384756");

INSERT INTO bill (code, date, client_id, paymentMethod_id, seller_id)
(SELECT code, date, (SELECT id FROM user WHERE documentNumber = B.client), (SELECT id FROM paymentMethod WHERE code = B.paymentMethod), (SELECT id FROM user WHERE documentNumber = B.seller) FROM bill_temp B);

DROP TABLE bill_temp;

select * from bill;