DROP TABLE ITEMCATEGORY;
DROP TABLE AUCTIONITEM;
DROP TABLE BID;
DROP TABLE BIDDER;
DROP TABLE SELLER;
DROP TABLE AUCTIONUSER;

DROP VIEW bidBelow100;
DROP VIEW electronicCategory;
DROP VIEW user_age_greater_23;

CREATE TABLE AUCTIONUSER (
    UserName VARCHAR2(30) NOT NULL,
    UserID int NOT NULL,
    EmailAddress VARCHAR2(255) NOT NULL,
    PhoneNumber VARCHAR2(10),
    Password VARCHAR2(32) NOT NULL,
    HomeAddress VARCHAR2(40),
    Gender VARCHAR2(10),
    Age int NOT NULL,
    CONSTRAINT aucusr_uid_pk PRIMARY KEY (UserID)
    
);

CREATE TABLE Seller (
    sellerID int NOT NULL, 
    DepositInfo VARCHAR2(255) NOT NULL,
    UserID int NOT NULL,
    CONSTRAINT sell_sid_pk PRIMARY KEY (sellerID),
    CONSTRAINT sell_uid_fk FOREIGN KEY (UserID) REFERENCES AUCTIONUSER (UserID)
);

CREATE TABLE Bidder(
    BidderID int NOT NULL, 
    ShippingAddress VARCHAR(255) NOT NULL,
    PaymentInfo VARCHAR(255) NOT NULL,
    UserID int NOT NULL,
    CONSTRAINT bidder_bid_pk PRIMARY KEY (BidderID),
    CONSTRAINT bidder_uid_fk FOREIGN KEY (UserID) REFERENCES AUCTIONUSER (UserID)
);

CREATE TABLE Bid(
    Price DECIMAL(10,2) NOT NULL,
    BidID int NOT NULL,
    BidderID int NOT NULL, 
    Status char(1),
    SubmitTime timestamp,
    CONSTRAINT bid_id_pk PRIMARY KEY (BidID),
    CONSTRAINT bid_bidfk FOREIGN Key (BidderID) REFERENCES Bidder (BidderID)
);

CREATE TABLE AuctionItem( 
    AuctionItemID int NOT NULL,
    title VARCHAR2 (255) NOT NULL,
    Description VARCHAR2 (500)  NULL,
    StartPrice DECIMAL (10,2) NOT NULL, 
    EndPrice DECIMAL (10,2) NOT NULL, 
    StartTime DATE  NOT NULL, 
    EndTime DATE  NOT NULL,
    sellerID int NOT NULL, 
    BidID int NOT NULL, 
    CONSTRAINT auc_item_pk PRIMARY KEY (AuctionItemID),
    CONSTRAINT auc_sid_fk FOREIGN KEY (sellerID) REFERENCES seller (sellerID), 
    CONSTRAINT auc_bid_fk FOREIGN KEY (BidID) REFERENCES Bid (BidID)
);

CREATE TABLE ItemCategory(
    Categoryname VARCHAR2(32),
    CategoryId int NOT NULL,
    AuctionItemID int NOT NULL,
    CONSTRAINT cat_id_pk PRIMARY KEY (CategoryId),
    CONSTRAINT cat_aucid_fk FOREIGN Key (AuctionItemID) REFERENCES AuctionItem (AuctionItemID)
);

