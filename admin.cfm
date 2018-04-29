<!-- Session Page Protection -->
<cfset SessionClass=createObject('component','components.SessionTools')/>
<cfset SessionClass.checkIfLoggedIn()/>
<cfset SessionClass.checkIfadmin()/>
<cfset SessionClass.ClearSessionAppID() > <!-- If appID session variable set, clear it -->
<!-- gather required page data -->
<cfset AdminPull=createObject('component','components.Admin')/>
<cfset allApplications=AdminPull.GetAllApplications()/>

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
		$("#myInput1").on("keyup", function() {
			var value = $(this).val().toLowerCase();
			$("#submitted div.panel").filter(function() {
			  $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
			});
		});

		$("#myInput2").on("keyup", function() {
			var value = $(this).val().toLowerCase();
			$("#approved div.panel").filter(function() {
			  $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
			});
		});

		$("#myInput3").on("keyup", function() {
			var value = $(this).val().toLowerCase();
			$("#inProcess div.panel").filter(function() {
			  $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
			});
		});

		$("#myInput4").on("keyup", function() {
			var value = $(this).val().toLowerCase();
			$("#returned div.panel").filter(function() {
			  $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
			});
		});
	});
	</script>

</head>
<body>
<cfinclude template="navbar.cfm"/>
<div class="container" style="margin-top:20px" >
	<cfif IsDefined('url.ApproveChange')>
		<cfoutput>
			<div class="alert alert-success">
			<a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			<strong>Success! </strong>Application Status Changed to Approved
			</div>
		</cfoutput> 
	</cfif>
	<div class="page-header">
		<div class="text-center"><h1>Admin Portal</h1></div>
	</div>
	<ul class="nav nav-tabs">
		<li class="active"><a data-toggle="tab" href="#submitted">Home</a></li>
		<li><a data-toggle="tab" href="#inProcess">In Progess</a></li>
		<li><a data-toggle="tab" href="#returned">Returned</a></li>
		<li><a data-toggle="tab" href="#approved">Approved</a></li>
	</ul>
	<br/>
	<div class="tab-content">  
		<div id="submitted" class="tab-pane fade in active">
		<input class="form-control" id="myInput1" type="text" placeholder="Search submitted applications..."></br>
		<cfloop query="allApplications">
			<cfif #STATUS# eq "R">
				<cfoutput>	
					<form action = './scripts/AdminS.cfm' method="POST">
					<div class='panel panel-default'>
						<div class='panel-heading'>App ID - #APPID#</div>
						<input type="hidden" name = "appID" value="<cfoutput>#APPID#</cfoutput>">
						<div class='panel-body'>
							<div class='row text-center'>
								<div class='col-sm-3'><h4>Patient Name</h4></div>
								<div class='col-sm-3'><h4>Submitted Date</h4></div>
								<div class='col-sm-3'></div>
								<div class='col-sm-3'><h4>Action</h4></div>
							</div>
							<div class='row text-center'>
								<div class='col-sm-3'>#FName# #LNAME#</div>
								<cfif #DATESUBMITED# eq "">
									<div class='col-sm-3'>IN PROGRESS</div>
									<cfelse>
									<div class='col-sm-3'>#DATESUBMITED#</div>
								</cfif>
								<div class='col-sm-3'><a class="btn btn-info" href='/CS491-RDE/application/dhas_page1.cfm?appID=#appID#'>View Application</a></div>
								<div class='col-sm-3'>
									<button name="button" type="submit" class="btn btn-default" value="Approve"><span class="text-success">Approve</span></button>
									<button name="button" type="submit" class="btn btn-default" value="Return"><span class="text-info">Return</span></button>
									<button name="button" type="submit" class="btn btn-default" value="Deny"><span class="text-danger">Deny</span></button>
								</div>
							</div>
						</div>
						<div class='panel-footer'><a class="btn btn-info" href='/CS491-RDE/DocumentStatus.cfm?appID=#appID#'>Document Tracker Status</a></div>
					</div>
					</form>
				</cfoutput>
			</cfif>
		</cfloop>
		</div>

		<div id="inProcess" class="tab-pane fade">
		<input class="form-control" id="myInput3" type="text" placeholder="Search in progress applications..."></br>
		<cfloop query="allApplications">
			<cfif #STATUS# eq "P">
				<cfoutput>
					<div class='panel panel-default'>
						<div class='panel-heading'>App ID - #APPID#</div>
						<div class='panel-body'>
							<div class='row text-center'>
								<div class='col-sm-4'><h4>Patient Name</h4></div>
								<div class='col-sm-4'><h4>Submitted Date</h4></div>
								<div class='col-sm-4'></div>
							</div>
							<div class='row text-center'>
								<cfif #FName# eq "" || #LNAME# eq "">
								<div class='col-sm-4'>No Name Inputed</div>
								<cfelse>
								<div class='col-sm-4'>#FName# #LNAME#</div>
								</cfif>
								<cfif #DATESUBMITED# eq "">
									<div class='col-sm-4'>In progress</div>
									<cfelse>
									<div class='col-sm-4'>>#DATESUBMITED#</div>
								</cfif>
								<div class='col-sm-4'><a class="btn btn-info" href='/CS491-RDE/application/dhas_page1.cfm?appID=#appID#'>View Application</a></div>
							</div>
						</div>
						<div class='panel-footer'><a class="btn btn-info" href='/CS491-RDE/DocumentStatus.cfm?appID=#appID#'>Document Tracker Status</a></div>
					</div>
				</cfoutput>
			</cfif>
		</cfloop>
		</div>

		<div id="returned" class="tab-pane fade">
		<input class="form-control" id="myInput4" type="text" placeholder="Search returned applications..."></br>
		<cfloop query="allApplications">
			<cfif #STATUS# eq "N" || #STATUS# eq "D">
				<cfoutput>	
					<form action = './scripts/AdminS.cfm' method="POST">
					<cfif #STATUS# eq "D">
						<div class='panel panel-danger'>
						<cfelse>
						<div class='panel panel-default'>
					</cfif>
						<div class='panel-heading'>App ID - #APPID#</div>
						<input type="hidden" name="appID" value="<cfoutput>#APPID#</cfoutput>">
						<div class='panel-body'>
							<div class='row text-center'>
								<div class='col-sm-3'><h4>Patient Name</h4></div>
								<div class='col-sm-3'><h4>Submitted Date</h4></div>
								<div class='col-sm-3'></div>
								<div class='col-sm-3'><h4>Action</h4></div>
							</div>
							<div class='row text-center'>
								<div class='col-sm-3'>#FName# #LNAME#</div>
								<cfif #DATESUBMITED# eq "">
									<div class='col-sm-3'>In progress</div>
									<cfelse>
									<div class='col-sm-3'>#DATESUBMITED#</div>
								</cfif>
								<div class='col-sm-3'><strong><a class="btn btn-info" href='/CS491-RDE/application/dhas_page1.cfm?appID=#appID#'>View Application</a></strong></div>
									<button name="button" type="submit" class="btn btn-default" value="Approve"><span class="text-success">Approve</span></button>
									<!--<button name="button" type="submit" class="btn btn-default" value="Return"><span class="text-info">Return</span></button>-->
									<button name="button" type="submit" class="btn btn-default" value="Deny"><span class="text-danger">Deny</span></button>
							</div>
						</div>
						<div class='panel-footer'><a class="btn btn-info" href='/CS491-RDE/DocumentStatus.cfm?appID=#appID#'>Document Tracker Status</a></div>
					</div>
					</form>
				</cfoutput>
			</cfif>
		</cfloop>
		</div>
		
		<div id="approved" class="tab-pane fade">
		<input class="form-control" id="myInput2" type="text" placeholder="Search approved applications..."></br>
		<cfloop query="allApplications">
			<cfif #STATUS# eq "A">
				<cfoutput>					
					<div class='panel panel-default'>
						<div class='panel-heading'>App ID - #APPID#</div>
						<div class='panel-body'>
							<div class='row text-center'>
								<div class='col-sm-4'><h4>Patient Name</h4></div>
								<div class='col-sm-4'><h4>Submitted Date</h4></div>
								<div class='col-sm-4'></div>
							</div>
							<div class='row text-center'>
								<cfif #FName# eq "">
								<div class='col-sm-4'>No Name Inputed</div>
								<cfelse>
								<div class='col-sm-4'>#FName# #LNAME#</div>
								</cfif>
								<cfif #DATESUBMITED# eq "">
									<div class='col-sm-4'>IN PROGRESS</div>
									<cfelse>
									<div class='col-sm-4'>#DATESUBMITED#</div>
								</cfif>
								<div class='col-sm-4'><a class="btn btn-info" href='/CS491-RDE/application/dhas_page1.cfm?appID=#appID#'>View Application</a></div>
							</div>							
						</div>
						<div class='panel-footer'><a class="btn btn-info" href='/CS491-RDE/DocumentStatus.cfm?appID=#appID#'>Document Tracker Status</a></div>
					</div>
				</cfoutput>
			</cfif>
		</cfloop>
		</div>
</div>
</body>
<html/>