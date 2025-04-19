create table Customers (
	cCustomerID char(11) primary key not null,
	vFirstName varchar(150) not null,
	vLastName varchar(150) not null,
	vEmail varchar(150) not null,
	vGender varchar(8),
	Birthdate date
	)

create table Vendors (
	cVendorID char(6) primary key not null,
	vName varchar(300) not null,
	vContactNum char(12) not null,
	CityAddress varchar(200) not null

)
create table Products (
	cProductID char(7) primary key not null,
	vDescription varchar(max),
	iQuantity int not null,
	cVendorID char(6) not null foreign key (cVendorID) references Vendors(cVendorID)
	)

insert into Customers values
('02000224632', 'Lance','Krager', 'krager@gmail.com', 'Male', '2297-05-14'),
('02000337200', 'Louise Byron','Macaburas', 'macaburas@gmail.com', 'Male', '2004-08-15'),
('02000243303', 'Moriancumer Notarte', 'Armada', 'armada@gmail.com', 'Male', '2004-05-04'),
('02000372183', 'Charles Justine', 'Relos', 'kingcharles@gmail.com', 'Male', '2005-12-19'),
('02000187531', 'John Kai', 'Rafael', 'irukai@gmail.com', 'Male', '2001-01-25');

insert into Vendors values
('V00001', 'Universal Robina Corporation','8633-7631', 'Pasig, MM'),
('V00002', 'Liwayway Marketing Corporation', '8844-8441', 'Pasay, MM'),
('V00003', 'Monde Nissin', '7759-7500', 'Makati, MM');

insert into Products values
('P000101', 'Jack "n Jill Piattos', '1000', 'V00001'),
('P000102', 'Jack "n Jill Nova', '1000', 'V00001'),
('P001005', 'Oishi Prawn Crackers', '700', 'V00002'),
('P030007', 'Nissin Eggnog Cookies', '850', 'V00003');

UPDATE Products
SET iQuantity += 274
WHERE cProductID = 'P000102';

UPDATE Products
SET iQuantity -= 42
WHERE cProductID = 'P030007';

SELECT cProductID, iQuantity
FROM Products
WHERE iQuantity <= 1000;

SELECT *
FROM Products
WHERE iQuantity <= 1000;

DELETE FROM Customers WHERE cCustomerID = '02000187531';

SELECT *
FROM Customers

SELECT *
FROM Vendors