INSERT INTO AUCTIONUSER(USERNAME, USERID, EMAILADDRESS, PHONENUMBER, PASSWORD, HOMEADDRESS, GENDER, AGE) VALUES ('Sherry', '5', 'Sherry@ryerson.ca', '6479999999', 'sherryy', '66 Bishop Ave W', 'F', '20');
INSERT INTO AUCTIONUSER(USERNAME, USERID, EMAILADDRESS, PHONENUMBER, PASSWORD, HOMEADDRESS, GENDER, AGE) VALUES ('Tae', '2', 'tae@ryerson.ca', '6471231234', 'thisismapw', '1001 Blah Ave', 'M', '23');
INSERT INTO AUCTIONUSER(USERNAME, USERID, EMAILADDRESS, PHONENUMBER, PASSWORD, HOMEADDRESS, GENDER, AGE) VALUES ('Kevin', '1', 'tahn@ryerson.ca', '6471111111', '123456', '77 Finch Ave E', 'M', '25');
INSERT INTO AUCTIONUSER(USERNAME, USERID, EMAILADDRESS, PHONENUMBER, PASSWORD, HOMEADDRESS, GENDER, AGE) VALUES ('Kate', '3', 'hee@ryerson.ca', '4167777777', 'hello', '1 dundas Ave E', 'F', '25');
INSERT INTO AUCTIONUSER(USERNAME, USERID, EMAILADDRESS, PHONENUMBER, PASSWORD, HOMEADDRESS, GENDER, AGE) VALUES ('Tom', '4', 'tom@ryerson.ca', '4167778989', 'tomtom', '5 dundas Ave E', 'M', '24');
INSERT INTO AUCTIONUSER(USERNAME, USERID, EMAILADDRESS, PHONENUMBER, PASSWORD, HOMEADDRESS, GENDER, AGE) VALUES ('Sharon', '6', 'Sharon@ryerson.ca', '4161234567', 'ssharon', '25 Greenview Avenue', 'F', '22');
INSERT INTO AUCTIONUSER(USERNAME, USERID, EMAILADDRESS, PHONENUMBER, PASSWORD, HOMEADDRESS, GENDER, AGE) VALUES ('Nithash', '7', 'nithash.rajendram@ryerson.ca', '6475642871', 'nithash', '47 Yonge St W', 'M', '20');

INSERT INTO BIDDER(BIDDERID, SHIPPINGADDRESS, PAYMENTINFO, USERID) VALUES ('1', '5 dundas Ave E', 'paypal - 56789', '4');
INSERT INTO BIDDER(BIDDERID, SHIPPINGADDRESS, PAYMENTINFO, USERID) VALUES ('2', '66 Bishop Ave W', 'paypal - 34567', '5');
INSERT INTO BIDDER(BIDDERID, SHIPPINGADDRESS, PAYMENTINFO, USERID) VALUES ('3', '25 Greenview Avenue', 'paypal - 23456', '6');

INSERT INTO SELLER(SELLERID, DEPOSITINFO, USERID) VALUES ('1', 'TD Bank 003-56789', '1');
INSERT INTO SELLER(SELLERID, DEPOSITINFO, USERID) VALUES ('2', 'RBC 005-34567', '2');
INSERT INTO SELLER(SELLERID, DEPOSITINFO, USERID) VALUES ('3', 'CIBC 009-23456', '3');

