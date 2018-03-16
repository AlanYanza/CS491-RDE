<!-- validate email and password and provide feedback on login page if wrong -->
<!-- Use result="queryStat" in query and queryState.recordcount to validate -->

<!-- gather required data from database -->
<cfquery name="userData" result="queryResult">
	SELECT userID,accessLevel,FirstName,LastName FROM "User" WHERE
	email=<cfqueryparam value="#form.email#" cfsqltype="varchar">
</cfquery>

<!-- set session scope variables(if username is correct) -->
<cfif queryResult.RecordCount EQ 1>  <!--if no record or multiple record pop up,do not attempt to set session variables-->
	<cfset session.userID=userData.userID/>
	<cfset session.accessLevel=userData.accessLevel/>
	<cfset session.firstName=userData.FirstName/>
	<cfset session.lastName=userData.LastName/>
	<cfif session.accessLevel EQ 'user'>
		<cflocation url="../home.cfm">
		<cfelse>
			<cflocation url="../admin.cfm">
	</cfif> 
	<cfelse>
		<cflocation url="../index.cfm">
</cfif>
