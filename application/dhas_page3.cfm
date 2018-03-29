<cfset SessionClass=createObject('component',"CS491-RDE.components.SessionTools")/>
<cfset SessionClass.checkIfLoggedIn()/>
<cfset SessionClass.checkIfuser()/>
<cfset tableName='NJSection3A'/>
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

			function insuredCheck() {
				if (typeof $("input[type=radio][name=insured]:checked").val() === "undefined") {
					return;
				}
				if ($("input[type=radio][name=insured]:checked").val() == "Y") {
					$("#insuredOption").show("slow");
					
				}
				else {
					$("#insuredOption").hide("slow");
					$("#insuredOption").find("input").removeAttr("required");
				}
			}

			function mediumCheck() {
				if (typeof $("input[type=radio][name=Medium]:checked").val() === "undefined") {
					return;
				}
				if ($("input[type=radio][name=Medium]:checked").val() != "S") {
					$("#mediumOption").show("slow");
					
				}
				else {
					$("#mediumOption").hide("slow");
					$("#mediumOption").find("input").removeAttr("required");
				}
			}

			function presCovCheck() {
				if (typeof $("input[type=radio][name=presCov]:checked").val() === "undefined") {
					return;
				}
				if ($("input[type=radio][name=presCov]:checked").val() != "Y") {
					$("#presCovOption").hide("slow");
					$("#presCovOption").find("input").removeAttr("required");
								
				}
				else {
					$("#presCovOption").show("slow");
				}
			}

			function medicaidDateCheck() {
				if ($("input[type=checkbox][name=UMedicaidDate]").is(":checked")) {
					$("input[type=date][name=AMedicaidDate]").val("1111-11-11");
					$("input[type=date][name=AMedicaidDate]").attr("readonly", "true");
					$("input[type=date][name=AMedicaidDate]").removeAttr("required");
				}
				else {
					$("input[type=date][name=AMedicaidDate]").removeAttr("readonly");
					$("input[type=date][name=AMedicaidDate]").attr("required", "true");
				}
			}

			function medicaidApplyCheck() {
				if (typeof $("input[type=radio][name=AMedicaid]:checked").val() === "undefined") {
					return;
				}
				if ($("input[type=radio][name=AMedicaid]:checked").val() != "Y") {
					$("#AmedicaidOption").hide("slow");
					$("#AmedicaidOption").find("input").removeAttr("required");
				}
				else {
					$("#AmedicaidOption").show("slow");
				}
			}

			function medicareDateCheck() {
				if ($("input[type=checkbox][name=UMedicareDate]").is(":checked")) {
					$("input[type=date][name=AMedicareDate]").val("1111-11-11");
					$("input[type=date][name=AMedicareDate]").attr("readonly", "true");
					$("input[type=date][name=AMedicareDate]").removeAttr("required");
				}
				else {
					$("input[type=date][name=AMedicareDate]").removeAttr("readonly");
					$("input[type=date][name=AMedicareDate]").attr("required", "true");
				}
			}

			function medicareApplyCheck() {
				if (typeof $("input[type=radio][name=AMedicare]:checked").val() === "undefined") {
					return;
				}
				if ($("input[type=radio][name=AMedicare]:checked").val() != "Y") {
					$("#AmedicareOption").hide();
					$("#AmedicareOption").find("input").removeAttr("required");
				}
				else {
					$("#AmedicareOption").show();
				}
			}
			function medicareDCheck() {
				if (typeof $("input[type=radio][name=AMedicareD]:checked").val() === "undefined") {
					return;
				}
				if ($("input[type=radio][name=AMedicareD]:checked").val() != "Y") {
					$("#AmedicareDOption").hide();
					$("#AmedicareDOption").find("input").removeAttr("required");
				}
				else {
					$("#AmedicareDOption").show();
				}
			}

			insuredCheck();
			mediumCheck();
			presCovCheck();
			medicaidApplyCheck();
			medicaidDateCheck();
			medicareApplyCheck();
			medicareDateCheck();
			medicareDCheck();

			$("input[type=radio][name=insured]").change(insuredCheck);
			$("input[type=radio][name=Medium]").change(mediumCheck);
			$("input[type=radio][name=presCov]").change(presCovCheck);
			$("input[type=radio][name=AMedicaid]").change(medicaidApplyCheck);
			$("input[type=checkbox][name=UMedicaidDate]").click(medicaidDateCheck);
			$("input[type=radio][name=AMedicare]").change(medicareApplyCheck);
			$("input[type=checkbox][name=UMedicareDate]").click(medicareDateCheck);
			$("input[type=radio][name=AMedicareD]").change(medicareDCheck);

			$("button[type=submit][name=save]").click(function() {
				$("form").find("input").removeAttr("required");
			});
		});
