<!-- Check to see if user is logged  in -->
<cfset SessionClass=createObject('component',"CS491-RDE.components.SessionTools")/>
<cfset SessionClass.checkIfLoggedIn()/>
<cfset tableName='NJSection1'/>
<cfset fields=[] />
<cfset subformClass=createObject('component','CS491-RDE.components.Subform').init('NJ',session.userID,tableName,fields)/>
<cfset subformClass.noAccessRedirect('/CS491-RDE/home.cfm')/>
<!-- Application Page preprocessing -->
<cfset subformClass.createSubformData()/>
<cfset subformData=subformClass.retrieveDataForSubform()/>
<cfset HICPStatus=subformClass.retrieveHICPStatus()/>

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
  <input type="text" hidden="true" id="tableName" name="tableName" value="<cfoutput>#tableName#</cfoutput>">
  <!--- hidden fields to c	ommuniate coldFusion resultSet with javascript Functions (auto-generated in a external tool and copied in) --->
  <input type="text" hidden="true" name="HFFName" value="#subformData.FName#"> <input type="text" hidden="true" name="HFMName" value="#subformData.MName#"> 
  <input type="text" hidden="true" name="HFLName" value="#subformData.LName#"> <input type="text" hidden="true" name="HFDateBirth" value="#subformData.DateBirth#"> 
  <input type="text" hidden="true" name="HFgender" value="#subformData.gender#"> <input type="text" hidden="true" name="HFgenderBirth" value="#subformData.genderBirth#"> 
  <input type="text" hidden="true" name="HFSSNum" value="#subformData.SSNum#"> <input type="text" hidden="true" name="HFstreet" value="#subformData.street#"> 
  <input type="text" hidden="true" name="HFcity" value="#subformData.city#"> <input type="text" hidden="true" name="HFstate" value="#subformData.state#"> 
  <input type="text" hidden="true" name="HFzip" value="#subformData.zip#"> <input type="text" hidden="true" name="HFcounty" value="#subformData.county#"> 
  <input type="text" hidden="true" name="HFaptNum" value="#subformData.aptNum#"> <input type="text" hidden="true" name="HFHPhone" value="#subformData.HPhone#"> 
  <input type="text" hidden="true" name="HFWPhone" value="#subformData.WPhone#"> <input type="text" hidden="true" name="HFCPhone" value="#subformData.CPhone#"> 
  <input type="text" hidden="true" name="HFVHomeMsgPerm" value="#subformData.VHomeMsgPerm#"> <input type="text" hidden="true" name="HFVCellMsgPerm" value="#subformData.VCellMsgPerm#"> 
  <input type="text" hidden="true" name="HFVWorkMsgPerm" value="#subformData.VWorkMsgPerm#"> <input type="text" hidden="true" name="HFAltComPerm" value="#subformData.AltComPerm#"> 
  <input type="text" hidden="true" name="HFAddrRes" value="#subformData.AddrRes#"> <input type="text" hidden="true" name="HFMStreet" value="#subformData.MStreet#"> 
  <input type="text" hidden="true" name="HFMCity" value="#subformData.MCity#"> <input type="text" hidden="true" name="HFMState" value="#subformData.MState#"> 
  <input type="text" hidden="true" name="HFMZip" value="#subformData.MZip#"> <input type="text" hidden="true" name="HFMCountry" value="#subformData.MCountry#"> 
  <input type="text" hidden="true" name="HFMaptNum" value="#subformData.MaptNum#"> <input type="text" hidden="true" name="HFUSCitizen" value="#subformData.USCitizen#"> 
  <input type="text" hidden="true" name="HFveteran" value="#subformData.veteran#"> <input type="text" hidden="true" name="HFRelStatus" value="#subformData.RelStatus#"> 
  <input type="text" hidden="true" name="HFRWhite" value="#subformData.RWhite#"> <input type="text" hidden="true" name="HFRBlack" value="#subformData.RBlack#"> 
  <input type="text" hidden="true" name="HFRAsian" value="#subformData.RAsian#"> <input type="text" hidden="true" name="HFRAmInd" value="#subformData.RAmInd#"> 
  <input type="text" hidden="true" name="HFRNatHa" value="#subformData.RNatHa#"> <input type="text" hidden="true" name="HFRUnk" value="#subformData.RUnk#"> 
  <input type="text" hidden="true" name="HFAAsInd" value="#subformData.AAsInd#"> <input type="text" hidden="true" name="HFAChinese" value="#subformData.AChinese#"> 
  <input type="text" hidden="true" name="HFAJap" value="#subformData.AJap#"> <input type="text" hidden="true" name="HFAKorean" value="#subformData.AKorean#"> 
  <input type="text" hidden="true" name="HFAViet" value="#subformData.AViet#"> <input type="text" hidden="true" name="HFAOther" value="#subformData.AOther#"> 
  <input type="text" hidden="true" name="HFNHNatHa" value="#subformData.NHNatHa#"> <input type="text" hidden="true" name="HFNHGua" value="#subformData.NHGua#"> 
  <input type="text" hidden="true" name="HFNHSam" value="#subformData.NHSam#"> <input type="text" hidden="true" name="HFNHOther" value="#subformData.NHOther#"> 
  <input type="text" hidden="true" name="HFEHisp" value="#subformData.EHisp#"> <input type="text" hidden="true" name="HFENonHisp" value="#subformData.ENonHisp#"> 
  <input type="text" hidden="true" name="HFHispMex" value="#subformData.HispMex#"> <input type="text" hidden="true" name="HFHispPR" value="#subformData.HispPR#"> 
  <input type="text" hidden="true" name="HFHispCub" value="#subformData.HispCub#"> <input type="text" hidden="true" name="HFHispOther" value="#subformData.HispOther#"> 


	<div class="text-center checkbox">
	    	<input type="checkbox" name="HICP" value="HICP"/> I am also applying for HICP
	  	</div>
	<div class="well text-center"><h4>Section 1 - APPLICANT INCOME</h4></div>

	<div class="row">
		<div class="col-sm-4"><div class="form-group">
			<label for="lastname">1. Last Name:</label>
			<input type="text" class="form-control" id="lastname" name="lastname" value="<cfoutput>#subformData.LName#</cfoutput>"></div></div>
		<div class="col-sm-4"><div class="form-group">
			<label for="firstname">First Name:</label>
			<input type="text" class="form-control" id="firstname" name="firstname" value="<cfoutput>#subformData.FName#</cfoutput>"></div></div>
		<div class="col-sm-2"><div class="form-group">
			<label for="mi">MI:</label>
			<input type="text" class="form-control" id="mi" name="mi" value="<cfoutput>#subformData.MName#</cfoutput>"></div></div>
		<div class="col-sm-2"><div class="form-group">
			<label for="dob">2. Date of Birth:</label>
			<input type="date" class="form-control" id="dob" name="dob" value="<cfoutput>#subformData.DateBirth#</cfoutput>"></div></div>
	</div>

	<div class="row">
		<div class="col-sm-9"><div class="form-group">
			<label for="StreetAddress">3. Street Address</label>
			<input type="text" class="form-control" id="StreetAddress" name="StreetAddress" value="<cfoutput>#subformData.street#</cfoutput>">
		</div></div>
		<div class="col-sm-3"><div class="form-group">
			<label for="AptNumber">Apt. #</label>
			<input type="text" class="form-control" id="AptNumber" name="AptNumber" value="<cfoutput>#subformData.aptNum#</cfoutput>">
		</div></div>
	</div>

	<div class="row">
		<div class="col-sm-3"><div class="form-group"><label for="City">City</label>
			<input type="text" class="form-control" id="City" name="City" value="<cfoutput>#subformData.city#</cfoutput>"></div></div>
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
			<input type="text" class="form-control" id="Zip" name="Zip" value="<cfoutput>#subformData.zip#</cfoutput>"></div></div>
		<div class="col-sm-3"><div class="form-group">
			<label for="County">4. County</label>
			<input type="text" class="form-control" id="County" name="County" value="<cfoutput>#subformData.county#</cfoutput>"></div></div>
	</div>

	<hr/>

	<div class="row">
		<div class="col-sm-9"><div class="form-group">
			<label for="MailingAddress">5. Mailing Address</label>
			<label class="checkbox-inline"><input type="checkbox"/>Same as above</label>
			<input type="text" class="form-control" id="MailStreet" name="MailStreet" value="<cfoutput>#subformData.MStreet#</cfoutput>">
		</div></div>
		<div class="col-sm-3"><div class="form-group">
			<label for="MAptNumber">Apt. #</label>
			<input type="text" class="form-control" id="MAptNumber" name="MAptNumber" value="<cfoutput>#subformData.MaptNum#</cfoutput>">
		</div></div>
	</div>

	<div class="row">
		<div class="col-sm-3"><div class="form-group"><label for="MCity">City</label>
			<input type="text" class="form-control" id="MCity" name="MCity" value="<cfoutput>#subformData.MCity#</cfoutput>"></div></div>
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
			<input type="text" class="form-control" id="MZip" name="MZip" value="<cfoutput>#subformData.MZip#</cfoutput>"></div></div>
		<div class="col-sm-3"><div class="form-group">
			<label for="MCounty">4. County</label>
			<input type="text" class="form-control" id="MCounty" name="MCounty" value="<cfoutput>#subformData.MCounty#</cfoutput>"></div></div>
	</div>

	<hr/>

	<strong>6. Applicant's Telephone Numbers:</strong>
	<div class="row">
		<div class="col-sm-4"><div class="form-group">
			<label for="HomeNumber">Home Phone Number </label>
			<input type="tel" class="form-control" id="HomeNumber" name="HomeNumber" value="<cfoutput>#subformData.HPhone#</cfoutput>">
		</div></div>
		<div class="col-sm-4"><div class="form-group">
		  	<label for="CellNumber">Cell Phone Number </label>
		  	<input type="tel" class="form-control" id="CellNumber" name="CellNumber" value="<cfoutput>#subformData.WPhone#</cfoutput>">
		</div></div>
		<div class="col-sm-4"><div class="form-group">
		  	<label for="WorkNumber">Work Phone Number </label>
		  	<input type="tel" class="form-control" id="WorkNumber" name="WorkNumber" value="<cfoutput>#subformData.CPhone#</cfoutput>">
		</div></div>
	</div>
	<strong>May ADDP/HICP staff leave a detailed voice mail message on(check all that apply)</strong><br>
		<label class="checkbox-inline"><input type="checkbox" name="VoiceMail" value="VHome"/>Home Phone</label>
		<label class="checkbox-inline"><input type="checkbox" name="VoiceMail" value="VCell"/>Cell Phone</label>
		<label class="checkbox-inline"><input type="checkbox" name="VoiceMail" value="VWork"/>Work Phone</label>
	<p><b>I do not have a phone but my alternate contact and/or case manager may be contacted and message left?<b><br>
	Note: please provide alternate contact information on Page 4</b>
	<div class="radio">
		<label><input type="radio" name="Residency" value="Yes"/>Yes</label>
		<label><input type="radio" name="Residency" value="No"/>No</label>
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
		<input type="text" class="form-control" id="SSN" name="SSN" value="<cfoutput>#subformData.SSNum#</cfoutput>">
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
	
	<strong>Race</strong><br>
	<div>
		<label class="checkbox-inline"><input type="checkbox" name="Race" value="White"/>White</label>
		<label class="checkbox-inline"><input type="checkbox" name="Race" value="Black"/>Black</label>
		<label class="checkbox-inline"><input type="checkbox" name="Race" value="Asian"/>Asian</label>
		<label class="checkbox-inline"><input type="checkbox" name="Race" value="AmIndAlaNat"/>Amercan Indian/Alaskan Native</label>
		<label class="checkbox-inline"><input type="checkbox" name="Race" value="NatHawPacIs"/>Native Hawaiian/Pacific Islander</label>
		<label class="checkbox-inline"><input type="checkbox" name="Race" value="Unknown"/>Unknown</label>
	</div>
	<div>
		<p>If Selected Asian: <br>Note: Javascript to be done later with make this section disappear<p>
		<label class="checkbox-inline"><input type="checkbox" name="Asian" value="Asian Indian"/>Asian Indian</label>
		<label class="checkbox-inline"><input type="checkbox" name="Asian" value="Japanese"/>Japanese</label>
		<label class="checkbox-inline"><input type="checkbox" name="Asian" value="Filipino"/>Filipino</label>
		<label class="checkbox-inline"><input type="checkbox" name="Asian" value="Chinese"/>Chinese</label>
		<label class="checkbox-inline"><input type="checkbox" name="Asian" value="Korean"/>Korean</label>
		<label class="checkbox-inline"><input type="checkbox" name="Asian" value="Vietnamese"/>Vietnamese</label>
		<label class="checkbox-inline"><input type="checkbox" name="Asian" value="OtherAsian"/>OtherAsian</label>
	</div>
	<div>
		<p>If Selected Native Hawaiian/Pacific Islander: <br>Note: Javascript to be done later with make this section disappear<p>
		<label class="checkbox-inline"><input type="checkbox" name="NatHawPacIs" value="NativeHawaiian"/>Native Hawaiian</label>
		<label class="checkbox-inline"><input type="checkbox" name="NatHawPacIs" value="GuamanianChamorro"/>Guamanian or Chamorro</label>
		<label class="checkbox-inline"><input type="checkbox" name="NatHawPacIs" value="Samoan"/>Samoan</label>
		<label class="checkbox-inline"><input type="checkbox" name="NatHawPacIs" value="OtherPacificIslander"/>Other Pacific Islander</label>
	</div>

	<hr/>

	<div class="form-group">
		<label>15. Ethnicity</label>
		<br/>
		<label class="radio-inline"><input type="radio" name="ethnicity" value="Hispanic/Latino"/>Hispanic/Latino</label>
		<label class="radio-inline"><input type="radio" name="ethnicity" value="Non-Hispanic"/>Non-Hispanic</label>
	</div>
	
	<div>
		<p>If Selected Hispanic/Latino: <br>Note: Javascript to be done later with make this section disappear<p>
		<label class="checkbox-inline"><input type="checkbox" name="HispLat" value="MexAmChi"/>Mexican, Mexican American, or Chicano/a</label>
		<label class="checkbox-inline"><input type="checkbox" name="HispLat" value="PuertoRican"/>Puerto Rican</label>
		<label class="checkbox-inline"><input type="checkbox" name="HispLat" value="Cuban"/>Cuban</label>
		<label class="checkbox-inline"><input type="checkbox" name="HispLat" value="OtherHisp"/>Other Hispanic, Latino/a, or Spanish Origin</label>
	</div>
	
	<label>16. Female Applicants Only:</label>
	<div class="form-group">
		<label for="pregnant">Are you pregnant?</label>
		<br/>
		<label class="radio-inline"><input type="radio" name="pregnant" value="Yes"/> Yes</label>
		<label class="radio-inline"><input type="radio" name="pregnant" value="No"/> No</label>
	</div>
	<button type="submit" class="btn btn-default" name="previous" value="prevous">previous</button>
	<button type="submit" class="btn btn-default" name="save" value="save">Exit & Save Progress</button>
	<button type="submit" class="btn btn-default" name="next" value="next">next</button>
	</form>
</div>
</body>
</html>
