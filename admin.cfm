<!-- Session Page Protection -->
<cfset SessionClass=createObject('component','components.SessionTools')/>
<cfset SessionClass.checkIfLoggedIn()/>
<cfset SessionClass.checkIfadmin()/>
<cfset SessionClass.ClearSessionAppID() > <!-- If appID session variable set, clear it -->
<!-- gather required page data -->
<cfset AdminPull=createObject('component','components.Admin')/>
<cfset allApplications=AdminPull.GetAllApplication()/>
<cfdump var="Test"/>
<cfdump var="#allApplications#"/>
	
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
<div class="page-header">
		<center><h1>Admin Portal</h1></center>
	</div>
<br><br>

    <div class="panel panel-default">
      <div class="panel-heading">Application ID - Name</div>
		<div class="panel-body">
		<div class="row">
		<div class="col-sm-3"><center><b>Form Name</b></center></div>
		<div class="col-sm-3"><center><b>Date Submitted</b></center></div>
		<div class="col-sm-3"><center><b>View Application</b></center></div>
		<div class="col-sm-3"><center><b>Approve | Edit | Deny</b></center></div>
		<br><br>
		<div id="demo1" class="collapse">
		This is the drop down! YAY!<br>
		This is the drop down! YAY!<br>
		This is the drop down! YAY!This is the drop down! YAY!<br>
		This is the drop down! YAY!<br>
		This is the drop down! YAY!<br>
		This is the drop down! YAY!<br>
		This is the drop down! YAY!<br>
		This is the drop down! YAY!<br>
		This is the drop down! YAY!<br>
		This is the drop down! YAY!<br>
		This is the drop down! YAY!This is the drop down! YAY!<br>
		This is the drop down! YAY!<br>
		</div>
		<center><button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo1">Show More</button></center>
		</div>
      </div>
	</div> 
  <div class="panel panel-default">
      <div class="panel-heading">Application ID - Name</div>
		<div class="panel-body">
		<div class="row">
		<div class="col-sm-3"><center><b>Form Name</b></center></div>
		<div class="col-sm-3"><center><b>Date Submitted</b></center></div>
		<div class="col-sm-3"><center><b>View Application</b></center></div>
		<div class="col-sm-3"><center><b>Approve | Edit | Deny</b></center></div>
		<br><br>
		<div id="demo2" class="collapse">
		This is the drop down! YAY!
		</div>
		<center><button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo2">Show More</button></center>
		</div>
      </div>
	</div> 
    <div class="panel panel-default">
      <div class="panel-heading">Application ID - Name</div>
		<div class="panel-body">
		<div class="row">
		<div class="col-sm-3"><center><b>Form Name</b></center></div>
		<div class="col-sm-3"><center><b>Date Submitted</b></center></div>
		<div class="col-sm-3"><center><b>View Application</b></center></div>
		<div class="col-sm-3"><center><b>Approve | Edit | Deny</b></center></div>
		<br><br>
		<div id="demo3" class="collapse">
		This is the drop down! YAY!
		</div>
		<center><button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo3">Show More</button></center>
		</div>
      </div>
	</div> 
<body>
<html/>