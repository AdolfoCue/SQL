/* BRANCH TBL CREATIONS */

CREATE TABLE tblLibraryBranch (
	clmBranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	clmBranchName VARCHAR(30) , 
	clmBranchAddress VARCHAR(50) ,
	
);


CREATE TABLE tblPublisher  (
	clmPublisherName VARCHAR(30) PRIMARY KEY NOT NULL,
	clmAddress VARCHAR (50),
	clmPhone VARCHAR(15),
);


CREATE TABLE tblBooks (
	clmBookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	clmTitle VARCHAR(30),
	clmPublisherName VARCHAR(30) FOREIGN KEY REFERENCES tblPublisher(clmPublisherName) NOT NULL, 
);


CREATE TABLE tblBookAuthors (
	clmAuthorName VARCHAR(30),
	clmBookID INT FOREIGN KEY REFERENCES tblBooks(clmBookID) NOT NULL,
);


CREATE TABLE tblBookCopies (
	clmBookID INT FOREIGN KEY REFERENCES tblBooks(clmBookID) NOT NULL,
	clmBranchID INT FOREIGN KEY REFERENCES tblLibraryBranch(clmBranchID) NOT NULL,
	clmNumberOfCopies INT
);


CREATE TABLE tblBookLoans (
	clmBookID INT FOREIGN KEY REFERENCES tblBooks(clmBookID) NOT NULL,
	clmBranchID INT FOREIGN KEY REFERENCES tblLibraryBranch(clmBranchID) NOT NULL,
	clmCardNo INT FOREIGN KEY REFERENCES tblBorrower(clmCardNo) NOT NULL,
	clmDateOut DATE,
	clmDateDue DATE,
);

CREATE TABLE tblBorrower (
	clmCardNo INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	clmName VARCHAR(30),
	clmAddress VARCHAR(50), 
	clmPhone VARCHAR(15)
);


/* INSERTS  */

INSERT INTO tblLibraryBranch
	(clmBranchName, clmBranchAddress)
	VALUES
	('Sharpstown', '123 N 1st st'),
	('Central', '789 E 6th st'),
	('Hialeah', '621 NE 5th st'),
	('Miami Lakes', '159 SE 6th st');


INSERT INTO tblPublisher	
	(clmPublisherName, clmAddress, clmPhone)
	VALUES 
	('Clear House', '689 NE 55TH ST', '789-473-9375'),
	('Industry', '2088 n 89TH ST', '395-472-8762'),
	('Hamilton', '2 N 65TH ST', '509-372-4872'),
	('Wash Post', '9 NW UGANDA ST', '507-592-8501');


INSERT INTO tblBooks	
	(clmTitle)
	VALUES
	('The Lost Tribe'),
	('How I won'),
	('Looks like Ugly Time'),
	('A wrinkle in Crime'),
	('Ms Confident Water'),
	('My Dog Roofio'),
	('By the way'),
	('Seven'),
	('Winchester the Great'),
	('She Is All Mine'),
	('I think I died'),
	('Grass Will Rule'),
	('Largest Organisms Ever'),
	('My Dad Writes Sometimes'),
	('The World Is Clay'),
	('Hello Heaven'),
	('The Marks Make Life Better'),
	('Why Wait?'),
	('Water Under the Fridge'),
	('Mac vs Mic');


INSERT INTO tblBookAuthors	
	(clmAuthorName)
	VALUES
	('Stephen King'),
	('Anton Lavey'),
	('Dr. Weiss'),
	('Tony Robbins'),
	('Mark Anthony'),
	('Madeline L''Engle'),
	('John Wayne'),
	('Max Calavera'),
	('Johnny Sins'),
	('Tera Patrick');

INSERT INTO tblBookCopies (
	clmNumberOfCopies)
	VALUES
	('10'),
	('10'),
	('6'),
	('8'),
	('6'),
	('2'),
	('9'),
	('8'),
	('6'),
	('6'),
	('10'),
	('10'),
	('6'),
	('8'),
	('6'),
	('2'),
	('9'),
	('8'),
	('6'),
	('6');



