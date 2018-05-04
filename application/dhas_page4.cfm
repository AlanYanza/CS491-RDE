<!--- If user is not logged in, redirect them to login page --->
<cfset SessionClass=createObject('component',"CS491-RDE.components.SessionTools")/>
<cfset SessionClass.checkIfLoggedIn()/>
<cfif isDefined('url.appID')>
	<!--- create a session variable for appID --->
	<cfset session.appID=url.appID>
</cfif>
<!--- If appID is not sent via url passing, redirects back to user home page --->
<cfset SessionClass.NoAppIDRedirect()>
<!--- If a user access level,checks to see appID set in session in valid --->
<cfif session.accessLevel neq 'admin'>
	<cfset SessionClass.validateAppID()>
</cfif>
<cfset tableName='NJSection3B'/>
<cfset subformClass=createObject('component','CS491-RDE.components.Subform').init('NJ',session.userID,tableName,session.appID)/>
<!--- Application Page pre-processing --->
<cfset subformClass.createSubformData()/>
<cfset subformData=subformClass.retrieveDataForSubform()/>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Application</title>
	<cfinclude template="../head.cfm"/>
	<script>
	  	"use strict";
  		
		$(document).ready(function(){
			<!--- Determine Flag(reviewing or editing) --->
			<cfif ((session.accessLevel eq 'admin') || (subformClass.isUserReview()))>
				<cfoutput>
					$("##formData").find("*").attr("disabled", "true");
					$("input[type=hidden][name=formPage]").removeAttr("disabled");
					$("input[type=hidden][name=tableName]").removeAttr("disabled");
				</cfoutput>
			</cfif>	

			$('[data-toggle="popover"]').popover();
			$("form").find("input").attr("autocomplete", "off");

			$("button[type=button][name=reveal]").click(function() {
				$("#InsSS").attr("type", "text");
				setTimeout(function() {
				    $("#InsSS").attr("type", "password");
				}, 3000);
			});

			function SSISSDICheck() {				
				if (($("input[type=radio][name=SSISSDIStatus]:checked").val() == "N") || ($("input[type=radio][name=SSISSDIStatus]:checked").val() == "U")) {
					$("#SSISSDIOption").hide("slow");
					$("#SSISSDIOption").find("input").removeAttr("required");
					$("#SSISSDIOption").find("input[type=date]").val("1111-11-11");
					$("#SSISSDIOption").find("input[type=text]").val("");
					$("#SSISSDIOption").find("input[type=number]").val(0);
					$("#SSISSDIOption").find("textarea").val("");
					$("#SSISSDIOption").find("input[type=checkbox]").prop("checked", false );
				}
				else {
					$("#SSISSDIOption").show("slow");					
				}
			}

			function marketCheck() {
				if (typeof $("input[type=radio][name=AMarket]:checked").val() === "undefined") {
					return;
				}				
				if (($("input[type=radio][name=AMarket]:checked").val() != "Y"))  {
					$("#marketOption").hide("slow");
					$("#marketOption").find("input").removeAttr("required");
				}
				else {
					$("#marketOption").show("slow");
				}
			}

			function dateCheck(unsureField, dateField) {
				if ($("input[type=checkbox][name=" + unsureField + "]").is(":checked")) {
					$("input[type=date][name=" + dateField + "]").val("1111-11-11");
					$("input[type=date][name=" + dateField + "]").attr("readonly", "true");
					$("input[type=date][name=" + dateField + "]").removeAttr("required");
				}
				else {
					$("input[type=date][name=" + dateField + "]").removeAttr("readonly");
					$("input[type=date][name=" + dateField + "]").attr("required", "true");
				}
			}

			function covOtherCheck() {
				if ($("input[type=checkbox][name=CovOther]").is(":checked")) {
					$("input[type=text][name=CovOtherTxt]").attr("required");
					$("input[type=text][name=CovOtherTxt]").show("slow");
				}
				else {
					$("input[type=text][name=CovOtherTxt]").hide();
					$("input[type=text][name=CovOtherTxt]").removeAttr("required", "true");
				}
			}
			
			function relationCheck() {
				$("input[type=text][name=relOther]").hide();
				$("input[type=text][name=relOther]").removeAttr("required", "true");

				if ($("input[type=radio][name=relation]:checked").val() == "S") {
					$("#insuredOption").hide("slow");
					$("#insuredOption").removeAttr("required", "true");
				}

				else if ($("input[type=radio][name=relation]:checked").val() == "O") {
					$("input[type=text][name=relOther]").attr("required");
					$("input[type=text][name=relOther]").show("slow");
					$("#insuredOption").show("slow");
					$("#insuredOption").attr("required", "true");
				}
				else {
					$("#insuredOption").show("slow");
					$("#insuredOption").attr("required", "true");
				}

			}

			SSISSDICheck();
			dateCheck("UASSISSDIDate", "ASSISSDIDate");
			marketCheck();
			dateCheck("UMarketDate", "AMarketDate");
			covOtherCheck();
			relationCheck();

			$("input[type=radio][name=SSISSDIStatus]").change(SSISSDICheck);
			$("input[type=checkbox][name=UASSISSDIDate]").click(function(){dateCheck("UASSISSDIDate", "ASSISSDIDate");});
			$("input[type=radio][name=AMarket]").change(marketCheck);
			$("input[type=checkbox][name=UMarketDate]").click(function(){dateCheck("UMarketDate", "AMarketDate");});
			$("input[type=checkbox][name=CovOther]").click(covOtherCheck);
			$("input[type=radio][name=relation]").change(relationCheck);

			$("button[type=submit][name=save]").click(function() {
				$("form").find("input").removeAttr("required");
			});
			$("button[type=submit][name=previous]").click(function() {
				$("form").find("input").removeAttr("required");
			});
			
			function insideTextArea(){
	  			if ($(event.target)[0]==$("textarea")[0] || $(event.target)[0]==$("textarea")[1] || $(event.target)[0]==$("textarea")[2]) {
					return true;
				}
				else {
					return false;
				}
			}
			
			$(document).keypress(
				function(event){
					//&& ($(event.target)[0]!=$("textarea")[0]) allows return in address textareas
					if (event.which == '13'  && insideTextArea()==false) {
						event.preventDefault();
					}
				}
			);
		});
		
	</script>
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
	<div id="formData">
	<input type="hidden" id="formPage" name="formPage" value="page3B"/>
	<input type="hidden" id="tableName" name="tableName" value="<cfoutput>#tableName#</cfoutput>"/>
	<strong>Are you apply or having applied for Social Security Income(SSI) or Social Security Income(SSDI)? <span style="color: red;">*</span></strong>
	<div class="radio">
		<label><input type="radio" name="SSISSDIStatus" value="YSSI" <cfset subformClass.showRadioButton('SSISSDIStatus',subformData,'YSSI')/> required />Yes for SSI</label>
		<label><input type="radio" name="SSISSDIStatus" value="YSSDI"<cfset subformClass.showRadioButton('SSISSDIStatus',subformData,'YSSDI')/>/>Yes for SSDI</label>
		<label><input type="radio" name="SSISSDIStatus" value="N"<cfset subformClass.showRadioButton('SSISSDIStatus',subformData,'N')/>/>No</label>
		<label><input type="radio" name="SSISSDIStatus" value="U"<cfset subformClass.showRadioButton('SSISSDIStatus',subformData,'U')/>/>Don't know</label>
	</div>

	<div id="SSISSDIOption">
		<div class="row">
			<label class="col-sm-4">When did you apply for SSI/SSDI? <span style="color: red;">*</span></label>
			<div class="col-sm-5">
				<input type="date" class="form-control" name="ASSISSDIDate" value="<cfoutput>#subformData.ASSISSDIDate#</cfoutput>" required />
			</div>
			<div class="checkbox col-sm-3">
				<label><input type="checkbox" name="UASSISSDIDate" value="Y" <cfset subformClass.showCheckbox('UASSISSDIDate',subformData)/>/>Unsure</label>
			</div>
		</div>

		<div class="form-group">
			<label>Have you received a response? <span style="color: red;">*</span></label>
			<br/>
			<label class="radio-inline"><input type="radio" name="RespASSISSI" value="Y" <cfset subformClass.showRadioButton('RespASSISSI',subformData,'Y')/>  required />Yes</label>
			<label class="radio-inline"><input type="radio" name="RespASSISSI" value="N" <cfset subformClass.showRadioButton('RespASSISSI',subformData,'N')/>/>No</label>
		</div>
	</div>

	<hr/>

	<div class="form-group">
		<label>Are you applying or have you applied for insurance through the health Insurance Reform Act (Marketplace/Exchange)? <span style="color: red;">*</span></label>
		<br/>
		<label class="radio-inline"><input type="radio" name="AMarket" value="Y" <cfset subformClass.showRadioButton('AMarket',subformData,'Y')/> required />Yes</label>
		<label class="radio-inline"><input type="radio" name="AMarket" value="N" <cfset subformClass.showRadioButton('AMarket',subformData,'N')/>/>No</label>
		<label class="radio-inline"><input type="radio" name="AMarket" value="U" <cfset subformClass.showRadioButton('AMarket',subformData,'U')/>/>Don't Know</label>
	</div>

	<div id="marketOption">
		<div class="row">
			<label class="col-sm-4">When did you apply? <span style="color: red;">*</span></label>
			<div class="col-sm-5">
				<input type="date" class="form-control" name="AMarketDate" value="<cfoutput>#subformData.AMarketDate#</cfoutput>" required />
			</div>
			<div class="checkbox col-sm-3">
				<label><input type="checkbox" name="UMarketDate" value="Y" <cfset subformClass.showCheckbox('UMarketDate',subformData)/>/>Unsure</label>
			</div>
		</div>

		<div class="form-group">
			<label>Have you received a response? <span style="color: red;">*</span></label>
			<br/>
			<label class="radio-inline"><input type="radio" name="RespAMarket" value="Y" <cfset subformClass.showRadioButton('RespAMarket',subformData,'Y')/> required />Yes</label>
			<label class="radio-inline"><input type="radio" name="RespAMarket" value="N" <cfset subformClass.showRadioButton('RespAMarket',subformData,'N')/>/>No</label>
		</div>
	</div>

	<hr/>

	<strong><em>NOTE: You MUST include a photocopy of the FRONT and BACK of your insurance card(s)/prescription card(s).</em></strong>

	<hr/>

	<strong>Type of Coverage(Check all that apply):</strong>
	<div class="form-group row">		
		<div class="col-sm-5">
			<label class="checkbox-inline"><input type="checkbox" name="CovMed" value="Y" <cfset subformClass.showCheckbox('CovMed',subformData)/>/>Medical Plan</label>
			<label class="checkbox-inline"><input type="checkbox" name="CovPres" value="Y" <cfset subformClass.showCheckbox('CovPres',subformData)/>/>Prescription Plan</label>
			<label class="checkbox-inline"><input type="checkbox" name="CovOther" value="Y" <cfset subformClass.showCheckbox('CovOther',subformData)/>/>Other (Specify)</label>
		</div>
		<div class="col-sm-7">
			<input type="text" class="form-control" name="CovOtherTxt" value="<cfoutput>#subformData.CovOtherTxt#</cfoutput>"/>
		</div>
	</div>

	<div class="row">
		<div class="col-sm-6">
			<strong>Private Health Insurance</strong><br/><br/>
			Insurance Carrier:
			<input type="text" class="form-control" name="InsCarrier" value="<cfoutput>#subformData.InsCarrier#</cfoutput>"/><br/>
			Address:
			<textarea type="text" class="form-control" name="InsCarAddr" id="InsCarAddr"><cfoutput>#subformData.InsCarAddr#</cfoutput></textarea><br/>
			Telephone Number:
			<input type="text" class="form-control" name="InsCarPhone" value="<cfoutput>#subformData.InsCarPhone#</cfoutput>" /><br/>
			Policy Number:
			<input type="text" class="form-control" name="InsCarPolicyNum" value="<cfoutput>#subformData.InsCarPolicyNum#</cfoutput>"/><br/>
			If provided by Union or Employer:<br/>
			Employer/Union Name:
			<input type="text" class="form-control" name="EmpUnName" value="<cfoutput>#subformData.EmpUnName#</cfoutput>"/><br/>
			Address:
			<textarea type="text" class="form-control" name="EmpUnAddr" id="EmpUnAddr"><cfoutput>#subformData.EmpUnAddr#</cfoutput></textarea><br/>
		</div>

		<div class="col-sm-6">
			<strong>Prescription Coverage</strong><br/><br/>
			Insurance Carrier:
			<input type="text" class="form-control" name="PresCar" value="<cfoutput>#subformData.PresCar#</cfoutput>"/><br/>
			Address:
			<textarea type="text" class="form-control" name="PresCarAddr" id="PresCarAddr"><cfoutput>#subformData.PresCarAddr#</cfoutput></textarea><br/>
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

	<strong>Identify your relationship to the insured: <span style="color: red;">*</span></strong>
	<br/>
	<div class="form-group row">
		<div class="col-sm-5">		
			<label class="radio-inline"><input type="radio" name="relation" value="S" <cfset subformClass.showRadioButton('relation',subformData,'S')/> required />Self</label>
			<label class="radio-inline"><input type="radio" name="relation" value="P" <cfset subformClass.showRadioButton('relation',subformData,'P')/>/>Spouse/Partner</label>
			<label class="radio-inline"><input type="radio" name="relation" value="C" <cfset subformClass.showRadioButton('relation',subformData,'C')/>/>Child</label>
			<label class="radio-inline"><input type="radio" name="relation" value="O" <cfset subformClass.showRadioButton('relation',subformData,'O')/>/>Other (Specify)</label>
		</div>
		<div class="col-sm-7">
			<input type="text" class="form-control" name="relOther" value="<cfoutput>#subformData.relOther#</cfoutput>"/>
		</div>
	</div>

	<div id="insuredOption">
		<div class="form-group row">
			<div class="col-sm-6">	
				<label for="InsName">Name of Insured</label>
			</div>
			<div class="col-sm-4">	
				<label for="InsSS">Social Security Number:</label>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-6">
				<input type="text" class="form-control" name="InsName" value="<cfoutput>#subformData.InsName#</cfoutput>"/>
			</div>
			<div class="col-sm-4">
				<input type="password" class="form-control" id="InsSS" name="InsSS" value="<cfoutput>#subformData.InsSS#</cfoutput>"/>
			</div>
			<div class="col-sm-2"><button type="button" class="btn btn-default btn-block" name="reveal">View SSN</button></div>
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
	</div>

	<hr/>

	<div class="form-group">
		<strong>Are you eligible for Veterans Administration prescription drug benefits? <span style="color: red;">*</span></strong>
		<br/>
		<label class="radio-inline"><input type="radio" name="EligVetDrugBen" value="Y" <cfset subformClass.showRadioButton('EligVetDrugBen',subformData,'Y')/> required />Yes</label>
		<label class="radio-inline"><input type="radio" name="EligVetDrugBen" value="N" <cfset subformClass.showRadioButton('EligVetDrugBen',subformData,'N')/>/>No</label>
		<br/>
		<strong>Are you currently receiving prescription drug benefits? <span style="color: red;">*</span></strong>
		<br/>
		<label class="radio-inline"><input type="radio" name="RecPresDrugBen" value="Y" <cfset subformClass.showRadioButton('RecPresDrugBen',subformData,'Y')/> required />Yes</label>
		<label class="radio-inline"><input type="radio" name="RecPresDrugBen" value="N" <cfset subformClass.showRadioButton('RecPresDrugBen',subformData,'N')/>/>No</label>
	</div>
	</div>
	<div class="text-center">
		<button type="submit" class="btn btn-default" name="previous" value="prevous">Previous</button>
		<cfif ((session.accessLevel eq 'admin') || (subformClass.isUserReview()))>
			<button type="submit" class="btn btn-default" name="exit" value="exit">Exit</button>
		<cfelse>
			<button type="submit" class="btn btn-default" name="save" value="save">Save Progress &#38; Exit</button>
		</cfif>
		<button type="submit" class="btn btn-default" name="next" value="next">Next</button>
	</div>
	</form>

	<hr/>

	<strong><em>
		NOTE: You MUST include a photocopy of the FRONT and BACK of your insurance card(s)/prescription card(s)
		and any notice from your Insurance Company regarding Medicare Part D.
	</em></strong>
	<div style="height: 50px;"></div>
</div>
</body>
</html>
