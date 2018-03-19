<!-- gather required data from database -->
<cfquery name="userData" result="queryResult">
	SELECT userID,accessLevel,FirstName,LastName FROM "User" WHERE
	email=<cfqueryparam value="#form.email#" cfsqltype="varchar">
</cfquery>

<!-- If user doesn't exist redirect to home page with feedback -->
<cfif queryResult.RecordCount EQ 0>
	<cflocation url="/CS491-RDE/index.cfm?noUser" > 
</cfif>	

<cfset result=0/>
<!-- validation Password (use SQL Stored Procedure) -->
<cfstoredproc procedure="ValidatePassword" >
	<cfprocparam value="#userData.userID#" cfsqltype="CF_SQL_INTEGER" >
	<cfprocparam value="#FORM.pwd#" cfsqltype="CF_SQL_VARCHAR" >
	<cfprocparam  variable="result"cfsqltype="CF_SQL_INTEGER" type="out">
</cfstoredproc>
<cfdump var="#result#" >
<cfif result eq 0>
	<cflocation url="/CS491-RDE/index.cfm?wrongLogin" > 
</cfif>

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
