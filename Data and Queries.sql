use cms2;
INSERT INTO User (UserID, Name, Email, Password, ContactNumber, Address)
VALUES 
(1, 'John Doe', 'john@example.com', 'password123', '1234567890', '123 Main St, City'),
(2, 'Jane Smith', 'jane@example.com', 'password456', '0987654321', '456 Oak St, Town'),
(3, 'Michael Johnson', 'michael@example.com', 'password789', '9876543210', '789 Elm St, Village'),
(4, 'Emily Brown', 'emily@example.com', 'passwordabc', '0123456789', '321 Pine St, Hamlet'),
(5, 'David Lee', 'david@example.com', 'passworddef', '5555555555', '555 Cedar St, Countryside'),
(6, 'Emma Garcia', 'emma@example.com', 'passwordghi', '6666666666', '666 Willow St, Suburbia'),
(7, 'Olivia Martinez', 'olivia@example.com', 'passwordjkl', '7777777777', '777 Birch St, Rural');

truncate table couriers;
INSERT INTO Couriers (CourierID, SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weight, Status, TrackingNumber, DispatchDate, DeliveryDate)
VALUES 
(1, 'John Doe', '123 Main St, City', 'Jane Smith', '456 Oak St, Town', 2.5, 'In transit', 'ABC123', '2024-04-10', '2024-04-10'),
(2, 'Alice Johnson', '789 Elm St, Village', 'Bob Brown', '321 Pine St, Hamlet', 1.8, 'Delivered', 'DEF456', '2024-04-02', '2024-04-08'),
(3, 'David Lee', '555 Cedar St, Countryside', 'Emma Garcia', '666 Willow St, Suburbia', 3.2, 'Pending', 'GHI789', NULL, NULL),
(4, 'Michael Johnson', '789 Elm St, Village', 'Olivia Martinez', '777 Birch St, Rural', 2.0, 'In transit', 'JKL012', '2024-04-08', '2024-04-09'),
(5, 'Emily Brown', '321 Pine St, Hamlet', 'David Lee', '555 Cedar St, Countryside', 1.5, 'Delivered', 'MNO345', '2024-04-05', '2024-04-07'),
(6, 'Emma Garcia', '666 Willow St, Suburbia', 'Michael Johnson', '789 Elm St, Village', 2.8, 'In transit', 'PQR678', NULL, NULL),
(7, 'Olivia Martinez', '777 Birch St, Rural', 'John Doe', '123 Main St, City', 2.3, 'Pending', 'STU901', NULL, NULL);



INSERT INTO CourierServices (ServiceID, ServiceName, Cost)
VALUES 
(1, 'Standard Delivery', 10.00),
(2, 'Express Delivery', 20.00),
(3, 'Overnight Delivery', 30.00),
(4, 'Same Day Delivery', 40.00),
(5, 'International Delivery', 50.00),
(6, 'Special Handling', 15.00),
(7, 'Fragile Item Delivery', 25.00);


INSERT INTO Employee (EmployeeID, Name, Email, ContactNumber, Role, Salary)
VALUES 
(1, 'Sarah Lee', 'sarah@example.com', '1112223333', 'Manager', 50000.00),
(2, 'Tom Johnson', 'tom@example.com', '4445556666', 'Courier', 30000.00),
(3, 'Emma Wilson', 'emma@example.com', '7778889999', 'Accountant', 40000.00),
(4, 'Andrew Smith', 'andrew@example.com', '1114447777', 'HR Manager', 45000.00),
(5, 'Sophia Brown', 'sophia@example.com', '2225558888', 'Customer Service', 32000.00),
(6, 'James Garcia', 'james@example.com', '3336669999', 'IT Support', 35000.00),
(7, 'Isabella Martinez', 'isabella@example.com', '4447770000', 'Marketing', 38000.00);

drop table location;
select * from location;
INSERT INTO Location (LocationID, LocationName, Address)
VALUES 
(1, 'City Hub', '123 Main St, City'),
(2, 'Town Center', '456 Oak St, Town'),
(3, 'Village Center', '789 Elm St, Village'),
(4, 'Hamlet Plaza', '321 Pine St, Hamlet'),
(5, 'Countryside Depot', '555 Cedar St, Countryside'),
(6, 'Suburbia Station', '666 Willow St, Suburbia'),
(7, 'Rural Drop-off', '777 Birch St, Rural');

