<!DOCTYPE html>
<html lang="en">
<head>
  <title>Login</title>
  <cfinclude template="head.cfm"/>
</head>
<body>
<cfinclude template="navbar.cfm">
<div class="container">
	<cfif IsDefined('url.registered')>
		<cfoutput>
			<div class="alert alert-success">
				<a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				Successfully registered
			</div>
		</cfoutput>
	</cfif>
	<!--- It's not good practice to let individuals know that a username does not exist. --->
	<!---<cfif IsDefined('url.noUser')>
		<cfoutput>Indicated User Doesn't Exist: Please try again</cfoutput>
	</cfif>--->
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
		<!-- Login Section-->
		<div class="col-sm-6">
			
			<p>Not a member? <a href="register.cfm">Register here</a></p>
			<br/>

			<form class="form-horizontal" method="POST" action="scripts/login.cfm">
				<div class="form-group">
				    <label class="control-label col-sm-2" for="email">Email:</label>
				    <div class="col-sm-10">
				    	<input type="email" class="form-control" id="email" name="email" placeholder="Enter email">
				    </div>
				</div>
				<div class="form-group">
				    <label class="control-label col-sm-2" for="pwd">Password:</label>
				    <div class="col-sm-10">
				    	<input type="password" class="form-control" id="pwd" name="pwd" placeholder="Enter password">
				    </div>
				</div>
				<div class="form-group">
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