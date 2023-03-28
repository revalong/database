
 -- A query to retrieve the main attributes of each person (their code, and last/first name)
select personCode, firstName, lastName from Person;
-- A query to retrieve the major fields for every person including their address (but excluding emails)
select p.personCode, p.firstName, p.lastName, a.street,a.city,a.state,a.zip,a.country
	from Person p, Address a where
    p.personId = a.personId;
-- A query to get the email addresses of a specific person
 select p.firstName, p.lastName, e.email from 
	Person p join Email e on 
    p.personId=e.personId
	where p.personId = 
   (select personId from Person 
	where firstName = "Howard" and lastName = "Shepard");
-- A query to change the email address of a specific email record
update Email set email = "hshepard@gmail.com" where
	emailId = (select emailId from Email 
    where email = "howard-shepard@aol.net");
-- A query (or series of queries) to remove a specific person record
delete from Email where PersonId = 1;
delete from Address where PersonId =1;
delete from Person where personId =1;
-- A query to get all the items on a specific invoice record
select i.invoiceCode, p.itemCode from
	Invoice i join Item p on
    i.invoiceId=p.invoiceId
    where i.invoiceId =1;
-- A query to get all the items purchased by a specific person
select p.personCode, p.firstName, p.lastName, i.itemCode
	from Person p join Item i join Invoice c on
	p.personId=c.customerId and
    i.invoiceId=c.invoiceId
    where p.firstName= "Kevin" and p.lastName="Briggs";
-- A query to find the total number of sales made at each store
select s.storeCode, count(i.itemCode) as itemAmount from 
	Store s join Invoice c join Item i
    on s.storeId = c.storeId and
    i.invoiceId = c.invoiceId 
    group by s.storeCode;
-- A query to find the total number of sales made by each employee
select c.salesPersonId, p.firstName, p.lastName, count(i.itemCode) 
	from Person p join Item i join Invoice c on
    p.personId=c.customerId and
    i.invoiceId = c.invoiceId 
    group by c.salesPersonId;
-- A query to find the subtotal charge of all products in each invoice 
-- (hint: you can take an aggregate of a mathematical expression). Do not include taxes.
select c.invoiceCode, sum(i.productPrice * i.productQuantity)
	from Item i  join Invoice c on
    i.invoiceId = c.invoiceId
    group by c.invoiceId;
-- A query to detect invalid data in invoice as follows. In a single invoice, a particular 
-- product should only appear once since any number of units can be consolidated to a single 
-- record. For example, an invoice should not have two records for fertilizer; one for 10 
-- liters and another for 25 liters. Instead, it should have a single record for 35 liters. 
-- Write a query to find any invoice that includes multiple instances of the same product. 
-- If your database design prevents such a situation, you should still write this query 
-- (but of course would never expect any results).
select c.invoiceCode, i.itemCode, count(*)
	from Item i  join Invoice c on
    i.invoiceId = c.invoiceId
    group by c.invoiceId, i.itemCode having 
    count(*)>1;
-- Write a query to detect a potential instance of fraud where an employee makes a sale 
-- to themselves (the same person is the sales person as well as the customer).
select i.invoiceCode, i.customerId,i.salesPersonId, p.firstName, p.lastName
	from Invoice i join Person p 
    on i.customerId=p.personId and 
    i.salesPersonId = p.personId
    where i.customerId =i.salesPersonId;
