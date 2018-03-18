<cfset SessionClass=createObject('component',"CS491-RDE.components.SessionTools")/>
<cfset SessionClass.checkIfLoggedIn()/>
<cfset tableName='NJSection3A'/>
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
	<script type="text/javascript">
  	"use strict";
	$(document).ready(
		function(){
			$('[data-toggle="popover"]').popover();
		}
	);
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
	<input type="text" hidden="true" id="formPage" name="formPage" value="page3A">
	<input type="text" hidden="true" id="tableName" name="tableName" value="<cfoutput>#tableName#</cfoutput>">
	<div class="form-group">
		<label>25. Do you currently have any type of health insurance?</label>
		<br/>
		<label class="radio-inline"><input type="radio" name="healthInsurance" value="Y"/>Yes</label>
		<label class="radio-inline"><input type="radio" name="healthInsurance" value="N"/>No</label>
		<label class="radio-inline"><input type="radio" name="healthInsurance" value="Don't Know"/>Don't Know</label>
	</div>

	<div class="form-group">
		<strong>a. If yes, is your insurance Policy through:</strong>
		<br/>
		<label class="radio-inline"><input type="radio" name="insurancePolicy" value="CurrentEmployer"/>Current Employer</label>
		<label class="radio-inline"><input type="radio" name="insurancePolicy" value="FormerEmployer"/>Former Employer (COBRA)</label>
		<label class="radio-inline"><input type="radio" name="insurancePolicy" value="Union"/>Union</label>
		<label class="radio-inline"><input type="radio" name="insurancePolicy" value="Self"/>Self</label>
	</div>


	<strong>(1) Employer or Union Providing Insurance Coverage:</strong>
	<br/>

	<div class="row">
	<div class="col-md-auto"><div class="form-group">
			<label for="Name">(a) Name:</label>
			<input type="text" class="form-control" id="Name" name="Name" value="<cfoutput>#subformData.EmpUnName#</cfoutput>">
		</div></div>
	</div>
	<div class="row">
		<div class="col-md-auto"><div class="form-group"><label for="EmpAddress">(c) EmpAddress</label>
			<input type="text" class="form-control" id="EmpAddress" name="EmpAddress" value="<cfoutput>#subformData.EmpUnAddr#</cfoutput>"></div></div>
	</div>
	<div class="row">
		<div class="col-sm-6"><div class="form-group">
			<label for="contact">(d) Contact</label>
			<input type="text" class="form-control" id="contact" name="contact" value="<cfoutput>#subformData.EmpUnContact#</cfoutput>">
		</div></div>
		<div class="col-sm-6"><div class="form-group">
			<label for="TelNumber">(e) Telephone Number</label>
			<input type="tel" class="form-control" id="TelNumber" name="TelNumber" value="<cfoutput>#subformData.EmpUnPhone#</cfoutput>">
		</div></div>
	</div>

	<p><strong>b. If yes, check all types that you currently have:</strong></p>
	<label class="checkbox-inline"><input type="checkbox" name="Medicaid" value="Medicaid"/>Medicaid</label>
	<label class="checkbox-inline"><input type="checkbox" name="MedicareAB" value="MedicareAB"/>Medicare A/B</label>
	<label class="checkbox-inline"><input type="checkbox" name="MedicareD" value="MedicareD"/>Medicare D</label>
	<label class="checkbox-inline"><input type="checkbox" name="PI" value="PI"/>Private Insurance*</label>
	<a href="#" data-toggle="popover" data-trigger="focus" title="Private Insurance Definition:" data-content="
			Plans provided by the private insurance industry as a benefit of employment or through the
			Marketplace (e.g. Horizon Blue Cross Blue Shield, Aetna, Amerihealth, etc.)."><span class="glyphicon glyphicon-info-sign"></span></a>
	<label class="checkbox-inline"><input type="checkbox" name="CHIP" value="CHIP"/>CHIP</label>
	<label class="checkbox-inline"><input type="checkbox" name="COBRA" value="COBRA"/>COBRA**</label>
		<a href="#" data-toggle="popover" data-trigger="focus" title="COBRA Definition:" data-content="
			COBRA stands for Consolidated Omnibus Budget Reconciliation Act. The law generally
			applies to all group health plans maintained by private-sector employers with 20 or more
			employees and sponsored by most state and local governments. If elected, COBRA
			allows individuals to continue group health coverage that would otherwise be lost due to
			certain specific events such as termination of employment. COBRA coverage extends
			from the date of the qualifying event for a limited period of time."><span class="glyphicon glyphicon-info-sign"></span></a>

	<div class="form-group">
		<div class="form-horizontal">
			<label class="control-label col-sm-4">(1) When does it start?</label>
			<div class="col-sm-8">
				<input type="date" class="form-control" id="start" name="start" value="<cfoutput>#subformData.COBRAStart#</cfoutput>">
			</div>
		</div>

		<div class="form-horizontal">
			<label class="control-label col-sm-4">(2) When does it end?</label>
			<div class="col-sm-8">
				<input type="date" class="form-control" id="end" name="end" value="<cfoutput>#subformData.COBRAEnd#</cfoutput>">
			</div>
		</div>
	</div>
	<div class="row">
		<label class="col-sm-4">c. When is the next premium due?</label>
		<div class="col-sm-8">
			<input type="date" class="form-control" id="premium" name="premium" value="<cfoutput>#subformData.NxtPremDue#</cfoutput>">
		</div>
	</div>

	<div class="form-group">
		<label>d. Other(specify):</label>
		<input type="text" class="form-control" id="OS" name="OS" value="<cfoutput>#subformData.Other#</cfoutput>">
	</div>

	<div class="form-group">
		<label>e. If you have insurance, does it provide prescription coverage?</label>
		<br/>
		<label class="radio-inline"><input type="radio" name="coverage" value="Y"/>Yes</label>
		<label class="radio-inline"><input type="radio" name="coverage" value="N"/>No</label>
		<label class="radio-inline"><input type="radio" name="coverage" value="Don't Know"/>Don't Know</label>
	</div>

	<div class="form-group">
		<label>(1) If you have prescription drug coverage through insurance, is there a cap on the annual amount your insurance will pay for medications?</label>
		<br/>
		<label class="radio-inline"><input type="radio" name="prescription drug" value="Y"/>Yes</label>
		<label class="radio-inline"><input type="radio" name="prescription drug" value="N"/>No</label>
		<label class="radio-inline"><input type="radio" name="prescription drug" value="Don't Know"/>Don't Know</label>
	</div>

	<div class="row">
		<label class="col-sm-4">(2) If yes, what is the amount of the cap?</label>
		<div class="input-group col-sm-8">
			<span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
			<input type="number" class="form-control" id="cap" name="cap" value="<cfoutput>#subformData.PresCovCapAmt#</cfoutput>"/>
		</div>
	</div>

	<div class="form-group">
		<label>f. Do you have prescription coverage through a mail order company?</label>
		<br/>
		<label class="radio-inline"><input type="radio" name="mailOrderCompany" value="Y"/>Yes</label>
		<label class="radio-inline"><input type="radio" name="mailOrderCompany" value="N"/>No</label>
		<label class="radio-inline"><input type="radio" name="mailOrderCompany" value="Partial"/>Partial</label>
	</div>

	<p><strong><em>A dedicated pharmacy is required even if not utilized</em></strong></p>

	<hr/>

	<div class="form-group">
		<label>26. Are you applying or have applied for Medicaid?</label>
		<br/>
		<label class="radio-inline"><input type="radio" name="Medicaid" value="Yes"/>Yes</label>
		<label class="radio-inline"><input type="radio" name="Medicaid" value="No"/>No</label>
		<label class="radio-inline"><input type="radio" name="Medicaid" value="Don't Know"/>Don't Know</label>
	</div>

	<div class="row">
		<label class="col-sm-4"> a. If yes, when did you apply for Medicaid?</label>
		<div class="col-sm-5">
			<input type="date" class="form-control" id="medicaidDate" name="medicaidDate" value="<cfoutput>#subformData.AMedicaidDate#</cfoutput>">
		</div>
		<div class="checkbox col-sm-3">
			<label><input type="checkbox" name="medicaidDate" value="Unsure"/>Unsure</label>
		</div>
	</div>

	<div class="form-group">
		<label>b. Have you received a response?</label>
		<br/>
		<label class="radio-inline"><input type="radio" name="medicaidResponse" value="Yes"/>Yes</label>
		<label class="radio-inline"><input type="radio" name="medicaidResponse" value="No"/>No</label>
	</div>

	<hr/>

	<div class="form-group">
		<label>27. Are you applying or have applied for Medicare?</label>
		<br/>
		<label class="radio-inline"><input type="radio" name="Medicare" value="Y"/>Yes</label>
		<label class="radio-inline"><input type="radio" name="Medicare" value="N"/>No</label>
		<label class="radio-inline"><input type="radio" name="Medicare" value="Don't Know"/>Don't Know</label>
	</div>

	<div class="row">
		<label class="col-sm-4">a. If yes, when did you apply for Medicare?</label>
		<div class="col-sm-5">
			<input type="date" class="form-control" id="medicareDate" name="medicareDate" value="<cfoutput>#subformData.AMedicareDate#</cfoutput>">
		</div>
		<div class="checkbox col-sm-3">
			<label><input type="checkbox" name="medicareDate" value="Unsure"/>Unsure</label>
		</div>
	</div>

	<div class="form-group">
		<label>b. Have you received a response?</label>
		<br/>
		<label class="radio-inline"><input type="radio" name="medicareResponse" value="Y"/>Yes</label>
		<label class="radio-inline"><input type="radio" name="medicareResponse" value="N"/>No</label>
	</div>

	<div class="form-group">
		<label>c. If yes, have you applied for Medicare Part D(medical coverage)</label>
		<br/>
		<label class="radio-inline"><input type="radio" name="medicarePartD" value="Y"/>Yes</label>
		<label class="radio-inline"><input type="radio" name="medicarePartD" value="N"/>No</label>
		<label class="radio-inline"><input type="radio" name="medicarePartD" value="Don't Know"/>Don't Know</label>
	</div>

	<div class="form-group">
		<label>(1) If yes, have you applied for Low Income Subsidy (LIS)</label>
		<br/>
		<label class="radio-inline"><input type="radio" name="appliedLIS" value="Y"/>Yes</label>
		<label class="radio-inline"><input type="radio" name="appliedLIS" value="N"/>No</label>
		<label class="radio-inline"><input type="radio" name="appliedLIS" value="Don't Know"/>Don't Know</label>
	</div>
	<button type="submit" class="btn btn-default" name="previous" value="prevous">previous</button>
	<button type="submit" class="btn btn-default" name="next" value="next">next</button>
	</form>
	<!--<div class="row">
		<div class="col-sm-6">
			* Private Insurance Definition: Plans provided by the private insurance industry as a benefit of employment or through the
			Marketplace (e.g. Horizon Blue Cross Blue Shield, Aetna, Amerihealth, etc.).
		</div>
		<div class="col-sm-6">
			**COBRA Definition:
			COBRA stands for Consolidated Omnibus Budget Reconciliation Act. The law generally
			applies to all group health plans maintained by private-sector employers with 20 or more
			employees and sponsored by most state and local governments. If elected, COBRA
			allows individuals to continue group health coverage that would otherwise be lost due to
			certain specific events such as termination of employment. COBRA coverage extends
			from the date of the qualifying event for a limited period of time.
		</div>
	</div>-->
	</div>
</body>
</html>
