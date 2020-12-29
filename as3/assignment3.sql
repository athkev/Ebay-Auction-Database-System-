CREATE TABLE AUCTIONUSER (
    UserName VARCHAR2(30) NOT NULL,
    UserID int NOT NULL,
    EmailAddress VARCHAR2(255) NOT NULL,
    PhoneNumber VARCHAR2(10),
    Password VARCHAR2(32) NOT NULL,
    HomeAddress VARCHAR2(40),
    PRIMARY KEY (UserID)
);

CREATE TABLE Seller (
    sellerID int NOT NULL, 
    DepositInfo VARCHAR2(255) NOT NULL,
    PRIMARY KEY (sellerID),
    UserID int NOT NULL,
    FOREIGN KEY (UserID)
    REFERENCES AUCTIONUSER (UserID)
);

CREATE TABLE Bidder(
    BidderID int NOT NULL, 
    ShippingAddress VARCHAR(255) NOT NULL,
    PaymentInfo VARCHAR(255) NOT NULL,
    UserID int NOT NULL,
    PRIMARY KEY (BidderID),
    FOREIGN KEY (UserID)
    REFERENCES AUCTIONUSER (UserID)
);

CREATE TABLE Bid(
    Price DECIMAL(10,2) NOT NULL,
    BidID int NOT NULL,
    BidderID int NOT NULL, 
    Status char(1),
    ID int NOT NULL,
    SubmitTime timestamp,
    PRIMARY KEY (BidID),
    FOREIGN Key (BidderID)
    REFERENCES Bidder (BidderID)
);
CREATE TABLE AuctionItem( 
    AuctionItemID int NOT NULL PRIMARY KEY,
    title VARCHAR2 (255) NOT NULL,
    Description_ VARCHAR2 (500)  NULL,
    StartPrice DECIMAL (10,2) NOT NULL, 
    EndPrice DECIMAL (10,2) NOT NULL, 
    StartTime DATE  NOT NULL, 
    EndTime DATE  NOT NULL,
    sellerID int NOT NULL, 
    BidID int NOT NULL, 
    FOREIGN KEY (sellerID)
    REFERENCES seller (sellerID), 
    FOREIGN KEY (BidID)
    REFERENCES Bid (BidID)
);

CREATE TABLE ItemCategory(
    Categoryname VARCHAR2(32),
    CategoryId int NOT NULL,
    AuctionItemID int NOT NULL,
    PRIMARY KEY (CategoryId),
    FOREIGN Key (AuctionItemID)
    REFERENCES AuctionItem (AuctionItemID)
);

DESC AUCTIONUSER;
DESC Seller;
DESC Bidder;
DESC Bid;
DESC AuctionItem;
DESC ItemCategory;

