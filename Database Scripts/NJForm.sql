/*********************************************************************/
/*Add the NJ Form to the Database
Tables:NJSection1
       NJSection2
	   NJSecion3A
	   NJSection3B*/
/********************************************************************/
--Check if Base Tables created using RDEDatabase.sql if not Do not attempt to create NJForm Tables
IF (NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME=N'Forms') AND 
	NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME=N'UserFormData') )
	PRINT 'ERROR: Mising Required Base Tables, Please Install Base Tables using RDEDatabase.sql and Retry';
ELSE
BEGIN
	PRINT 'Adding NJ Form Tables to Database....';
	--Insert NJ Form into Forms Table
	IF (NOT EXISTS(SELECT state FROM Forms WHERE state='NJ'))
	BEGIN
		INSERT INTO Forms (state) VALUES('NJ') 
	END

	--Retrieve FormTypeID of Form
	DECLARE @NJFORMID int;
	SET @NJFORMID = (SELECT formTypeID FROM FORMS where state='NJ');

	--Insert Form Tables into FormTables
	IF (NOT EXISTS(SELECT * FROM FormTables WHERE formTypeID=@NJFORMID AND tableName='NJSection1'))
		INSERT INTO FormTables(formTypeID,tableName) VALUES(@NJFORMID,'NJSection1');
	IF (NOT EXISTS(SELECT * FROM FormTables WHERE formTypeID=@NJFORMID AND tableName='NJSection2'))
		INSERT INTO FormTables(formTypeID,tableName) VALUES(@NJFORMID,'NJSection2');
	IF (NOT EXISTS(SELECT * FROM FormTables WHERE formTypeID=@NJFORMID AND tableName='NJSection3A'))
		INSERT INTO FormTables(formTypeID,tableName) VALUES(@NJFORMID,'NJSection3A'); 
	IF (NOT EXISTS(SELECT * FROM FormTables WHERE formTypeID=@NJFORMID AND tableName='NJSection3B'))
		INSERT INTO FormTables(formTypeID,tableName) VALUES(@NJFORMID,'NJSection3B');

	----------------------------------------------------------------------------------------------------
	--Create NJSection1 Table
	IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
				  WHERE TABLE_NAME=N'NJSection1')
	BEGIN
		CREATE TABLE "NJSection1" (
			dataID int NOT NULL FOREIGN KEY REFERENCES "UserFormData"(dataID),
			FName varchar(100) NOT NULL DEFAULT(''),
			MName varchar(100) NOT NULL DEFAULT(''),
			LName varchar(100) NOT NULL DEFAULT(''),
			gender varchar(3) CHECK(gender IN('M','F','TMF','TFM')),
			genderBirth char(1) CHECK(genderBirth IN('M','F')),
			SSNum varchar(15) NOT NULL DEFAULT(''),
			street varchar(50) NOT NULL DEFAULT(''),
			city varchar(50) NOT NULL DEFAULT(''),
			state varchar(2) NOT NULL DEFAULT(''),
			zip varchar(12) NOT NULL DEFAULT(''),
			county varchar(50) NOT NULL DEFAULT(''),
			HPhone varchar(16) NOT NULL DEFAULT(''),
			WPhone varchar(16) NOT NULL DEFAULT(''),
			CPhone varchar(16) NOT NULL DEFAULT(''),
			VMsgPerm char(1) CHECK(VMsgPerm IN('Y','N')),
			AltComPerm char(1) CHECK(AltComPerm IN('Y','N')),
			AddrRes char(1) CHECK(AddrRes IN('Y','N')),
			MStreet varchar(50) NOT NULL DEFAULT(''),
			MCity varchar(50) NOT NULL DEFAULT(''),
			MState varchar(2) NOT NULL DEFAULT(''),
			MZip varchar(12) NOT NULL DEFAULT(''),
			MCounty varchar(50) NOT NULL DEFAULT(''),
			USCitizen char(1) CHECK(USCitizen IN('Y','N')),
			veteran char(1) CHECK(veteran IN('Y','N')),
			RelStatus varchar(2) CHECK(RelStatus IN('S','M','C','DP','D','W','SP')),
			race varchar(2) CHECK(race IN('W','B','A','NH','U','AI')),
			asain char(1) CHECK(asain IN('AI','C','F','J','K','V','O')),
			NHPI varchar(2) CHECK(NHPI IN('NH','G','S','O')),
			preg char(1) CHECK(preg IN('Y','N')),
		);
	END

	----------------------------------------------------------------------------------------------------
	--Create NJSection2 Table
	IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
				  WHERE TABLE_NAME=N'NJSection2')
	BEGIN
		CREATE TABLE "NJSection2" (
			dataID int NOT NULL FOREIGN KEY REFERENCES "UserFormData"(dataID),
			EmplyStatus char(1) CHECK(EmplyStatus IN('F','P','N')),
			unableWork char(1) CHECK(unableWork IN('Y','N')),
			unable12LMonth char(1) CHECK(unable12LMonth IN('Y','N')),
			unable12MMonth char(1) CHECK(unable12MMonth IN('Y','N')),
			HPersonNum int,
			salary decimal(14,2),
			disBen decimal(14,2),
			genAssist decimal(14,2),
			unemploy decimal(14,2),
			socialSecurity decimal(14,2),
			pension decimal(14,2),
			allimony decimal(14,2),
			totalHIncome decimal(14,2),
			taxFile char(1) CHECK(taxFile IN('Y','N')),
			dependant char(1) CHECK(dependant IN('Y','N')),
			ApTANF char(1) CHECK(ApTANF IN('Y','N')),
			ApSAIF char(1) CHECK(ApSAIF IN('Y','N')),
			ApSSI char(1) CHECK(ApSSI IN('Y','N')),
			ApGA char(1) CHECK(ApGA IN('Y','N')),
			ApSNAP char(1) CHECK(ApSNAP IN('Y','N')),
			RcTANF char(1) CHECK(RcTANF IN('Y','N')),
			RcSAIF char(1) CHECK(RcSAIF IN('Y','N')),
			RcSSI char(1) CHECK(RcSSI IN('Y','N')),
			RcGA char(1) CHECK(RcGA IN('Y','N')),
			RcSNAP char(1) CHECK(RcSNAP IN('Y','N')),
		);
	END

	----------------------------------------------------------------------------------------------------
	--Create NJSection3A Table
	IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
				  WHERE TABLE_NAME=N'NJSection3A')
	BEGIN
		CREATE TABLE "NJSection3A" (
			dataID int NOT NULL FOREIGN KEY REFERENCES "UserFormData"(dataID),
			insured char(1) CHECK(insured IN('Y','N','U')),
			Medium char(1) CHECK(Medium IN('C','F','U','S')),
			EmpUnName varchar(100) NOT NULL DEFAULT(''),
			EmpUnAddrSt varchar(50) NOT NULL DEFAULT(''),
			EmpUnAddrCity varchar(50) NOT NULL DEFAULT(''),
			EmpUnAddrState varchar(2) NOT NULL DEFAULT(''),
			EmpUnAddrZip varchar(12) NOT NULL DEFAULT(''),
			EmpUnContact varchar(150) NOT NULL DEFAULT(''),
			EmpUnPhone varchar(16) NOT NULL DEFAULT(''),
			Medicaid char(1) CHECK(Medicaid IN('Y','N')),
			MedicareAB char(1) CHECK(MedicareAB IN('Y','N')),
			MedicareD char(1) CHECK(MedicareD IN('Y','N')),
			PrivateIns char(1) CHECK(PrivateIns IN('Y','N')),
			CHIP char(1) CHECK(CHIP IN('Y','N')),
			COBRA char(1) CHECK(COBRA IN('Y','N')),
			COBRAStart dateTime,
			COBRAEnd dateTime,
			NxtPremDue dateTime,
			Other varchar(50) NOT NULL default(''),
			PresCov char(1) CHECK(PresCov IN('Y','N','U')),
			PresCovCap char(1) CHECK(PresCovCap IN('Y','N','U')),
			PresCovCapAmt decimal(14,4),
			PresCovMail char(1) CHECK(PresCovMail IN('Y','N','P')),
			AMedicaid char(1) CHECK(AMedicaid IN('Y','N','U')),
			AMedicaidDate dateTime,
			UMedicaidDate char(1) CHECK(UMedicaidDate IN('Y','N')),
			RespMedicaid char(1) CHECK(RespMedicaid IN('Y','N')),
			AMedicare char(1) CHECK(AMedicare IN('Y','N','U')),
			AMedicareDate dateTime,
			UMedicareDate char(1) CHECK(UMedicareDate IN('Y','N')),
			RespMedicare char(1) CHECK(RespMedicare IN('Y','N')),
			AMedicareD char(1) CHECK(AMedicareD IN('Y','N','U')),
			ALIS char(1) CHECK(ALIS IN('Y','N','U')),
		);
	END

	----------------------------------------------------------------------------------------------------
	--Create NJSection3B Table
	IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES
				  WHERE TABLE_NAME=N'NJSection3B')
	BEGIN
		CREATE TABLE "NJSection3B" (
			dataID int NOT NULL FOREIGN KEY REFERENCES "UserFormData"(dataID),
			ASSISSDI char(1) CHECK(ASSISSDI IN('N','U')),
			YesSSI char(1) CHECK(YesSSI IN('Y','N')),
			YesSSDI char(1) CHECK(YesSSDI IN('Y','N')),
			ASSISSDIDate dateTime,
			UASSISSDIDate char(1) CHECK(UASSISSDIDate IN('Y','N')),
			RespASSISSI char(1) CHECK(RespASSISSI IN('Y','N')),
			AMarket char(1) CHECK(AMarket IN('Y','N')),
			AMarketDate dateTime,
			UMarketDate char(1) CHECK(UMarketDate IN('Y','N')),
			RespAMarket char(1) CHECK(RespAMarket IN('Y','N')),
			CovMed char(1) CHECK(CovMed IN('Y','N')),
			CovPres char(1) CHECK(CovPres IN('Y','N')),
			CovOther varchar(100) NOT NULL DEFAULT(''),
			relation char(1) CHECK(relation IN('S','P','C','O')),
			relOther varchar(50) NOT NULL DEFAULT(''),
			InsName varchar(100) NOT NULL DEFAULT(''),
			InsAddrSt varchar(50) NOT NULL DEFAULT(''),
			InsAddrCity varchar(50) NOT NULL DEFAULT(''),
			InsAddrState varchar(2) NOT NULL DEFAULT(''),
			InsAddrZip varchar(12) NOT NULL DEFAULT(''),
			InsAddrCounty varchar(50) NOT NULL DEFAULT(''),
			InsSS varchar(15) NOT NULL DEFAULT(''),
			InsPhone varchar(16) NOT NULL DEFAULT(''),
			InsCarrier varchar(100) NOT NULL DEFAULT(''),
			InsCarAddrSt varchar(50) NOT NULL DEFAULT(''),
			InsCarAddrCity varchar(50) NOT NULL DEFAULT(''),
			InsCarAddrState varchar(2) NOT NULL DEFAULT(''),
			InsCarAddrZip varchar(12) NOT NULL DEFAULT(''),
			InsCarPhone varchar(16) NOT NULL DEFAULT(''),
			InsCarPolicyNum varchar(50) NOT NULL DEFAULT(''),
			EmpUnName varchar(100) NOT NULL DEFAULT(''),
			EmpUnAddrSt varchar(50) NOT NULL DEFAULT(''),
			EmpUnAddrCity varchar(50) NOT NULL DEFAULT(''),
			EmpUnAddrState varchar(2) NOT NULL DEFAULT(''),
			EmpUnAddrZip varchar(12) NOT NULL DEFAULT(''),
			PresCar varchar(50) NOT NULL DEFAULT(''),
			PresCarAddrSt varchar(50) NOT NULL DEFAULT(''),
			PresCarAddrCity varchar(50) NOT NULL DEFAULT(''),
			PresCarAddrState varchar(2) NOT NULL DEFAULT(''),
			PresCarAddrZip varchar(12) NOT NULL DEFAULT(''),
			PresCarPhone varchar(16) NOT NULL DEFAULT(''),
			PresCarID varchar(50) NOT NULL DEFAULT(''),
			PresCoPay decimal(14,2),
			PresDeduct decimal(14,2),
			EligVetDrugBen char(1) CHECK(EligVetDrugBen IN('Y','N')),
			RecPresDrugBen char(1) CHECK(RecPresDrugBen IN('Y','N')),
		);
	END
	PRINT 'Successfully Added NJ Form Tables to Database';
END