drop table payment;
INSERT INTO Payment (PaymentID, CourierID, LocationID, Amount, PaymentDate)
VALUES 
(1, 1, 1, 10.00, '2024-04-08'),
(2, 2, 2, 20.00, '2024-04-08'),
(3, 3, 3, 30.00, '2024-04-08'),
(4, 4, 4, 40.00, '2024-04-08'),
(5, 5, 5, 50.00, '2024-04-08'),
(6, 6, 6, 15.00, '2024-04-08'),
(7, 7, 7, 25.00, '2024-04-08');

 


-- Task 1
-- query 1
select * from user;

-- query 2
select * from user as u join couriers as c
on c.receivername = u.name
where u.name = 'John doe';

-- query 3
select * from couriers;

-- query 4

-- query 5
select * from couriers where courierid = 5;

-- query 6
select * from Couriers where status <> 'Delivered';

-- query 7
select * from couriers where deliverydate = current_date();


-- query 8
select * from couriers group by status;

-- query 10
select datediff(deliverydate,dispatchdate) from couriers where status <> 'Pending';

-- query 11
select * from couriers where weight between 1 and 2;

-- query 12
select * from employee where Name = 'john';

-- query 13
select * from couriers as c join payment as p
on c.courierID = p.CourierId 
where p.amount>50;

-- Task 3
-- query 14
SELECT e.EmployeeID, e.Name, COUNT(o.CourierID) AS total_couriers_handled
FROM Employee e
LEFT JOIN couriers o ON e.EmployeeID = o.CourierID
GROUP BY e.EmployeeID, e.Name;

-- query 15
select sum(p.amount) as 'total revenue',l.locationname  from payment as p join location as l
on p.locationid=l.locationid
group by l.locationid;
use cms2;

-- query 16
select *,count(c.status) as 'delivered couriers' from couriers as c join payment as p
on p.courierid = c.courierid join location as l
on p.locationid = l.locationid
where c.status = 'delivered'
group by l.locationid;

-- query 17


-- query 18
select l.locationid,l.locationname 
from payment as p join location as l
on l.locationid = p.locationid
group by locationid
having sum(p.amount)< 15;

-- query 19
select l.locationid,l.locationname,sum(amount) 
from payment as p left join location as l
on l.locationid=p.locationid
group by l.locationid;

-- query 20
select c.* from 
couriers as c inner join payment as p
on c.courierid = p.courierid
where p.locationid=3
group by c.courierid
having sum(p.amount)>10;

-- query 21
select c.* from couriers as c inner join payment as p
on c.courierid=p.courierid
where p.paymentdate>'2023-04-05'
group by c.courierid
having sum(p.amount)>10;

-- query 22
select l.* 
from location as l inner join payment as p
on p.locationid = l.locationid
where p.paymentdate > '2023-04-08'
group by l.locationid
having sum(p.amount)>=50;

-- task 4
-- query 23
select c.*,p.paymentid,p.amount,p.paymentdate 
from payment as p join couriers as c
on p.courierid = c.courierid;

-- query 24
select p.paymentid,p.amount,p.paymentdate,l.* 
from payment as p join location as l
on l.locationid = p.locationid;

-- query 25
select p.paymentid,p.paymentdate,p.amount,c.*,l.*
from payment as p join couriers as c
on p.courierid = c.courierid
join location l
on l.locationid= p.locationid;

-- query 26
select p.paymentid,p.amount,p.paymentdate,c.* 
from payment as p join couriers as c 
on p.courierid = c.courierid;

-- query 27
select sum(p.amount) from payment as p
join couriers as c
on c.courierid= p.courierid
group by c.courierid;

-- query 28
select * from payment
where paymentdate= '2024-04-08';

-- query 29
select p.paymentid,p.amount,p.paymentdate,c.* from payment as p 
join couriers as c
on c.courierid= p.courierid;

-- query 30
select p.paymentid,p.amount, p.paymentdate,l.locationname,l.address
from payment as p
join location as l
on l.locationid =p.locationid;

-- query 31
select c.*,sum(p.amount) 
from couriers as c
join payment as p
on p.courierid=c.courierid
group by c.courierid;

-- query 32
select * from payment
where paymentdate between '2023-04-08' and '2024-04-08';

-- query 33
select * from user as u
left join couriers as c
on c.Receivername = u.name;

