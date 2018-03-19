/*********************************************************************/
/*Creates Initial Base RDE Database (without any Forms)
Note:There is a separate SQL script to add each Form
     See documentation ERD diagrams for Database Design*/
/********************************************************************/
/*replace first line with USE[DatabaseName]*/
USE [RDESystemsLocal];
PRINT 'Creating Base Tables for RDE Form Application....';
--Create User1 Table
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_NAME=N'User')
BEGIN
	CREATE TABLE [User] (
		userID int PRIMARY KEY IDENTITY(1,1),
		email varchar(150) NOT NULL,
		FirstName varchar(150) NOT NULL,
		LastName varchar(150) NOT NULL,
		password binary(64) NOT NULL,
		accessLevel varchar(50) NOT NULL
		CHECK (accessLevel IN('user','admin'))
	);
	PRINT 'Successfully created "User" Table';
END
ELSE
	PRINT '"User" Table already exist';
-----------------------------------------------------------------------------------
--Create Forms Table
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
			  WHERE TABLE_NAME=N'Forms')
BEGIN
	CREATE TABLE [Forms] (
		formTypeID int IDENTITY(1,1) PRIMARY KEY,
		state varchar(2) NOT NULL
	);
	PRINT 'Successfully created "Forms" Table';
END
ELSE
	PRINT '"Forms" Table already exist';
-----------------------------------------------------------------------------------
--Create UserApplication Table
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
			  WHERE TABLE_NAME=N'UserApplication')
BEGIN
	CREATE TABLE [UserApplication] (
		userID int NOT NULL FOREIGN KEY REFERENCES [User](userID),
		appID int IDENTITY(1,1) PRIMARY KEY,
		formTypeID int NOT NULL FOREIGN KEY REFERENCES [Forms](formTypeID),
		HICPApp char(1) NOT NULL CHECK (HICPApp IN('Y','N')),
		dateEligDet date,
		status char(1) NOT NULL DEFAULT('R') CHECK (status IN('R','A','D','N','P'))
	);
	PRINT 'Successfully created "UserApplication" Table';
END
ELSE
	PRINT '"UserApplication" Table already exist';
---------------------------------------------------------------------------------
--Create Message Table
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
			  WHERE TABLE_NAME=N'Message')
BEGIN
	CREATE TABLE [Message] (
		msgID int IDENTITY(1,1) PRIMARY KEY,
		sender varchar(100) NOT NULL,
		receipient varchar(255) NOT NULL,
		subject varchar(100) NOT NULL DEFAULT(''),
		message varchar(1000) NOT NULL DEFAULT(''),
		dateSent datetime NOT NULL DEFAULT(getutcdate())
	);
	PRINT 'Successfully created "Message" Table';
END
ELSE
	PRINT '"Message" Table already exist';
---------------------------------------------------------------------------------
--Create FormTables Table
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
			  WHERE TABLE_NAME=N'FormTables')
BEGIN
	CREATE TABLE [FormTables] (
		formTypeID int NOT NULL FOREIGN KEY REFERENCES [Forms](formTypeID),
		tableName varchar(100) NOT NULL
	);
	PRINT 'Successfully created "FormTables" Table';
END
ELSE
	PRINT '"FormTables" Table already exist';
---------------------------------------------------------------------------------
--Create AppDocument Table
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
			  WHERE TABLE_NAME=N'AppDocument')
BEGIN
	CREATE TABLE [AppDocument] (
		appID int NOT NULL FOREIGN KEY REFERENCES [UserApplication](appID),
		document varchar(100) NOT NULL,
		isRequired char(1) NOT NULL CHECK (isRequired IN('Y','N')),
		received char(1) NOT NULL CHECK (received IN('Y','N')),
		dateReceived date
	);
	PRINT 'Successfully created "AppDocument" Table';
END
ELSE
	PRINT '"AppDocument" Table already exist';
---------------------------------------------------------------------------------
--Create Inbox Table
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
			  WHERE TABLE_NAME=N'Inbox')
BEGIN
	CREATE TABLE [Inbox] (
		userID int NOT NULL FOREIGN KEY REFERENCES [User](userID),
		dateRevc datetime NOT NULL,
		msgID int NOT NULL FOREIGN KEY REFERENCES [Message](msgID),
		readStatus char(1) NOT NULL CHECK (readStatus IN('Y','N'))
	);
	PRINT 'Successfully created "Inbox" Table';
END
ELSE
	PRINT '"Inbox" Table already exist';
---------------------------------------------------------------------------------
--Create Sent Table
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
			  WHERE TABLE_NAME=N'Sent')
BEGIN
	CREATE TABLE [Sent] (
		userID int NOT NULL FOREIGN KEY REFERENCES [User](userID),
		msgID int NOT NULL FOREIGN KEY REFERENCES [Message](msgID)
	);
	PRINT 'Successfully created "Sent" Table';
END
ELSE
	PRINT '"Sent" Table already exist';
---------------------------------------------------------------------------------
--Create Trash Table
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
			  WHERE TABLE_NAME=N'Trash')
BEGIN
	CREATE TABLE [Trash] (
		userID int NOT NULL FOREIGN KEY REFERENCES [User](userID),
		msgID int NOT NULL FOREIGN KEY REFERENCES [Message](msgID)
	);
	PRINT 'Successfully created "Trash" Table';
END
ELSE
	PRINT '"Trash" Table already exist';
---------------------------------------------------------------------------------
--Create UserFormData Table
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
			  WHERE TABLE_NAME=N'UserFormData')
BEGIN
	CREATE TABLE [UserFormData] (
		appID int NOT NULL FOREIGN KEY REFERENCES [UserApplication](appID),
		dataID int IDENTITY(1,1) PRIMARY KEY
	);
	PRINT 'Successfully created [UserFormData] Table';
END
ELSE
	PRINT '"UserFormData" Table already exist';
---------------------------------------------------------------------------------
PRINT 'Successfully created Base Tables for RDE Form Application';
