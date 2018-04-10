<!-- Session Page Protection -->
<cfset SessionClass=createObject('component','components.SessionTools')/>
<cfset SessionClass.checkIfLoggedIn()/>
<cfset SessionClass.checkIfuser()/>
<!-- If appID is not sent via url passing, redirects back to user home page -->
<cfif isDefined('url.appID')>
	<cfset session.appID=url.appID>
</cfif>
<!-- More Session Page Protection -->
<cfset SessionClass.NoAppIDRedirect()>
<cfset SessionClass.validateAppID()>
<!-- Generate Document Information for User -->
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
	<style>
	td, th {
	    text-align: center;
	}

	tr:nth-child(even) {
	}
	</style> 
</head>
<body>
<cfinclude template="navbar.cfm">
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">Application Status</div>
		<div class="panel-body table-responsive">
	        <center><table class="table table-hover">
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
</div>
<br><br>
<center>
<form action="/CS491-RDE/home.cfm" class="inline">
    <button class="btn btn-default" >Go Back to Home Page</button>
</form>
</center>
</body>
</html>
