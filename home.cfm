<cfset SessionClass=createObject('component','components.SessionTools')/>
<cfset SessionClass.checkIfLoggedIn()/>
<cfset SessionClass.checkIfuser()/>
<cfset UserObj=createObject('component','components.User').init(session.userID)/>
<cfset editableApplications=UserObj.getEditableApplication()/>
<cfset allApplications=UserObj.getAllApplication()/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Application</title>
    <cfinclude template="head.cfm"/>
    <script>
        function myFunction() {
            document.getElementById("demo").innerHTML = "<form action=''><input type='file' name='pic' accept='image/*'></form>";

        }
        function Gone() {
            document.getElementById("demo").innerHTML = "YOU CLICKED ME!";
        }
</script>
</head>
<body>
<cfinclude template="navbar.cfm">
<cfif IsDefined('url.submitApplication')>
	<cfoutput><b>Submit Application Successfully: Application is under Review</b></cfoutput>
</cfif>
<cfif IsDefined('url.savedApplication')>
	<cfoutput><b>Application Progress saved successfully</b></cfoutput>
</cfif>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">Start New Application</div>
        <div class="panel-body">
            <ul>
            	<cfset appExistNJ=UserObj.stateAppExist('NJ')/>
            	
                <li>NJ-Participation in the AIDS Drug Distribution Program (ADDP) / Health Insurance Continuation Program (HICP)</li>
                <cfset NJAppExist=UserObj.stateAppExist('NJ')/>
                <cfif NJAppExist eq 0>
                	<cfoutput><a href="application/dhas_instructions_page1.cfm">start New Application</a></cfoutput>
                <cfelse>
                	<cfoutput>Application already exist</cfoutput>
               </cfif>
            </ul>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">Edit Existing Application</div>
        <div class="panel-body">Pick up where you left off or make edits to your application<br>
        <table>
        	<tr><th>State</th><th>Status</th><th></th></tr>
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
			<!-- create html row for Application-->
			<cfoutput><tr><td>#outputState#</td><td>#outputStatus#</td>
				<td><a href="/CS491-RDE/application/dhas_page1.cfm">edit Application</td></tr>
				</cfoutput>
		</cfloop>
		</table>
    	</div>
    </div>
    
    <div class="panel panel-default">
        <div class="panel-heading">Application Status</div>
        <table>
        	<tr><th>State</th><th>Status</th></tr>
        <!-- Interate though resultSet and display data-->
		<cfloop query="allApplications">
			<cfoutput><tr></cfoutput>
			<!-- Determine State of Form-->
			<cfset outputState=UserObj.getState(#formTypeID#)/>
			<!-- Determine the Status of Application -->
			<cfif #status# eq 'P'>
				<cfset outputStatus='Application Not Submitted'/>
			<cfelseif #status# eq 'N'>
				<cfset outputStatus='Application Requires Attention'/>
			<cfelseif #status# eq 'R'>
				<cfset outputStatus='Application Under Review'/>
			<cfelseif #status# eq 'A'>
				<cfset outputStatus='Application Approved'/>		
			<cfelseif #status# eq 'D'>
				<cfset outputStatus='Application Denied'/>		
			</cfif>
			<!-- create html row for Application-->
			<cfoutput><tr><td>#outputState#</td><td>#outputStatus#</td></tr></cfoutput>
		</cfloop>
		</table>
        <p id="demo"></p>
    </div>
   
    <div class="panel panel-default">
        <div class="panel-heading">External Documents</div>
        <div class="panel-body">You do not have any needed Documents for any Applications</div>
        <p id="demo"></p>
    </div>
</div>
</body>
</html>
