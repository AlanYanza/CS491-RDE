<cfcomponent output="false">
	
	<cffunction name="checkIfLoggedIn">
		<cfif NOT IsDefined("session.userID") >
			<cflocation url="/CS491-RDE/index.cfm">
		</cfif>
	</cffunction>
	
	<cffunction name="checkIfadmin">
		<cfif session.accessLevel NEQ 'admin'>
			<cflocation url="/CS491-RDE/home.cfm">
		</cfif>
	</cffunction>
	
	<cffunction name="checkIfuser">
		<cfif session.accessLevel NEQ 'user'>
			<cflocation url="/CS491-RDE/admin.cfm">
		</cfif>
	</cffunction>
	
</cfcomponent>