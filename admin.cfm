<!DOCTYPE html>
<html lang="en">
<head>
    <title>Administration</title>
    <cfinclude template="head.cfm"/>
    <script>
	$(document).ready(function(){
	    $('[data-toggle="tooltip"]').tooltip();   
	});
	</script>
</head>
<body>
	<cfinclude template="navbar.cfm"/>
<div class="container">
<center><b><font size="6" color="black">ADMIN PAGE</font></b></center>
<br><br>

    <div class="panel panel-success">
      <div class="panel-heading">Applications to review</div>
		<div class="panel-body">
		<div class="row">
		<div class="col-sm-3"><center><b>ID</b></center></div>
		<div class="col-sm-3"><center><b>Name</b></center></div>
		<div class="col-sm-3"><center><b>State</b></center></div>
		<div class="col-sm-3"><center><b>Date Submitted</b></center></div>
		</div>
		<div class="row">
		<div class="col-sm-3"><center><a href="http://127.0.0.1:8500/CFIDE/NewProject/Page1.cfm">1</a></center></div>
		<div class="col-sm-3"><center>Manish</center></div>
		<div class="col-sm-3"><center>NJ</center></div>
		<div class="col-sm-3"><center>03/04/2018</center></div>
		</div>
		<div class="row">
		<div class="col-sm-3"><center><a href="http://127.0.0.1:8500/CFIDE/NewProject/Page1.cfm">2</a></center></div>
		<div class="col-sm-3"><center>Alan</center></div>
		<div class="col-sm-3"><center>NJ</center></div>
		<div class="col-sm-3"><center>03/04/2018</center></div>
		</div>
		<div class="row">
		<div class="col-sm-3"><center><a href="http://127.0.0.1:8500/CFIDE/NewProject/Page1.cfm">3</a></center></div>
		<div class="col-sm-3"><center>Steve</center></div>
		<div class="col-sm-3"><center>NJ</center></div>
		<div class="col-sm-3"><center>03/04/2018</center></div>
		</div>
		<div class="row">
		<div class="col-sm-3"><center><a href="http://127.0.0.1:8500/CFIDE/NewProject/Page1.cfm">4</a></center></div>
		<div class="col-sm-3"><center>Taylor</center></div>
		<div class="col-sm-3"><center>NJ</center></div>
		<div class="col-sm-3"><center>03/04/2018</center></div>
		</div>
      </div>
	</div> 
  <div class="panel panel-success">
      <div class="panel-heading">Applications awaiting for senders edits</div>
      <div class="panel-body">
		<div class="row">
		<div class="col-sm-3"><center><b>ID</b></center></div>
		<div class="col-sm-3"><center><b>Name</b></center></div>
		<div class="col-sm-3"><center><b>State</b></center></div>
		<div class="col-sm-3"><center><b>Date Submitted</b></center></div>
		</div>
		<div class="row">
		<div class="col-sm-3"><center>5</center></div>
		<div class="col-sm-3"><center>Jean-Felix</center></div>
		<div class="col-sm-3"><center>NJ</center></div>
		<div class="col-sm-3"><center>03/31/2018</center></div>
		</div>
		<div class="row">
		<div class="col-sm-3"><center>6</center></div>
		<div class="col-sm-3"><center>Louis</center></div>
		<div class="col-sm-3"><center>NJ</center></div>
		<div class="col-sm-3"><center>03/29/2018</center></div>
		</div>
      </div>
    </div>
    <div class="panel panel-success">
      <div class="panel-heading">Document Tracker</div>
      <div class="panel-body">
		<div class="row">
		<div class="col-sm-3"><center><b>ID</b></center></div>
		<div class="col-sm-3"><center><b>Name</b></center></div>
		<div class="col-sm-3"><center><b>State</b></center></div>
		<div class="col-sm-3"><center><b>Date Submitted</b></center></div>
		</div>
		<div class="row">
		<div class="col-sm-3"><center><a href="#" data-toggle="tooltip" title="All forms submitted">1</a></center></div>
		<div class="col-sm-3"><center>Manish</center></div>
		<div class="col-sm-3"><center>NJ</center></div>
		<div class="col-sm-3"><center>03/04/2018</center></div>
		</div>
		<div class="row">
		<div class="col-sm-3"><center><a href="#" data-toggle="tooltip" title="1 form missing">2</a></center></div>
		<div class="col-sm-3"><center>Alan</center></div>
		<div class="col-sm-3"><center>NJ</center></div>
		<div class="col-sm-3"><center>03/04/2018</center></div>
		</div>
		<div class="row">
		<div class="col-sm-3"><center><a href="#" data-toggle="tooltip" title="All forms submitted">3</a></center></div>
		<div class="col-sm-3"><center>Steve</center></div>
		<div class="col-sm-3"><center>NJ</center></div>
		<div class="col-sm-3"><center>03/04/2018</center></div>
		</div>
		<div class="row">
		<div class="col-sm-3"><center><a href="#" data-toggle="tooltip" title="2 forms missing">4</a></center></div>
		<div class="col-sm-3"><center>Taylor</center></div>
		<div class="col-sm-3"><center>NJ</center></div>
		<div class="col-sm-3"><center>03/04/2018</center></div>
		</div>
      </div>
  </div>
</div>
<body>
<html/>