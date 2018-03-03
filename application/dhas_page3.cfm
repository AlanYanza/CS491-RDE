<!DOCTYPE html>
<html lang="en">
<head>
  <title>Application</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <!--<script type="text/javascript" src="scripts.js"></script>-->
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
		      <li><a href="../home.cfm">Home</a></li>
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
		<div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width:60%">
			Page 3 of 5
		</div>
	</div>
	
	<!--<strong>APPLICATION FOR PARTICIPATION IN THE AIDS DRUG DISTRIBUTION PROGRAM AND/OR HEALTH INSURANCE CONTINUATION PROGRAM (Continued)</strong>-->
	
	<div class="well text-center"><h4>Section 3 - INSURANCE STATUS</h4></div>
	<form action="">
	
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
	<div class="col-sm-5"><div class="form-group">
			<label for="Name">(a) Name:</label>
			<input type="text" class="form-control" id="Name" name="Name">
		</div></div>		
		<div class="col-sm-7"><div class="form-group">
			<label for="StreetAddress">(b) Address:</label>
			<input type="text" class="form-control" id="StreetAddress" name="StreetAddress">
		</div></div>			
	</div>
	<div class="row">
		<div class="col-sm-4"><div class="form-group"><label for="City">(c) City</label>
			<input type="text" class="form-control" id="City" name="City"></div></div>
		<div class="col-sm-4"><label for="state">State</label>			
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
		<div class="col-sm-4"><div class="form-group"><label for="Zip">Zip Code</label>
			<input type="text" class="form-control" id="Zip" name="Zip"></div></div>
	</div>
	<div class="row">
		<div class="col-sm-6"><div class="form-group">
			<label for="contact">(d) Contact</label>
			<input type="text" class="form-control" id="contact" name="contact">
		</div></div>
		<div class="col-sm-6"><div class="form-group">
			<label for="TelNumber">(e) Telephone Number</label>
			<input type="tel" class="form-control" id="TelNumber" name="TelNumber">
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
				<input type="date" class="form-control" id="start" name="start">
			</div>
		</div>
		
		<div class="form-horizontal">
			<label class="control-label col-sm-4">(2) When does it end?</label>
			<div class="col-sm-8">
				<input type="date" class="form-control" id="end" name="end">
			</div>
		</div>
	</div>
	<div class="row">
		<label class="col-sm-4">c. When is the next premium due?</label>
		<div class="col-sm-8">
			<input type="date" class="form-control" id="premium" name="premium">
		</div>
	</div>
	
	<div class="form-group">
		<label>d. Other(specify):</label>
		<input type="text" class="form-control" id="OS" name="OS">
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
			<input type="number" class="form-control" id="cap" name="cap"/>
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
			<input type="date" class="form-control" id="medicaidDate" name="medicaidDate">
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
			<input type="date" class="form-control" id="medicareDate" name="medicareDate">
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
	
	<ul class="pager">
		<li class="previous"><a href="./dhas_page2.cfm">Previous</a></li>
		<li class="next"><a href="./dhas_page4.cfm">Next</a></li>
	</ul>
	</div>
</body>
</html>