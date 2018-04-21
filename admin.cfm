<!-- Session Page Protection -->
<cfset SessionClass=createObject('component','components.SessionTools')/>
<cfset SessionClass.checkIfLoggedIn()/>
<cfset SessionClass.checkIfadmin()/>
<cfset SessionClass.ClearSessionAppID() > <!-- If appID session variable set, clear it -->
<!-- gather required page data -->
<cfset AdminPull=createObject('component','components.Admin')/>
<cfset allApplications=AdminPull.GetAllApplications()/>
<cfset FormName=AdminPull.getNameInfo()/>
<!---<cfdump var="#allApplications#"/> --->
<!---<cfdump var="#FormName#"/> --->

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
<div class="container" style="margin-top:20px">
	<div class="page-header">
		<div class="text-center"><h1>Admin Portal</h1></div>
	</div>
	<ul class="nav nav-tabs">
		<li class="active"><a data-toggle="tab" href="#submitted">Home</a></li>
		<li><a data-toggle="tab" href="#inProcess">In Progess</a></li>
		<li><a data-toggle="tab" href="#returned">Returned</a></li>
	</ul>
	<br/>
	<div class="tab-content">  
		<div id="submitted" class="tab-pane fade in active">
		<cfloop query="allApplications">
			<cfif #STATUS# eq "R">
				<cfoutput>					
					<div class='panel panel-default'>
						<div class='panel-heading'>App ID - #APPID# | #FName# #LNAME#</div>
						<div class='panel-body'>
							<div class='row text-center'>
								<div class='col-sm-3'>#FName# #LNAME#</div>
								<cfif #DATESUBMITED# eq "">
									<div class='col-sm-3'><strong>IN PROGRESS</strong></div>
									<cfelse>
									<div class='col-sm-3'><strong>#DATESUBMITED#</strong></div>
								</cfif>
								<div class='col-sm-3'><strong><a href='/CS491-RDE/application/dhas_page1.cfm?appID=#appID#'>View Application</a></strong></div>
									<button type="button" class="btn btn-default"><span class="text-success">Approve</span></button>
									<button type="button" class="btn btn-default"><span class="text-info">Return</span></button>
									<button type="button" class="btn btn-default"><span class="text-danger">Deny</span></button>
								<div class='panel-body'><a href='/CS491-RDE/DocumentStatus.cfm?appID=#appID#'>Document Tracker Status</a></div>
							</div>
						</div>
					</div>
				</cfoutput>
			</cfif>
		</cfloop>
		</div>

		<div id="inProcess" class="tab-pane fade">
		<cfloop query="allApplications">
			<cfif #STATUS# eq "P">
				<cfoutput>					
					<div class='panel panel-default'>
						<div class='panel-heading'>App ID - #APPID# | #FName# #LNAME#</div>
						<div class='panel-body'>
							<div class='row'>
								<div class='col-sm-3'>#FName# #LNAME#</div>
								<cfif #DATESUBMITED# eq "">
									<div class='col-sm-3'><strong>IN PROGRESS</strong></div>
									<cfelse>
									<div class='col-sm-3'><strong>#DATESUBMITED#</strong></div>
								</cfif>
								<div class='col-sm-3'><strong><a href='/CS491-RDE/application/dhas_page1.cfm?appID=#appID#'>View Application</a></strong></div>
							</div>							
						</div>
						<div class='panel-footer'><a href='/CS491-RDE/DocumentStatus.cfm?appID=#appID#'>Document Tracker Status</a></div>
					</div>
				</cfoutput>
			</cfif>
		</cfloop>
		</div>

		<div id="returned" class="tab-pane fade">
		<cfloop query="allApplications">
			<cfif #STATUS# eq "D">
				<cfoutput>					
					<div class='panel panel-default'>
						<div class='panel-heading'>App ID - #APPID# #FName# #LNAME#</div>
						<div class='panel-body'>
							<div class='row text-center'>
								<div class='col-sm-3'>#FName# #LNAME#</div>
								<cfif #DATESUBMITED# eq "">
									<div class='col-sm-3'><strong>IN PROGRESS</strong></div>
									<cfelse>
									<div class='col-sm-3'><strong>#DATESUBMITED#</strong></div>
								</cfif>
								<div class='col-sm-3'><strong><a href='/CS491-RDE/application/dhas_page1.cfm?appID=#appID#'>View Application</a></strong></div>
									<button type="button" class="btn btn-default"><span class="text-success">Approve</span></button>
									<button type="button" class="btn btn-default"><span class="text-info">Return</span></button>
									<button type="button" class="btn btn-default"><span class="text-danger">Deny</span></button>
								<div class='panel-body'><a href='/CS491-RDE/DocumentStatus.cfm?appID=#appID#'>Document Tracker Status</a></div>
							</div>
						</div>
					</div>
				</cfoutput>
			</cfif>
		</cfloop>
		</div>
	</div>
</div>
</body>
<html/>