create table Professors
(
	cProfessor_ID char(12) primary key not null,
	vFirst_Name varchar(50) not null,
	vLast_Name varchar(50) not null,
	cContact_Number char(11),
	cMajor char(100),
	cDepartment char(150)
)

create table Rooms
(
	cRoom_ID char(5) primary key not null,
	vRoom_Name varchar(5) not null,
	vBuilding varchar(max)
)

create table Courses
(
	cCourse_ID char(8) primary key not null,
	vTitle varchar(8) not null,
	vDescription varchar(max) not null,
	cDepartment char(150) not null
)

create table Students
(
	cStudent_ID char(15) primary key not null,
	vFirst_Name varchar(50) not null,
	vLast_Name varchar(50) not null,
	cContact_Number char(11),
	vAddress varchar(max) not null,
	cCourse_ID char(8) 
	foreign key (cCourse_ID) references Courses(cCourse_ID) not null,
)

create table ClassSchedules
(
	cClass_ID char(5) primary key not null,
	cCourse_ID char(8) 
	foreign key (cCourse_ID) references Courses(cCourse_ID) not null,
	vSubject varchar(100) not null,
	vSchedule varchar(150) not null,
	cRoom_ID char(5)
	foreign key (cRoom_ID) references Rooms(cRoom_ID) not null,
	cProfessor_ID char(12)
	foreign key (cProfessor_ID) references Professors(cProfessor_ID) not null,
)
