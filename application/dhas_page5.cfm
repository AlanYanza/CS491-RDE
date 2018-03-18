<cfset SessionClass=createObject('component',"CS491-RDE.components.SessionTools")/>
<cfset SessionClass.checkIfLoggedIn()/>
<cfset tableName='NJSection4'/>
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
		<div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width:100%">
			Page 5 of 5
		</div>
	</div>


	<!--<strong>APPLICATION FOR PARTICIPATION IN THE AIDS DRUG DISTRIBUTION PROGRAM AND/OR HEALTH INSURANCE CONTINUATION PROGRAM (Continued)</strong><br/><br/>-->
	<div class="well text-center"><h4>Section 4 - CERTIFICATION AND AUTHORIZATION BY APPLICANT</h4></div>

	<div class="text-justify">
		I certify that the information above is true and accurate to the best of my knowledge and I know that I can be prosecuted for perjury if I
		have intentionally provided false information. I will notify the Program immediately if my/our income rises above legal limits (as stated
		in the Instructions); if I move from New Jersey; if I change my present residential address or telephone number; if there is any change
		in premium payments or policy type; if I become Medicaid/Welfare/PAAD eligible; or if there is a change in any other information
		pertinent to my participation in ADDP and/or HICP. I authorize the release of information necessary to determine my ADDP and/or
		HICP eligibility from the records in possession of the Social Security Administration, Internal Revenue Service and New Jersey
		Division of Taxation, employers, banks and others as the need arises. I authorize my physician to release information concerning
		prescriptions which have been paid on my behalf by ADDP, or my eligibility for HICP. I hereby assign the State of New Jersey as my
		authorized representative, any right to drug benefits to which I may be entitled under any other plan of assistance or insurance, from
		any other liable third party or drug benefits under any other plan of governmental assistance. I understand that the ADDP or the HICP
		is entitled to repayment for incorrectly provided benefits. I further understand that I will be held liable for any ADDP and/or HICP
		benefits which are determined to have been incorrectly paid on my behalf. I understand that the ADDP and the HICP reserve the
		right to limit enrollment based upon the availability of funds.
	</div>

	<hr/>

	<form action="../scripts/NJScript.cfm" method="POST">
  <input type="text" hidden="true" id="formPage" name="formPage" value="page4">
  <input type="text" hidden="true" id="tableName" name="tableName" value="<cfoutput>#tableName#</cfoutput>">
	<div class="row">
		<div class="col-sm-9">
			<label for="signature">33. Signature of Applicant</label>
			<canvas class="form-control" id="signature" name="signature" style="width: 100%; height: 200px;"></canvas>
		</div>
		<div class="col-sm-3">
			<label for="signatureDate">Date</label>
			<input type="date" class="form-control" id="signatureDate" name="signatureDate" value="<cfoutput>#subformData.signatureDate#</cfoutput>"/>
		</div>
	</div>

	<div class="row">
		<div class="col-sm-9">
			<label for="signatureSpousePartner">34. Signature of Spouse/Partner</label>
			<canvas class="form-control" id="signatureSpousePartner" name="signatureSpousePartner" style="width: 100%; height: 200px;"></canvas>
		</div>
		<div class="col-sm-3">
			<label for="dateSignatureSpousePartner">Date</label>
			<input type="date" class="form-control" id="dateSignatureSpousePartner" name="dateSignatureSpousePartner" value="<cfoutput>#subformData.spouseSigDate#</cfoutput>">
		</div>
	</div>

	<hr/>

	<div class="form-group">
		<strong>35. Contact Person</strong><br/>
		<label>May the Department of Human Services and the Department of Health contact an alternate person?</label>
		<br/>
		<label class="radio-inline"><input type="radio" name="HSDHContactPerson" value="Y"/>Yes</label>
		<label class="radio-inline"><input type="radio" name="HSDHContactPerson" value="N"/>No</label>
		<br/>
		In the event that we need information regarding your participation in the program and you are unavailable, please indicate someone
		we may contact on your behalf.<br/>
		<label>Is this person aware of your HIV Status?</label>
		<br/>
		<label class="radio-inline"><input type="radio" name="HIVStatus" value="Yes"/>Yes</label>
		<label class="radio-inline"><input type="radio" name="HIVStatus" value="No"/>No</label>
	</div>

	<b>Name of Contact Person</b>
	<input type="" class="form-control" id="NOC" name="NOC" value="<cfoutput>#subformData.CPName#</cfoutput>"><br/>
	<b>Relationship to Applicant</b>
	<input type="" class="form-control" id="RA" name="RA" value="<cfoutput>#subformData.Relation#</cfoutput>"><br/>
	<b>Street Address, City, State, Zip</b>
	<input type="" class="form-control" id="ACSZ" name="ACSZ" value="<cfoutput>#subformData.CPAddr#</cfoutput>"><br/>

	<div class="row">
		<div class="col-sm-4"><div class="form-group">
			<label for="contactWorkNumber">Work Number</label>
			<input type="tel" class="form-control" id="contactWorkNumber" name="contactWorkNumber" value="<cfoutput>#subformData.CPHPhone#</cfoutput>">
		</div></div>
		<div class="col-sm-4"><div class="form-group">
		  	<label for="contactFaxNumber">Fax Number</label>
		  	<input type="tel" class="form-control" id="contactFaxNumber" name="contactFaxNumber" value="<cfoutput>#subformData.CPWPhone#</cfoutput>">
		</div></div>
		<div class="col-sm-4"><div class="form-group">
		  	<label for="contactCellNumber">Cell Number</label>
		  	<input type="tel" class="form-control" id="contactCellNumber" name="contactCellNumber" value="<cfoutput>#subformData.CPCPhone#</cfoutput>">
		</div></div>
	</div>

	<hr/>

	<b>36. Preparer: </b><br/>
	Anyone other than the applicant who prepared the form must provide his/her name and telephone number, in case questions should
	arise concerning the application.<br/>
	<b>Name of Preparer</b>
	<input type="" class="form-control" id="NP" name="NP" value="<cfoutput>#subformData.PName#</cfoutput>"><br/>
	<b>Phone</b>
	<input type="" class="form-control" id="P" name="P" value="<cfoutput>#subformData.PPhone#</cfoutput>"><br/>

	<hr/>

	<b>37. Case Manager Information </b><br/>
	<div class="row">
		<div class="col-sm-6"><div class="form-group">
			<label for="caseManagerName">Name of Case Manager:</label>
			<input type="text" class="form-control" id="caseManagerName" name="caseManagerName" value="<cfoutput>#subformData.CMName#</cfoutput>"></div></div>
		<div class="col-sm-6"><div class="form-group">
			<label for="agencyAffiliation">Agency Affiliation:</label>
			<input type="text" class="form-control" id="agencyAffiliation" name="agencyAffiliation" value="<cfoutput>#subformData.agency#</cfoutput>"></div></div>
	</div>
	<b>Address:</b>
	<input type="" class="form-control" id="CaseMngAddr" name="CaseMngAddr" value="<cfoutput>#subformData.CMaddr#</cfoutput>"><br/>

	<div class="row">
		<div class="col-sm-4"><div class="form-group">
			<label for="caseWorkNumber">Work Number</label>
			<input type="tel" class="form-control" id="caseWorkNumber" name="caseWorkNumber" value="<cfoutput>#subformData.CMWPhone#</cfoutput>">
		</div></div>
		<div class="col-sm-4"><div class="form-group">
		  	<label for="caseFaxNumber">Fax Number</label>
		  	<input type="tel" class="form-control" id="caseFaxNumber" name="caseFaxNumber" value="<cfoutput>#subformData.CMFaxNum#</cfoutput>">
		</div></div>
		<div class="col-sm-4"><div class="form-group">
		  	<label for="caseCellNumber">Cell Number</label>
		  	<input type="tel" class="form-control" id="caseCellNumber" name="caseCellNumber" value="<cfoutput>#subformData.CMCPhone#</cfoutput>">
		</div></div>
	</div>

	<div class="form-group">
	<label for="caseEmail">Case Manager's Email Address:</label>
	<input type="email" class="form-control" id="caseEmail" name="caseEmail" value="<cfoutput>#subformData.email#</cfoutput>"><br/>
	</div>

	<!--<b>FOR ADDP STAFF USE ONLY:</b>
	Date eligibility determined:
	<input type="date" class="form-control" id="WP" name="WP">-->
	<button type="submit" class="btn btn-default" name="previous" value="prevous">previous</button>
	<button type="submit" class="btn btn-default" name="next" value="next">Submit</button>
	</form>

</div>
</body>
</html>
