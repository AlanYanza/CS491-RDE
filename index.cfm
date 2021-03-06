<!--- If user is already signed in, prevent them entering --->
<cfset SessionClass=createObject('component','components.SessionTools')/>
<cfset SessionClass.ClearSessionAppID() > <!--- If appID session variable set, clear it --->
<cfset SessionClass.ifAlreadySignIn()/>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Login</title>
  <cfinclude template="head.cfm"/>
</head>
<body>
<cfinclude template="navbar.cfm">
<div class="container">
	<!--- If user registered successfully, alert user --->
	<cfif IsDefined('url.registered')>
		<cfoutput>
			<div class="alert alert-success">
				<a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				Successfully registered
			</div>
		</cfoutput>
	</cfif>
	<!--- If user provided wrong login, alert user --->
	<cfif IsDefined('url.wrongLogin')>
		<cfoutput>
			<div class="alert alert-warning">
				<a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				Incorrect login credentials. Please try again.
			</div>
		</cfoutput>
	</cfif>
	<div class="page-header">
		<h1>Login</h1>
	</div>
	<div class="row">
		<!--- Login Section--->
		<div class="col-sm-6">
			
			<p>Not a member? <a href="register.cfm">Register here</a></p>
			<br/>

			<form class="form-horizontal" method="POST" action="scripts/login.cfm">
				<div class="form-group">
				    <label class="control-label col-sm-2" for="email">Email:</label>
				    <div class="col-sm-10">
				    	<input type="email" class="form-control" id="email" name="email" placeholder="Enter email" required/>
				    </div>
				</div>
				<div class="form-group">
				    <label class="control-label col-sm-2" for="pwd">Password:</label>
				    <div class="col-sm-10">
				    	<input type="password" class="form-control" id="pwd" name="pwd" placeholder="Enter password" required/>
				    </div>
				</div>				<div class="form-group">
			    	<div class="col-sm-offset-2 col-sm-10">
			      		<button type="submit" class="btn btn-default">Submit</button>
				    </div>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>