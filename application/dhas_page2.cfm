<!DOCTYPE html>
<html lang="en">
<head>
  <title>Application</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>                        
			</button>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
		    <ul class="nav navbar-nav">
		      <li><a href="home.cfm">Home</li>
		      <li class="active"><a href="#">Application</a></li>
		      <li><a href="./message.cfm">Messages <span class="badge">1</span></a></li>
		    </ul>		
			<ul class="nav navbar-nav navbar-right">
		      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Name</a></li>
		      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Signout</a></li>
		    </ul>
		</div>
	</div>
</nav>
<div class="container">
	<h3>Progress</h3>
	<div class="progress">
		<div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:40%">
			Page 2 of 5
		</div>
	</div>
	
	<!--<strong>APPLICATION FOR PARTICIPATION IN THE AIDS DRUG DISTRIBUTION PROGRAM AND/OR HEALTH INSURANCE CONTINUATION PROGRAM (Continued)</strong>-->
	
	<div class="well text-center"><h4>Section 2 - HOUSEHOLD INCOME</h4></div>
	
	<form>
	<div class="form-group">
		<label for="employment">17. What if your current employment status?</label>
		<select class="form-control" name="employment">
			<option selected>Choose one</option>
			<option value="Full time">Full Time (35 or more hours per week)</option>
			<option value="Part time">Part Time (less than 35 hours per week)</option>
			<option value="Not employed">Not employed</option>
		</select>
	</div>
	
	<hr/>
	
	<div class="form-group">
		<label> 18. Are you medically UNABLE to work?</label>
		<br/>
		<label class="radio-inline"><input type="radio" name="UnableToWork" value="yes"/>Yes</label>
		<label class="radio-inline"><input type="radio" name="UnableToWork" value="no"/>No</label>
	</div>
	
	<hr/>
	
	<div class="form-group">
		<label>19. Medically unable to work LESS than 12 months?</label>
		<br/>
		<label class="radio-inline"><input type="radio" name="UnableToWork12" value="UnableToWork"/>Yes</label>
		<label class="radio-inline"><input type="radio" name="UnableToWork12" value="UnableToWork"/>No</label>
	</div>
	
	<hr/>
	
	<div class="form-group">
		<label>20. Medically unable to work MORE than 12 months?</label>
		<br>
			<label class="radio-inline"><input type="radio" name="UnableToWork12Up" value="UnableToWork"/>Yes</label>
			<label class="radio-inline"><input type="radio" name="UnableToWork12Up" value="UnableToWork"/>No</label>
	</div>
	
	<hr/>
	
	<div class="form-inline">
	  <label for="NumberHousehold">21. Number of person in your household unit (include yourself):</label>
	  <input type="number" class="form-control" id="NumberHousehold" name="NumberHousehold">
	</div>
	
	<hr/>
	
	<strong>22. List any annual household income:</strong>
	<div class="form-horizontal">		  
	  	<label class="control-label col-sm-3" for="Salary/Wages">Salary/Wages:</label>
	  	<div class="col-sm-9 input-group">
			<span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
			<input type="number" class="form-control" id="Salary/Wages" name="Salary/Wages"/>
	  	</div>
	  	<label class="control-label col-sm-3" for="DisabilityBenefits">Disability Benefit:</label>
	  	<div class="col-sm-9 input-group">
			<span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
			<input type="number" class="form-control" id="DisabilityBenefits" name="DisabilityBenefits"/>
	  	</div>
	  	<label class="control-label col-sm-3" for="GeneralAssistance">General Assistance:</label>
	  	<div class="col-sm-9 input-group">
			<span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
			<input type="number" class="form-control" id="GeneralAssistance" name="GeneralAssistance"/>
	  	</div>
	  	<label class="control-label col-sm-3" for="Unemployment">Unemployment:</label>
	  	<div class="col-sm-9 input-group">
			<span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
			<input type="number" class="form-control" id="Unemployment" name="Unemployment"/>
	  	</div>
	  	<label class="control-label col-sm-3" for="SocialSecurity">Social Security:</label>
	  	<div class="col-sm-9 input-group">
			<span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
			<input type="number" class="form-control" id="SocialSecurity" name="SocialSecurity"/>
	  	</div>
	  	<label class="control-label col-sm-3" for="PensionRetirement">Pension/Retirement:</label>
	  	<div class="col-sm-9 input-group">
			<span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
			<input type="number" class="form-control" id="PensionRetirement" name="PensionRetirement"/>
	  	</div>
	  	<label class="control-label col-sm-3" for="AlimonyPalimony">Alimony/Palimony:</label>
	  	<div class="col-sm-9 input-group">
			<span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
			<input type="number" class="form-control" id="AlimonyPalimony" name="AlimonyPalimony"/>
	  	</div>
	  	<label class="control-label col-sm-3" for="Other">Other:</label>
	  	<div class="col-sm-9 input-group">
			<span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
	    	<input type="number" class="form-control" id="Other" name="Other"/>
	  	</div>	  
	  	<label class="control-label col-sm-3" for="TotalIncome">Total Annual Household Income:</label>
	  	<div class="col-sm-9 input-group">
	    	<span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
	    	<input type="number" class="form-control" id="TotalIncome" name="TotalIncome"/>
	  	</div>
	</div>
	
	<hr/>
	
	<div class="form-group row">
	  	<div class="col-sm-1"><strong>23.</strong></div> 
	  	<div class="col-sm-11">
		  	<label>a. Did you and/or any member of your household file a Federal, State or City Income Tax return last year?</label>
		  	<br/>
		  	<label class="radio-inline"><input type="radio" name="Federal" value="Federal"/>Yes</label>
		  	<label class="radio-inline"><input type="radio" name="Federal" value="Federal"/>No</label>
	  	</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12 col-sm-offset-1">
			<label>b. Were you listed as a dependent on a family member's Federal, State, or City Income tax return last year?</label>
			<br/>
			<label class="radio-inline"><input type="radio" name="Dependent" value="Dependent"/>Yes</label>
			<label class="radio-inline"><input type="radio" name="Dependent" value="Dependent"/>No</label>
		</div>
	</div>
	
	<hr/>
	
	<strong>24. Have you applied for or are you currently receiving any of the following? (Check ALL that apply)</strong>
	<br/>
	<br/>
	<div class="row">
		<div class="col-sm-8">Temporary Assistance to Needy Families (TANF)</div>
		<div class="col-sm-2"><label class="radio-inline"><input type="radio" name="TANF" value="A"/>Applied For<label></div>
		<div class="col-sm-2"><label class="radio-inline"><input type="radio" name="TANF" value="R"/>Receiving<label></div>
	</div>
	<div class="row">
		<div class="col-sm-8">Supportive Assistance to Individuals and Families (SAIF) Program</div>
		<div class="col-sm-2"><label class="radio-inline"><input type="radio" name="SAIF" value="A"/>Applied For<label></div>
		<div class="col-sm-2"><label class="radio-inline"><input type="radio" name="SAIF" value="R"/>Receiving<label></div>
	</div>
	<div class="row">
		<div class="col-sm-8">Supplemental Security Income (SSI) Program</div>
		<div class="col-sm-2"><label class="radio-inline"><input type="radio" name="SSI" value="A"/>Applied For<label></div>
		<div class="col-sm-2"><label class="radio-inline"><input type="radio" name="SSI" value="R"/>Receiving<label></div>
	</div>
	<div class="row">
		<div class="col-sm-8">General Assistance (GA)</div>
		<div class="col-sm-2"><label class="radio-inline"><input type="radio" name="GA" value="A"/>Applied For<label></div>
		<div class="col-sm-2"><label class="radio-inline"><input type="radio" name="GA" value="R"/>Receiving<label></div>
	</div>
	<div class="row">
		<div class="col-sm-8">Supplemental Nutrition Assistance Program (SNAP) (formerly Food Stamps)</div>
		<div class="col-sm-2"><label class="radio-inline"><input type="radio" name="SNAP" value="A"/>Applied For<label></div>
		<div class="col-sm-2"><label class="radio-inline"><input type="radio" name="SNAP" value="R"/>Receiving<label></div>
		
	</div>
	  
	</form>
	<ul class="pager">
		<li class="previous"><a href="./dhas_page1.cfm">Previous</a></li>
		<li class="next"><a href="./dhas_page3.cfm">Next</a></li>
	</ul>
</body>
</html>