<!--- If user is already signed in, prevent them entering --->
<cfset SessionClass=createObject('component','components.SessionTools')/>
<cfset SessionClass.ClearSessionAppID() > <!--- If appID session variable set, clear it --->
<cfset SessionClass.ifAlreadySignIn()/>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Register</title>
	<cfinclude template="head.cfm"/>
	<script>
		"use strict";
		$(document).ready(function(){
			var password = document.getElementById("password")
			var confirm_password = document.getElementById("confirm_password");

			function validatePassword() {
				if(password.value != confirm_password.value) {
					confirm_password.setCustomValidity("Passwords Don't Match");
				}
				else {
					confirm_password.setCustomValidity('');
				}
			}

			password.onchange = validatePassword;
			confirm_password.onkeyup = validatePassword;
		});
	</script>
</head>
<body>
<cfinclude template="navbar.cfm">
<div class="container">
	<!--- If user already existed, alert user --->
	<cfif IsDefined('url.Exist')>
		<cfoutput>
			<div class="alert alert-warning">
				<a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				Email Already Registered.
			</div>
		</cfoutput>
	</cfif>
	<div class="page-header">
		<h1>Register</h1>
	</div>
	<div class="row">
		<div class="col-sm-6">
			
			<p>Already a member? <a href="index.cfm">Log in here</a></p>
			<br/>

			<form class="form-horizontal" action="scripts/register.cfm" method="post">
				<div class="form-group">
				    <label class="control-label col-sm-3" for="email">Email:</label>
				    <div class="col-sm-9">
				    	<input type="email" class="form-control" id="email" name="email" placeholder="Enter email" required/>
				    </div>
				</div>
				<div class="form-group">
				    <label class="control-label col-sm-3" for="password">Password:</label>
				    <div class="col-sm-9">
				    	<input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required/>
				    </div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3"  for="confirm_password">Confirm Password:</label>
					<div class="col-sm-9">
						<input type="password" class="form-control" id="confirm_password" placeholder="Confirm password" required/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3"  for="firstName">First Name:</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="firstName" placeholder="Enter Your First Name" required/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3"  for="lastName">Last Name:</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="lastName" placeholder="Enter Your Last Name" required/>
					</div>
				</div>
				<div class="form-group">
			    	<div class="col-sm-offset-3 col-sm-9">
			      		<button type="submit" class="btn btn-default">Register</button>
				    </div>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>