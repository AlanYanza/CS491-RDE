<!DOCTYPE html>
<html lang="en">
<head>
  <title>Login</title>
  <cfinclude template="head.cfm"/>
</head>
<body>
<cfinclude template="navbar.cfm">
<div class="container">
	<div class="page-header">
		<h1>Login</h1>
	</div>
	<div class="row">
		<!-- Login Section-->
		<div class="col-sm-6">
			
			<p>Not a member? <a href="register.cfm">Register here</a></p>
			<br/>

			<form class="form-horizontal" action="#">
				<div class="form-group">
				    <label class="control-label col-sm-2" for="email">Email:</label>
				    <div class="col-sm-10">
				    	<input type="email" class="form-control" id="email" placeholder="Enter email">
				    </div>
				</div>
				<div class="form-group">
				    <label class="control-label col-sm-2" for="pwd">Password:</label>
				    <div class="col-sm-10">
				    	<input type="password" class="form-control" id="pwd" placeholder="Enter password">
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