/*********************************************************************/
/*Removes NJ Form Tables*/
/********************************************************************/
/*replace first line with USE[DatabaseName]*/ 
USE [RDESystems];
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
	DROP TABLE NJSection1;
	PRINT 'DROPPED "NJSection2" Table';
END
ELSE
	PRINT '"NJSection2" does not exist in database';
-----------------------------------------------------------------------------------
IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_NAME=N'NJSection2')
BEGIN
	DROP TABLE NJSection1;
	PRINT 'DROPPED "NJSection3A" Table';
END
ELSE
	PRINT '"NJSection3A" does not exist in database';
-----------------------------------------------------------------------------------
IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_NAME=N'NJSection2')
BEGIN
	DROP TABLE NJSection1;
	PRINT 'DROPPED "NJSection3B" Table';
END
ELSE
	PRINT '"NJSection3B" does not exist in database';
-----------------------------------------------------------------------------------
PRINT 'Successfully Removed NJ Form Table';
