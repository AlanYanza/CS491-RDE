<cfset SessionClass=createObject('component',"CS491-RDE.components.SessionTools")/>
<cfset SessionClass.checkIfLoggedIn()/>
<cfset tableName='NJSection3B'/>
<cfset subformClass=createObject('component','CS491-RDE.components.Subform').init('NJ',session.userID,tableName)/>
<cfset subformClass.noAccessRedirect('/CS491-RDE/home.cfm')/>
<!-- Application Page pre-processing -->
<cfset subformClass.createSubformData()/>
<cfset subformData=subformClass.retrieveDataFromSubform()/>

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
	<div>
		<label class="checkbox-inline"><input type="checkbox" name="YesSSI" value="Y"/>Yes for SSI</label>
		<label class="checkbox-inline"><input type="checkbox" name="YesSSDI" value="Y"/>Yes for SSDI</label>
		<label class="checkbox-inline"><input type="checkbox" name="NoSSISSDI" value="N"/>No</label>
		<label class="checkbox-inline"><input type="checkbox" name="USSISSDI" value="U"/>Don't know</label>
	</div>

	<div class="row">
		<label class="col-sm-4">a. If yes, when did you apply for SSI/SSDI?</label>
		<div class="col-sm-5">
			<input type="date" class="form-control" name="ASSI_SSDIDate" value="<cfoutput>#subformData.ASSISSDIDate#</cfoutput>">
		</div>
		<div class="checkbox col-sm-3">
			<label><input type="checkbox" name="ASSI_SSDIDate" value="Unsure"/>Unsure</label>
		</div>
	</div>

	<div class="form-group">
		<label>b. Have you received a response?</label>
		<br/>
		<label class="radio-inline"><input type="radio" name="RespSSI_SSI" value="Y"/>Yes</label>
		<label class="radio-inline"><input type="radio" name="RespSSI_SSI" value="N"/>No</label>
	</div>

	<hr/>

	<div class="form-group">
		<label>29. Are you applying or have you applied for insurance through the health Insurance Reform Act (Marketplace/Exchange)?</label>
		<br/>
		<label class="radio-inline"><input type="radio" name="AMarket" value="Y"/>Yes</label>
		<label class="radio-inline"><input type="radio" name="AMarket" value="N"/>No</label>
		<label class="radio-inline"><input type="radio" name="AMarket" value="Don't Know"/>Don't Know</label>
	</div>

	<div class="row">
		<label class="col-sm-4">a. If yes, when did you apply?</label>
		<div class="col-sm-5">
			<input type="date" class="form-control" name="AMarketDate" value="<cfoutput>#subformData.AMarketDate#</cfoutput>">
		</div>
		<div class="checkbox col-sm-3">
			<label><input type="checkbox" name="UMarketDate" value="Unsure"/>Unsure</label>
		</div>
	</div>

	<div class="form-group">
		<label>b. Have you received a response?</label>
		<br/>
		<label class="radio-inline"><input type="radio" name="RespAMarket" value="Y"/>Yes</label>
		<label class="radio-inline"><input type="radio" name="RespAMarket" value="N"/>No</label>
	</div>

	<hr/>

	<strong><em>NOTE: You MUST include a photocopy of the FRONT and BACK of your insurance card(s)/prescription card(s).</em></strong>

	<hr/>

	<strong>Type of Coverage(Check all that apply):</strong>
	<div class="form-group row">		
		<div class="col-sm-5">
			<label class="checkbox-inline"><input type="checkbox" name="CovMed" value="Y"/>Medical Plan</label>
			<label class="checkbox-inline"><input type="checkbox" name="CovPres" value="Y"/>Prescription Plan</label>
			<label class="checkbox-inline"><input type="checkbox" name="CovOther" value="Y"/>Other (Specify)</label>
		</div>
		<div class="col-sm-7">
			<input type="text" class="form-control" name="CovOtherTxt" value="<cfoutput>#subformData.CovOtherTxt#</cfoutput>"/>
		</div>
	</div>

	<div class="row">
		<div class="col-sm-6">
			<strong>30. Private Health Insurance</strong><br/><br/>
			Insurance Carrier:
			<input type="text" class="form-control" name="InsCarrier" value="<cfoutput>#subformData.InsCarrier#</cfoutput>"/><br/>
			Address:
			<textarea type="text" class="form-control" name="InsCarAddr" value="<cfoutput>#subformData.InsCarAddr#</cfoutput>"></textarea><br/>
			Telephone Number:
			<input type="text" class="form-control" name="InsCarPhone" value="<cfoutput>#subformData.InsCarPhone#</cfoutput>" /><br/>
			Policy Number:
			<input type="text" class="form-control" name="InsCarPolicyNum" value="<cfoutput>#subformData.InsCarPolicyNum#</cfoutput>"/><br/>
			If provided by Union or Employer:<br/>
			Employer/Union Name:
			<input type="text" class="form-control" name="EmpUnName" value="<cfoutput>#subformData.EmpUnName#</cfoutput>"/><br/>
			Address:
			<textarea type="text" class="form-control" name="EmpUnAddr" value="<cfoutput>#subformData.EmpUnAddr#</cfoutput>"></textarea><br/>
		</div>

		<div class="col-sm-6">
			<strong>31. Prescription Coverage</strong><br/><br/>
			Insurance Carrier:
			<input type="text" class="form-control" name="PresCar" value="<cfoutput>#subformData.PresCar#</cfoutput>"/><br/>
			Address:
			<textarea type="text" class="form-control" name="PresCarAddr" value="<cfoutput>#subformData.PresCarAddr#</cfoutput>"></textarea><br/>
			Telephone Number:
			<input type="text" class="form-control" name="PresCarPhone" value="<cfoutput>#subformData.PresCarPhone#</cfoutput>"/><br/>
			ID Number:
			<input type="text" class="form-control" name="PresCarID" value="<cfoutput>#subformData.PresCarID#</cfoutput>"/><br/>
			What is the Co-Pay Amount?
			<input type="number" class="form-control" name="PresCoPay" value="<cfoutput>#subformData.PresCoPay#</cfoutput>"/>
			What is the Deductible?
			<input type="number" class="form-control" name="PresDeduct" value="<cfoutput>#subformData.PresDeduct#</cfoutput>"/>
		</div>
	</div>

	<hr/>

	<strong>Identify your relationship to the insured: </strong>
	<br/>
	<div class="form-group row">
		<div class="col-sm-5">		
			<label class="radio-inline"><input type="radio" name="relation" value="Self"/>Self</label>
			<label class="radio-inline"><input type="radio" name="relation" value="Spouse/Partner"/>Spouse/Partner</label>
			<label class="radio-inline"><input type="radio" name="relation" value="Child"/>Child</label>
			<label class="radio-inline"><input type="radio" name="relation"/>Other (Specify)</label>
		</div>
		<div class="col-sm-7">
			<input type="text" class="form-control" name="relOther" value="<cfoutput>#subformData.relOther#</cfoutput>"/>
		</div>
	</div>

	<div class="form-group row">
		<div class="col-sm-6">	
			<label for="InsName">Name of Insured</label>
			<input type="text" class="form-control" name="InsName" value="<cfoutput>#subformData.InsName#</cfoutput>"/>
		</div>
		<div class="col-sm-6">
			<label for="InsSS">Social Security Number:</label>
			<input type="text" class="form-control" name="InsSS" value="<cfoutput>#subformData.InsSS#</cfoutput>"/>
		</div>
	</div>
	<div class="form-group">
		<label for="InsAddr">Street Address, City, State, Zip:</label>
		<input type="text" class="form-control" name="InsAddr" value="<cfoutput>#subformData.InsAddr#</cfoutput>"/>
	</div>
	<div class="form-group row">
		<div class="col-sm-6">	
			<label for="InsAddrCounty">County:</label>
			<input type="text" class="form-control" name="InsAddrCounty" value="<cfoutput>#subformData.InsAddrCounty#</cfoutput>"/>
		</div>
		<div class="col-sm-6">
			<label for="InsPhone">Telephone Number</label>
			<input type="tel" class="form-control" name="InsPhone" value="<cfoutput>#subformData.InsPhone#</cfoutput>"/>
		</div>
	</div>	

	<hr/>

	<div class="form-group">
		<strong>32. a. Are you eligible for Veterans Administration prescription drug benefits?</strong>
		<br/>
		<label class="radio-inline"><input type="radio" name="EliVetDrugBen" value="Y"/>Yes</label>
		<label class="radio-inline"><input type="radio" name="EliVetDrugBen" value="N"/>No</label>
		<br/>
		<strong>b. Are you currently receiving prescription drug benefits?</strong>
		<br/>
		<label class="radio-inline"><input type="radio" name="RecPresDrugBen" value="Y"/>Yes</label>
		<label class="radio-inline"><input type="radio" name="RecPresDrugBen" value="N"/>No</label>
	</div>

	<div class="text-center">
		<button type="submit" class="btn btn-default" name="previous" value="prevous">Previous</button>
		<button type="submit" class="btn btn-default" name="save" value="save">Save Progress &#38; Exit</button>
		<button type="submit" class="btn btn-default" name="next" value="next">Next</button>
	</div>
	</form>

	<hr/>

	<strong><em>
		NOTE: You MUST include a photocopy of the FRONT and BACK of your insurance card(s)/prescription card(s)
		and any notice from your Insurance Company regarding Medicare Part D.
	</em></strong>
</div>
</body>
</html>
