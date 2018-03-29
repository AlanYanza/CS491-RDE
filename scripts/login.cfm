<!-- If user doesn't exist redirect to home page with feedback -->
<cfinvoke method="checkIfUserExist" component="/CS491-RDE/components.LoginComponent" returnvariable="userExist"
email="#form.email#">
 <!--- It's not good practice to let individuals know that a username does not exist. --->
<!---<cfif userExist eq 0>
	<cflocation url="/CS491-RDE/index.cfm?noUser" > 
</cfif> --->

<!-- If user exist, create an UserObj -->
<cfset UserObj=createObject('component',"CS491-RDE.components.LoginComponent").init(form.email)/>
<cfset UserObj.test()/>

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