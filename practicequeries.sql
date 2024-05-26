update vehicletable
set dailyrate = 68
where make = 'Mercedes';

delete from customertable
where firstname = '';

alter table paymenttable
rename column transactiondate to paymentdate;

select * from customertable
where email = '';

select * from customertable 
where customerid= 3 and enddate>= curdate();

select * from customertable c join leasetable l 
on c.customerid =l.customerID
join paymenttable p 
on l.leaseId = p.leaseId
where c.phonenumber = '555-555-5555'
;

select avg(dailyrate)as dailyrate 
from vehicletable
where status = 'available'
;

select * from vehicletable
order by dailyrate desc
limit 1;

select c.firstname,v.* 
from vehicletable v join leasetable l 
on v.vehicleid = l.vehicleID
join customertable c
on c.customerid = l.customerID
where c.firstname = 'John'
;

select * from leasetable
order by enddate desc
limit 1;

select * from paymenttable
where year(paymentdate) = '2023';

select * 
from customertable c left join leasetable l 
on l.customerID = c.customerid
left join paymenttable p
on p.leaseId = l.leaseId
where p.paymentId is null
;

select v.*,sum(p.amount) from vehicletable v join leasetable l
on l.vehicleID = v.vehicleid
join paymenttable p 
on p.leaseId = l.leaseId
group by v.vehicleid
;

select c.*,sum(p.amount) as 'total payment' 
from customertable c join leasetable l
on c.customerid = l.customerID
join paymenttable p
on p.leaseId = l.leaseId
group by c.customerid
;

select l.leaseId,v.*
from vehicletable v join leasetable l
on v.vehicleid = l.vehicleID
order by l.leaseId
;

select * 
from vehicletable v join leasetable l
on v.vehicleid = l.vehicleID
join customertable c
on c.customerid = l.customerID
where l.enddate >= curdate()
;

select c.* 
from customertable c join leasetable l
on l.customerid = c. customerid
join paymenttable p 
on p.leaseId = l.leaseId
group by c.customerid
order by sum(p.amount)
limit 1;

select v.* ,max(l.enddate)
from vehicletable v left join leasetable l
on v.vehicleid = l.vehicleID
group by v.vehicleID
;