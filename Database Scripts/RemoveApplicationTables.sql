/*********************************************************************/
/*Removes Base Tables
Note: Remove all Forms from Database bofore executing*/
/********************************************************************/
/*replace first line with USE[DatabaseName]*/ 
USE [RDESystems];
GO
PRINT 'Removing Base Tables....';
IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_NAME=N'AppDocument')
BEGIN
	DROP TABLE AppDocument;
	PRINT 'DROPPED "AppDocument" Table';
END
ELSE
	PRINT '"AppDocument" does not exist in database';
-----------------------------------------------------------------------------------
GO
IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_NAME=N'UserFormData')
BEGIN
	DROP TABLE UserFormData;
	PRINT 'DROPPED "UserFormData" Table';
END
ELSE
	PRINT '"UserFormData" does not exist in database';
-----------------------------------------------------------------------------------
IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_NAME=N'FormTables')
BEGIN
	DROP TABLE FormTables;
	PRINT 'DROPPED "FormTables" Table';
END
ELSE
	PRINT '"FormTables" does not exist in database';
-----------------------------------------------------------------------------------
IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_NAME=N'UserApplication')
BEGIN
	DROP TABLE UserApplication;
	PRINT 'DROPPED "UserApplication" Table';
END
ELSE
	PRINT '"UserApplication" does not exist in database';
-----------------------------------------------------------------------------------
IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_NAME=N'Sent')
BEGIN
	DROP TABLE Sent;
	PRINT 'DROPPED "Sent" Table';
END
ELSE
	PRINT '"Sent" does not exist in database';
-----------------------------------------------------------------------------------
IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_NAME=N'Trash')
BEGIN
	DROP TABLE Trash;
	PRINT 'DROPPED "Trash" Table';
END
ELSE
	PRINT '"Trash" does not exist in database';
-----------------------------------------------------------------------------------
IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_NAME=N'Inbox')
BEGIN
	DROP TABLE Inbox;
	PRINT 'DROPPED "Inbox" Table';
END
ELSE
	PRINT '"Inbox" does not exist in database';
-----------------------------------------------------------------------------------
IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_NAME=N'Message')
BEGIN
	DROP TABLE Message;
	PRINT 'DROPPED "Message" Table';
END
ELSE
	PRINT '"Message" does not exist in database';
-----------------------------------------------------------------------------------
IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_NAME=N'User')
BEGIN
	DROP TABLE [User];
	PRINT 'DROPPED "User" Table';
END
ELSE
	PRINT '"User" does not exist in database';
-----------------------------------------------------------------------------------
IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_NAME=N'ApplicationLinks')
BEGIN
	DROP TABLE ApplicationLinks;
	PRINT 'DROPPED "ApplicationLinks" Table';
END
ELSE
	PRINT '"ApplicationLinks" does not exist in database';
-----------------------------------------------------------------------------------
IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_NAME=N'Forms')
BEGIN
	DROP TABLE Forms;
	PRINT 'DROPPED "Forms" Table';
END
ELSE
	PRINT '"Forms" does not exist in database';
-----------------------------------------------------------------------------------
PRINT 'Successfully Removed Base Tables from Database';