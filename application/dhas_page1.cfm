<!-- Check to see if user is logged  in -->
<cfset SessionClass=createObject('component',"CS491-RDE.components.SessionTools")/>
<cfset SessionClass.checkIfLoggedIn()/>
<cfset subformClass=createObject('component','CS491-RDE.components.Subform').init('NJ',session.userID)/>
<!-- Check ApplicationStattus and redirect to homePage is needed -->
<cfset appStatus=subformClass.CheckApplicationStatus()/>
<cfif appStatus neq "M" AND appStatus neq "P" AND appStatus neq "N">
	<cflocation url="/CS491-RDE/home.cfm">
</cfif>
<!--Determine if INSERT or UPDATE required -->
<cfif subformClass.checkIfDataExist() neq 0>
	<cfset method="UPDATE"/>
<cfelse>
	<cfset method="INSERT"/>
</cfif> 

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
		<div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width:20%">
		  Page 1 of 5
		</div>
	</div>

	<p class="text-center"><strong>APPLICATION FOR PARTICIPATION IN THE AIDS DRUG DISTRIBUTION PROGRAM AND/OR HEALTH INSURANCE CONTINUATION PROGRAM</strong></p>
	<p>
		Please answer all questions. Review the instructions pages before you begin. If you need assistance completing this
		application, call toll free 1-877-613-4533 for ADDP questions or 1-800-353-3232 for HICP questions. Send copies of any requested documents. Do NOT send original
		documents as they WILL NOT be returned.
	</p>
	<form action="../scripts/NJScript.cfm" method="POST">
  <input type="text" hidden="true" id="formPage" name="formPage" value="page1">
  <input type="text" hidden="true" id="databaseMethod" name="databaseMethod" value="<cfoutput>#method#</cfoutput>" >
	<div class="text-center checkbox">
	    	<input type="checkbox" name="HICP" value="HICP"/> I am also applying for HICP
	  	</div>
	<div class="well text-center"><h4>Section 1 - APPLICANT INCOME</h4></div>

	<div class="row">
		<div class="col-sm-4"><div class="form-group">
			<label for="lastname">1. Last Name:</label>
			<input type="text" class="form-control" id="lastname" name="lastname"></div></div>
		<div class="col-sm-4"><div class="form-group">
			<label for="firstname">First Name:</label>
			<input type="text" class="form-control" id="firstname" name="firstname"></div></div>
		<div class="col-sm-2"><div class="form-group">
			<label for="mi">MI:</label>
			<input type="text" class="form-control" id="mi" name="mi"></div></div>
		<div class="col-sm-2"><div class="form-group">
			<label for="dob">2. Date of Birth:</label>
			<input type="date" class="form-control" id="dob" name="dob"></div></div>
	</div>

	<div class="row">
		<div class="col-sm-9"><div class="form-group">
			<label for="StreetAddress">3. Street Address</label>
			<input type="text" class="form-control" id="StreetAddress" name="StreetAddress">
		</div></div>
		<div class="col-sm-3"><div class="form-group">
			<label for="AptNumber">Apt. #</label>
			<input type="text" class="form-control" id="AptNumber" name="AptNumber">
		</div></div>
	</div>

	<div class="row">
		<div class="col-sm-3"><div class="form-group"><label for="City">City</label>
			<input type="text" class="form-control" id="City" name="City"></div></div>
		<div class="col-sm-3"><label for="state">State</label>
			<select class="form-control" name="state">
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
		<div class="col-sm-3"><div class="form-group"><label for="Zip">Zip Code</label>
			<input type="text" class="form-control" id="Zip" name="Zip"></div></div>
		<div class="col-sm-3"><div class="form-group">
			<label for="County">4. County</label>
			<input type="text" class="form-control" id="County" name="County"></div></div>
	</div>

	<hr/>

	<div class="row">
		<div class="col-sm-9"><div class="form-group">
			<label for="MailingAddress">5. Mailing Address</label>
			<label class="checkbox-inline"><input type="checkbox"/>Same as above</label>
			<input type="text" class="form-control" id="MAddresss" name="MAddress">
		</div></div>
		<div class="col-sm-3"><div class="form-group">
			<label for="MAptNumber">Apt. #</label>
			<input type="text" class="form-control" id="MAptNumber" name="MAptNumber">
		</div></div>
	</div>

	<div class="row">
		<div class="col-sm-3"><div class="form-group"><label for="MCity">City</label>
			<input type="text" class="form-control" id="MCity" name="MCity"></div></div>
		<div class="col-sm-3"><label for="Mstate">State</label>
			<select class="form-control" name="MState">
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
		<div class="col-sm-3"><div class="form-group"><label for="MZip">Zip Code</label>
			<input type="text" class="form-control" id="MZip" name="MZip"></div></div>
		<div class="col-sm-3"><div class="form-group">
			<label for="MCounty">4. County</label>
			<input type="text" class="form-control" id="MCounty" name="MCounty"></div></div>
	</div>

	<hr/>

	<strong>6. Applicant's Telephone Numbers:</strong>
	<div class="row">
		<div class="col-sm-4"><div class="form-group">
			<label for="HomeNumber">Home Phone Number </label>
			<input type="tel" class="form-control" id="HomeNumber" name="HomeNumber">
		</div></div>
		<div class="col-sm-4"><div class="form-group">
		  	<label for="CellNumber">Cell Phone Number </label>
		  	<input type="tel" class="form-control" id="CellNumber" name="CellNumber">
		</div></div>
		<div class="col-sm-4"><div class="form-group">
		  	<label for="WorkNumber">Work Phone Number </label>
		  	<input type="tel" class="form-control" id="WorkNumber" name="WorkNumber">
		</div></div>
	</div>

	<hr/>

	<label>7. Residency</label>
	<p>a. Is the address above your principal place of residence?</p>
	<div class="radio">
		<label><input type="radio" name="Residency" value="Yes"/>Yes</label>
		<label><input type="radio" name="Residency" value="No"/>No</label>
	</div>

	<p><strong><em>
	NOTE: Two (2) proofs of residency MUST accompany this application. See Instructions.
	<br/>
	NO HOME ADDRESS DECLARATION &#45; If you do not have a home address, have a case manager/social worker provide support
	documentation on facility letterhead.
	</em></strong></p>
	<hr/>
	<div class="form-group">
		<label for="SSN">8. What is your Social Security Number (if you have one)?</label>
		<input type="text" class="form-control" id="SSN" name="SSN">
	</div>
	<div class="form-group">
		<label for="citizenship">9. Are you a U.S. citizen? (Responding to this question will not affect your eligibility for ADDP.)</label>
		<div class="radio">
			<label><input type="radio" name="citizenship" value="Yes"/>Yes</label>
			<label><input type="radio" name="citizenship" value="No"/>No</label>
		</div>
	</div>

	<hr/>

	<div class="form-group">
		<label for="veteran">10. Are you a veteran?</label>
		<div class="radio">
			<label><input type="radio" name="Veteran" value="Yes"/>Yes</label>
			<label><input type="radio" name="Veteran" value="No"/>No</label>
		</div>
	</div>

	<hr/>

	<div class="form-group">
		<label for="relationship" >11. Relationship Status</label>
		<select class="form-control" name="relationship">
			<option selected>Select one</option>
			<option value="Single"/>Single</option>
			<option value="Married"/>Married</option>
			<option value="Civil Union"/>Civil Union</option>
			<option value="Domestic Partner"/>Domestic Partner</option>
			<option value="Divorced"/>Divorced</option>
			<option value="Widowed"/>Widowed</option>
			<option value="Separated"/>*Separated</option>
		</select>
		<em>*(See instructions, Page 1. Applicant information.)</em>
	</div>

	<hr/>

	<div class="form-group">
		<label for="gender">12. Gender</label>
		<select class="form-control" name="gender">
			<option selected>Select one</option>
			<option value="Male">Male</option>
			<option value="Female">Female</option>
			<option value="Transgendered Male to Female">Transgendered Male to Female</option>
			<option value="Transgendered Female to Male">Transgendered Female to Male</option>
		</select>
	</div>

	<hr/>

	<div class="form-group">
		<label>13. Gender at Birth</label>
		<br/>
		<label class="radio-inline"><input type="radio" name="GAB" value="Male"/>Male</label>
		<label class="radio-inline"><input type="radio" name="GAB" value="Female"/>Female</label>
	</div>

	<hr/>

	<div class="form-group">
		<label for="race">14. Race</label>
		<select class="form-control" name="Race">
			<option selected>Select one</option>
			<option value="White">White</option>
			<option value="Black">Black</option>
			<option value="Asian">Asian</option>
			<option value="American Indian/Alaskan Native">American Indian/Alaskan Native</option>
			<option value="Native Hawaiian/Pacific Islander">Native Hawaiian/Pacific Islander</option>
			<option value="Unknown">Unknown</option>
		</select>
	</div>

	<div class="form-group" id="asian">
		<select class="form-control" name="Race">
			<option selected>Select one</option>
			<option value="Asian Indian">Asian Indian</option>
			<option value="Chinese">Chinese</option>
			<option value="Filipino">Filipino</option>
			<option value="Japanese">Japanese</option>
			<option value="Korean">Korean</option>
			<option value="Vietnamese">Vietnamese</option>
		</select>
	</div>

	<div class="form-group" id="nativeHawaiian">
		<select class="form-control" name="Race">
			<option selected>Select one</option>
			<option value="Native Hawaiian">Native Hawaiian</option>
			<option value="Guamanian or Chamorro">Guamanian or Chamorro</option>
			<option value="Samoan">Samoan</option>
			<option value="Other Pacific Islander">Other Pacific Islander</option>
		</select>
	</div>

	<hr/>

	<div class="form-group">
		<label>15. Ethnicity</label>
		<br/>
		<label class="radio-inline"><input type="radio" name="ethnicity" value="Hispanic/Latino"/>Hispanic/Latino</label>
		<label class="radio-inline"><input type="radio" name="ethnicity" value="Non-Hispanic"/>Non-Hispanic</label>
	</div>

	<div class="form-group" id="hispanic|latino">
		<select class="form-control" name="Race">
			<option selected>Select one</option>
			<option value="Mexican, Mexican American, Chicano/a">Mexican, Mexican American, Chicano/a</option>
			<option value="Puerto Rican">Puerto Rican </option>
			<option value="Cuban">Cuban</option>
			<option value="Other Hispanic, Latino/a, or Spanish Origin">Other Hispanic, Latino/a, or Spanish Origin</option>
		</select>
	</div>

	<label>16. Female Applicants Only:</label>
	<div class="form-group">
		<label for="pregnant">Are you pregnant?</label>
		<br/>
		<label class="radio-inline"><input type="radio" name="pregnant" value="Yes"/> Yes</label>
		<label class="radio-inline"><input type="radio" name="pregnant" value="No"/> No</label>
	</div>
	<button type="submit" class="btn btn-default" name="previous" value="prevous">previous</button>
	<button type="submit" class="btn btn-default" name="next" value="next">next</button>
	</form>
</div>
</body>
</html>
