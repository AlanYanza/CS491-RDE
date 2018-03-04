<!DOCTYPE html>
<html lang="en">
<head>
  <title>Register</title>
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