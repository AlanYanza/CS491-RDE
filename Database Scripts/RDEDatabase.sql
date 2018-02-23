/*********************************************************************/
/*Creates Initial Base RDE Database (without any Forms)
Note:There is a separate SQL script to add each Form
     See documentation ERD diagrams for Database Design
	 **Connect first to database that you wish to populate*/
/********************************************************************/

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
END
-----------------------------------------------------------------------------------
--Create Forms Table
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
			  WHERE TABLE_NAME=N'Forms')
BEGIN
	CREATE TABLE "Forms" (
		formTypeID int IDENTITY(1,1) PRIMARY KEY,
		state varchar(2) NOT NULL
	);
END
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
END
---------------------------------------------------------------------------------
--Create Message Table
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
			  WHERE TABLE_NAME=N'Message')
BEGIN
	CREATE TABLE "Message" (
		msgID int IDENTITY(1,1) PRIMARY KEY,
		sender varchar(100) NOT NULL,
		receipient varchar(255) NOT NULL,
		message varchar(1000),
		dateSent datetime NOT NULL 
	);
END
---------------------------------------------------------------------------------
--Create FormTables Table
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
			  WHERE TABLE_NAME=N'FormTables')
BEGIN
	CREATE TABLE "FormTables" (
		formTypeID int NOT NULL FOREIGN KEY REFERENCES "Forms"(formTypeID),
		tableName varchar(100) NOT NULL
	);
END
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
END
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
END
---------------------------------------------------------------------------------
--Create Sent Table
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
			  WHERE TABLE_NAME=N'Sent')
BEGIN
	CREATE TABLE "Sent" (
		username varchar(100) NOT NULL FOREIGN KEY REFERENCES "User"(username),
		msgID int NOT NULL FOREIGN KEY REFERENCES "Message"(msgID)
	);
END
---------------------------------------------------------------------------------
--Create Trash Table
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
			  WHERE TABLE_NAME=N'Trash')
BEGIN
	CREATE TABLE "Trash" (
		username varchar(100) NOT NULL FOREIGN KEY REFERENCES "User"(username),
		msgID int NOT NULL FOREIGN KEY REFERENCES "Message"(msgID)
	);
END
---------------------------------------------------------------------------------
--Create UserFormData Table
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
			  WHERE TABLE_NAME=N'UserFormData')
BEGIN
	CREATE TABLE "UserFormData" (
		appID int NOT NULL FOREIGN KEY REFERENCES "UserApplication"(appID),
		dataID int PRIMARY KEY
	);
END
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
END
---------------------------------------------------------------------------------
--Create Preparer Table
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
			  WHERE TABLE_NAME=N'Preparer')
BEGIN
	CREATE TABLE "Preparer" (
		dataID int NOT NULL FOREIGN KEY REFERENCES "UserFormData"(dataID),
		formTypeID int NOT NULL FOREIGN KEY REFERENCES "Forms"(formTypeID),
		FName varchar(100),
		MName varchar(100),
		LName varchar(100),
		phone varchar(16)
	);
END
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
		FName varchar(100),
		MName varchar(100),
		LName varchar(100),
		relation varchar(50),
		street varchar(50),
		city varchar(100),
		state varchar(2),
		zip varchar(12),
		HPhone varchar(16),
		WPhone varchar(16),
		CPhone varchar(16)
	);
END
---------------------------------------------------------------------------------
--Create CaseManager Table
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
			  WHERE TABLE_NAME=N'CaseManager')
BEGIN
	CREATE TABLE "CaseManager" (
		dataID int NOT NULL FOREIGN KEY REFERENCES "UserFormData"(dataID),
		formTypeID int NOT NULL FOREIGN KEY REFERENCES "Forms"(formTypeID),
		FName varchar(100),
		MName varchar(100),
		LName varchar(100),
		agency varchar(100),
		street varchar(50),
		city varchar(100),
		state varchar(2),
		zip varchar(12),
		WPhone varchar(16),
		FaxNum varchar(16),
		CPhone varchar(16),
		email varchar(100)
	);
END


