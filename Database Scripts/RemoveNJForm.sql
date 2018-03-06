/*********************************************************************/
/*Removes NJ Form Tables*/
/********************************************************************/
/*replace first line with USE[DatabaseName]*/ 
USE [RDESystems];
GO
PRINT 'Removing NJ Form Tables ....';
IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_NAME=N'NJSection1')
BEGIN
	DROP TABLE NJSection1;
	PRINT 'DROPPED "NJSection1" Table';
END
ELSE
	PRINT '"NJSection1" does not exist in database';
-----------------------------------------------------------------------------------
IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_NAME=N'NJSection2')
BEGIN
	DROP TABLE NJSection2;
	PRINT 'DROPPED "NJSection2" Table';
END
ELSE
	PRINT '"NJSection2" does not exist in database';
-----------------------------------------------------------------------------------
IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_NAME=N'NJSection3A')
BEGIN
	DROP TABLE NJSection3A;
	PRINT 'DROPPED "NJSection3A" Table';
END
ELSE
	PRINT '"NJSection3A" does not exist in database';
-----------------------------------------------------------------------------------
IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_NAME=N'NJSection3B')
BEGIN
	DROP TABLE NJSection3B;
	PRINT 'DROPPED "NJSection3B" Table';
END
ELSE
	PRINT '"NJSection3B" does not exist in database';
-----------------------------------------------------------------------------------
IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_NAME=N'NJSection4')
BEGIN
	DROP TABLE NJSection4;
	PRINT 'DROPPED "NJSection4" Table';
END
ELSE
	PRINT '"NJSection4" does not exist in database';
-----------------------------------------------------------------------------------
PRINT 'Successfully Removed NJ Form Table';
