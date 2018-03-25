use [RDESystems]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('ValidatePassword'))
   DROP PROCEDURE ValidatePassword; 
GO

CREATE PROCEDURE dbo.ValidatePassword 
    @userID int,
    @planPass varchar(100),
    @result int OUTPUT 
AS
    DECLARE @hashedPassInput BINARY(64);
    DECLARE @userPass BINARY(64)
    SET @hashedPassInput=HASHBYTES('sha2_512', @planPass);
    SET @userPass= (SELECT password FROM [User] WHERE userID=@userID);
    IF (@hashedPassInput= @userPass)
        SET @result=1;
    ELSE
        SET @result=0;
GO