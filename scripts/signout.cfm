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
	<cfset StructDelete(#session#,'userID')/>
</cfif>

<cflocation url="../index.cfm">
