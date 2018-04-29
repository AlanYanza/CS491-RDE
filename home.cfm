<!--- If user isn't logged in, redirect them back to login page --->
<cfset SessionClass=createObject('component','components.SessionTools') >
<cfset SessionClass.checkIfLoggedIn() >
<!--- if user's access level isn't user,redirect them back to admin home page --->
<cfset SessionClass.checkIfuser() >
<cfset SessionClass.ClearSessionAppID() > <!--- If appID session variable set, clear it --->
<!--- gather required page data --->
<cfset UserObj=createObject('component','components.User').init(session.userID)/>
<cfset allApplications=UserObj.getAllApplication()/>
<cfset directLink=UserObj.getDirectLink('NJ')/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Application</title>
    <cfinclude template="head.cfm"/>
    <script>
		$(document).ready(function(){
			$('[data-toggle="tooltip"]').tooltip();   
		});
	</script>
	<style>
		td, th {
			text-align: center;
		}
		tr:nth-child(even) {}
	</style> 
</head>
<body>
<cfinclude template="navbar.cfm">
<div class="container">
	<cfif IsDefined('url.submitApplication')>
		<cfoutput>
			<div class="alert alert-success">
				<a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>Success! </strong>Application is under Review.
			</div>
		</cfoutput>
	</cfif>
	<cfif IsDefined('url.savedApplication')>
		<cfoutput>
			<div class="alert alert-info">
				<a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				Application Progress saved.
			</div>
		</cfoutput>
	<!--- If appID doesn't belong to current user, alert user --->
	</cfif>
		<cfif IsDefined('url.no')>
		<cfoutput>
			<div class="alert alert-danger">
				<a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				Indicated Application doesn't exist for current User.
			</div>
		</cfoutput>
	</cfif>

    <div class="panel panel-default">
        <div class="panel-heading">Start New Application</div>
		<div class="panel-body table-responsive"">
		<table class="table table-hover text-center">
			<tr><th style="width: 50%;">Application Type</th></tr>
			<td><cfoutput>NJ-Participation in (ADDP) / HICP</cfoutput></td>
			<cfoutput >
				<td><a class="btn btn-primary" href='application/dhas_instructions_page1.cfm?new'>Start new application</a></td>
			</cfoutput>
			</table>
		</div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">Existing Application</div>
		<div class="panel-body table-responsive">
	        <span class="help-block">Click the AppID to edit or view applications.</span>
	        <table class="table table-hover">
	        	<tr><th>AppID</th><th>State</th><th>Application Description</th>
	        		<th>Date Submitted</th><th>Status</th><th></th><th></th></tr>
	        	<!-- Interate though resultSet and display data-->
				<cfloop query="allApplications">
					<cfoutput><tr></cfoutput>
					<!-- Determine State of Form-->
					<cfset formInfo=UserObj.getFormInfo(#formTypeID#)/>
					<!-- Determine the Status of Application -->
					<cfif #status# eq 'P'>
						<cfset outputStatus='Not Submitted'/>
					<cfelseif #status# eq 'N'>
						<cfset outputStatus='Requires Attention'/>
					<cfelseif #status# eq 'R'>
						<cfset outputStatus='Pending'/>
					<cfelseif #status# eq 'A'>
						<cfset outputStatus='Approved'/>
					<cfelseif #status# eq 'D'>
						<cfset outputStatus='Denied'/>
					</cfif>
					<!-- determine the direct Link based on state -->
					<cfset outputLink=UserObj.getDirectLink(formInfo.state)/>
					<!-- create html row for Application -->
					<cfset userEditLink=#outputLink# & '?appID=' & #appID# > 
					<cfoutput>
						<tr><td>#appID#</td>
							<td>#formInfo.state#</td>
							<td>#formInfo.AppDescription#</td>
							<td>#dateSubmited#</td>
							<td>#outputStatus#</td>
							<td>
								<a class="btn btn-info" href='/CS491-RDE/DocumentStatus.cfm?appID=#appID#'">View Documents</a>
							<td>
								<cfif #status# eq 'P' OR #status# eq 'N' >
									<a class="btn btn-success" href='/CS491-RDE/application/dhas_page1.cfm?appID=#appID#'">Edit Application</a>
								<cfelse>
									<a class="btn btn-success" href='/CS491-RDE/application/dhas_page1.cfm?appID=#appID#'">Review Application</a>
								</cfif>
							</td>
						</tr>
					</cfoutput>
				</cfloop>
			</table>
		</div>
    </div>
</div>
</body>
</html>
