<!-- Session Page Protection -->
<cfset SessionClass=createObject('component','components.SessionTools') >
<cfset SessionClass.checkIfLoggedIn() >
<cfset SessionClass.checkIfuser() >
<cfset SessionClass.ClearSessionAppID() > <!-- If appID session variable set, clear it -->
<!-- gather required page data -->
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
		table {
			font-family: arial, sans-serif;
			font-size: 14px;
			border-collapse: collapse;
			width: 100%;
		}

		td, th {
			border: 1px solid #dddddd;
			text-align: center;
			padding: 8px;
		}

		tr:nth-child(even) {
		   
		}
	</style> 
</head>
<body>
<cfinclude template="navbar.cfm">
<div class="container">
	<cfif IsDefined('url.submitApplication')>
		<cfoutput>
			<div class="alert alert-success">
				<a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>Success! </strong>Application is under Review
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
	</cfif>

    <div class="panel panel-default">
        <div class="panel-heading">Start New Application</div>
            	<center><table>
				<tr><th style="width: 50%;">Application Type</th></tr><td>
                <cfoutput>NJ-Participation in (ADDP) / HICP</cfoutput></td>
                <cfoutput><td><a href="application/dhas_instructions_page1.cfm?new">Start new application</a></td></cfoutput>
			  </table></center> 
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">Existing Application<br>Click AppID for Required Document Status</div>
        <center><table>
        	<tr><th style="width: 15%;">AppID</th><th style="width: 5%;">State</th><th style="width: 40%;">Application Description</th>
        		<th style="width: 10%;">Date Submitted</th><th style="width: 25%;">Status</th><th style="width: 5%;">Editable</th></tr>
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
			<cfoutput><tr><td><a href='/CS491-RDE/DocumentStatus.cfm?appID=#appID#'>#appID#</td><td>#formInfo.state#</td><td>#formInfo.AppDescription#</td>
				<td>#dateSubmited#</td>
				<td>#outputStatus#</td>
				<cfif #status# eq 'P' OR #status# eq 'N' >
					<td>Yes<br><a href="#userEditLink#">Edit</td></tr>
				<cfelse>
					<td>No<br><a href="">Review</td></tr>
				</cfif>
			</cfoutput>
		</cfloop>
		</table></center>
    </div>    
</div>
</body>
</html>
