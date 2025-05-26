CREATE VIEW user_city AS
SELECT U.firstName, U.lastName, U.email, C.name, U.address 
FROM user U 
INNER JOIN city C;
