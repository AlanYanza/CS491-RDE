<cfset SessionClass=createObject('component',"CS491-RDE.components.SessionTools")/>
<cfset SessionClass.checkIfLoggedIn()/>
<cfset SessionClass.checkIfuser()/>
<cfset tableName='NJSection3B'/>
<cfset fields=[] />
<cfset subformClass=createObject('component','CS491-RDE.components.Subform').init('NJ',session.userID,tableName,fields)/>
<cfset subformClass.noAccessRedirect('/CS491-RDE/home.cfm')/>
<!-- Application Page pre-processing -->
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
			$('[data-toggle="popover"]').popover();

			function SSISSDICheck() {
				
				if (($("input[type=radio][name=SSISSDI]:checked").val() == "N") || ($("input[type=radio][name=SSISSDI]:checked").val() == "U")) {
					$("#SSISSDIOption").hide("slow");
					$("#SSISSDIOption").find("input").removeAttr("required");
				}
				else {
					$("#SSISSDIOption").show("slow");					
				}
			}

			function SSISSDIDateCheck() {
				if ($("input[type=checkbox][name=UASSISSDIDate]").is(":checked")) {					
					$("input[type=date][name=ASSISSDIDate]").val("1111-11-11");
					$("input[type=date][name=ASSISSDIDate]").attr("readonly", "true");
					$("input[type=date][name=ASSISSDIDate]").removeAttr("required");
				}
				else {
					$("input[type=date][name=ASSISSDIDate]").removeAttr("readonly");
					$("input[type=date][name=ASSISSDIDate]").attr("required", "true");
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

			function marketDateCheck() {
				if ($("input[type=checkbox][name=UMarketDate]").is(":checked")) {					
					$("input[type=date][name=AMarketDate]").val("1111-11-11");
					$("input[type=date][name=AMarketDate]").attr("readonly", "true");
					$("input[type=date][name=AMarketDate]").removeAttr("required");
				}
				else {
					$("input[type=date][name=AMarketDate]").removeAttr("readonly");
					$("input[type=date][name=AMarketDate]").attr("required", "true");
				}
			}

			SSISSDICheck();
			SSISSDIDateCheck();
			marketCheck();
			marketDateCheck();

			$("input[type=radio][name=SSISSDI]").change(SSISSDICheck);
			$("input[type=checkbox][name=UASSISSDIDate]").click(SSISSDIDateCheck);
			$("input[type=radio][name=AMarket]").change(marketCheck);
			$("input[type=checkbox][name=UMarketDate]").click(marketDateCheck);

			$("button[type=submit][name=save]").click(function() {
				$("form").find("input").removeAttr("required");
			});
			$("button[type=submit][name=previous]").click(function() {
				$("form").find("input").removeAttr("required");
			});
		});
		$(document).keypress(
			function(event){
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
		<label class="checkbox-inline"><input type="checkbox" name="YesSSI" value="Y" <cfset subformClass.showCheckbox('YesSSI',subformData)/>/>Yes for SSI</label>
		<label class="checkbox-inline"><input type="checkbox" name="YesSSDI" value="Y" <cfset subformClass.showCheckbox('YEsSSDI',subformData)/>/>Yes for SSDI</label>
		<label class="checkbox-inline"><input type="checkbox" name="NoASSISSDI" value="Y" <cfset subformClass.showCheckbox('NoASSISSDI',subformData)/>/>No</label>
		<label class="checkbox-inline"><input type="checkbox" name="UASSISSDI" value="Y" <cfset subformClass.showCheckbox('UASSISSDI',subformData)/>/>Don't know</label>
	</div>

	<div id="SSISSDIOption">
		<div class="row">
			<label class="col-sm-4">a. If yes, when did you apply for SSI/SSDI?</label>
			<div class="col-sm-5">
				<input type="date" class="form-control" name="ASSISSDIDate" value="<cfoutput>#subformData.ASSISSDIDate#</cfoutput>">
			</div>
			<div class="checkbox col-sm-3">
				<label><input type="checkbox" name="UASSISSDIDate" value="Y" <cfset subformClass.showCheckbox('UASSISSDIDate',subformData)/>/>Unsure</label>
			</div>
		</div>

		<div class="form-group">
			<label>b. Have you received a response?</label>
			<br/>
			<label class="radio-inline"><input type="radio" name="RespASSISSI" value="Y" <cfset subformClass.showRadioButton('RespASSISSI',subformData,'Y')/>/>Yes</label>
			<label class="radio-inline"><input type="radio" name="RespASSISSI" value="N" <cfset subformClass.showRadioButton('RespASSISSI',subformData,'N')/>/>No</label>
		</div>
	</div>

	<hr/>

	<div class="form-group">
		<label>29. Are you applying or have you applied for insurance through the health Insurance Reform Act (Marketplace/Exchange)?</label>
		<br/>
		<label class="radio-inline"><input type="radio" name="AMarket" value="Y" <cfset subformClass.showRadioButton('AMarket',subformData,'Y')/>/>Yes</label>
		<label class="radio-inline"><input type="radio" name="AMarket" value="N" <cfset subformClass.showRadioButton('AMarket',subformData,'N')/>/>No</label>
		<label class="radio-inline"><input type="radio" name="AMarket" value="U" <cfset subformClass.showRadioButton('AMarket',subformData,'U')/>/>Don't Know</label>
	</div>

	<div id="marketOption">
		<div class="row">
			<label class="col-sm-4">a. If yes, when did you apply?</label>
			<div class="col-sm-5">
				<input type="date" class="form-control" name="AMarketDate" value="<cfoutput>#subformData.AMarketDate#</cfoutput>">
			</div>
			<div class="checkbox col-sm-3">
				<label><input type="checkbox" name="UMarketDate" value="Y" <cfset subformClass.showCheckbox('UMarketDate',subformData)/>/>Unsure</label>
			</div>
		</div>

		<div class="form-group">
			<label>b. Have you received a response?</label>
			<br/>
			<label class="radio-inline"><input type="radio" name="RespAMarket" value="Y" <cfset subformClass.showRadioButton('RespAMarket',subformData,'Y')/>/>Yes</label>
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
			<strong>30. Private Health Insurance</strong><br/><br/>
			Insurance Carrier:
			<input type="text" class="form-control" name="InsCarrier" value="<cfoutput>#subformData.InsCarrier#</cfoutput>"/><br/>
			Address:
			<textarea type="text" class="form-control" name="InsCarAddr"><cfoutput>#subformData.InsCarAddr#</cfoutput></textarea><br/>
			Telephone Number:
			<input type="text" class="form-control" name="InsCarPhone" value="<cfoutput>#subformData.InsCarPhone#</cfoutput>" /><br/>
			Policy Number:
			<input type="text" class="form-control" name="InsCarPolicyNum" value="<cfoutput>#subformData.InsCarPolicyNum#</cfoutput>"/><br/>
			If provided by Union or Employer:<br/>
			Employer/Union Name:
			<input type="text" class="form-control" name="EmpUnName" value="<cfoutput>#subformData.EmpUnName#</cfoutput>"/><br/>
			Address:
			<textarea type="text" class="form-control" name="EmpUnAddr"><cfoutput>#subformData.EmpUnAddr#</cfoutput></textarea><br/>
		</div>

		<div class="col-sm-6">
			<strong>31. Prescription Coverage</strong><br/><br/>
			Insurance Carrier:
			<input type="text" class="form-control" name="PresCar" value="<cfoutput>#subformData.PresCar#</cfoutput>"/><br/>
			Address:
			<textarea type="text" class="form-control" name="PresCarAddr"><cfoutput>#subformData.PresCarAddr#</cfoutput></textarea><br/>
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
			<label class="radio-inline"><input type="radio" name="relation" value="S" <cfset subformClass.showRadioButton('relation',subformData,'S')/>/>Self</label>
			<label class="radio-inline"><input type="radio" name="relation" value="P" <cfset subformClass.showRadioButton('relation',subformData,'P')/>/>Spouse/Partner</label>
			<label class="radio-inline"><input type="radio" name="relation" value="C" <cfset subformClass.showRadioButton('relation',subformData,'C')/>/>Child</label>
			<label class="radio-inline"><input type="radio" name="relation" value="O" <cfset subformClass.showRadioButton('relation',subformData,'O')/>/>Other (Specify)</label>
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
		<label class="radio-inline"><input type="radio" name="EligVetDrugBen" value="Y" <cfset subformClass.showRadioButton('EligVetDrugBen',subformData,'Y')/>/>Yes</label>
		<label class="radio-inline"><input type="radio" name="EligVetDrugBen" value="N" <cfset subformClass.showRadioButton('EligVetDrugBen',subformData,'N')/>/>No</label>
		<br/>
		<strong>b. Are you currently receiving prescription drug benefits?</strong>
		<br/>
		<label class="radio-inline"><input type="radio" name="RecPresDrugBen" value="Y" <cfset subformClass.showRadioButton('RecPresDrugBen',subformData,'Y')/>/>Yes</label>
		<label class="radio-inline"><input type="radio" name="RecPresDrugBen" value="N" <cfset subformClass.showRadioButton('RecPresDrugBen',subformData,'N')/>/>No</label>
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
