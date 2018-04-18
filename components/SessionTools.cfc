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
	
	<cffunction name="ifAlreadySignIn" hint="If User is signed in, do not let them into sign-in or registration page" >
		<cfif IsDefined("session.userID")>
			<cflocation url="/CS491-RDE/home.cfm" >
		</cfif>
	</cffunction>
	
	<cffunction name="ClearSessionAppID" hint="If leaving Application edit, clear the Session AppID variable" >
		<cfif isDefined('session.appID')>
			<cfset StructDelete(#session#,'appID')/>
		</cfif>
	</cffunction>
	
	<cffunction name="NoAppIDRedirect" hint="If user has no Session AppID variable redirect back to user home page " >
		<cfif NOT isDefined('session.appID')>
			<cflocation url="/CS491-RDE/home.cfm" >
		</cfif>
	</cffunction>
	
	<cffunction name="ValidateAppID" 
	hint="Validates appID given in url for current user ownership otherwise redirects to user homepage" >
		<cfquery name="ValidateAppIDResult" result="queryStats">
			SELECT userID FROM UserApplication WHERE
			appID=<cfqueryparam value="#session.appID#" cfsqltype="cf_sql_integer" >
		</cfquery>
		<cfif queryStats.recordCount neq 1>
			<cflocation url="/CS491-RDE/home.cfm?no" >
		</cfif>
		<cfif ValidateAppIDResult.userID neq session.userID>
			<cflocation url="/CS491-RDE/home.cfm?no" >
		</cfif>
	</cffunction>
	
	<cffunction name="passUserID" hint="passes the current user's userID to rest CFC'" >
		<cfreturn session.userID>
	</cffunction>

	<cffunction name="passUserAccessLevel" hint="passes the current user's access level to rest CFC'" > 
		<cfreturn session.accessLevel />
	</cffunction>
	
</cfcomponent>