<cfcomponent output="false">
	
	<cffunction name="checkIfLoggedIn" displayname="checkIfUserIsLoggedIn"
	hint="Checks to see if the user to logged in when entering a page">
		<cfif NOT IsDefined("session.userID") >
			<cflocation url="/CS491-RDE/index.cfm">
		</cfif>
	</cffunction>
	
	<cffunction name="checkIfadmin" displayname="checkIfUserIsAdmin" 
	hint="Check to see if the user had admin level access">
		<cfif session.accessLevel NEQ 'admin'>
			<cflocation url="/CS491-RDE/home.cfm">
		</cfif>
	</cffunction>
	
	<cffunction name="checkIfuser" displayname="checkIfUserIsNonDdmin"
	hint="checks to see if User to has user level access">
		<cfif session.accessLevel NEQ 'user'>
			<cflocation url="/CS491-RDE/admin.cfm">
		</cfif>
	</cffunction>
	
	<cffunction name="ifAlreadySignIn" displayname="IfAlreadySignInDirectHome" 
	hint="If User is signed in, do not let them into sign-in or registration page" >
		<cfif IsDefined("session.userID")>
			<cflocation url="/CS491-RDE/home.cfm" >
		</cfif>
	</cffunction>
	
</cfcomponent>