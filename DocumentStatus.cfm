<!--- Session Page Protection --->
<cfset SessionClass=createObject('component','components.SessionTools')/>
<cfset SessionClass.checkIfLoggedIn()/>
<!--- If appID is not sent via url passing, redirects back to user home page --->
<cfif isDefined('url.appID')>
	<cfset session.appID=url.appID>
</cfif>
<!--- If a user access level,More Session Page Protection --->
<cfif session.accessLevel neq 'admin'>
	<cfset SessionClass.checkIfuser()>
	<cfset SessionClass.NoAppIDRedirect()>
	<cfset SessionClass.validateAppID()>
</cfif>
<!--- if admin set flag  ---->
<cfif session.accessLevel eq 'admin'>
	<cfset isAdmin=true>
<cfelse>
	<cfset isAdmin=false>
</cfif>
<!--- Generate Document Information for User --->
<cfset UserObj=createObject('component','components.User').init(session.userID)/>
<cfset DocumentTracker=UserObj.getDocuments()/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Document Status</title>
    <cfinclude template="head.cfm"/>
	<style>
		tr:nth-child(even) {}
	</style> 
</head>
<body>
<cfinclude template="navbar.cfm">
<cfif  isAdmin eq 1>
	<cfif isDefined('url.update') eq 1>
		<div class="alert alert-success">
			<a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			Changes Made Successfully
		</div>
	</cfif>
</cfif>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">Application Status</div><br>
        <cfif isAdmin eq 1>
			<cfoutput>
				<div class="text-center">
					<a class="btn btn-default" href='/CS491-RDE/application/dhas_page1.cfm?appID=#session.appID#' target="_blank">View Application</a>
				</div>
			</cfoutput>
		</cfif>
		<!--- if admin, make page a form --->
		<cfif isAdmin eq 1>
			<cfoutput><form action="scripts/DocStatusMgmt.cfm" method="POST"></cfoutput>
		</cfif>
		<div class="panel-body table-responsive">
	        <table class="table table-hover">
	        	<tr class="text-center">
	        		<th class="text-center">Document</th>
	        		<th class="text-center">Required</th>
	        		<th class="text-center">Received</th>
	        		<th class="text-center">Date Received</th>
	        	</tr>
		        <!--- Interate though resultSet and display data--->
		        <cfset iterator=0>
				<cfloop query="DocumentTracker">
					<cfset iterator=iterator+1>
					<!--- Determine State of Form--->
					<cfset documentName = DocumentTracker.document/>
					<cfset documentRequired = DocumentTracker.isRequired/>
					<cfif #documentRequired# eq 'Y'>
						<cfset documentRequired = 'Yes'/>
					<cfelseif #documentRequired# eq 'N'>
						<cfset documentRequired = 'No'/>	
					</cfif>
					<cfset documentReceived = DocumentTracker.received/>
					<cfif #documentReceived# eq 'Y'>
						<cfset documentReceived = 'Yes'/>
					<cfelseif #documentReceived# eq 'N'>
						<cfset documentReceived = 'No'/>	
					</cfif>
					<cfset dateReceived = DocumentTracker.dateReceived/>
					<!--- Determine the Status of Application --->					
					<cfoutput>
						<tr><td>#documentName#<input type="hidden" name="documentName#iterator#" id="documentName#iterator#" value="#documentName#" </td>
						<!--- If admin, make these dropdown menu --->
						<cfif isAdmin eq 1>
							<cfoutput >
								<td><select name="documentRequired#iterator#" id="documentRequired#iterator#" class="form-control">
									<option name="Yes" value='Y' <cfif documentRequired eq 'Yes'><cfoutput>selected</cfoutput></cfif>>Yes</option>
									<option name="No" value='N' <cfif documentRequired eq 'No'><cfoutput>selected</cfoutput></cfif>>No</option>
								</select></td>
							</cfoutput>
						<cfelse>
							<cfoutput><td class="text-center">#documentRequired#</td></cfoutput>
						</cfif>
						<!--- If admin, make these dropdown menu --->
						<cfif isAdmin eq 1>
							<cfoutput >
								<td><select name="documentReceived#iterator#" id="documentReceived#iterator#" class="form-control">
									<option name="Yes" value='Y' <cfif #documentReceived# eq 'Yes'><cfoutput>selected</cfoutput></cfif>>Yes</option>
									<option name="No" value='N' <cfif #documentReceived# eq 'No'><cfoutput>selected</cfoutput></cfif>>No</option>
								</select></td>
							</cfoutput>
						<cfelse>
							<cfoutput><td class="text-center">#documentReceived#</td></cfoutput>
						</cfif>
						<cfif isAdmin eq 1>
							<cfoutput>
								<td><input type="date" class="form-control" name="DateReceived#iterator#" id="DateReceived#iterator#" value="<cfoutput>#dateReceived#</cfoutput>"/></td>
							</cfoutput>
						<cfelse>
							<td class="text-center">#dateReceived#</td>
						</cfif>
						</tr>
					</cfoutput>
				</cfloop>
			</table>
			<cfif isAdmin eq 1>
				<input type="hidden" name="numDocuments" id="numDocuments" value="<cfoutput>#iterator#</cfoutput>"/>
			</cfif>
		</div>
		<!--- if admin, make page a form --->
		<cfif isAdmin eq 1>
			<cfoutput><div class="text-center"><button type="submit" class="btn btn-primary" value="SubmitAdminChanges">Submit Changes</button></div><br></cfoutput>
		</cfif>
    </div>
	<!--- if admin, make page a form --->
	<cfif isAdmin eq 1>
		<cfoutput></form></cfoutput>
	</cfif>
    <div class="text-center">
    	<a href="/CS491-RDE/home.cfm" class="btn btn-default"  role="button">Go Back to Home Page</a>
    </div>
</div>
</body>
</html>
