
drop table if exists Address;
drop table if exists Email;
drop table if exists Item;
drop table if exists Invoice;
drop table if exists Store;
drop table if exists Person;

create table Person(
personId int not null primary key auto_increment,
firstName varchar(15) not null,
 lastName varchar(15) not null,
 personCode varchar(10) not null,
 personType varchar(1)
);
create table Store(
StoreId int not null primary key auto_increment,
storeCode varchar(10) not null
);
create table Invoice(
  invoiceId int not null primary key auto_increment,
  invoiceCode varChar(10) not null,
 customerId int,
  salesPersonId int,
  storeId int,
   dateOfInvoice varchar(10) not null default "0000-00-00",
  foreign key (customerId) references Person(personId),
 foreign key (salesPersonId) references Person(personId),
 foreign key (storeId) references Store(storeId)
);
create table Address(
addressId int not null primary key auto_increment,
street varchar(100) not null,
city varchar(100) not null,
state varchar(20) not null,
zip varchar(6) not null,
country varchar(20) not null,
storeId int,
personId int,
 foreign key (personId) references Person(personId),
 foreign key (storeId) references Store(storeId)
);
create table Email(
emailId int not null primary key auto_increment,
email varchar(50) not null,
personId int,
 foreign key (personId) references Person(personId)
);
create table Item(
ItemId int not null primary key auto_increment,
itemCode varChar(10) not null,
itemType varChar(1) not null,
itemName varChar(30),
productUnit varChar(30),
productQuantity double default 0,
productPrice double default 0,
leasePrice double default 0,
purchasePrice double default 0,
serviceHours double default 0,
serviceHourlyRate double default 0,
date1 varchar(10),
date2 varchar(10),
model varChar(30) ,
equipmentType varChar(1),
 invoiceId int,
 foreign key (invoiceId) references Invoice(invoiceId),
 constraint UC_Item unique (invoiceId,itemCode)
);

insert into Store(storeId,storeCode) values (1,"a6i1p8");
insert into Store(storeId,storeCode) values (2,"k3e3s4");
insert into Store(storeId,storeCode) values (3,"r4b8k1");
insert into Store(storeId,storeCode) values (4,"l7g8a3");
insert into Store(storeId,storeCode) values (5,"r4b8k1");

insert into Person(personId,firstName,lastName,personCode) values (1,"Howard","Shepard","s7u2j4");
insert into Person(personId,firstName,lastName,personCode) values (2,"Ethan","Dudley","l7i1r1");
insert into Person(personId,firstName,lastName,personCode) values (3,"Kevin","Briggs","y3c0c1");
insert into Person(personId,firstName,lastName,personCode) values (4,"Wesley","Britt","t8z5z2");
insert into Person(personId,firstName,lastName,personCode) values (5,"Xander","Hobbs","s1w6y1");
insert into Person(personId,firstName,lastName,personCode) values (6,"Chaney","Beasley","j8b9m0");
insert into Person(personId,firstName,lastName,personCode) values (7,"Claire","Raymond","l1x1g8");
insert into Person(personId,firstName,lastName,personCode) values (8,"Cherokee","Casey","v5x1l8");

insert into Invoice(invoiceId,invoiceCode, storeId, customerId, salesPersonId, dateOfInvoice) values (1,"INV001",1,3,7,"2022-11-29");
insert into Invoice(invoiceId,invoiceCode, storeId,customerId, salesPersonId, dateOfInvoice) values (2,"INV002",2,4,7,"2022-11-25");
insert into Invoice(invoiceId,invoiceCode, storeId,customerId, salesPersonId, dateOfInvoice) values (3,"INV003",3,5,8,"2022-11-17");
insert into Invoice(invoiceId,invoiceCode, storeId,customerId, salesPersonId, dateOfInvoice) values (4,"INV004",4,6,8,"2022-10-30");


insert into Address(addressId,street,city,state,zip,country,personId) values (1,"320-4473 Suspendisse Ave","Richmond","Virginia","30617","US",1);
insert into Address(addressId,street,city,state,zip,country,personId) values (2,"929-8499 Amet St.","Davenport","Iowa","35617","US",2);
insert into Address(addressId,street,city,state,zip,country,personId) values (3,"447-540 Sed Rd.","Kaneohe","HI","33234","US",3);
insert into Address(addressId,street,city,state,zip,country,personId) values (4,"292-4982 Mauris Rd.","Columbia","MD","28948","US",4);
insert into Address(addressId,street,city,state,zip,country,personId) values (5,"4606 Euismod Road","Seattle","WA","27517","US",5);
insert into Address(addressId,street,city,state,zip,country,personId) values (6,"976 Diam Av","Idaho Falls","Idaho","72270","US",6);
insert into Address(addressId,street,city,state,zip,country,personId) values (7,"547-6363 Nec Street","Grand Island","NE","97716","US",7);
insert into Address(addressId,street,city,state,zip,country,personId) values (8,"Ap #682-9440 Sed Road","Olathe","KS","31557","US",8);
insert into Address(addressId,street,city,state,zip,country,storeId) values (9,"7400 E HIGHWAY 30","FREMONT","NE","68025","US",1);
insert into Address(addressId,street,city,state,zip,country,storeId) values (10,"2100 GLENWOOD AVE","PAPILLION","NE","68046", "US",2);
insert into Address(addressId,street,city,state,zip,country,storeId) values (11,"9500 GILES RD","LA VISTA","NE","68128","US",3);
insert into Address(addressId,street,city,state,zip,country,storeId) values (12,"17501 W CENTER RD","OMAHA","NE","68130","US",4);
insert into Address(addressId,street,city,state,zip,country,storeId) values (13,"7301 N 59TH ST","OMAHA","NE","68152","US",5);

