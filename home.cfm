<cfset SessionClass=createObject('component','components.SessionTools')/>
<cfset SessionClass.checkIfLoggedIn()/>
<cfset SessionClass.checkIfuser()/>
<cfset UserObj=createObject('component','components.User').init(session.userID)/>
<cfset editableApplications=UserObj.getEditableApplication()/>
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
				<tr><th style="width: 50%;">Application Type</th><th>Status</th></tr><td>
                <cfoutput>NJ-Participation in (ADDP) / HICP</cfoutput></td>
                <cfset NJAppExist=UserObj.stateAppExist('NJ')/>
                <cfif NJAppExist eq 0>
                	<cfoutput><td><a href="application/dhas_instructions_page1.cfm">start New Application</a></td></cfoutput>
                <cfelse>
                	<cfoutput><td>Application already exist</td></cfoutput>
               </cfif>
			  </table></center> 
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">Edit Existing Application</div>
        <center><table>
        	<tr><th style="width: 50%;">State</th><th>Status</th></tr>
        <!-- Interate though resultSet and display data-->
		<cfloop query="editableApplications">
			<cfoutput><tr></cfoutput>
			<!-- Determine State of Form-->
			<cfset outputState=UserObj.getState(#formTypeID#)/>
			<!-- Determine the Status of Application -->
			<cfif #status# eq 'P'>
				<cfset outputStatus='Application Not Submitted'/>
			<cfelse>
				<cfset outputStatus='Application Requires Attention'/>
			</cfif>
			<!-- determine the direct Link based on state -->
			<cfset outputLink=UserObj.getDirectLink(outputState)/>
			<!-- create html row for Application -->
			<cfoutput><tr><td>#outputState#</td><td>#outputStatus#</td>
				<td><a href="#outputLink#">edit Application</td></tr>
				</cfoutput>
		</cfloop>
		</table></center>
    </div>
    
    <div class="panel panel-default">
        <div class="panel-heading">Application Status</div>
        <center><table>
        	<tr><th style="width: 50%;">State</th><th>Status</th></tr>
        <!-- Interate though resultSet and display data-->
		<cfloop query="allApplications">
			<!-- Determine State of Form-->
			<cfset outputState=UserObj.getState(#formTypeID#)/>
			<!-- Determine the Status of Application -->
			<cfif #status# eq 'P'>
				<cfset outputStatus='Application Not Submitted'/>
			<cfelseif #status# eq 'N'>
				<cfset outputStatus='Application Requires Attention'/>
			<cfelseif #status# eq 'R'>
				<cfset outputStatus='Pending'/>
			<cfelseif #status# eq 'A'>
				<cfset outputStatus='Application Approved'/>		
			<cfelseif #status# eq 'D'>
				<cfset outputStatus='Application Denied'/>		
			</cfif>
			<!-- create html row for Application-->
			<cfoutput><tr><td><a href="/CS491-RDE/DocumentStatus.cfm" data-toggle="tooltip" title="Click Here to See Submitted Documents">#outputState#</a></td><td>#outputStatus#</td></tr></cfoutput>
		</cfloop>
		</table></center>
    </div>
   
    
</div>
</body>
</html>
