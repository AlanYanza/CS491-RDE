<!--- Session Page Protection --->
<cfset SessionClass=createObject('component',"CS491-RDE.components.SessionTools")/>
<cfset SessionClass.checkIfLoggedIn()/>
<cfif isDefined('url.appID')>
	<!--- create a session variable for appID --->
	<cfset session.appID=url.appID>
</cfif>
<!--- If a user access level,More Session Page Protection --->
<cfif session.accessLevel neq 'admin'>
	<cfset SessionClass.checkIfuser()>
	<cfset SessionClass.NoAppIDRedirect()>
	<cfset SessionClass.validateAppID()>
</cfif>
<cfset tableName='NJSection2'/>
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
			
			function dataCorrection(){
				$("form").find("input").removeAttr("required");
				$("form").find("input[type=number]").val(function() {
					if ($(this).val() != "") {
						console.log($(this).val());
						return $(this).val();
					}
					else {
						return 0;
					}
				});
			}

			function calTotal() {
				var totalIncome = 0;
				var income = $("#income").find("input[type=number]").serializeArray();
				$.each(income, (function(i, j){
					totalIncome += Number(j.value);
					console.log(totalIncome.toFixed(2));
				}));
				$("input[type=number][name=totalHIncome]").val(totalIncome.toFixed(2));
			}

			$("#income input[type=number]").keyup(calTotal);

	  		$("button[type=submit][name=save]").click(dataCorrection);
			$("button[type=submit][name=previous]").click(dataCorrection);

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
		<div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:40%">
			Page 2 of 5
		</div>
	</div>

	<!--<strong>APPLICATION FOR PARTICIPATION IN THE AIDS DRUG DISTRIBUTION PROGRAM AND/OR HEALTH INSURANCE CONTINUATION PROGRAM (Continued)</strong>-->

	<div class="well text-center"><h4>Section 2 - HOUSEHOLD INCOME</h4></div>
	<form action="../scripts/NJScript.cfm" method="POST">
	<div id="formData">
	<input type="hidden" id="formPage" name="formPage" value="page2"/>
	<input type="hidden" id="tableName" name="tableName" value="<cfoutput>#tableName#</cfoutput>"/>

	<div class="form-group">
		<label for="EmplyStatus">What if your current employment status? <span style="color: red;">*</span></label>
		<select class="form-control" name="EmplyStatus" required>
			<option value='X' <cfset subformClass.showSelectionField('EmplyStatus',subformData,'X')/>>Choose one</option>
			<option value="F" <cfset subformClass.showSelectionField('EmplyStatus',subformData,'F')/>>Full Time (35 or more hours per week)</option>
			<option value="P" <cfset subformClass.showSelectionField('EmplyStatus',subformData,'P')/>>Part Time (less than 35 hours per week)</option>
			<option value="N" <cfset subformClass.showSelectionField('EmplyStatus',subformData,'N')/>>Not employed</option>
		</select>
	</div>

	<hr/>

	<div class="form-group">
		<label>Are you medically <span style="text-decoration: underline;">UNABLE</span> to work? <span style="color: red;">*</span></label>
		<br/>
		<label class="radio-inline"><input type="radio" name="unableWork" value="Y" <cfset subformClass.showRadioButton('unableWork',subformData,'Y')/> required />Yes</label>
		<label class="radio-inline"><input type="radio" name="unableWork" value="N" <cfset subformClass.showRadioButton('unableWork',subformData,'N')/>/>No</label>
	</div>

	<hr/>

	<div class="form-group">
		<label>Medically unable to work <span style="text-decoration: underline;">LESS</span> than 12 months? <span style="color: red;">*</span></label>
		<br/>
		<label class="radio-inline"><input type="radio" name="unable12LMonth" value="Y" <cfset subformClass.showRadioButton('unable12LMonth',subformData,'Y')/> required />Yes</label>
		<label class="radio-inline"><input type="radio" name="unable12LMonth" value="N" <cfset subformClass.showRadioButton('unable12LMonth',subformData,'N')/>/>No</label>
	</div>

	<hr/>

	<div class="form-group">
		<label>Medically unable to work <span style="text-decoration: underline;">MORE</span> than 12 months? <span style="color: red;">*</span></label>
		<br>
			<label class="radio-inline"><input type="radio" name="unable12MMonth" value="Y" <cfset subformClass.showRadioButton('unable12MMonth',subformData,'Y')/> required />Yes</label>
			<label class="radio-inline"><input type="radio" name="unable12MMonth" value="N" <cfset subformClass.showRadioButton('unable12MMonth',subformData,'N')/>/>No</label>
	</div>

	<hr/>

	<div class="form-inline">
	  <label for="HPersonNum">Number of person in your household unit (include yourself): <span style="color: red;">*</span></label>
	  <input type="number" class="form-control" name="HPersonNum" value="<cfoutput>#subformData.HPersonNum#</cfoutput>" required />
	</div>

	<hr/>

	<strong>List any annual household income:</strong>

	<div class="form-horizontal">
		<div id="income">
		  	<label class="control-label col-sm-4" for="salary">Salary/Wages:</label>
		  	<div class="col-sm-8 input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
				<input type="number" class="form-control" name="salary" min="0" step="0.01" max="1000000" value="<cfoutput>#subformData.salary#</cfoutput>" required />
		  	</div>
		  	<label class="control-label col-sm-4" for="disBen">Disability Benefit:</label>
		  	<div class="col-sm-8 input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
				<input type="number" class="form-control" name="disBen" min="0" step="0.01" max="1000000" value="<cfoutput>#subformData.disBen#</cfoutput>" required />
		  	</div>
		  	<label class="control-label col-sm-4" for="genAssist">General Assistance:</label>
		  	<div class="col-sm-8 input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
				<input type="number" class="form-control" name="genAssist" min="0" step="0.01" max="1000000" value="<cfoutput>#subformData.genAssist#</cfoutput>" required />
		  	</div>
		  	<label class="control-label col-sm-4" for="unemploy">Unemployment:</label>
		  	<div class="col-sm-8 input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
				<input type="number" class="form-control" name="unemploy" min="0" step="0.01" max="1000000" value="<cfoutput>#subformData.unemploy#</cfoutput>" required />
		  	</div>
		  	<label class="control-label col-sm-4" for="socialSecurity">Social Security:</label>
		  	<div class="col-sm-8 input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
				<input type="number" class="form-control" name="socialSecurity" min="0" step="0.01" max="1000000" value="<cfoutput>#subformData.socialSecurity#</cfoutput>" required />
		  	</div>
		  	<label class="control-label col-sm-4" for="pension">Pension/Retirement:</label>
		  	<div class="col-sm-8 input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
				<input type="number" class="form-control" name="pension" min="0" step="0.01" max="1000000" value="<cfoutput>#subformData.pension#</cfoutput>" required />
		  	</div>
		  	<label class="control-label col-sm-4" for="allimony">Alimony/Palimony:</label>
		  	<div class="col-sm-8 input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
				<input type="number" class="form-control" name="allimony" min="0" step="0.01" max="1000000" value="<cfoutput>#subformData.allimony#</cfoutput>" required />
		  	</div>
		  	<label class="control-label col-sm-4" for="OtherIncome">Other:</label>
		  	<div class="col-sm-8 input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
		    	<input type="number" class="form-control" name="OtherIncome" min="0" step="0.01" max="1000000" value="<cfoutput>#subformData.OtherIncome#</cfoutput>" required />
		  	</div>
		</div>
			<label class="control-label col-sm-4" for="totalHIncome">Total Annual Household Income:</label>
			<div class="col-sm-8 input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
				<input type="number" class="form-control" name="totalHIncome" min="0" step="0.01" max="1000000" value="<cfoutput>#subformData.totalHIncome#</cfoutput>" readonly required />
			</div>
	</div>

	<hr/>

	<div class="form-group">
		<label for ="taxFile">Did you and/or any member of your household file a Federal, State or City Income Tax return last year? <span style="color: red;">*</span></label>
		<br/>
		<label class="radio-inline"><input type="radio" name="taxFile" value="Y" <cfset subformClass.showRadioButton('taxFile',subformData,'Y')/> required />Yes</label>
		<label class="radio-inline"><input type="radio" name="taxFile" value="N" <cfset subformClass.showRadioButton('taxFile',subformData,'N')/>/>No</label>
	</div>

	<div class="form-group">
		<label for="dependant">Were you listed as a dependent on a family member's Federal, State, or City Income tax return last year? <span style="color: red;">*</span></label>
		<br/>
		<label class="radio-inline"><input type="radio" name="dependant" value="Y" <cfset subformClass.showRadioButton('dependant',subformData,'Y')/> required />Yes</label>
		<label class="radio-inline"><input type="radio" name="dependant" value="N" <cfset subformClass.showRadioButton('dependant',subformData,'N')/>/>No</label>
	</div>

	<hr/>

	<strong>Have you applied for or are you currently receiving any of the following? (Check ALL that apply)</strong>
	<br/>
	<br/>
	<div class="row">
		<div class="col-sm-8">Temporary Assistance to Needy Families (TANF)</div>
		<div class="col-sm-2"><label class="radio-inline"><input type="radio" name="TANF" value="A" <cfset subformClass.showRadioButton('TANF',subformData,'A')/>/>Applied For</label></div>
		<div class="col-sm-2"><label class="radio-inline"><input type="radio" name="TANF" value="R" <cfset subformClass.showRadioButton('TANF',subformData,'R')/>/>Receiving</label></div>
	</div>
	<div class="row">
		<div class="col-sm-8">Supportive Assistance to Individuals and Families (SAIF) Program</div>
		<div class="col-sm-2"><label class="radio-inline"><input type="radio" name="SAIF" value="A" <cfset subformClass.showRadioButton('SAIF',subformData,'A')/>/>Applied For</label></div>
		<div class="col-sm-2"><label class="radio-inline"><input type="radio" name="SAIF" value="R" <cfset subformClass.showRadioButton('SAIF',subformData,'R')/>/>Receiving</label></div>
	</div>
	<div class="row">
		<div class="col-sm-8">Supplemental Security Income (SSI) Program</div>
		<div class="col-sm-2"><label class="radio-inline"><input type="radio" name="SSI" value="A" <cfset subformClass.showRadioButton('SSI',subformData,'A')/>/>Applied For</label></div>
		<div class="col-sm-2"><label class="radio-inline"><input type="radio" name="SSI" value="R" <cfset subformClass.showRadioButton('SSI',subformData,'R')/>/>Receiving</label></div>
	</div>
	<div class="row">
		<div class="col-sm-8">General Assistance (GA)</div>
		<div class="col-sm-2"><label class="radio-inline"><input type="radio" name="GA" value="A" <cfset subformClass.showRadioButton('GA',subformData,'A')/>>Applied For</label></div>
		<div class="col-sm-2"><label class="radio-inline"><input type="radio" name="GA" value="R" <cfset subformClass.showRadioButton('GA',subformData,'R')/>/>Receiving</label></div>
	</div>
	<div class="row">
		<div class="col-sm-8">Supplemental Nutrition Assistance Program (SNAP) (formerly Food Stamps)</div>
		<div class="col-sm-2"><label class="radio-inline"><input type="radio" name="SNAP" value="A" <cfset subformClass.showRadioButton('SNAP',subformData,'A')/>/>Applied For</label></div>
		<div class="col-sm-2"><label class="radio-inline"><input type="radio" name="SNAP" value="R" <cfset subformClass.showRadioButton('SNAP',subformData,'R')/>/>Receiving</label></div>
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
</div>
</body>
</html>