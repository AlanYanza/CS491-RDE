/*********************************************************************/
/*Creates Initial Base RDE Database (without any Forms)
Note:There is a separate SQL script to add each Form
     See documentation ERD diagrams for Database Design
	 **Connect first to database that you wish to populate*/
/********************************************************************/
PRINT 'Creating Base Tables for RDE Form Application....';
--Create User Table
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_NAME=N'User')
BEGIN
	CREATE TABLE "User" (
		username varchar(100) PRIMARY KEY,
		email varchar(150) NOT NULL,
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
	CREATE TABLE "Forms" (
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
	CREATE TABLE "UserApplication" (
		username varchar(100) NOT NULL FOREIGN KEY REFERENCES "User"(username),
		appID int IDENTITY(1,1) PRIMARY KEY,
		formTypeID int NOT NULL FOREIGN KEY REFERENCES "Forms"(formTypeID),
		HICPApp char(1) NOT NULL CHECK (HICPApp IN('Y','N')),
		dateEligDet datetime,
		status char(1) NOT NULL DEFAULT('R') CHECK (status IN('R','A','D','N'))
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
	CREATE TABLE "Message" (
		msgID int IDENTITY(1,1) PRIMARY KEY,
		sender varchar(100) NOT NULL,
		receipient varchar(255) NOT NULL,
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
	CREATE TABLE "FormTables" (
		formTypeID int NOT NULL FOREIGN KEY REFERENCES "Forms"(formTypeID),
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
	CREATE TABLE "AppDocument" (
		appID int NOT NULL FOREIGN KEY REFERENCES "UserApplication"(appID),
		document varchar(100) NOT NULL,
		isRequired char(1) NOT NULL CHECK (isRequired IN('Y','N')),
		received char(1) NOT NULL CHECK (received IN('Y','N'))
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
	CREATE TABLE "Inbox" (
		username varchar(100) NOT NULL FOREIGN KEY REFERENCES "User"(username),
		dateRevc datetime NOT NULL,
		msgID int NOT NULL FOREIGN KEY REFERENCES "Message"(msgID),
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
	CREATE TABLE "Sent" (
		username varchar(100) NOT NULL FOREIGN KEY REFERENCES "User"(username),
		msgID int NOT NULL FOREIGN KEY REFERENCES "Message"(msgID)
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
	CREATE TABLE "Trash" (
		username varchar(100) NOT NULL FOREIGN KEY REFERENCES "User"(username),
		msgID int NOT NULL FOREIGN KEY REFERENCES "Message"(msgID)
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
	CREATE TABLE "UserFormData" (
		appID int NOT NULL FOREIGN KEY REFERENCES "UserApplication"(appID),
		dataID int PRIMARY KEY
	);
	PRINT 'Successfully created "UserFormData" Table';
END
ELSE
	PRINT '"UserFormData" Table already exist';
---------------------------------------------------------------------------------
--Create Signature Table
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
			  WHERE TABLE_NAME=N'Signature')
BEGIN
	CREATE TABLE "Signature" (
		dataID int NOT NULL FOREIGN KEY REFERENCES "UserFormData"(dataID),
		formTypeID int NOT NULL FOREIGN KEY REFERENCES "Forms"(formTypeID),
		signature image,
		signatureDate datetime,
		spouseSig image,
		spouseSigDate datetime
	);
	PRINT 'Successfully created "Signature" Table';
END
ELSE
	PRINT '"Signature" Table already exist';
---------------------------------------------------------------------------------
--Create Preparer Table
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
			  WHERE TABLE_NAME=N'Preparer')
BEGIN
	CREATE TABLE "Preparer" (
		dataID int NOT NULL FOREIGN KEY REFERENCES "UserFormData"(dataID),
		formTypeID int NOT NULL FOREIGN KEY REFERENCES "Forms"(formTypeID),
		FName varchar(100) NOT NULL DEFAULT(''),
		MName varchar(100) NOT NULL DEFAULT(''),
		LName varchar(100) NOT NULL DEFAULT(''),
		phone varchar(16) NOT NULL DEFAULT('')
	);
	PRINT 'Successfully created "Preparer" Table';
END
ELSE
	PRINT '"Preparer" Table already exist';
---------------------------------------------------------------------------------
--Create ContactPerson Table
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
			  WHERE TABLE_NAME=N'ContactPerson')
BEGIN
	CREATE TABLE "ContactPerson" (
		dataID int NOT NULL FOREIGN KEY REFERENCES "UserFormData"(dataID),
		formTypeID int NOT NULL FOREIGN KEY REFERENCES "Forms"(formTypeID),
		perm char(1) CHECK (perm IN('Y','N')),
		HIVAware char(1) CHECK (HIVAware IN('Y','N')),
		FName varchar(100) NOT NULL DEFAULT(''),
		MName varchar(100) NOT NULL DEFAULT(''),
		LName varchar(100) NOT NULL DEFAULT(''),
		relation varchar(50) NOT NULL DEFAULT(''),
		street varchar(50) NOT NULL DEFAULT(''),
		city varchar(100) NOT NULL DEFAULT(''),
		state varchar(2) NOT NULL DEFAULT(''),
		zip varchar(12) NOT NULL DEFAULT(''),
		HPhone varchar(16) NOT NULL DEFAULT(''),
		WPhone varchar(16) NOT NULL DEFAULT(''),
		CPhone varchar(16) NOT NULL DEFAULT('')
	);
	PRINT 'Successfully created "ContactPerson" Table';
END
ELSE
	PRINT '"ContactPerson" Table already exist';
---------------------------------------------------------------------------------
--Create CaseManager Table
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
			  WHERE TABLE_NAME=N'CaseManager')
BEGIN
	CREATE TABLE "CaseManager" (
		dataID int NOT NULL FOREIGN KEY REFERENCES "UserFormData"(dataID),
		formTypeID int NOT NULL FOREIGN KEY REFERENCES "Forms"(formTypeID),
		FName varchar(100) NOT NULL DEFAULT(''),
		MName varchar(100) NOT NULL DEFAULT(''),
		LName varchar(100) NOT NULL DEFAULT(''),
		agency varchar(100) NOT NULL DEFAULT(''),
		street varchar(50) NOT NULL DEFAULT(''),
		city varchar(100) NOT NULL DEFAULT(''),
		state varchar(2) NOT NULL DEFAULT(''),
		zip varchar(12) NOT NULL DEFAULT(''),
		WPhone varchar(16) NOT NULL DEFAULT(''),
		FaxNum varchar(16) NOT NULL DEFAULT(''),
		CPhone varchar(16) NOT NULL DEFAULT(''),
		email varchar(100) NOT NULL DEFAULT('')
	);
	PRINT 'Successfully created "CaseManager" Table';
END
ELSE
	PRINT '"CaseManager" Table already exist';
---------------------------------------------------------------------------------
--Create OtherIncome Table
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
			  WHERE TABLE_NAME=N'OtherIncome')
BEGIN
	CREATE TABLE "OtherIncome" (
		dataID int NOT NULL FOREIGN KEY REFERENCES "UserFormData"(dataID),
		formTypeID int NOT NULL FOREIGN KEY REFERENCES "Forms"(formTypeID),
		incomeType varchar(50) NOT NULL DEFAULT(''),
		amount decimal(14,2) DEFAULT(0.00)
	);
	PRINT 'Successfully created "OtherIncome" Table';
END
ELSE
	PRINT '"OtherIncome" Table already exist';
PRINT 'Successfully created Base Tables for RDE Form Application';
