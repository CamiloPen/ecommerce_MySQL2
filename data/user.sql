use Ecommerce;

CREATE TABLE user_temp AS
SELECT firstName, lastName, password, documentType, documentNumber, email, phone, null AS city, address, zipCode, registeredDate, active FROM user WHERE false;

ALTER TABLE user_temp MODIFY COLUMN city VARCHAR(10);

insert into user_temp (firstName, lastName, password, documentType, documentNumber, email, phone, city, address, zipCode, registeredDate, active) values 
("Sebastian", "Montenegro", "S3b@stiAn9", "CC", "1234567890", "sebastian.montenegro@example.com", "3001234567", "CTY001", "Cra 10 # 20-30", 110111, "2025-01-15", true),
("Valentina", "Rodriguez", "V@l3ntina8", "CE", "9876543210", "valentina.rodriguez@example.net", "3109876543", "CTY002", "Calle 50 # 45-60", 50021, "2025-02-20", true),
("Federico", "Fischbach", "F3d3r!co7", "PEP", "PEP2023456", "federico.fischbach@example.org", "3156549870", "CTY003", "Av 6N # 34-52", 760001, "2025-03-10", false),
("Manuela", "Gonzalez", "M@nu3la23", "CC", "654321987", "manuela.gonzalez@example.co", "3017654321", "CTY004", "Carrera 40 # 45-23",80001, "2025-03-25", true),
("Camilo", "Torres", "C@m1lo98T", "PS", "PS1234567", "camilo.torres@example.com", "3021239876", "CTY005", "Calle 20 # 15-40", 660002, "2025-01-28", true),
("Daniela", "Castaneda", "D@ni3laP9", "CC", "1029384756", "daniela.castaneda@example.net", "3113456789", "CTY006", "Av Pedro de Heredia # 50-25", 130001, "2025-03-01", true),
("Santiago", "Vargas", "S4nti@go5", "CE", "CE9832471", "santiago.vargas@example.edu", "3002345678", "CTY007", "Carrera 23 # 65-80", 170004, "2025-02-15", false),
("Isabella", "Martinez", "1s@bElla7", "PEP", "PEP9876543", "isabella.martinez@example.info", "3209871234", "CTY008", "Carrera 5 # 12-34", 470004, "2025-04-05", true),
("Alejandro", "Giraldo", "A1ej@ndrO", "PS", "PS3456789", "alejandro.giraldo@example.io", "3135678901", "CTY009", "Calle 45 # 27-60", 680003, "2025-01-18", true),
("Mariana", "Salazar", "M@r1ana8S", "CC", "1092837465", "mariana.salazar@example.biz", "3146789012", "CTY010", "Av 0 # 5-10", 540001, "2025-04-10", false);

INSERT INTO user (firstName, lastName, password, documentType, documentNumber, email, phone, city_id, address, zipCode, registeredDate, active)
(SELECT firstName, lastName, password, documentType, documentNumber, email, phone, (SELECT id FROM city WHERE code = U.city), address, zipCode, registeredDate, active FROM user_temp U);

DROP TABLE user_temp;

select * from user;  