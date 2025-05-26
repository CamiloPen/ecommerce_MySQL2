use Ecommerce;

insert into paymentMethod (code, name, active) values 
("PAY001", "Credit Card Payment", true),
("PAY002", "Debit Card Payment", true),
("PAY003", "Bank Transfer", true),
("PAY004", "Cash on Delivery", true),
("PAY005", "PayPal Online Payment", true);

select * from paymentMethod;