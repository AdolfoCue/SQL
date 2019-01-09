/* BRANCH TBL CREATIONS */

CREATE TABLE tblLibraryBranch (
	clmBranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	clmBranchName VARCHAR(30) , 
	clmBranchAddress VARCHAR(50) ,
	
);


CREATE TABLE tblPublisher  (
	clmPublisherName KEY VARCHAR(30) PRIMARY NOT NULL,
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
	(clmBranchName)
	VALUES
	('Sharpstown'),
	('Central'),
	('Hialeah'),
	('Miami Lakes');

INSERT INTO tblLibraryBranch
	(clmBranchAddress)
	VALUES
	('123 N 1st st'),
	('789 E 6th st'),
	('621 NE 5th st'),
	('159 SE 6th st');


INSERT INTO tblPublisher	
	(clmPublisherName)
	VALUES 
	('Clear House'),
	('Industry'),
	('Hamilton'),
	('Wash Post');

INSERT INTO tblPublisher
	(clmAddress)
	VALUES
	('')

INSERT tblPublisher
	(clmPhone)
	('')


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
	clmDateOut)
	VALUES
	('5/6/15'),
	('9/1/14'),
	('10/12/12'),
	('11/13/12'),
	('1/18/18'),
	('1/22/18'),
	('1/17/16'),
	('4/16/16'),
	('12/15/15'),
	('6/19/18'),
	('5/7/15'),
	('9/2/14'),
	('10/11/12'),
	('11/12/12'),
	('1/17/18'),
	('1/21/18'),
	('1/19/16'),
	('4/17/16'),
	('12/16/15');

	
INSERT INTO tblBookLoans (
	clmDateDue)
	VALUES
	('6/10/18'),
	('10/16/18'),
	('9/1/18'),
	('5/4/18'),
	('3/2/11'),
	('7/15/15'),
	('9/9/18'),
	('9/3/14'),
	('10/17/12'),
	('11/12/12'),
	('1/19/18'),
	('1/26/18'),
	('1/10/16'),
	('4/18/16'),
	('12/10/15'),
	('6/12/18'),
	('5/19/15'),
	('9/18/14'),
	('10/22/12'),
	('11/18/12'),
	('1/10/18'),
	('1/25/18'),
	('1/29/16'),
	('4/30/16'),
	('12/31/15'),
	('6/30/18'),
	('10/19/18'),
	('9/11/18'),
	('5/14/18'),
	('3/16/11'),
	('7/18/15');


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
	(clmAddress)
	VALUES
	('11 S St Andrews st'),
	('769 W 81st st'),
	('112 e 55th st'),
	('North Andrews'),
	('1 West 59 st'),
	('89 sw 65th ave'),
	('901 55th st'),
	('6533 n Foreign Ave');

INSERT INTO tblBorrower
	(clmPhone)
	VALUES
	('502-112-5896'),
	('596-392-6820'),
	('328-294-9703'),
	('289-693-2039'),
	('674-582-8935'),
	('901-462-3523'),
	('245-352-9685'),
	('895-384-7834');

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
