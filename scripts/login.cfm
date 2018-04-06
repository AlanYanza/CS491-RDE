<!--- If user are already sign in, do not let them access --->
<cfset SessionClass=createObject('component',"CS491-RDE.components.SessionTools")/>
<cfset SessionClass.ClearSessionAppID() > <!-- If appID session variable set, clear it -->
<cfset SessionClass.ifAlreadySignIn()>

<!-- If user exist, create an UserObj -->
<cfset UserObj=createObject('component',"CS491-RDE.components.LoginComponent").init(form.email)/>

<!-- validation Password (use SQL Stored Procedure) -->
<cfset passValid=UserObj.validateInputPassword(form.pwd)/>
<cfif passValid eq 0>
	<cflocation url="/CS491-RDE/index.cfm?wrongLogin" > 
</cfif>

<!-- set session scope variables(if username is correct) -->
<cfset UserObj.setSessionVariables()/>

<!-- redirect based on access level -->
<cfif session.accessLevel EQ 'user'>
	<cflocation url="../home.cfm">
<cfelse>
	<cflocation url="../admin.cfm">
</cfif> 