INSERT INTO tblBookLoans (
	clmDateOut, clmDateDue)
	VALUES
	('5/6/15', '6/10/18'),
	('9/1/14', '10/16/18'),
	('10/12/12','9/1/18'),
	('11/13/12', '5/4/18'),
	('1/18/18', '6/10/18'),
	('1/22/18', '10/16/18'),
	('1/17/16','9/1/14'),
	('4/16/16', '5/4/18'),
	('12/15/15', '9/1/14'),
	('6/19/18', '6/10/18'),
	('5/7/15', '5/4/18'),
	('9/2/14', '1/22/18'),
	('10/11/12', '5/6/15'),
	('11/12/12', '10/16/18'),
	('1/17/18', '11/12/12'),
	('1/21/18', '6/12/18'),
	('1/19/16', '1/26/18'),
	('4/17/16', '9/9/18'),
	('12/16/15', '4/18/16');
	('12/31/15', '6/30/18'),
	('12/31/15', '10/19/18'),
	('3/16/11', '10/19/18'),
	('7/18/15', '5/14/18'),
	('10/11/12', '5/6/15'),	
	('4/16/16', '5/4/18');
	

INSERT INTO tblBorrower
	(clmName)
	VALUES
	('John Jacob'),
	('Naheilam Jean'),
	('Rick Winchester'),
	('Amy Amethyst'),
	('Amelia Airheart'),
	('Ugandan Pearson'),
	('Pot Richee'),
	('Jack Milchen');

INSERT INTO tblBorrower
	(clmAddress, clmPhone)
	VALUES
	('11 S St Andrews st', '502-112-5896'),
	('769 W 81st st', '596-392-6820'),
	('112 e 55th st', '328-294-9703'),
	('North Andrews', '289-693-2039'),
	('1 West 59 st', '674-582-8935'),
	('89 sw 65th ave', '901-462-3523'),
	('901 55th st', '245-352-9685'),
	('6533 n Foreign Ave', '895-384-7834');


/* JOINS  */

SELECT * FROM tblLibraryBranch
	INNER JOIN tblBookLoans
	ON  tblLibraryBranch.clmBranchID = tblBookLoans.clmBranchID

SELECT * FROM tblPublisher
	INNER JOIN tblBooks
	ON tblPublisher.clmPublisherName = tblBooks.clmPublisherName

SELECT * FROM tblBooks
	INNER JOIN tblBookAuthors
	ON tblBooks.clmBookID = tblBookAuthors.clmBookID

SELECT * FROM tblBooks
	INNER JOIN tblBookLoans
	ON tblBooks.clmTitle = tblBookLoans.clmBookID

SELECT * FROM tblBooks
	INNER JOIN tblBookCopies
	ON tblBooks.clmBookID = tblBookCopies.clmBookID

SELECT * FROM tblBorrower
	INNER JOIN tblBookLoans
	ON tblBorrower.clmCardNo = tblBookLoans.clmCardNo


/* STORED PROC  */

GO
CREATE PROCEDURE
srchBookLostTribe (@clmBranchName AS VARCHAR(30))
AS 
BEGIN
	SELECT tblBooks.clmTitle
	FROM tblBooks
	INNER JOIN tblLibraryBranch
	ON tblLibraryBranch.clmBranchAddress = tblBooks.clmTitle
END


GO 
CREATE PROCEDURE
nmbrCopiesLostTribe (@clmBookID AS VARCHAR(30))
AS
BEGIN
	SELECT clmTitle
	FROM tblBooks
	INNER JOIN tblBookCopies
	ON tblBookCopies.clmBookID = tblBooks.clmTitle
	END


SELECT clmCardNo
	FROM tblBookLoans
	Where clmDateOut = NULL;



SELECT clmName, clmAddress, clmTitle, clmDateDue
	FROM tblBorrower, tblBooks, tblBookLoans
	WHERE clmDateDue = GETDATE()



SELECT clmBranchName, clmDateOut
	FROM tblLibraryBranch, tblBookLoans
	Where clmDateOut>NULL



SELECT clmName, clmAddress, clmDateOut
	FROM tblBorrower, tblBookLoans
	WHERE clmDateOut>Null
BEGIN
SELECT	Count(*)
	FROM tblBookLoans
	WHERE clmDateOut > NULL
END




SELECT clmTitle 
	FROM tblBooks
BEGIN
SELECT Count(*)
	FROM tblBookAuthors
	WHERE clmAuthorName = 'Stephen King' 
END
BEGIN
SELECT clmBranchName
	FROM tblLibraryBranch
	WHERE clmBranchName='Central'
END