insert into Email(emailId,email,personId) values (1, "howard-shepard@aol.net",1);
insert into Email(emailId,email,personId) values (2, "shepard-howard5444@outlook.ca",1);
insert into Email(emailId,email,personId) values (3, "d_ethan@protonmail.couk",2);
insert into Email(emailId,email,personId) values (4, "ethandudley@protonmail.couk",2);
insert into Email(emailId,email,personId) values (5, "kevinbriggs@outlook.org",3);
insert into Email(emailId,email,personId) values (6, "kevin-briggs@protonmail.edu",3);
insert into Email(emailId,email,personId) values (7, ",b-wesley3211@icloud.com",4);
insert into Email(emailId,email,personId) values (8, "britt.wesley@yahoo.ca",4);
insert into Email(emailId,email,personId) values (9, "xanderhobbs1032@protonmail.com",5);
insert into Email(emailId,email,personId) values (10, "h_xander4708@hotmail.ca",5);
insert into Email(emailId,email,personId) values (11, "beasley-chaney6903@yahoo.edu",6);
insert into Email(emailId,email,personId) values (12, "b.chaney@google.net",6);
insert into Email(emailId,email,personId) values (13, "rclaire3144@aol.com",7);
insert into Email(emailId,email,personId) values (14, "claireraymond@aol.couk",7);
insert into Email(emailId,email,personId) values (15, "c.casey@yahoo.edu",8);
insert into Email(emailId,email,personId) values (16, "cherokee-casey9069@google.org",8);


insert into Item(itemId, itemCode, itemType, equipmentType, itemName, model,purchasePrice, invoiceId) values(1,"qf3j64f","E","P", "Tractor","Tractor5000",25000,1);
insert into Item(itemId, itemCode, itemType,itemName, serviceHours, serviceHourlyRate,invoiceId) values(2,"wq7p59d","S","Plowing",2,48.00,1);
insert into Item(itemId, itemCode, itemType, equipmentType, itemName, model,purchasePrice, invoiceId) values(3,"hg4v28a","E","P","Truck", "F250",25000,4);
insert into Item(itemId, itemCode, itemType, itemName, productUnit,productQuantity, productPrice,invoiceId) values(4,"kn3b281","P", "Fertilizer", "Bag", 17,9,3);
insert into Item(itemId, itemCode, itemType,equipmentType,date1,date2, itemName, model,leasePrice,invoiceId) values(5,"nl4m41d","E", "L", "2022-11-12", "2022-11-26", "Baler", "Superbaler", 200,1);
insert into Item(itemId, itemCode, itemType, equipmentType, itemName, model) values(6,"mu2l87m","E", "P","Truck","F150");
insert into Item(itemId, itemCode, itemType, itemName, productUnit,productQuantity, productPrice,invoiceId) values(7,"nj3t02a","P", "Seed","Bag", 10,11.0,2);
insert into Item(itemId, itemCode, itemType, itemName, productUnit,productPrice) values(8,"vw2l191","P","Feed", "Bag",6.00);
insert into Item(itemId, itemCode, itemType,itemName, serviceHours, serviceHourlyRate,invoiceId) values(9,"xz8r73q","S", "Driving",4,52.0,4);
insert into Item(itemId, itemCode, itemType, itemName, productUnit,productQuantity, productPrice,invoiceId) values(10,"ln4k266","P", "Cattle","Cow",2,700.0,2);
insert into Item(itemId, itemCode, itemType, equipmentType, itemName, model,purchasePrice, invoiceId) values(11,"nf1t88zl","E","P","Harvester","Harvester250",30000,3);
insert into Item(itemId, itemCode, itemType, equipmentType, itemName, model,purchasePrice, invoiceId) values(12,"wv1c17a","E","P","Tractor","Tractor280",28000,3);
insert into Item(itemId, itemCode, itemType,itemName, serviceHourlyRate) values(13,"xk6v88d","S","Delivery",44.0);


