CREATE PROCEDURE dbo.CreateUserWithLogin
    @UserName NVARCHAR(255),   -- Input for the username
    @Password NVARCHAR(255)     -- Input for the password
AS
BEGIN
    SET NOCOUNT ON;  -- Prevent extra result sets from interfering with SELECT statements

    DECLARE @DatabaseName NVARCHAR(255) = 'NFL_SQL_DW';  -- Specify your database name here

    BEGIN TRY
        -- Create a login
        EXEC('CREATE LOGIN [' + @UserName + '] WITH PASSWORD = ''' + @Password + '''');

        -- Create a user in the specific database
        EXEC('USE [' + @DatabaseName + ']; CREATE USER [' + @UserName + '] FOR LOGIN [' + @UserName + '];');

        -- Grant necessary permissions in this database
        EXEC('USE [' + @DatabaseName + ']; ALTER ROLE db_datareader ADD MEMBER [' + @UserName + '];');

        PRINT 'User and login created successfully.';

    END TRY
    BEGIN CATCH
        PRINT 'Error occurred: ' + ERROR_MESSAGE();  -- Handle errors
    END CATCH
END;
GO
