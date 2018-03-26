<cfset SessionClass=createObject('component','components.SessionTools')/>
<cfset SessionClass.checkIfLoggedIn()/>
<cfset SessionClass.checkIfuser()/>
<cfset UserObj=createObject('component','components.User').init(session.userID)/>
<cfset DocumentTracker=UserObj.getDocuments()/>

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
<cfinclude template="navbar.cfm">
<cfif IsDefined('url.submitApplication')>
	<cfoutput><b>Submit Application Successfully: Application is under Review</b></cfoutput>
</cfif>
<cfif IsDefined('url.savedApplication')>
	<cfoutput><b>Application Progress saved successfully</b></cfoutput>
</cfif>
<br><br><br>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">Application Status</div>
        <center><table>
        	<tr><th style="width: 25%;">Document</th><th>Required</th><th>Received</th><th>Date Received</th></tr>
        <!-- Interate though resultSet and display data-->
		<cfloop query="DocumentTracker">
			<!-- Determine State of Form-->
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
			<!-- Determine the Status of Application -->
			
			<cfoutput><tr><td>#documentName#</td><td>#documentRequired#</td><td>#documentReceived#</td><td>#dateReceived#</td></tr></cfoutput>
		</cfloop>
		</table></center>
    </div>   
</div>
<br><br>
<center>
<form action="/CS491-RDE/home.cfm" class="inline">
    <button class="submit-button" >Go Back to Home Page</button>
</form>
</center>
</body>
</html>
