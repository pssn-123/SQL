create database CMS2;

use CMS2;

create table User(
UserID int primary key auto_increment,
Name VARCHAR(255) not null,
Email VARCHAR(255) Unique,
Password VARCHAR(255) not null,
ContactNumber VARCHAR(20) unique,
Address text 
);

create table CourierServices(
ServiceID int primary key,
ServiceName varchar(100),
Cost decimal(8,2));

create table Couriers(
CourierID int primary key auto_increment,
serviceid int,
foreign key (serviceid) references courierservices(serviceid) on update cascade on delete cascade,
SenderName varchar(255),
SenderAddress text,
ReceiverName varchar(255),
ReceiverAddress text,
Weight decimal(5,2),
Status varchar(50),
TrackingNumber varchar(20) unique,
DispatchDate date,
DeliveryDate date
);


create table Employee(
EmployeeID int primary key auto_increment,
Name varchar(255),
Email varchar(255) unique,
ContactNumber varchar(20),
Role varchar(50),
Salary decimal(10,2));

create table Location(
LocationId int primary key auto_increment,
LocationName varchar(100),
Address text);

create table Payment(
PaymentId int primary key auto_increment,
CourierId int,
LocationId int,
Amount decimal(10,2),
PaymentDate date,
foreign key(CourierID) references Couriers(CourierId) on delete cascade,
foreign key(LocationID) references Location(LocationId) on delete cascade
);
