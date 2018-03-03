<!DOCTYPE html>
<html lang="en">
<head>
  <title>Login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
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
		      <li class="active"><a>Home</a></li>
		    </ul>
		</div>
	</div>
</nav>
<div class="container">
	<div class="row">
		<!-- Login Section-->
		<div class="col-sm-6">
			<div class="page-header">
				<h1>Login</h1>
			</div>
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

		<div class="col-sm-6">
			<div class="page-header">
				<h1>Register</h1>
			</div>
			<p>Already a member? <a href="index.cfm">Log in here</a></p>
			<br/>

			<form class="form-horizontal" action="#">
				<div class="form-group">
				    <label class="control-label col-sm-3" for="email">Email:</label>
				    <div class="col-sm-9">
				    	<input type="email" class="form-control" id="email" placeholder="Enter email">
				    </div>
				</div>
				<div class="form-group">
				    <label class="control-label col-sm-3" for="password">Password:</label>
				    <div class="col-sm-9">
				    	<input type="password" class="form-control" id="password" name="password" placeholder="Enter password">
				    </div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3"  for="confirm_password">Confirm Password:</label>
					<div class="col-sm-9">
						<input type="password" class="form-control" id="confirm_password" name="confirm_password" placeholder="Confirm password" required/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3"  for="firstName">First Name:</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="firstName" required/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3"  for="lastName">Last Name:</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" name="lastName" required/>
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