INSERT INTO BID(PRICE, BIDID, BIDDERID, STATUS, SUBMITTIME) VALUES ('55', '5', '1', 'c', TO_TIMESTAMP('2020-10-09 12:46:39.808790900', 'YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO BID(PRICE, BIDID, BIDDERID, STATUS, SUBMITTIME) VALUES ('72', '2', '1', 'c', TO_TIMESTAMP('2020-10-10 12:46:52.970394100', 'YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO BID(PRICE, BIDID, BIDDERID, STATUS, SUBMITTIME) VALUES ('299', '6', '2', 'c', TO_TIMESTAMP('2020-10-07 12:46:56.150845500', 'YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO BID(PRICE, BIDID, BIDDERID, STATUS, SUBMITTIME) VALUES ('480', '8', '3', 'c', TO_TIMESTAMP('2020-10-06 12:47:00.744006500', 'YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO BID(PRICE, BIDID, BIDDERID, STATUS, SUBMITTIME) VALUES ('52', '1', '1', 'c', TO_TIMESTAMP('2020-10-17 12:47:07.551059700', 'YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO BID(PRICE, BIDID, BIDDERID, STATUS, SUBMITTIME) VALUES ('280', '3', '2', 'c', TO_TIMESTAMP('2020-10-17 13:47:11.189294400', 'YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO BID(PRICE, BIDID, BIDDERID, STATUS, SUBMITTIME) VALUES ('450', '7', '3', 'c', TO_TIMESTAMP('2020-10-24 14:47:15.284508600', 'YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO BID(PRICE, BIDID, BIDDERID, STATUS, SUBMITTIME) VALUES ('410', '4', '3', 'c', TO_TIMESTAMP('2020-10-18 10:47:26.406848700', 'YYYY-MM-DD HH24:MI:SS.FF'));

INSERT INTO AUCTIONITEM(AUCTIONITEMID, TITLE, DESCRIPTION, STARTPRICE, ENDPRICE, STARTTIME, ENDTIME, SELLERID, BIDID) VALUES ('1', 'bicycle', '1-year old bicycle for 10-15 years old kids', '150', '299', TO_DATE('2020-10-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-10-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1', '6');
INSERT INTO AUCTIONITEM(AUCTIONITEMID, TITLE, DESCRIPTION, STARTPRICE, ENDPRICE, STARTTIME, ENDTIME, SELLERID, BIDID) VALUES ('2', 'office desk', 'office desk for sale', '50', '55', TO_DATE('2020-10-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-10-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '2', '5');
INSERT INTO AUCTIONITEM(AUCTIONITEMID, TITLE, DESCRIPTION, STARTPRICE, ENDPRICE, STARTTIME, ENDTIME, SELLERID, BIDID) VALUES ('3', 'perfume', 'chanel perfume brand new', '60', '72', TO_DATE('2020-10-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-10-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '2', '2');
INSERT INTO AUCTIONITEM(AUCTIONITEMID, TITLE, DESCRIPTION, STARTPRICE, ENDPRICE, STARTTIME, ENDTIME, SELLERID, BIDID) VALUES ('4', 'HP laptop', '5 months old laptop - Core i5, 8GB RAM', '400', '480', TO_DATE('2020-10-09 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-10-19 14:49:01', 'YYYY-MM-DD HH24:MI:SS'), '3', '8');

INSERT INTO ITEMCATEGORY(CATEGORYNAME, CATEGORYID, AUCTIONITEMID) VALUES ('SPORTS', '1', '1');
INSERT INTO ITEMCATEGORY(CATEGORYNAME, CATEGORYID, AUCTIONITEMID) VALUES ('FURNITURE', '2', '2');
INSERT INTO ITEMCATEGORY(CATEGORYNAME, CATEGORYID, AUCTIONITEMID) VALUES ('ELECTRONICS', '3', '4');
INSERT INTO ITEMCATEGORY(CATEGORYNAME, CATEGORYID, AUCTIONITEMID) VALUES ('BEAUTY', '4', '3');


CREATE VIEW bidBelow100 AS
    (SELECT * FROM Bid WHERE Price < 100);

CREATE VIEW electronicCategory AS
    (SELECT *
    FROM ItemCategory
    WHERE CategoryID = 3);

CREATE VIEW user_age_greater_23 AS
    (SELECT * FROM AUCTIONUSER WHERE age > 23);
   

SELECT *
FROM AUCTIONUSER;

SELECT *
FROM BIDDER;

SELECT *
FROM SELLER;

SELECT *
FROM AUCTIONITEM
WHERE startprice >=100;

SELECT *
FROM AUCTIONITEM
WHERE (endprice - startprice) > 5;

SELECT *
FROM BID
WHERE price > 100
ORDER BY PRICE ASC;

SELECT USERNAME, EMAILADDRESS
FROM AUCTIONUSER;

SELECT CATEGORYNAME
FROM ITEMCATEGORY;

DESC AUCTIONUSER;
DESC Seller;
DESC Bid;
DESC AuctionItem;
DESC ItemCategory;
DESC Bidder;
