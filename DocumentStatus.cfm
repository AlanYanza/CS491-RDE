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
		tr:nth-child(even) {}
	</style> 
</head>
<body>
<cfinclude template="navbar.cfm">
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">Application Status</div>
		<div class="panel-body table-responsive">
	        <table class="table table-hover">
	        	<tr class="text-center">
	        		<th class="text-center">Document</th>
	        		<th class="text-center">Required</th>
	        		<th class="text-center">Received</th>
	        		<th class="text-center">Date Received</th>
	        	</tr>
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
					<cfoutput>
						<tr><td>#documentName#</td>
							<td class="text-center">#documentRequired#</td>
							<td class="text-center">#documentReceived#</td>
							<td class="text-center">#dateReceived#</td>
						</tr>
					</cfoutput>
				</cfloop>
			</table>
		</div>
    </div>
    <div class="text-center">
    	<a href="/CS491-RDE/home.cfm" class="btn btn-default"  role="button">Go Back to Home Page</a>
    </div>
</div>
</body>
</html>
