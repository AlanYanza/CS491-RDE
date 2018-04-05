<!--- If user is not sign in, do not let them access --->
<cfset SessionClass=createObject('component',"CS491-RDE.components.SessionTools")/>
<cfset SessionClass.checkIfLoggedIn()>
<cfif IsDefined('session.userID')>
	<cfset StructDelete(#session#,'userID')/>
</cfif>
<cfif IsDefined('session.accessLevel')>
	<cfset StructDelete(#session#,'accessLevel')/>
</cfif>
<cfif IsDefined('session.firstName')>
	<cfset StructDelete(#session#,'firstName')/>
</cfif>
<cfif IsDefined('session.lastName')>
	<cfset StructDelete(#session#,'lastName')/>
</cfif>
<cfif IsDefined('Application.userID')>
	<cfset StructDelete(#Application#,'userID')/>
</cfif>

<cflocation url="../index.cfm">