-- query 34
select * from couriers as c 
left join courierservices as cs
on c.serviceid = cs.serviceid;

-- query 35
SELECT *
FROM employee e
JOIN Payment p ON e.EmployeeID = p.CourierID;

-- 36. List all users and all courier services, showing all possible combinations. 
SELECT *
FROM User
CROSS JOIN Couriers;

-- 37. List all employees and all locations, showing all possible combinations: 
SELECT *
FROM Employee
CROSS JOIN Location;

-- 38. Retrieve a list of couriers and their corresponding sender information (if available) 

-- 39. Retrieve a list of couriers and their corresponding receiver information (if available): 


-- 40. Retrieve a list of couriers along with the courier service details (if available): 
SELECT *
FROM Couriers
LEFT OUTER JOIN Payment ON Couriers.CourierID = Payment.CourierID;

-- 41. Retrieve a list of employees and the number of couriers assigned to each employee: 


-- 42. Retrieve a list of locations and the total payment amount received at each location: 
SELECT Location.LocationID, Location.LocationName, SUM(Payment.Amount) AS TotalPaymentsReceived
FROM Location
LEFT OUTER JOIN Payment ON Location.LocationID = Payment.LocationID
GROUP BY Location.LocationID, Location.LocationName;

-- 43. Retrieve all couriers sent by the same sender (based on SenderName). 
SELECT *
FROM Couriers
INNER JOIN User AS Sender ON Couriers.SenderName = Sender.Name;

-- 44. List all employees who share the same role. 
SELECT *
FROM Employee AS e1
INNER JOIN Employee AS e2 ON e1.Role = e2.Role AND e1.EmployeeID != e2.EmployeeID;

-- 45. Retrieve all payments made for couriers sent from the same location. 
SELECT *
FROM Payment AS p1
INNER JOIN Payment AS p2 ON p1.LocationID = p2.LocationID AND p1.CourierID != p2.CourierID;

-- 46. Retrieve all couriers sent from the same location (based on SenderAddress). 
SELECT *
FROM Couriers AS c1
INNER JOIN Couriers AS c2 ON c1.SenderAddress LIKE c2.SenderAddress AND c1.CourierID != c2.CourierID;

-- 47. List employees and the number of couriers they have delivered: 
SELECT Employee.EmployeeID, Employee.Name, COUNT(Couriers.CourierID) AS TotalCouriersDelivered
FROM Employee
LEFT OUTER JOIN Couriers ON Employee.EmployeeID = Couriers.UserID
GROUP BY Employee.EmployeeID, Employee.Name;

-- 48. Find couriers that were paid an amount greater than the cost of their respective courier services
SELECT Payment.*
FROM Payment
INNER JOIN Couriers ON Payment.CourierID = Couriers.CourierID
INNER JOIN CourierServiceMapping ON Couriers.CourierID = CourierServiceMapping.CourierID
INNER JOIN CourierServices ON CourierServiceMapping.ServiceID = CourierServices.ServiceID
WHERE Payment.Amount > CourierServices.Cost;



-- Problem 49: Find couriers that have a weight greater than the average weight of all couriers
SELECT *
FROM Couriers
WHERE Weight > (SELECT AVG(Weight) FROM Couriers);

-- Problem 50: Find the names of all employees who have a salary greater than the average salary
SELECT Name
FROM Employee
WHERE Salary > (SELECT AVG(Salary) FROM Employee);

-- Problem 51: Find the total cost of all courier services where the cost is less than the maximum cost
SELECT SUM(Cost) As TotalCost
FROM CourierServices
WHERE Cost < (SELECT MAX(Cost) FROM CourierServices);

-- Problem 52: Find all couriers that have been paid for
SELECT *
FROM Couriers
WHERE EXISTS (
    SELECT 1
    FROM Payment
    WHERE Payment.CourierID = Couriers.CourierID
);

-- Problem 53: Find the locations where the maximum payment amount was made
SELECT LocationID
FROM Payment
WHERE Amount = (SELECT MAX(Amount) FROM Payment);

-- Problem 54: Find all couriers whose weight is greater than the weight of all couriers sent by a specific sender
SELECT *
FROM Couriers AS c1
WHERE Weight > ALL (
    SELECT Weight
    FROM Couriers AS c2
    WHERE c2.SenderName = 'Exim Logistics'
);