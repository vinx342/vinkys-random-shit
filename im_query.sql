create table Wrapper
(
cWrapperId char(10) primary key not null,
vDescription varchar(50) unique not null ,
vWrapperRate DECIMAL (5,2) Null,
iPhoto image NULL,
vWrapper_Image_Path varchar(50) NULL,
)


create table OrderDetail
(
cOrderNo char(10) primary key,
cToyId char(10),
cQty char CHECK (cQty > 0),
cGiftWrap char(1) CHECK (cGiftWrap IN ('Y', 'N')),
cWrapperId char(10),
vMessage varchar(255),
dToyCost decimal (10,2),
foreign key (cWrapperId) references Wrapper(cWrapperId)
)


create table Orders
(
cOrderNo char(10) primary key,
foreign key (cOrderNo) references OrderDetail(cOrderNo),
dOrderDate date not null,
cCartId char(50) not null,
cShopperId char(50) not null,
cShippingModeId char(2) not null,
dShippingCharges decimal (10,2) check (dShippingCharges <= 90),
dGiftWrapCharges decimal (10,2) default 0 not null,
cOrderProcessed char(1) default 'Y' not null,
dTotalCost decimal (10,2) not null,
dExpectedDeliveryDate date not null
)

INSERT INTO Wrapper (cWrapperID, vDescription, vWrapperRate, iPhoto, vWrapper_Image_Path) VALUES 
  ('001', 'Geckos', 1.00, NULL, NULL),
  ('002', 'Baby blocks', 1.25, NULL, NULL),
  ('003', 'stars', 1.50, NULL, NULL),
  ('004', 'Bubbles', 2, NULL, NULL);

INSERT INTO OrderDetail (cOrderNo, cToyId, cQty, cWrapperID, vMessage, dToyCost) VALUES 
  ('000001', '000008', 1, 'Y', '002', 'Surprise', 14.99),
  ('000002', '000016', 2, 'Y', '001', 'I Love you', 86.50),
  ('000003', '000017', 3, 'N', NULL, NULL, 71.97),
  ('000004', '000030', 1, 'Y', '003', 'Happy Birthday', 35.99),
  ('000005', '000001', 4, 'Y', '004', 'Congratulations', 35.96);

INSERT INTO Orders (cOrderNo, dOrderDate, cCartId, cShopperId, cShippingModeId, dShippingCharges, dGiftWrapCharges, cOrderProcessed, dTotalCost, dExpectedDeliveryDate)VALUES 
  ('000001', '2024-05-20', '000002', '000002', '01', 6.00, 1.25, 'Y', 62.22, '2024-05-24'),
  ('000002', '2024-05-20', '000001', '000005', '02', 8.00, 2.00, 'Y', 96.50, '2024-05-23'),
  ('000003', '2024-05-20', '000003', '000007', '01', 12.00, 0.00, 'Y', 83.97, '2024-05-24'),
  ('000004', '2024-05-20', '000004', '000006', '01', 4.00, 1.00, 'Y', 40.99, '2024-05-24'),
  ('000005', '2024-05-21', '000005', '000002', '03', 90.00, 7.75, 'Y', 231.68, '2024-05-25');

DELETE FROM Orders WHERE cOrderNo = '000004'

SELECT * INTO NewOrder FROM Orders WHERE 1 = 0;

SELECT * FROM Orders WHERE cOrderNo IN (000002,000005);

SELECT * FROM Wrapper;

SELECT * FROM Orders;

SELECT * FROM OrderDetail;
