<!-- Session Page Protection -->
<cfset SessionClass=createObject('component','components.SessionTools')/>
<cfset SessionClass.checkIfLoggedIn()/>
<cfset SessionClass.checkIfadmin()/>
<cfset SessionClass.ClearSessionAppID() > <!-- If appID session variable set, clear it -->
<!-- gather required page data -->
<cfset AdminPull=createObject('component','components.Admin')/>
<cfset allApplications=AdminPull.GetAllApplications()/>
<cfset FormName=AdminPull.getNameInfo()/>
<cfdump var="#allApplications#"/>
<cfdump var="#FormName#"/>

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
<cfloop query="allApplications">
<cfoutput>
<div class='panel panel-default'>

<div class='panel-heading'>App ID - #APPID#</div>
<div class='panel-body'>
<div class='row'>
<cfloop query="FormName">
<cfif #allApplications.userID# eq #FormName.userID#>
<div class='col-sm-3'><center><b>#FormName.FirstName# #FormName.LastName#</b></center></div>
</cfif>
</cfloop>
<cfif #DATESUBMITED# eq "">
<div class='col-sm-3'><center><b>IN PROGRESS</b></center></div>
<cfelse>
<div class='col-sm-3'><center><b>#DATESUBMITED#</b></center></div>
</cfif>
<div class='col-sm-3'><center><b><a href='/CS491-RDE/application/dhas_page1.cfm?appID=#appID#'>View Application</a></b></center></div>
<div class='col-sm-3'><center><b><a href="www.google.com">Approve</a> | <a href="www.google.com">Edit</a> | <a href="www.google.com">Deny</a></b></center></div>
<br><br>
<div class='panel-body'><b><a href='/CS491-RDE/DocumentStatus.cfm?appID=#appID#'>Document Tracker Status</a></b</div>
<!--<div id='demo1' class='collapse'>
This is the drop down! YAY!<br>-->
</div>
</cfoutput>
<!--<center><button type='button' class='btn btn-info' data-toggle='collapse' data-target='#demo1'>Show More</button></center>
</div>-->
</div>
</div>
</cfloop>
</div>


</body>
<html/>