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
	<script>
		"use strict";
		$(document).ready(function(){

			$("#same").change(function(){
				if (document.getElementById('same').checked){
					var state = document.getElementById('state');
					var MState = document.getElementById('MState');
					$("#MStreet").val($("#street").val());
					$("#MaptNum").val($("#aptNum").val());
					$("#MCity").val($("#city").val());
					MState.selectedIndex = state.selectedIndex;
					$("#MZip").val($("#zip").val());
					$("#MCounty").val($("#County").val());
				}
			});

			function asianCheck() {
				
				if ($("input[type=checkbox][name=RAsian]").is(":checked")) {
					$("#RasianOption").show("slow");
				}					
				else {
					$("#RasianOption").hide();
				}
			}

			function RNatHaCheck() {
				
				if ($("input[type=checkbox][name=RNatHa]").is(":checked")) {
					$("#RNatHaOption").show("slow");
				}					
				else {
					$("#RNatHaOption").hide();
				}
			}

			function EHispCheck() {
				if (typeof $("input[type=radio][name=EHisp]:checked").val() === "undefined") {
					$("#EHispOption").hide();
					return;
				}

				if ($("input[type=radio][name=EHisp]:checked").val() == "Y") {
					$("#EHispOption").show("slow");
				}					
				else {
					$("#EHispOption").hide();
				}
			}

			function pregnant() {
				if (typeof $("input[type=radio][name=genderBirth]:checked").val() === "undefined") {
					return;
				}
				if ($("input[type=radio][name=genderBirth]:checked").val().toLowerCase() == "male") {
					$("#preg").hide();
					$("#preg").children().removeAttr("required");
				}
				else {
					$("#preg").show();
					$("#preg").children().attr("required", "true");
				}
			}

			$("button[type=submit][name=save]").click(function() {
				$("form").find("input").removeAttr("required");
			});
			
			asianCheck();
			RNatHaCheck();
			EHispCheck();
			pregnant();
			
			$("input[type=checkbox][name=RAsian]").click(asianCheck);
			$("input[type=checkbox][name=RNatHa]").click(RNatHaCheck);
			$("input[type=radio][name=EHisp]").change(EHispCheck);
			$("input[type=radio][name=genderBirth]").change(pregnant);
		});
	</script>
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
	<div class="text-center checkbox">
			<input type="checkbox" name="HICP" value="HICP"/> I am also applying for HICP
		</div>
	<div class="well text-center"><h4>Section 1 - APPLICANT INCOME</h4></div>

	<div class="row">
		<div class="col-sm-4"><div class="form-group">
			<label for="LName">1. Last Name:</label>
			<input type="text" class="form-control" id="LName" name="LName" value="<cfoutput>#subformData.LName#</cfoutput>" required /></div></div>
		<div class="col-sm-4"><div class="form-group">
			<label for="FName">First Name:</label>
			<input type="text" class="form-control" id="FName" name="FName" value="<cfoutput>#subformData.FName#</cfoutput>" required /></div></div>
		<div class="col-sm-2"><div class="form-group">
			<label for="MName">MI:</label>
			<input type="text" class="form-control" id="MName" name="MName" value="<cfoutput>#subformData.MName#</cfoutput>" /></div></div>
		<div class="col-sm-2"><div class="form-group">
			<label for="DateBirth">2. Date of Birth:</label>
			<input type="date" class="form-control" name="DateBirth" value="<cfoutput>#subformData.DateBirth#</cfoutput>" required /></div></div>
	</div>

	<div class="row">
		<div class="col-sm-9"><div class="form-group">
			<label for="street">3. Street Address</label>
			<input type="text" class="form-control" id="street" name="street" value="<cfoutput>#subformData.street#</cfoutput>" required />
		</div></div>
		<div class="col-sm-3"><div class="form-group">
			<label for="aptNum">Apt. #</label>
			<input type="text" class="form-control" id="aptNum" name="aptNum" value="<cfoutput>#subformData.aptNum#</cfoutput>"/>
		</div></div>
	</div>

	<div class="row">
		<div class="col-sm-3"><div class="form-group"><label for="city">City</label>
			<input type="text" class="form-control" id="city" name="city" value="<cfoutput>#subformData.city#</cfoutput>" required /></div></div>
		<div class="col-sm-3"><label for="state">State</label>
			<select class="form-control" id="state" name="state" required />
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
		<div class="col-sm-3"><div class="form-group"><label for="zip">Zip Code</label>
			<input type="text" class="form-control" id="zip" name="zip" value="<cfoutput>#subformData.zip#</cfoutput>" required /></div></div>
		<div class="col-sm-3"><div class="form-group">
			<label for="County">4. County</label>
			<input type="text" class="form-control" id="County" name="County" value="<cfoutput>#subformData.county#</cfoutput>" required /></div></div>
	</div>

	<hr/>

	<div class="row">
		<div class="col-sm-9"><div class="form-group">
			<label for="MStreet">5. Mailing Address</label>
			<label class="checkbox-inline"><input type="checkbox" id="same"/>Same as above</label>
			<input type="text" class="form-control" id="MStreet" name="MStreet" value="<cfoutput>#subformData.MStreet#</cfoutput>" required />
		</div></div>
		<div class="col-sm-3"><div class="form-group">
			<label for="MaptNum">Apt. #</label>
			<input type="text" class="form-control" id="MaptNum" name="MaptNum" value="<cfoutput>#subformData.MaptNum#</cfoutput>">
		</div></div>
	</div>

	<div class="row">
		<div class="col-sm-3"><div class="form-group"><label for="MCity">City</label>
			<input type="text" class="form-control" id="MCity" name="MCity" value="<cfoutput>#subformData.MCity#</cfoutput>" required /></div></div>
		<div class="col-sm-3"><label for="MState">State</label>
			<select class="form-control" id="MState" name="MState" required />
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
			<input type="text" class="form-control" id="MZip" name="MZip" value="<cfoutput>#subformData.MZip#</cfoutput>" required />
		</div></div>
		<div class="col-sm-3"><div class="form-group">
			<label for="MCounty">4. County</label>
			<input type="text" class="form-control" id="MCounty" name="MCounty" value="<cfoutput>#subformData.MCounty#</cfoutput>" required />
		</div></div>
	</div>

	<hr/>

	<strong>6. Applicant's Telephone Numbers:</strong>
	<div class="row">
		<div class="col-sm-4"><div class="form-group">
			<label for="HPhone">Home Phone Number </label>
			<input type="tel" class="form-control" id="HPhone" name="HPhone" value="<cfoutput>#subformData.HPhone#</cfoutput>">
		</div></div>
		<div class="col-sm-4"><div class="form-group">
		  	<label for="CPhone">Cell Phone Number </label>
		  	<input type="tel" class="form-control" id="CPhone" name="CPhone" value="<cfoutput>#subformData.CPhone#</cfoutput>">
		</div></div>
		<div class="col-sm-4"><div class="form-group">
		  	<label for="WPhone">Work Phone Number </label>
		  	<input type="tel" class="form-control" id="WPhone" name="WPhone" value="<cfoutput>#subformData.WPhone#</cfoutput>">
		</div></div>
	</div>
	<strong>May ADDP/HICP staff leave a detailed voice mail message on(check all that apply)</strong><br>
		<label class="checkbox-inline"><input type="checkbox" name="VHomeMsgPerm" value="Y"/>Home Phone</label>
		<label class="checkbox-inline"><input type="checkbox" name="VCellMsgPerm" value="Y"/>Cell Phone</label>
		<label class="checkbox-inline"><input type="checkbox" name="VWorkMsgPerm" value="Y"/>Work Phone</label>
	<p><strong>I do not have a phone but my alternate contact and/or case manager may be contacted and message left?</strong>
	</p>	
	<div class="radio">
		<label><input type="radio" name="AltCommPerm" value="Y"/>Yes</label>
		<label><input type="radio" name="AltCommPerm" value="N"/>No</label>
	</div>
	<p><strong>Note: please provide alternate contact information on Page 4</strong></p>

	<hr/>

	<label>7. Residency</label>
	<p>a. Is the address above your principal place of residence?</p>
	<div class="radio">
		<label><input type="radio" name="AddrRes" value="Y" required />Yes</label>
		<label><input type="radio" name="AddrRes" value="N"/>No</label>
	</div>

	<p><strong><em>
	NOTE: Two (2) proofs of residency MUST accompany this application. See Instructions.
	<br/>
	NO HOME ADDRESS DECLARATION &#45; If you do not have a home address, have a case manager/social worker provide support
	documentation on facility letterhead.
	</em></strong></p>

	<hr/>

	<div class="form-group">
		<label for="SSNum">8. What is your Social Security Number (if you have one)?</label>
		<input type="text" class="form-control" id="SSNum" name="SSNum"   maxlength="9" value="<cfoutput>#subformData.SSNum#</cfoutput>" />
	</div>
	<div class="form-group">
		<label for="USCitizen">9. Are you a U.S. citizen? (Responding to this question will not affect your eligibility for ADDP.)</label>
		<div class="radio">
			<label><input type="radio" name="USCitizen" value="Y" required />Yes</label>
			<label><input type="radio" name="USCitizen" value="N"/>No</label>
		</div>
	</div>

	<hr/>

	<div class="form-group">
		<label for="veteran">10. Are you a veteran?</label>
		<div class="radio">
			<label><input type="radio" name="veteran" value="Y" required />Yes</label>
			<label><input type="radio" name="veteran" value="N"/>No</label>
		</div>
	</div>

	<hr/>

	<div class="form-group">
		<label for="relationship" >11. Relationship Status</label>
		<select class="form-control" name="relationship" required >
			<option selected>Select one</option>
			<option value="Single">Single</option>
			<option value="Married">Married</option>
			<option value="Civil Union">Civil Union</option>
			<option value="Domestic Partner">Domestic Partner</option>
			<option value="Divorced">Divorced</option>
			<option value="Widowed">Widowed</option>
			<option value="Separated">*Separated</option>
		</select>
		<em><span style="color: red;">*(See instructions, Page 1. Applicant information.)</span></em>
	</div>

	<hr/>

	<div class="form-group">
		<label for="gender">12. Gender</label>
		<select class="form-control" name="gender" required >
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
		<label class="radio-inline"><input type="radio" name="genderBirth" value="Male" required />Male</label>
		<label class="radio-inline"><input type="radio" name="genderBirth" value="Female"/>Female</label>
	</div>

	<hr/>
	
	<strong>14. Race</strong>
	<br/>
	<div>
		<label class="checkbox-inline"><input type="checkbox" name="RWhite" value="Y"/>White</label>
		<label class="checkbox-inline"><input type="checkbox" name="RBlack" value="Y"/>Black</label>
		<label class="checkbox-inline"><input type="checkbox" name="RAsian" value="Y"/>Asian</label>
		<label class="checkbox-inline"><input type="checkbox" name="RAmInd" value="Y"/>Amercan Indian/Alaskan Native</label>
		<label class="checkbox-inline"><input type="checkbox" name="RNatHa" value="Y"/>Native Hawaiian/Pacific Islander</label>
		<label class="checkbox-inline"><input type="checkbox" name="RUnk" value="Y"/>Unknown</label>
	</div>

	<div class="form-group" id="RasianOption">
		<label class="checkbox-inline"><input type="checkbox" name="Asind" value="Y"/>Asian Indian</label>
		<label class="checkbox-inline"><input type="checkbox" name="AJap" value="Y"/>Japanese</label>
		<label class="checkbox-inline"><input type="checkbox" name="AFilipino" value="Y"/>Filipino</label>
		<label class="checkbox-inline"><input type="checkbox" name="AChinese" value="Y"/>Chinese</label>
		<label class="checkbox-inline"><input type="checkbox" name="AKorean" value="Y"/>Korean</label>
		<label class="checkbox-inline"><input type="checkbox" name="AViet" value="Y"/>Vietnamese</label>
		<label class="checkbox-inline"><input type="checkbox" name="AOther" value="Y"/>OtherAsian</label>
	</div>

	<div class="form-group" id="RNatHaOption">
		<label class="checkbox-inline"><input type="checkbox" name="NHNatHa" value="Y"/>Native Hawaiian</label>
		<label class="checkbox-inline"><input type="checkbox" name="NHGua" value="Y"/>Guamanian or Chamorro</label>
		<label class="checkbox-inline"><input type="checkbox" name="NHSam" value="Y"/>Samoan</label>
		<label class="checkbox-inline"><input type="checkbox" name="NHOther" value="Y"/>Other Pacific Islander</label>
	</div>

	<hr/>

	<div class="form-group">
		<label>15. Ethnicity</label>
		<br/>
		<label class="radio-inline"><input type="radio" name="EHisp" value="Y"/>Hispanic/Latino</label>
		<label class="radio-inline"><input type="radio" name="EHisp" value="N"/>Non-Hispanic</label>
	</div>
	
	<div class="form-group" id="EHispOption">
		<label class="checkbox-inline"><input type="checkbox" name="HispLat" value="MexAmChi"/>Mexican, Mexican American, or Chicano/a</label>
		<label class="checkbox-inline"><input type="checkbox" name="HispLat" value="PuertoRican"/>Puerto Rican</label>
		<label class="checkbox-inline"><input type="checkbox" name="HispLat" value="Cuban"/>Cuban</label>
		<label class="checkbox-inline"><input type="checkbox" name="HispLat" value="OtherHisp"/>Other Hispanic, Latino/a, or Spanish Origin</label>
	</div>
	
	<div class="form-group" id="preg">
		<label>16. Female Applicants Only:</label>
		<br/>
		<label for="pregnant">Are you pregnant?</label>
		<br/>
		<label class="radio-inline"><input type="radio" name="preg" value="Y" required /> Yes</label>
		<label class="radio-inline"><input type="radio" name="preg" value="N"/> No</label>
	</div>

	<div class="text-center">
		<button type="submit" class="btn btn-default" name="previous" value="prevous">Previous</button>
		<button type="submit" class="btn btn-default" name="save" value="save">Save Progress &#38; Exit</button>
		<button type="submit" class="btn btn-default" name="next" value="next">Next</button>
	</div>
	</form>
</div>
</body>
</html>