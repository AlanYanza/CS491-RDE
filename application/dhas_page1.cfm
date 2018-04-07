<!-- Session Page Protection -->
<cfset SessionClass=createObject('component',"CS491-RDE.components.SessionTools")/>
<cfset SessionClass.checkIfLoggedIn()>
<cfset SessionClass.checkIfuser()>
<!-- If appID is not sent via url passing, redirects back to user home page -->
<cfif isDefined('url.appID')>
	<!-- create a session variable for appID -->
	<cfset session.appID=url.appID>
</cfif>
<!-- More Session Page Protection -->
<cfset SessionClass.NoAppIDRedirect()>
<cfset SessionClass.validateAppID()>
<cfset tableName='NJSection1'/>
<cfset subformClass=createObject('component','CS491-RDE.components.Subform').init('NJ',session.userID,tableName,session.appID)/>
<cfset subformClass.noAccessRedirect('/CS491-RDE/home.cfm')/>
<!-- Application Page preprocessing -->
<cfset subformClass.createSubformData()/>
<cfset subformData=subformClass.retrieveDataForSubform()/>
<cfset HICPStatus=subformClass.retrieveHICPStatus()/>
<!-- Determine Flag(reviewing or editing) -->


<!DOCTYPE html>
<html lang="en">
<head>
	<title>Application</title>
	<cfinclude template="../head.cfm"/>
	<script>
		"use strict";
		$(document).ready(function(){
			$('[data-toggle="popover"]').popover();

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
					$("#MStreet").attr("readonly", true);
					$("#MaptNum").attr("readonly", true);
					$("#MCity").attr("readonly", true);
					$("#MState").attr("readonly", true);
					$("#MZip").attr("readonly", true);
					$("#MCounty").attr("readonly", true);
				}
				else {
					$("#MStreet").removeAttr("readonly");
					$("#MaptNum").removeAttr("readonly");
					$("#MCity").removeAttr("readonly");
					$("#MState").removeAttr("readonly");
					$("#MZip").removeAttr("readonly");
					$("#MCounty").removeAttr("readonly");
				}
			});

			$("button[type=button][name=reveal]").click(function() {
				$("#SSNum").attr("type", "text");
				setTimeout(function() {
				    $("#SSNum").attr("type", "password");
				}, 3000);
			});

			function asianCheck() {
				if ($("input[type=checkbox][name=RAsian]").is(":checked")) {
					$("#RasianOption").show("slow");
				}
				else {
					$("#RasianOption").hide("slow");
				}
			}

			function RNatHaCheck() {
				if ($("input[type=checkbox][name=RNatHa]").is(":checked")) {
					$("#RNatHaOption").show("slow");
				}
				else {
					$("#RNatHaOption").hide("slow");
				}
			}

			function EHispCheck() {
				if (typeof $("input[type=radio][name=EHisp]:checked").val() === "undefined") {
					$("#EHispOption").hide("slow");
					return;
				}

				if ($("input[type=radio][name=EHisp]:checked").val() == "Y") {
					$("#EHispOption").show("slow");
				}					
				else {
					$("#EHispOption").hide("slow");
				}
			}

			function pregnant() {
				if (typeof $("input[type=radio][name=genderBirth]:checked").val() === "undefined") {
					return;
				}
				if ($("input[type=radio][name=genderBirth]:checked").val().toLowerCase() == "m") {
					$("#preg").hide("slow");
					$("#preg").children().removeAttr("required");
				}
				else {
					$("#preg").show("slow");
					$("#preg").children().attr("required", "true");
				}
			}

			$("button[type=submit][name=save]").click(function() {
				$("form").find("input").removeAttr("required");
			});
			$("button[type=submit][name=previous]").click(function() {
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

			/*
			$("button[type=button][name=next]").click(function() {
				if(($("select[name=state]").val() == "X") || ($("select[name=MState]").val() == "X")) {
					document.getElementById("state").validity;
					console.log($("form").serialize());
				}				
				//$('form').submit();
			});
			*/
		});
		$(document).keypress(function(event){
				if (event.which == '13') {
					event.preventDefault();
				}
			}
		);
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
			<input type="checkbox" name="HICP" value="HICP" <cfif HICPStatus eq 'Y'><cfoutput>checked</cfoutput></cfif>/> I am also applying for HICP
		</div>
	<div class="well text-center"><h4>Section 1 - APPLICANT INCOME</h4></div>

	<div class="row">
		<div class="col-sm-4"><div class="form-group">
			<label for="LName">Last Name <span style="color: red;">*</span></label>
			<input type="text" class="form-control" id="LName" name="LName" value="<cfoutput>#subformData.LName#</cfoutput>" required /></div></div>
		<div class="col-sm-4"><div class="form-group">
			<label for="FName">First Name <span style="color: red;">*</span></label>
			<input type="text" class="form-control" id="FName" name="FName" value="<cfoutput>#subformData.FName#</cfoutput>" required /></div></div>
		<div class="col-sm-2"><div class="form-group">
			<label for="MName">MI</label>
			<input type="text" class="form-control" id="MName" name="MName" value="<cfoutput>#subformData.MName#</cfoutput>" /></div></div>
		<div class="col-sm-2"><div class="form-group">
			<label for="DateBirth">Date of Birth <span style="color: red;">*</span></label>
			<input type="date" class="form-control" name="DateBirth" value="<cfoutput>#subformData.DateBirth#</cfoutput>" required /></div></div>
	</div>

	<div class="row">
		<div class="col-sm-9"><div class="form-group">
			<label for="street">Street Address <span style="color: red;">*</span></label>
			<input type="text" class="form-control" id="street" name="street" value="<cfoutput>#subformData.street#</cfoutput>" required />
		</div></div>
		<div class="col-sm-3"><div class="form-group">
			<label for="aptNum">Apt. #</label>
			<input type="text" class="form-control" id="aptNum" name="aptNum" value="<cfoutput>#subformData.aptNum#</cfoutput>"/>
		</div></div>
	</div>

	<div class="row">
		<div class="col-sm-3"><div class="form-group"><label for="city">City <span style="color: red;">*</span></label>
			<input type="text" class="form-control" id="city" name="city" value="<cfoutput>#subformData.city#</cfoutput>" required /></div></div>
		<div class="col-sm-3"><label for="state">State <span style="color: red;">*</span></label>
			<select class="form-control" id="state" name="state" required />
				<option value="X" <cfset subformClass.showSelectionField('state',subformData,'X')/>>Select one</option>
				<option value="AL" <cfset subformClass.showSelectionField('state',subformData,'AL')/>>AL - Alabama</option>
				<option value="AK" <cfset subformClass.showSelectionField('state',subformData,'AK')/>>AK - Alaska</option>
				<option value="AZ" <cfset subformClass.showSelectionField('state',subformData,'AZ')/>>AZ - Arizona</option>
				<option value="AR" <cfset subformClass.showSelectionField('state',subformData,'AR')/>>AR - Arkansas</option>
				<option value="CA" <cfset subformClass.showSelectionField('state',subformData,'CA')/>>CA - California</option>
				<option value="CO" <cfset subformClass.showSelectionField('state',subformData,'CO')/>>CO - Colorado</option>
				<option value="CT" <cfset subformClass.showSelectionField('state',subformData,'CT')/>>CT - Connecticut</option>
				<option value="DC" <cfset subformClass.showSelectionField('state',subformData,'DC')/>>DC - District of Columbia</option>
				<option value="DE" <cfset subformClass.showSelectionField('state',subformData,'DE')/>>DE - Delaware</option>
				<option value="FL" <cfset subformClass.showSelectionField('state',subformData,'FL')/>>FL - Florida</option>
				<option value="GA" <cfset subformClass.showSelectionField('state',subformData,'GA')/>>GA - Georgia</option>
				<option value="HI" <cfset subformClass.showSelectionField('state',subformData,'HI')/>>HI - Hawaii</option>
				<option value="ID" <cfset subformClass.showSelectionField('state',subformData,'ID')/>>ID - Idaho</option>
				<option value="IL" <cfset subformClass.showSelectionField('state',subformData,'IL')/>>IL - Illinois</option>
				<option value="IN" <cfset subformClass.showSelectionField('state',subformData,'IN')/>>IN - Indiana</option>
				<option value="IA" <cfset subformClass.showSelectionField('state',subformData,'IA')/>>IA - Iowa</option>
				<option value="KS" <cfset subformClass.showSelectionField('state',subformData,'KS')/>>KS - Kansas</option>
				<option value="KY" <cfset subformClass.showSelectionField('state',subformData,'KY')/>>KY - Kentucky</option>
				<option value="LA" <cfset subformClass.showSelectionField('state',subformData,'LA')/>>LA - Louisiana</option>
				<option value="ME" <cfset subformClass.showSelectionField('state',subformData,'ME')/>>ME - Maine</option>
				<option value="MD" <cfset subformClass.showSelectionField('state',subformData,'MD')/>>MD - Maryland</option>
				<option value="MA" <cfset subformClass.showSelectionField('state',subformData,'MA')/>>MA - Massachusetts</option>
				<option value="MI" <cfset subformClass.showSelectionField('state',subformData,'MI')/>>MI - Michigan</option>
				<option value="MN" <cfset subformClass.showSelectionField('state',subformData,'MN')/>>MN - Minnesota</option>
				<option value="MS" <cfset subformClass.showSelectionField('state',subformData,'MS')/>>MS - Mississippi</option>
				<option value="MO" <cfset subformClass.showSelectionField('state',subformData,'MO')/>>MO - Missouri</option>
				<option value="MT" <cfset subformClass.showSelectionField('state',subformData,'MT')/>>MT - Montana</option>
				<option value="NE" <cfset subformClass.showSelectionField('state',subformData,'NE')/>>NE - Nebraska</option>
				<option value="NV" <cfset subformClass.showSelectionField('state',subformData,'NV')/>>NV - Nevada</option>
				<option value="NH" <cfset subformClass.showSelectionField('state',subformData,'NH')/>>NH - New Hampshire</option>
				<option value="NJ" <cfset subformClass.showSelectionField('state',subformData,'NJ')/>>NJ - New Jersey</option>
				<option value="NM" <cfset subformClass.showSelectionField('state',subformData,'NM')/>>NM - New Mexico</option>
				<option value="NY" <cfset subformClass.showSelectionField('state',subformData,'NY')/>>NY - New York</option>
				<option value="NC" <cfset subformClass.showSelectionField('state',subformData,'NC')/>>NC - North Carolina</option>
				<option value="ND" <cfset subformClass.showSelectionField('state',subformData,'ND')/>>ND - North Dakota</option>
				<option value="OH" <cfset subformClass.showSelectionField('state',subformData,'OH')/>>OH - Ohio</option>
				<option value="OK" <cfset subformClass.showSelectionField('state',subformData,'OK')/>>OK - Oklahoma</option>
				<option value="OR" <cfset subformClass.showSelectionField('state',subformData,'OR')/>>OR - Oregon</option>
				<option value="PA" <cfset subformClass.showSelectionField('state',subformData,'PA')/>>PA - Pennsylvania</option>
				<option value="PR" <cfset subformClass.showSelectionField('state',subformData,'PR')/>>PR - Puerto Rico</option>
				<option value="RI" <cfset subformClass.showSelectionField('state',subformData,'RI')/>>RI - Rhode Island</option>
				<option value="SC" <cfset subformClass.showSelectionField('state',subformData,'SC')/>>SC - South Carolina</option>
				<option value="SD" <cfset subformClass.showSelectionField('state',subformData,'SD')/>>SD - South Dakota</option>
				<option value="TN" <cfset subformClass.showSelectionField('state',subformData,'TN')/>>TN - Tennessee</option>
				<option value="TX" <cfset subformClass.showSelectionField('state',subformData,'TX')/>>TX - Texas</option>
				<option value="UT" <cfset subformClass.showSelectionField('state',subformData,'UT')/>>UT - Utah</option>
				<option value="VT" <cfset subformClass.showSelectionField('state',subformData,'VT')/>>VT - Vermont</option>
				<option value="VA" <cfset subformClass.showSelectionField('state',subformData,'VA')/>>VA - Virginia</option>
				<option value="WA" <cfset subformClass.showSelectionField('state',subformData,'WA')/>>WA - Washington</option>
				<option value="WV" <cfset subformClass.showSelectionField('state',subformData,'WV')/>>WV - West Virginia</option>
				<option value="WI" <cfset subformClass.showSelectionField('state',subformData,'WI')/>>WI - Wisconsin</option>
				<option value="WY" <cfset subformClass.showSelectionField('state',subformData,'WY')/>>WY - Wyoming</option>
			</select>
		</div>
		<div class="col-sm-3"><div class="form-group"><label for="zip">Zip Code <span style="color: red;">*</span></label>
			<input type="text" class="form-control" id="zip" name="zip" value="<cfoutput>#subformData.zip#</cfoutput>" required /></div></div>
		<div class="col-sm-3"><div class="form-group">
			<label for="County">County <span style="color: red;">*</span></label>
			<input type="text" class="form-control" id="County" name="County" value="<cfoutput>#subformData.county#</cfoutput>" required /></div></div>
	</div>

	<hr/>

	<div class="row">
		<div class="col-sm-9"><div class="form-group">
			<label for="MStreet">Mailing Address <span style="color: red;">*</span></label>
			<label class="checkbox-inline"><input type="checkbox" id="same"/>Same as above</label>
			<input type="text" class="form-control" id="MStreet" name="MStreet" value="<cfoutput>#subformData.MStreet#</cfoutput>" required />
		</div></div>
		<div class="col-sm-3"><div class="form-group">
			<label for="MaptNum">Apt. #</label>
			<input type="text" class="form-control" id="MaptNum" name="MaptNum" value="<cfoutput>#subformData.MaptNum#</cfoutput>">
		</div></div>
	</div>

	<div class="row">
		<div class="col-sm-3"><div class="form-group"><label for="MCity">City <span style="color: red;">*</span></label>
			<input type="text" class="form-control" id="MCity" name="MCity" value="<cfoutput>#subformData.MCity#</cfoutput>" required /></div></div>
		<div class="col-sm-3"><label for="MState">State <span style="color: red;">*</span></label>
			<select class="form-control" id="MState" name="MState" required />
				<option value="X" <cfset subformClass.showSelectionField('MState',subformData,'X')/>>Select one</option>
				<option value="AL" <cfset subformClass.showSelectionField('MState',subformData,'AL')/>>AL - Alabama</option>
				<option value="AK" <cfset subformClass.showSelectionField('MState',subformData,'AK')/>>AK - Alaska</option>
				<option value="AZ" <cfset subformClass.showSelectionField('MState',subformData,'AZ')/>>AZ - Arizona</option>
				<option value="AR" <cfset subformClass.showSelectionField('MState',subformData,'AR')/>>AR - Arkansas</option>
				<option value="CA" <cfset subformClass.showSelectionField('MState',subformData,'CA')/>>CA - California</option>
				<option value="CO" <cfset subformClass.showSelectionField('MState',subformData,'CO')/>>CO - Colorado</option>
				<option value="CT" <cfset subformClass.showSelectionField('MState',subformData,'CT')/>>CT - Connecticut</option>
				<option value="DC" <cfset subformClass.showSelectionField('MState',subformData,'DC')/>>DC - District of Columbia</option>
				<option value="DE" <cfset subformClass.showSelectionField('MState',subformData,'DE')/>>DE - Delaware</option>
				<option value="FL" <cfset subformClass.showSelectionField('MState',subformData,'FL')/>>FL - Florida</option>
				<option value="GA" <cfset subformClass.showSelectionField('MState',subformData,'GA')/>>GA - Georgia</option>
				<option value="HI" <cfset subformClass.showSelectionField('MState',subformData,'HI')/>>HI - Hawaii</option>
				<option value="ID" <cfset subformClass.showSelectionField('MState',subformData,'ID')/>>ID - Idaho</option>
				<option value="IL" <cfset subformClass.showSelectionField('MState',subformData,'IL')/>>IL - Illinois</option>
				<option value="IN" <cfset subformClass.showSelectionField('MState',subformData,'IN')/>>IN - Indiana</option>
				<option value="IA" <cfset subformClass.showSelectionField('MState',subformData,'IA')/>>IA - Iowa</option>
				<option value="KS" <cfset subformClass.showSelectionField('MState',subformData,'KS')/>>KS - Kansas</option>
				<option value="KY" <cfset subformClass.showSelectionField('MState',subformData,'KY')/>>KY - Kentucky</option>
				<option value="LA" <cfset subformClass.showSelectionField('MState',subformData,'LA')/>>LA - Louisiana</option>
				<option value="ME" <cfset subformClass.showSelectionField('MState',subformData,'ME')/>>ME - Maine</option>
				<option value="MD" <cfset subformClass.showSelectionField('MState',subformData,'MD')/>>MD - Maryland</option>
				<option value="MA" <cfset subformClass.showSelectionField('MState',subformData,'MA')/>>MA - Massachusetts</option>
				<option value="MI" <cfset subformClass.showSelectionField('MState',subformData,'MI')/>>MI - Michigan</option>
				<option value="MN" <cfset subformClass.showSelectionField('MState',subformData,'MN')/>>MN - Minnesota</option>
				<option value="MS" <cfset subformClass.showSelectionField('MState',subformData,'MS')/>>MS - Mississippi</option>
				<option value="MO" <cfset subformClass.showSelectionField('MState',subformData,'MO')/>>MO - Missouri</option>
				<option value="MT" <cfset subformClass.showSelectionField('MState',subformData,'MT')/>>MT - Montana</option>
				<option value="NE" <cfset subformClass.showSelectionField('MState',subformData,'NE')/>>NE - Nebraska</option>
				<option value="NV" <cfset subformClass.showSelectionField('MState',subformData,'NV')/>>NV - Nevada</option>
				<option value="NH" <cfset subformClass.showSelectionField('MState',subformData,'NH')/>>NH - New Hampshire</option>
				<option value="NJ" <cfset subformClass.showSelectionField('MState',subformData,'NJ')/>>NJ - New Jersey</option>
				<option value="NM" <cfset subformClass.showSelectionField('MState',subformData,'NM')/>>NM - New Mexico</option>
				<option value="NY" <cfset subformClass.showSelectionField('MState',subformData,'NY')/>>NY - New York</option>
				<option value="NC" <cfset subformClass.showSelectionField('MState',subformData,'NJ')/>>NC - North Carolina</option>
				<option value="ND" <cfset subformClass.showSelectionField('MState',subformData,'ND')/>>ND - North Dakota</option>
				<option value="OH" <cfset subformClass.showSelectionField('MState',subformData,'OH')/>>OH - Ohio</option>
				<option value="OK" <cfset subformClass.showSelectionField('MState',subformData,'OK')/>>OK - Oklahoma</option>
				<option value="OR" <cfset subformClass.showSelectionField('MState',subformData,'OR')/>>OR - Oregon</option>
				<option value="PA" <cfset subformClass.showSelectionField('MState',subformData,'PA')/>>PA - Pennsylvania</option>
				<option value="PR" <cfset subformClass.showSelectionField('MState',subformData,'PR')/>>PR - Puerto Rico</option>
				<option value="RI" <cfset subformClass.showSelectionField('MState',subformData,'RI')/>>RI - Rhode Island</option>
				<option value="SC" <cfset subformClass.showSelectionField('MState',subformData,'SC')/>>SC - South Carolina</option>
				<option value="SD" <cfset subformClass.showSelectionField('MState',subformData,'SD')/>>SD - South Dakota</option>
				<option value="TN" <cfset subformClass.showSelectionField('MState',subformData,'TN')/>>TN - Tennessee</option>
				<option value="TX" <cfset subformClass.showSelectionField('MState',subformData,'TX')/>>TX - Texas</option>
				<option value="UT" <cfset subformClass.showSelectionField('MState',subformData,'UT')/>>UT - Utah</option>
				<option value="VT" <cfset subformClass.showSelectionField('MState',subformData,'VT')/>>VT - Vermont</option>
				<option value="VA" <cfset subformClass.showSelectionField('MState',subformData,'VA')/>>VA - Virginia</option>
				<option value="WA" <cfset subformClass.showSelectionField('MState',subformData,'WA')/>>WA - Washington</option>
				<option value="WV" <cfset subformClass.showSelectionField('MState',subformData,'WV')/>>WV - West Virginia</option>
				<option value="WI" <cfset subformClass.showSelectionField('MState',subformData,'WI')/>>WI - Wisconsin</option>
				<option value="WY" <cfset subformClass.showSelectionField('MState',subformData,'WY')/>>WY - Wyoming</option>
			</select>
		</div>
		<div class="col-sm-3"><div class="form-group"><label for="MZip">Zip Code <span style="color: red;">*</span></label>
			<input type="text" class="form-control" id="MZip" name="MZip" value="<cfoutput>#subformData.MZip#</cfoutput>" required />
		</div></div>
		<div class="col-sm-3"><div class="form-group">
			<label for="MCounty">County <span style="color: red;">*</span></label>
			<input type="text" class="form-control" id="MCounty" name="MCounty" value="<cfoutput>#subformData.MCounty#</cfoutput>" required />
		</div></div>
	</div>

	<hr/>

	<strong>Applicant's Telephone Numbers:</strong>
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
		<label class="checkbox-inline"><input type="checkbox" name="VHomeMsgPerm" value="Y" <cfset subformClass.showCheckbox('VHomeMsgPerm',subformData)/>/>
		Home Phone</label>
		<label class="checkbox-inline"><input type="checkbox" name="VCellMsgPerm" value="Y" <cfset subformClass.showCheckbox('VCellMsgPerm',subformData)/>/>Cell Phone</label>
		<label class="checkbox-inline"><input type="checkbox" name="VWorkMsgPerm" value="Y" <cfset subformClass.showCheckbox('VWorkMsgPerm',subformData)/>/>Work Phone</label>
	<p><strong>I do not have a phone but my alternate contact and/or case manager may be contacted and message left?</strong>
	</p>	
	<div class="radio">
		<label><input type="radio" name="AltComPerm" value="Y" <cfset subformClass.showRadioButton('AltComPerm',subformData,'Y')/>/>Yes</label>
		<label><input type="radio" name="AltComPerm" value="N" <cfset subformClass.showRadioButton('AltComPerm',subformData,'N')/>/>No</label>
	</div>
	<p><strong>Note: please provide alternate contact information on Page 4</strong></p>

	<hr/>

	<label>Residency</label>
	<p>Is the address above your principal place of residence? <span style="color: red;">*</span></p>
	<div class="radio">
		<label><input type="radio" name="AddrRes" value="Y" <cfset subformClass.showRadioButton('AddrRes',subformData,'Y')/> required />Yes</label>
		<label><input type="radio" name="AddrRes" value="N"<cfset subformClass.showRadioButton('AddrRes',subformData,'N')/>/>No</label>
	</div>

	<p><strong><em>
	NOTE: Two (2) proofs of residency MUST accompany this application. See Instructions.
	<br/>
	NO HOME ADDRESS DECLARATION &#45; If you do not have a home address, have a case manager/social worker provide support
	documentation on facility letterhead.
	</em></strong></p>

	<hr/>

	<label for="SSNum">What is your Social Security Number (if you have one)?</label>
	<div class="form-group row">
		<div class="col-sm-2">			
			<input type="password" class="form-control" id="SSNum" name="SSNum"  maxlength="11" value="<cfoutput>#subformData.SSNum#</cfoutput>" />
		</div>
		<div class="col-sm-10">
			<button type="button" class="btn btn-default" name="reveal">View SSN</button>
		</div>
	</div>
	<div class="form-group">
		<label for="USCitizen">Are you a U.S. citizen? (Responding to this question will not affect your eligibility for ADDP.) <span style="color: red;">*</span></label>
		<div class="radio">
			<label><input type="radio" name="USCitizen" value="Y" <cfset subformClass.showRadioButton('USCitizen',subformData,'Y')/> required />Yes</label>
			<label><input type="radio" name="USCitizen" value="N" <cfset subformClass.showRadioButton('USCitizen',subformData,'N')/>/>No</label>
		</div>
	</div>

	<hr/>

	<div class="form-group">
		<label for="veteran">Are you a veteran? <span style="color: red;">*</span></label>
		<div class="radio">
			<label><input type="radio" name="veteran" value="Y" <cfset subformClass.showRadioButton('veteran',subformData,'Y')/> required />Yes</label>
			<label><input type="radio" name="veteran" value="N" <cfset subformClass.showRadioButton('veteran',subformData,'N')/>/>No</label>
		</div>
	</div>

	<hr/>

	<div class="form-group">
		<label for="relationship" >Relationship Status <span style="color: red;">*</span></label>
		<select class="form-control" name="RelStatus" required >
			<option value='X' <cfset subformClass.showSelectionField('RelStatus',subformData,'X')/>>Select one</option>
			<option value="S" <cfset subformClass.showSelectionField('RelStatus',subformData,'S')/>>Single</option>
			<option value="M" <cfset subformClass.showSelectionField('RelStatus',subformData,'M')/>>Married</option>
			<option value="C" <cfset subformClass.showSelectionField('RelStatus',subformData,'C')/>>Civil Union</option>
			<option value="DP" <cfset subformClass.showSelectionField('RelStatus',subformData,'DP')/>>Domestic Partner</option>
			<option value="D" <cfset subformClass.showSelectionField('RelStatus',subformData,'D')/>>Divorced</option>
			<option value="W" <cfset subformClass.showSelectionField('RelStatus',subformData,'W')/>>Widowed</option>
			<option value="SP" <cfset subformClass.showSelectionField('RelStatus',subformData,'SP')/>>*Separated</option>
		</select>
		<em>*(See instructions)</span></em>
		<a href="javascript:void(0)" data-toggle="popover" data-trigger="focus" title="DOMESTIC STATUS:" data-html="true" data-content='
			Check &#34separated&#34 if:<br/>
			(1) You and your spouse/partner live apart AND if you do not have access to, or receive support from, your spouse&#39s/partner&#39s income;<br/>
			(2) Your spouse/partner has been confined to a long-term care or psychiatric institution for at least 30 days prior to this application.<br/>
			<strong>If you check &#34separated,&#34 please fill out and send in DHAS-40 Certification of Separation.</strong>''>
			<span class="glyphicon glyphicon-info-sign"></span>
		</a>
	</div>

	<hr/>

	<div class="form-group">
		<label for="gender">Gender <span style="color: red;">*</span></label>
		<select class="form-control" name="gender" required >
			<option value="X" <cfset subformClass.showSelectionField('gender',subformData,'X')/>>Select one</option>
			<option value="M" <cfset subformClass.showSelectionField('gender',subformData,'M')/>>Male</option>
			<option value="F" <cfset subformClass.showSelectionField('gender',subformData,'F')/>>Female</option>
			<option value="TMF" <cfset subformClass.showSelectionField('gender',subformData,'TMF')/>>Transgendered Male to Female</option>
			<option value="TFM" <cfset subformClass.showSelectionField('gender',subformData,'TFM')/>>Transgendered Female to Male</option>
		</select>
	</div>

	<hr/>

	<div class="form-group">
		<label>Gender at Birth <span style="color: red;">*</span></label>
		<br/>
		<label class="radio-inline"><input type="radio" name="genderBirth" value="M" <cfset subformClass.showRadioButton('genderBirth',subformData,'M')/> required />Male</label>
		<label class="radio-inline"><input type="radio" name="genderBirth" value="F" <cfset subformClass.showRadioButton('genderBirth',subformData,'F')/>/>Female</label>
	</div>

	<hr/>
	
	<strong>Race </strong> <span style="color: red;">*</span>
	<br/>
	<div>
		<label class="checkbox-inline"><input type="checkbox" name="RWhite" value="Y" <cfset subformClass.showCheckbox('RWhite',subformData)/>/>White</label>
		<label class="checkbox-inline"><input type="checkbox" name="RBlack" value="Y" <cfset subformClass.showCheckbox('RBlack',subformData)/>/>Black</label>
		<label class="checkbox-inline"><input type="checkbox" name="RAsian" value="Y" <cfset subformClass.showCheckbox('RAsian',subformData)/>/>Asian</label>
		<label class="checkbox-inline"><input type="checkbox" name="RAmInd" value="Y" <cfset subformClass.showCheckbox('RAmInd',subformData)/>/>Amercan Indian/Alaskan Native</label>
		<label class="checkbox-inline"><input type="checkbox" name="RNatHa" value="Y" <cfset subformClass.showCheckbox('RNatHa',subformData)/>/>Native Hawaiian/Pacific Islander</label>
		<label class="checkbox-inline"><input type="checkbox" name="RUnk" value="Y" <cfset subformClass.showCheckbox('RUnk',subformData)/>/>Unknown</label>
	</div>

	<div class="form-group" id="RasianOption">
		<label class="checkbox-inline"><input type="checkbox" name="AAsind" value="Y" <cfset subformClass.showCheckbox('AAsind',subformData)/>/>Asian Indian</label>
		<label class="checkbox-inline"><input type="checkbox" name="AJap" value="Y" <cfset subformClass.showCheckbox('AJap',subformData)/>/>Japanese</label>
		<label class="checkbox-inline"><input type="checkbox" name="AFilipino" value="Y" <cfset subformClass.showCheckbox('AFilipino',subformData)/>/>Filipino</label>
		<label class="checkbox-inline"><input type="checkbox" name="AChinese" value="Y" <cfset subformClass.showCheckbox('AChinese',subformData)/>/>Chinese</label>
		<label class="checkbox-inline"><input type="checkbox" name="AKorean" value="Y" <cfset subformClass.showCheckbox('AKorean',subformData)/>/>Korean</label>
		<label class="checkbox-inline"><input type="checkbox" name="AViet" value="Y" <cfset subformClass.showCheckbox('AViet',subformData)/>/>Vietnamese</label>
		<label class="checkbox-inline"><input type="checkbox" name="AOther" value="Y" <cfset subformClass.showCheckbox('AOther',subformData)/>/>OtherAsian</label>
	</div>

	<div class="form-group" id="RNatHaOption">
		<label class="checkbox-inline"><input type="checkbox" name="NHNatHaw" value="Y" <cfset subformClass.showCheckbox('NHNatHaw',subformData)/>/>Native Hawaiian</label>
		<label class="checkbox-inline"><input type="checkbox" name="NHGua" value="Y" <cfset subformClass.showCheckbox('NHGua',subformData)/>/>Guamanian or Chamorro</label>
		<label class="checkbox-inline"><input type="checkbox" name="NHSam" value="Y" <cfset subformClass.showCheckbox('NHSam',subformData)/>/>Samoan</label>
		<label class="checkbox-inline"><input type="checkbox" name="NHOther" value="Y" <cfset subformClass.showCheckbox('NHOther',subformData)/>/>Other Pacific Islander</label>
	</div>

	<hr/>

	<div class="form-group">
		<label>Ethnicity <span style="color: red;">*</span></label>
		<br/>
		<label class="radio-inline"><input type="radio" name="EHisp" value="Y" <cfset subformClass.showRadioButton('EHisp',subformData,'Y')/>/>Hispanic/Latino</label>
		<label class="radio-inline"><input type="radio" name="EHisp" value="N" <cfset subformClass.showRadioButton('EHisp',subformData,'N')/>/>Non-Hispanic</label>
	</div>
	
	<div class="form-group" id="EHispOption">
		<label class="checkbox-inline"><input type="checkbox" name="HispMex" value="Y" <cfset subformClass.showCheckbox('HispMex',subformData)/>/>Mexican, Mexican American, or Chicano/a</label>
		<label class="checkbox-inline"><input type="checkbox" name="HispPR" value="Y" <cfset subformClass.showCheckbox('HispPR',subformData)/>/>Puerto Rican</label>
		<label class="checkbox-inline"><input type="checkbox" name="HispCub" value="Y" <cfset subformClass.showCheckbox('HispCub',subformData)/>/>Cuban</label>
		<label class="checkbox-inline"><input type="checkbox" name="HispOther" value="Y" <cfset subformClass.showCheckbox('HispOther',subformData)/>/>Other Hispanic, Latino/a, or Spanish Origin</label>
	</div>
	
	<div class="form-group" id="preg">
		<label>Female Applicants Only:</label>
		<br/>
		<label for="pregnant">Are you pregnant? <span style="color: red;">*</span></label>
		<br/>
		<label class="radio-inline"><input type="radio" name="preg" value="Y" <cfset subformClass.showRadioButton('preg',subformData,'Y')/> required /> Yes</label>
		<label class="radio-inline"><input type="radio" name="preg" value="N" <cfset subformClass.showRadioButton('preg',subformData,'N')/>/> No</label>
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