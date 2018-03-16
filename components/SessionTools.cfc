<cfcomponent output="false">
	
	<cffunction name="checkIfLoggedIn">
		<cfif NOT IsDefined("session.userID") >
			<cflocation url="/CS491-RDE/index.cfm">
		</cfif>
	</cffunction>

</cfcomponent>