</script>
</head>
<body>
<cfinclude template="../navbar.cfm">
<div class="container">
	<h3>Progress</h3>
	<div class="progress">
		<div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width:60%">
			Page 3 of 5
		</div>
	</div>

	<!--<strong>APPLICATION FOR PARTICIPATION IN THE AIDS DRUG DISTRIBUTION PROGRAM AND/OR HEALTH INSURANCE CONTINUATION PROGRAM (Continued)</strong>-->

	<div class="well text-center"><h4>Section 3 - INSURANCE STATUS</h4></div>
	<form action="../scripts/NJScript.cfm" method="POST">
	<input type="text" hidden="true" id="formPage" name="formPage" value="page3A"/>
	<input type="text" hidden="true" id="tableName" name="tableName" value="<cfoutput>#tableName#</cfoutput>"/>
	<div class="form-group">
		<label>25. Do you currently have any type of health insurance?</label>
		<br/>
		<label class="radio-inline"><input type="radio" name="insured" value="Y" <cfset subformClass.showRadioButton('insured',subformData,'Y')/> required />Yes</label>
		<label class="radio-inline"><input type="radio" name="insured" value="N" <cfset subformClass.showRadioButton('insured',subformData,'N')/>/>No</label>
		<label class="radio-inline"><input type="radio" name="insured" value="U" <cfset subformClass.showRadioButton('insured',subformData,'U')/>/>Don't Know</label>
	</div>

	<div id="insuredOption">
		<div class="form-group">
			<strong>a. If yes, is your insurance Policy through:</strong>
			<br/>
			<label class="radio-inline"><input type="radio" name="Medium" value="C" <cfset subformClass.showRadioButton('Medium',subformData,'C')/> required/>Current Employer</label>
			<label class="radio-inline"><input type="radio" name="Medium" value="F" <cfset subformClass.showRadioButton('Medium',subformData,'F')/>/>Former Employer (COBRA)</label>
			<label class="radio-inline"><input type="radio" name="Medium" value="U" <cfset subformClass.showRadioButton('Medium',subformData,'U')/>/>Union</label>
			<label class="radio-inline"><input type="radio" name="Medium" value="S" <cfset subformClass.showRadioButton('Medium',subformData,'S')/>/>Self</label>
		</div>

		<div id="mediumOption">
			<strong>(1) Employer or Union Providing Insurance Coverage:</strong>
			<br/>

			<div class="form-group">
				<label for="EmpUnName">(a) Name:</label>
				<input type="text" class="form-control" name="EmpUnName" value="<cfoutput>#subformData.EmpUnName#</cfoutput>"/>
			</div>

			<div class="form-group">
				<label for="EmpUnAddress">(b) Address</label>
				<input type="text" class="form-control" name="EmpUnAddr" value="<cfoutput>#subformData.EmpUnAddr#</cfoutput>"/>
			</div>

			<div class="row">
				<div class="col-sm-6"><div class="form-group">
					<label for="EmpUnContact">(c) Contact Person</label>
					<input type="text" class="form-control" name="EmpUnContact" value="<cfoutput>#subformData.EmpUnContact#</cfoutput>"/>
				</div></div>
				<div class="col-sm-6"><div class="form-group">
					<label for="EmpUnPhone">(d) Telephone Number</label>
					<input type="tel" class="form-control" name="EmpUnPhone" value="<cfoutput>#subformData.EmpUnPhone#</cfoutput>"/>
				</div></div>
			</div>
		</div>

		<p><strong>b. If yes, check all types that you currently have:</strong></p>
		<label class="checkbox-inline"><input type="checkbox" name="Medicaid" value="Y" <cfset subformClass.showCheckbox('Medicaid',subformData)/>/>Medicaid</label>
		<label class="checkbox-inline"><input type="checkbox" name="MedicareAB" value="Y" <cfset subformClass.showCheckbox('MedicareAB',subformData)/>/>Medicare A/B</label>
		<label class="checkbox-inline"><input type="checkbox" name="MedicareD" value="Y" <cfset subformClass.showCheckbox('MedicareD',subformData)/>/>Medicare D</label>
		<label class="checkbox-inline"><input type="checkbox" name="PrivateIns" value="Y" <cfset subformClass.showCheckbox('PrivateIns',subformData)/>/>Private Insurance </label>
		<a href="javascript:void(0)" data-toggle="popover" data-trigger="focus" title="Private Insurance Definition:" data-content="
			Plans provided by the private insurance industry as a benefit of employment or through the
			Marketplace (e.g. Horizon Blue Cross Blue Shield, Aetna, Amerihealth, etc.).">
			<span class="glyphicon glyphicon-info-sign"></span>
		</a>
		<label class="checkbox-inline"><input type="checkbox" name="CHIP" value="Y" <cfset subformClass.showCheckbox('CHIP',subformData)/>/>CHIP</label>
		<label class="checkbox-inline"><input type="checkbox" name="COBRA" value="Y" <cfset subformClass.showCheckbox('COBRA',subformData)/>/>COBRA </label>
		<a href="javascript:void(0)" data-toggle="popover" data-trigger="focus" title="COBRA Definition:" data-content="
			COBRA stands for Consolidated Omnibus Budget Reconciliation Act. The law generally
			applies to all group health plans maintained by private-sector employers with 20 or more
			employees and sponsored by most state and local governments. If elected, COBRA
			allows individuals to continue group health coverage that would otherwise be lost due to
			certain specific events such as termination of employment. COBRA coverage extends
			from the date of the qualifying event for a limited period of time.">
			<span class="glyphicon glyphicon-info-sign"></span>
		</a>

		<div class="form-group">
			<div class="form-horizontal">
				<label class="control-label col-sm-4">(1) When does it start?</label>
				<div class="col-sm-8">
					<input type="date" class="form-control" name="COBRAStart" value="<cfoutput>#subformData.COBRAStart#</cfoutput>"/>
				</div>
			</div>

			<div class="form-horizontal">
				<label class="control-label col-sm-4">(2) When does it end?</label>
				<div class="col-sm-8">
					<input type="date" class="form-control" name="COBRAEnd" value="<cfoutput>#subformData.COBRAEnd#</cfoutput>"/>
				</div>
			</div>
		</div>
		<div class="row">
			<label class="col-sm-4">c. When is the next premium due?</label>
			<div class="col-sm-8">
				<input type="date" class="form-control" name="NxtPremDue" value="<cfoutput>#subformData.NxtPremDue#</cfoutput>"/>
			</div>
		</div>

		<div class="form-group">
			<label>d. Other(specify):</label>
			<input type="text" class="form-control" name="Other" value="<cfoutput>#subformData.Other#</cfoutput>"/>
		</div>

		<div class="form-group">
			<label>e. If you have insurance, does it provide prescription coverage?</label>
			<br/>
			<label class="radio-inline"><input type="radio" name="presCov" value="Y" <cfset subformClass.showRadioButton('presCov',subformData,'Y')/> required/>Yes</label>
			<label class="radio-inline"><input type="radio" name="presCov" value="N" <cfset subformClass.showRadioButton('presCov',subformData,'N')/>/>No</label>
			<label class="radio-inline"><input type="radio" name="presCov" value="U" <cfset subformClass.showRadioButton('presCov',subformData,'U')/>/>Don't Know</label>
		</div>

		<div id="presCovOption">
			<div class="form-group">
				<label>(1) If you have prescription drug coverage through insurance, is there a cap on the annual amount your insurance will pay for medications?</label>
				<br/>
				<label class="radio-inline"><input type="radio" name="PresCovCap" value="Y" <cfset subformClass.showRadioButton('presCovCap',subformData,'Y')/> required/>Yes</label>
				<label class="radio-inline"><input type="radio" name="PresCovCap" value="N" <cfset subformClass.showRadioButton('presCovCap',subformData,'N')/>/>No</label>
				<label class="radio-inline"><input type="radio" name="PresCovCap" value="U" <cfset subformClass.showRadioButton('presCovCap',subformData,'U')/>/>Don't Know</label>
			</div>

			<div class="row">
				<label class="col-sm-4">(2) If yes, what is the amount of the cap?</label>
				<div class="input-group col-sm-8">
					<span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
					<input type="number" class="form-control" name="PresCovCapAmt" value="<cfoutput>#subformData.PresCovCapAmt#</cfoutput>" required/>
				</div>
			</div>
		</div>

		<div class="form-group">
			<label>f. Do you have prescription coverage through a mail order company?</label>
			<br/>
			<label class="radio-inline"><input type="radio" name="presCovMail" value="Y" <cfset subformClass.showRadioButton('presCovMail',subformData,'Y')/>/>Yes</label>
			<label class="radio-inline"><input type="radio" name="presCovMail" value="N" <cfset subformClass.showRadioButton('presCovMail',subformData,'N')/>/>No</label>
			<label class="radio-inline"><input type="radio" name="presCovMail" value="P" <cfset subformClass.showRadioButton('presCovMail',subformData,'P')/>/>Partial</label>
		</div>

		<p><strong><em>A dedicated pharmacy is required even if not utilized</em></strong></p>
	</div>

	<hr/>

	<div class="form-group">
		<label>26. Are you applying or have applied for Medicaid?</label>
		<br/>
		<label class="radio-inline"><input type="radio" name="AMedicaid" value="Y" <cfset subformClass.showRadioButton('AMedicaid',subformData,'Y')/> required />Yes</label>
		<label class="radio-inline"><input type="radio" name="AMedicaid" value="N" <cfset subformClass.showRadioButton('AMedicaid',subformData,'N')/>/>No</label>
		<label class="radio-inline"><input type="radio" name="AMedicaid" value="U" <cfset subformClass.showRadioButton('AMedicaid',subformData,'U')/>/>Don't Know</label>
	</div>

	<div id="AmedicaidOption">
		<div class="row">
			<label class="col-sm-4"> a. If yes, when did you apply for Medicaid?</label>
			<div class="col-sm-5">
				<input type="date" class="form-control" name="AMedicaidDate" value="<cfoutput>#subformData.AMedicaidDate#</cfoutput>"/>
			</div>
			<div class="checkbox col-sm-3">
				<label><input type="checkbox" name="UMedicaidDate" value="Y" <cfset subformClass.showCheckbox('UMedicaidDate',subformData)/>/>Unsure</label>
			</div>
		</div>

		<div class="form-group">
			<label>b. Have you received a response?</label>
			<br/>
			<label class="radio-inline"><input type="radio" name="RespMedicaid" value="Y" <cfset subformClass.showRadioButton('RespMedicaid',subformData,'Y')/>/>Yes</label>
			<label class="radio-inline"><input type="radio" name="RespMedicaid" value="N" <cfset subformClass.showRadioButton('RespMedicaid',subformData,'N')/>/>No</label>
		</div>
	</div>

	<hr/>

	<div class="form-group">
		<label>27. Are you applying or have applied for Medicare?</label>
		<br/>
		<label class="radio-inline"><input type="radio" name="AMedicare" value="Y" <cfset subformClass.showRadioButton('AMedicare',subformData,'Y')/> required />Yes</label>
		<label class="radio-inline"><input type="radio" name="AMedicare" value="N" <cfset subformClass.showRadioButton('AMedicare',subformData,'N')/>/>No</label>
		<label class="radio-inline"><input type="radio" name="AMedicare" value="U" <cfset subformClass.showRadioButton('AMedicare',subformData,'U')/>/>Don't Know</label>
	</div>

	<div id="AmedicareOption">
		<div class="row">
			<label class="col-sm-4">a. If yes, when did you apply for Medicare?</label>
			<div class="col-sm-5">
				<input type="date" class="form-control" id="medicareDate" name="AMedicareDate" value="<cfoutput>#subformData.AMedicareDate#</cfoutput>"/>
			</div>
			<div class="checkbox col-sm-3">
				<label><input type="checkbox" name="UMedicareDate" value="Y" <cfset subformClass.showCheckbox('UMedicareDate',subformData)/> />Unsure</label>
			</div>
		</div>

		<div class="form-group">
			<label>b. Have you received a response?</label>
			<br/>
			<label class="radio-inline"><input type="radio" name="Respmedicare" value="Y" <cfset subformClass.showRadioButton('RespMedicare',subformData,'Y')/> required />Yes</label>
			<label class="radio-inline"><input type="radio" name="Respmedicare" value="N" <cfset subformClass.showRadioButton('RespMedicare',subformData,'N')/>/>No</label>
		</div>

		<div class="form-group">
			<label>c. If yes, have you applied for Medicare Part D(medical coverage)</label>
			<br/>
			<label class="radio-inline"><input type="radio" name="AMedicareD" value="Y" <cfset subformClass.showRadioButton('AMedicareD',subformData,'Y')/> required />Yes</label>
			<label class="radio-inline"><input type="radio" name="AMedicareD" value="N" <cfset subformClass.showRadioButton('AMedicareD',subformData,'N')/>/>No</label>
			<label class="radio-inline"><input type="radio" name="AMedicareD" value="U" <cfset subformClass.showRadioButton('AMedicareD',subformData,'U')/>/>Don't Know</label>
		</div>

		<div class="form-group" id="AmedicareDOption">
			<label>(1) If yes, have you applied for Low Income Subsidy (LIS)</label>
			<br/>
			<label class="radio-inline"><input type="radio" name="ALIS" value="Y" <cfset subformClass.showRadioButton('ALIS',subformData,'Y')/> required />Yes</label>
			<label class="radio-inline"><input type="radio" name="ALIS" value="N" <cfset subformClass.showRadioButton('ALIS',subformData,'N')/>/>No</label>
			<label class="radio-inline"><input type="radio" name="ALIS" value="U" <cfset subformClass.showRadioButton('ALIS',subformData,'U')/>/>Don't Know</label>
		</div>
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