<cfset SessionClass=createObject('component',"CS491-RDE.components.SessionTools")/>
<cfset SessionClass.checkIfLoggedIn()/>
<cfset tableName='NJSection3B'/>
<cfset subformClass=createObject('component','CS491-RDE.components.Subform').init('NJ',session.userID,tableName)/>
<cfset subformClass.noAccessRedirect('/CS491-RDE/home.cfm')/>
<!-- Application Page pre-processing -->
<cfset subformClass.createSubformData()/>

<!DOCTYPE html>
<html lang="en">
<head>
  	<title>Application</title>
  	<cfinclude template="../head.cfm"/>
</head>
<body>
<cfinclude template="../navbar.cfm">
<div class="container">
	<h3>Progress</h3>
	<div class="progress">
		<div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width:80%">
			Page 4 of 5
		</div>
	</div>

	<!--<strong>APPLICATION FOR PARTICIPATION IN THE AIDS DRUG DISTRIBUTION PROGRAM AND/OR HEALTH INSURANCE CONTINUATION PROGRAM (Continued)</strong>-->

	<div class="well text-center"><h4>Section 3 - INSURANCE STATUS, CONTINUED</h4></div>

	<form  action="../scripts/NJScript.cfm" method="POST">
  <input type="text" hidden="true" id="formPage" name="formPage" value="page3B">
  <input type="text" hidden="true" id="tableName" name="tableName" value="<cfoutput>#tableName#</cfoutput>">
  	<strong>Are you apply or having applied for Social Security Income(SSI) or Social Security Income(SSDI)?</strong>
	<div class="row">
		<div class="col-sm-4"><div class="form-group">
			<input type="checkbox" name="YesSSI" value="YesSSI"/> Yes for SSI 
		</div></div>
		<div class="col-sm-4"><div class="form-group">
			<input type="checkbox" name="YesSSDI" value="YesSSDI"/> Yes for SSDI
		</div></div>
		<div class="col-sm-4"><div class="form-group">
			<input type="checkbox" name="NoASSISSDI" value="NoASSISSDI"/> No
		</div></div>
		<div class="col-sm-4"><div class="form-group">
			<input type="checkbox" name="UASSISSDI" value="UASSISSDI"/> Don't know
		</div></div>
	</div>

	<div class="row">
		<label class="col-sm-4">a. If yes, when did you apply for SSI/SSDI?</label>
		<div class="col-sm-5">
			<input type="date" class="form-control" id="SSI_SSDIDate" name="SSI_SSDIDate">
		</div>
		<div class="checkbox col-sm-3">
			<label><input type="checkbox" name="SSI_SSDIDate" value="Unsure"/>Unsure</label>
		</div>
	</div>

	<div class="form-group">
		<label>b. Have you received a response?</label>
		<br/>
		<label class="radio-inline"><input type="radio" name="SSI_SSDIResponse" value="Yes"/>Yes</label>
		<label class="radio-inline"><input type="radio" name="SSI_SSDIResponse" value="No"/>No</label>
	</div>

	<hr/>

	<div class="form-group">
		<label>29. Are you applying or have you applied for insurance through the health Insurance Reform Act (Marketplace/Exchange)?</label>
		<br/>
		<label class="radio-inline"><input type="radio" name="IRA" value="Yes"/>Yes</label>
		<label class="radio-inline"><input type="radio" name="IRA" value="No"/>No</label>
		<label class="radio-inline"><input type="radio" name="IRA" value="Don't Know"/>Don't Know</label>
	</div>

	<div class="row">
		<label class="col-sm-4">a. If yes, when did you apply?</label>
		<div class="col-sm-5">
			<input type="date" class="form-control" id="IRADate" name="IRADate">
		</div>
		<div class="checkbox col-sm-3">
			<label><input type="checkbox" name="IRADate" value="Unsure"/>Unsure</label>
		</div>
	</div>

	<div class="form-group">
		<label>b. Have you received a response?</label>
		<br/>
		<label class="radio-inline"><input type="radio" name="IRAResponse" value="Yes"/>Yes</label>
		<label class="radio-inline"><input type="radio" name="IRAResponse" value="No"/>No</label>
	</div>

	<hr/>

	<strong><em>NOTE: You MUST include a photocopy of the FRONT and BACK of your insurance card(s)/prescription card(s).</em></strong>

	<hr/>

	<div class="form-group">
		<strong>Type of Coverage(Check all that apply):</strong>
		<br/>
		<label class="checkbox-inline"><input type="checkbox" name="coverage" value="MP"/>Medical Plan</label>
		<label class="checkbox-inline"><input type="checkbox" name="coverage" value="PP"/>Prescription Plan</label>
		<label class="checkbox-inline"><input type="checkbox" name="coverage" value="PP"/>Other (Specify)</label>
	  	<input type="text" class="form-control" name="Other"/><br>
	</div>

	<div class="row">
		<div class="col-sm-6">
			<strong>30. Private Health Insurance</strong><br><br>
			Insurance Carrier:
			<input type="" class="form-control" name="IC"/><br>
			Address:
			<textarea type="" class="form-control" name="A"></textarea><br>
			Telephone Number:
			<input type="" class="form-control" name="TN"/><br>
			Policy Number:
			<input type="" class="form-control" name="PN"/><br>
			If provided by Union or Employer:<br>
			Employer/Union Name:
			<input type="" class="form-control" name="EUN"/><br>
			Address:
			<textarea type="" class="form-control" name="A"></textarea>
		</div>

		<div class="col-sm-6">
			<strong>31. Prescription Coverage</strong><br><br>
			Insurance Carrier:
			<input type="" class="form-control" name="IC"/><br>
			Address:
			<textarea type="" class="form-control" name="A"></textarea><br>
			Telephone Number:
			<input type="" class="form-control" name="TN"/><br>
			ID Number:
			<input type="" class="form-control" name="IDN"/><br>
			What is the Co-Pay Amount?
			<input type="number" class="form-control" id="CoPay" name="CoPay"/>
			What is the Deductible?
			<input type="number" class="form-control" id="Deductible" name="Deductible"/>
		</div>
	</div>

	<hr/>

	<div class="form-group">
		<strong>Identify your relationship to the insured: </strong>
		<br/>
		<label class="radio-inline"><input type="radio" name="relationship" value="Self"/>Self</label>
		<label class="radio-inline"><input type="radio" name="relationship" value="Spouse/Partner"/>Spouse/Partner</label>
		<label class="radio-inline"><input type="radio" name="relationship" value="Child"/>Child</label>
		<label class="radio-inline"><input type="radio" name="relationship"/>Other (Specify)</label>
		<input type="text" class="form-control" name="relationship"/>
		<label for="nameInsured">Name of Insured</label>
		<input type="text" class="form-control" name="nameInsured"/>
		<label for="addressInsured">Street Address, City, State, Zip:</label>
		<textarea type="text" class="form-control" name="addressInsured"></textarea>
		<label for="countyInsured">County:</label>
		<input type="text" class="form-control" name="countyInsured"/>
		<label for="SSNInsured">Social Security Number:</label>
		<input type="text" class="form-control" name="SSNInsured"/>
		<label for="telephoneInsured">Telephone Number</label>
		<input type="tel" class="form-control" name="telephoneInsured"/>
	</div>

	<hr/>

	<div class="form-group">
		<strong>32. a. Are you eligible for Veterans Administration prescription drug benefits?</strong>
		<br/>
		<label class="radio-inline"><input type="radio" name="VAPDB" value="Y"/>Yes</label>
		<label class="radio-inline"><input type="radio" name="VAPDB" value="N"/>No</label>
		<br/>
		<strong>b. Are you currently receiving prescription drug benefits?</strong>
		<br/>
		<label class="radio-inline"><input type="radio" name="Y" value="Y"/>Yes</label>
		<label class="radio-inline"><input type="radio" name="N" value="N"/>No</label>
	</div>
	<button type="submit" class="btn btn-default" name="previous" value="prevous">previous</button>
	<button type="submit" class="btn btn-default" name="next" value="next">next</button>
	</form>

	<hr/>

	<strong><em>NOTE: You MUST include a photocopy of the FRONT and BACK of your insurance card(s)/prescription card(s)
	and any notice from your Insurance Company regarding Medicare Part D.
	</em></strong>
</div>
</body>
</html>
