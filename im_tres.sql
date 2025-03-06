create table Users
(
	cUserID char(1) primary key not null,
	vUsername varchar(max) not null,
	vPassword varchar(50) not null,
	dDateCreated date not null
)

create table Locations
(
	cLocationID char(1) primary key not null,
	vCity varchar(30),
	cCountryAbbrev char(3) not null,
	cCountry char(50) not null
)

create table Pictures
(
	cPictureID char(1) not null,
	vFilename varchar(300) not null,
	cUserID char(1)
	foreign key (cUserID) references Users(cUserID) not null,
	cLocationID char(1)
	foreign key (cLocationID) references Locations(cLocationID) not null,
	dDateCreated date not null
)

insert into Users values
('1', 'sparsley0', 'ilyLunox2013', '2019-02-19'),
('2', 'dsumshon1', 'ZACstrong19', '2018-12-24'),
('3', 'hpointing2', 'ramramos11', '2018-12-11'),
('4', 'smannagh3', 'asheArrow01', '2018-08-05'),
('5', 'gstarsmore4', 'miyaArrow10', '2018-07-09'),
('6', 'dzuann5', 'ekkoSystem32', '2019-01-09');

insert into Locations values
('1', 'Venice', 'IT', 'Italy'),
('2', 'Arboga', 'SE', 'Sweden'),
('3', 'Angers', 'FR', 'France'),
('4', 'Manila', 'PH', 'Philippines'),
('5', 'Cebu', 'PH', 'Philippines'),
('6', 'Dunhou', 'CH', 'China');

insert into Pictures values
('1', 'laptop.jpeg', '3', '1', '2019-02-07'),
('2', 'myschool.jpeg', '6', '1', '2019-02-05'),
('3', 'sti_orca.jpeg', '4', '1', '2019-09-04'),
('4', 'home.jpeg', '2', '6', '2019-02-16'),
('5', 'bsit.jpeg', '1', '6', '2019-10-19'),
('6', 'database.jpeg', '2', '1', '2019-02-02'),
('7', 'cute.jpeg', '5', '6', '2019-06-09');

select * from Users;

select * from Locations;

select * from Pictures;
