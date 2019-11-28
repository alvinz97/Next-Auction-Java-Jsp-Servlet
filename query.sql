CREATE TABLE user (
	uId varchar(50) not null,
    uName varchar(100),
    uMail varchar(100),
    uPass varchar(100),
    uR_Pass varchar(100),
    
    CONSTRAINT user_pk PRIMARY KEY(uId)
);

INSERT INTO user (uId, uName, uMail, uPass, uR_Pass) VALUES ("E3001", "admin", "admin@gmail.com", "admin", "admin");

 CREATE TABLE item(
	itemNo varchar(10) not null ,
	title varchar(50),
	category varchar(50),
	condition_ varchar(50),
	brand varchar(50),
	color varchar(50),
	startDate varchar(20),
	endDate varchar(20),
	startPrice varchar(20),
	buyPrice varchar(20),
	reservePrice varchar(20),
	desc_ varchar(1000),
				
	primary key(itemNo)
);
            
CREATE TABLE category(
           
	catNo varchar(50) not null,
	catName varchar(100),
	subName varchar(100),
			    
	primary key(catNo)
);

CREATE TABLE payment (
	id varchar(50) not null,
    cardNo varchar(20),
    cusName varchar(40),
    expiryDate varchar(20),
    cvv varchar(4),
    email varchar(100),
    amount varchar(1000),
    phone varchar(20),
    
    PRIMARY KEY(id)
);
      
select * from category;
select * from item;
select * from user;
select * from payment;

delete from user;
delete from item;

drop table item;
drop table category;
drop table user;
drop table payment;