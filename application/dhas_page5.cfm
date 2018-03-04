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

	<form>

	<div class="row">
		<div class="col-sm-9">
			<label for="signature">33. Signature of Applicant</label>
			<canvas class="form-control" id="signature" name="signature" style="width: 100%; height: 200px;"></canvas>
		</div>
		<div class="col-sm-3">
			<label for="signatureDate">Date</label>
			<input type="date" class="form-control" id="signatureDate" name="signatureDate"/>
		</div>
	</div>

	<div class="row">
		<div class="col-sm-9">
			<label for="signatureSpousePartner">34. Signature of Spouse/Partner</label>
			<canvas class="form-control" id="signatureSpousePartner" name="signatureSpousePartner" style="width: 100%; height: 200px;"></canvas>
		</div>
		<div class="col-sm-3">
			<label for="dateSignatureSpousePartner">Date</label>
			<input type="date" class="form-control" id="dateSignatureSpousePartner" name="dateSignatureSpousePartner">
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

	Name of Contact Person
	<input type="" class="form-control" id="NOC" name="NOC"><br/>
	Relationship to Applicant
	<input type="" class="form-control" id="RA" name="RA"><br/>
	Street Address, City, State, Zip
	<input type="" class="form-control" id="ACSZ" name="ACSZ"><br/>

	<div class="row">
		<div class="col-sm-4"><div class="form-group">
			<label for="contactWorkNumber">Work Number</label>
			<input type="tel" class="form-control" id="contactWorkNumber" name="contactWorkNumber">
		</div></div>
		<div class="col-sm-4"><div class="form-group">
		  	<label for="contactFaxNumber">Fax Number</label>
		  	<input type="tel" class="form-control" id="contactFaxNumber" name="contactFaxNumber">
		</div></div>
		<div class="col-sm-4"><div class="form-group">
		  	<label for="contactCellNumber">Cell Number</label>
		  	<input type="tel" class="form-control" id="contactCellNumber" name="contactCellNumber">
		</div></div>
	</div>
	
	<hr/>

	<b>36. Preparer: </b><br/>
	Anyone other than the applicant who prepared the form must provide his/her name and telephone number, in case questions should
	arise concerning the application.<br/>
	Name of Preparer
	<input type="" class="form-control" id="NP" name="NP"><br/>
	Phone
	<input type="" class="form-control" id="P" name="P"><br/>

	<hr/>

	<b>37. Case Manager Information </b><br/>
	<div class="row">
		<div class="col-sm-6"><div class="form-group">
			<label for="caseManagerName">Name of Case Manager:</label>
			<input type="text" class="form-control" id="caseManagerName" name="caseManagerName"></div></div>
		<div class="col-sm-6"><div class="form-group">
			<label for="agencyAffiliation">Agency Affiliation:</label>
			<input type="text" class="form-control" id="agencyAffiliation" name="agencyAffiliation"></div></div>
		
	</div>

	<div class="row">
		<div class="col-sm-12"><div class="form-group">
			<label for="caseStreetAddress">Street Address</label>
			<input type="text" class="form-control" id="caseStreetAddress" name="caseStreetAddress">
		</div></div>
	</div>

	<div class="row">
		<div class="col-sm-3"><div class="form-group"><label for="caseCity">City</label>
			<input type="text" class="form-control" id="City" name="caseCity"></div></div>
		<div class="col-sm-3"><label for="caseState">State</label>
			<select class="form-control" name="caseSState">
			<option selected>Select one</option>
				<option value="AL">AL - Alabama</option>
				<option value="AK">AK - Alaska</option>
				<option value="AZ">AZ - Arizona</option>
				<option value="AR">AR - Arkansas</option>
				<option value="CA">CA - California</option>
				<option value="CO">CO - Colorado</option>
				<option value="CT">CT - Connecticut</option>
				<option value="DC">DC - District of Columbia</option>
				<option value="DE">DE - Delaware</option>
				<option value="FL">FL - Florida</option>
				<option value="GA">GA - Georgia</option>
				<option value="HI">HI - Hawaii</option>
				<option value="ID">ID - Idaho</option>
				<option value="IL">IL - Illinois</option>
				<option value="IN">IN - Indiana</option>
				<option value="IA">IA - Iowa</option>
				<option value="KS">KS - Kansas</option>
				<option value="KY">KY - Kentucky</option>
				<option value="LA">LA - Louisiana</option>
				<option value="ME">ME - Maine</option>
				<option value="MD">MD - Maryland</option>
				<option value="MA">MA - Massachusetts</option>
				<option value="MI">MI - Michigan</option>
				<option value="MN">MN - Minnesota</option>
				<option value="MS">MS - Mississippi</option>
				<option value="MO">MO - Missouri</option>
				<option value="MT">MT - Montana</option>
				<option value="NE">NE - Nebraska</option>
				<option value="NV">NV - Nevada</option>
				<option value="NH">NH - New Hampshire</option>
				<option value="NJ">NJ - New Jersey</option>
				<option value="NM">NM - New Mexico</option>
				<option value="NY">NY - New York</option>
				<option value="NC">NC - North Carolina</option>
				<option value="ND">ND - North Dakota</option>
				<option value="OH">OH - Ohio</option>
				<option value="OK">OK - Oklahoma</option>
				<option value="OR">OR - Oregon</option>
				<option value="PA">PA - Pennsylvania</option>
				<option value="PR">PR - Puerto Rico</option>
				<option value="RI">RI - Rhode Island</option>
				<option value="SC">SC - South Carolina</option>
				<option value="SD">SD - South Dakota</option>
				<option value="TN">TN - Tennessee</option>
				<option value="TX">TX - Texas</option>
				<option value="UT">UT - Utah</option>
				<option value="VT">VT - Vermont</option>
				<option value="VA">VA - Virginia</option>
				<option value="WA">WA - Washington</option>
				<option value="WV">WV - West Virginia</option>
				<option value="WI">WI - Wisconsin</option>
				<option value="WY">WY - Wyoming</option>
			</select>
		</div>
		<div class="col-sm-3"><div class="form-group"><label for="caseZip">Zip Code</label>
			<input type="text" class="form-control" id="Zip" name="caseZip"></div></div>
		<div class="col-sm-3"><div class="form-group">
			<label for="caseCounty">County</label>
			<input type="text" class="form-control" id="caseCounty" name="caseCounty"></div></div>
	</div>
	<div class="row">
		<div class="col-sm-4"><div class="form-group">
			<label for="caseWorkNumber">Work Number</label>
			<input type="tel" class="form-control" id="caseWorkNumber" name="caseWorkNumber">
		</div></div>
		<div class="col-sm-4"><div class="form-group">
		  	<label for="caseFaxNumber">Fax Number</label>
		  	<input type="tel" class="form-control" id="caseFaxNumber" name="caseFaxNumber">
		</div></div>
		<div class="col-sm-4"><div class="form-group">
		  	<label for="caseCellNumber">Cell Number</label>
		  	<input type="tel" class="form-control" id="caseCellNumber" name="caseCellNumber">
		</div></div>
	</div>

	<div class="form-group">
	<label for="caseEmail">Case Manager's Email Address:</label>
	<input type="email" class="form-control" id="caseEmail" name="caseEmail"><br/>
	</div>

	<!--<b>FOR ADDP STAFF USE ONLY:</b>
	Date eligibility determined: 
	<input type="date" class="form-control" id="WP" name="WP">-->

	</form>

	<ul class="pager">
		<li><a href="./Page6.cfm">Previous</a></li>
		<li><a href="#">Submit</a></li>
	</ul>
</div>
</body>
</html>