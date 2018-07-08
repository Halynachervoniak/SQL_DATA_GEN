-- ##################################
CREATE VIEW [dbo].[VW_Random] AS
SELECT RAND() Random

-- ----------------------------------
go 
select * from  [dbo].[VW_Random]

-- ####################################
go 
CREATE FUNCTION dbo.FN_Random
(@CharPoolLength INT = 0
)
RETURNS FLOAT
AS

BEGIN
DECLARE @Random FLOAT= 0;
IF @CharPoolLength > 1

BEGIN
WHILE @Random < 1.0 / @CharPoolLength
BEGIN
SELECT @Random = Random
FROM dbo.VW_Random;
END;
END;
ELSE
BEGIN
SELECT @Random = Random
FROM dbo.VW_Random;
END;
RETURN @Random;
END;

-- ---------------------------------------
go 
select * from dbo.FN_Random

-- #########################################

go
CREATE FUNCTION dbo.FN_WordGenerator
(
@Length INT, -- length of random word
@FirstCap BIT -- capitalization of first letter (1 for true)
)
RETURNS NVARCHAR(50)

AS

BEGIN
DECLARE @CapitalLettersPool NVARCHAR(50)= 'ABCDEFGHIJKLMNPQRSTUVWXYZ';
DECLARE @SmallLettersPool NVARCHAR(50)= 'abcdefghijkmnopqrstuvwxyz';
DECLARE @LoopCount INT= 0;
DECLARE @GeneratedString VARCHAR(50)= '';


IF @FirstCap = 1
BEGIN
SELECT @GeneratedString = @GeneratedString + SUBSTRING(@CapitalLettersPool,
CONVERT( INT, dbo.FN_Random(26) * LEN(@CapitalLettersPool)), 1);
SELECT @LoopCount = 1;
WHILE(@LoopCount < @Length)
BEGIN
SELECT @GeneratedString = @GeneratedString + SUBSTRING(@SmallLettersPool,
CONVERT( INT, dbo.FN_Random(26) * LEN(@SmallLettersPool)), 1);
SELECT @LoopCount = @LoopCount + 1;
END;
END;
ELSE

BEGIN
WHILE(@LoopCount < @Length)
BEGIN
SELECT @GeneratedString = @GeneratedString + SUBSTRING(@SmallLettersPool,
CONVERT( INT, dbo.FN_Random(26)*LEN(@SmallLettersPool)), 1);
SELECT @LoopCount = @LoopCount + 1;
END;
END;

RETURN @GeneratedString;
END;
-- -------------------------------------------
go
select dbo.FN_WordGenerator(100,1) as test;

-- ##############################################
go
CREATE FUNCTION [dbo].[FN_ComplexGenerator]
(
@Length INT,
@Type NVARCHAR(10)
)
RETURNS NVARCHAR(50)
AS
BEGIN
DECLARE @GeneratedString VARCHAR(50)= '';

IF @Type = 'name'

BEGIN
SELECT @GeneratedString = @GeneratedString + dbo.FN_WordGenerator(@length,1);
END;
/* IF @Type = &#39;email&#39;
BEGIN
SELECT @GeneratedString = @GeneratedString+dbo.FN_WordGenerator(@length,
0)+&#39;@ss.com&#39;;
END;
IF @Type = &#39;number&#39;
BEGIN
SELECT @GeneratedString = @GeneratedString +
dbo.FN_PhoneNumberGenerator(@Length);
END;
IF @Type = &#39;bit&#39;
BEGIN
SELECT @GeneratedString = ROUND(dbo.FN_Random(0), 0);
END; */
RETURN @GeneratedString;
END;
----------------------------------------------------
go
CREATE PROCEDURE dbo.STP_AddRandomCustomers(@Quantity INT)
AS
BEGIN
SET NOCOUNT ON;
DECLARE @LoopCount INT= 0;
WHILE @LoopCount < @Quantity
BEGIN
INSERT INTO dbo.products3
SELECT [dbo].[FN_ComplexGenerator](7, 'name'),[dbo].[FN_ComplexGenerator](10, 'name');
/*dbo.FN_ComplexGenerator(8, 'name'),
dbo.FN_ComplexGenerator(10, 'number'),
dbo.FN_ComplexGenerator(7, 'email'),
1,

dbo.FN_ComplexGenerator(1, 'bit'),
dbo.FN_DateGenerator('1950/01/01', '1999/12/31'),
0; */
SELECT @LoopCount = @LoopCount + 1;
END;
SET NOCOUNT OFF;
END;
-----------------------------------------------
go 
Drop PROCEDURE dbo.STP_AddRandomCustomers
================================================
go
exec dbo.STP_AddRandomCustomers 100