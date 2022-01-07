CREATE USER 'simpleuser1'@'localhost' IDENTIFIED BY 'simplepassword';
CREATE USER 'simpleuser1'@'%' IDENTIFIED BY 'simplepassword';
GRANT SELECT ON mydb.* TO 'simpleuser1'@'localhost';
GRANT SELECT ON mydb.* TO 'simpleuser1'@'%';

CREATE USER 'truser'@'localhost' IDENTIFIED BY 'mypass';
GRANT INSERT, UPDATE ON mydb.* TO 'truser'@'localhost';

CREATE USER 'sadmin'@'localhost' IDENTIFIED BY 'superpass';
GRANT ALL PRIVILEGES ON mydb.* TO 'sadmin'@'localhost';