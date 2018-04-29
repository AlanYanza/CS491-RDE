<cfcomponent output="false">
	
	<!--- Check to see if the user is not logged in, and if so redirect them--->
	<cffunction name="checkIfLoggedIn" displayname="checkIfUserIsLoggedIn"
	hint="Checks to see if the user to logged in when entering a page">
		<cfif NOT IsDefined("session.userID") >
			<cflocation url="/CS491-RDE/index.cfm">
		</cfif>
	</cffunction>
	
	<!--- Check to see if current user has admin access level --->
	<cffunction name="checkIfadmin" displayname="checkIfUserIsAdmin" 
	hint="Check to see if the user had admin level access">
		<cfif session.accessLevel NEQ 'admin'>
			<cflocation url="/CS491-RDE/home.cfm">
		</cfif>
	</cffunction>
	
	<!--- Check to see if current user has user access level --->
	<cffunction name="checkIfuser" displayname="checkIfUserIsNonDdmin"
	hint="checks to see if User to has user level access">
		<cfif session.accessLevel NEQ 'user'>
			<cflocation url="/CS491-RDE/admin.cfm">
		</cfif>
	</cffunction>
	
	<!--- Checks to see if user is signed-in and if so redirect them --->
	<cffunction name="ifAlreadySignIn" hint="If User is signed in, do not let them into sign-in or registration page" >
		<cfif IsDefined("session.userID")>
			<cflocation url="/CS491-RDE/home.cfm" >
		</cfif>
	</cffunction>
	
	<!--- clears the appID set in session --->
	<cffunction name="ClearSessionAppID" hint="If leaving Application edit, clear the Session AppID variable" >
		<cfif isDefined('session.appID')>
			<cfset StructDelete(#session#,'appID')/>
		</cfif>
	</cffunction>
	
	<!--- If no appID set in session, redirect current user --->
	<cffunction name="NoAppIDRedirect" hint="If user has no Session AppID variable redirect back to user home page " >
		<cfif NOT isDefined('session.appID')>
			<cflocation url="/CS491-RDE/home.cfm" >
		</cfif>
	</cffunction>
	
	<!--- Checks to see if the appId set in session belongs to current user --->
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
	
	<!--- used to pass userId set in session to restCFC--->
	<cffunction name="passUserID" hint="passes the current user's userID to rest CFC'" >
		<cfreturn session.userID>
	</cffunction>

	<!--- used to pass user's accessLevel set in session to restCFC--->
	<cffunction name="passUserAccessLevel" hint="passes the current user's access level to rest CFC'" > 
		<cfreturn session.accessLevel />
	</cffunction>
	
</cfcomponent>