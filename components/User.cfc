<cfcomponent>
	<cfset Variables.userID=0/>
	
	<!-- constructor -->
	<cffunction name="init" displayname="User constructor" hint="constructor for the userCFC" >
		<cfargument name="userIDInput" type="numeric" hint="session userID of user logged in" >
		<cfset userID=userIDInput/>
		<cfreturn this>
	</cffunction>
	
	<!-- get Application able to edit -->
	<cffunction name="getEditableApplication" hint="Retrieves all Application editable by user(status of 'P' or 'N')" 
	returntype="Query" >
		<cfquery name="applicationResult">
			SELECT formTypeID,status FROM UserApplication WHERE
			userID=<cfqueryparam value="#userID#" cfsqltype="cf_sql_integer" > AND
			status='P' OR status='N'
		</cfquery>
		<cfreturn applicationResult>
	</cffunction>
	
	<!-- get Application all Applications -->
	<cffunction name="getAllApplication" hint="Retrieves all Application editable by user(status of 'P' or 'N')" 
	returntype="Query" >
		<cfquery name="applicationResult">
			SELECT formTypeID,status FROM UserApplication WHERE
			userID=<cfqueryparam value="#userID#" cfsqltype="cf_sql_integer" >
		</cfquery>
		<cfreturn applicationResult>
	</cffunction>
	
	<!-- check if application exist for state -->
	<cffunction name="stateAppExist" displayname="CheckIfStateAppExist" hint="Checks to see if an Application exists for a state" 
	returntype="Numeric" >
		<cfargument name="stateInput" hint="state of Interest to see if form exist for" type="string" >
		<cfset Var formTypeID=getFormTypeID(arguments.stateInput)/>
		<cfquery result="queryStats">
			SELECT appID FROM UserApplication WHERE
			userID=<cfqueryparam value="#userID#" cfsqltype="cf_sql_integer" > AND
			formTypeID=<cfqueryparam value="#formTypeID#" cfsqltype="cf_sql_integer" >
		</cfquery>
		<cfif queryStats.recordCount neq 1>
			<cfreturn 0>
		<cfelse>
			<cfreturn 1>
		</cfif>
	</cffunction>
	
	<!-- get FormTypeID for a State-->
	<cffunction name="getFormTypeID" displayname="getFormTypeIDForState" hint="retrives a formTypeID for indicated State" 
	returntype="Numeric" >
		<cfargument name="stateInput" hint="state of Interest to get formTypeID for" type="string" >
		<cfquery name="formTypeIDResult" result="queryStats">
			SELECT formTypeID FROM Forms WHERE state=<cfqueryparam value="#arguments.stateInput#" cfsqltype="cf_sql_varchar" >
		</cfquery>
		<cfif queryStats.recordCount neq 1>
			<cfset Var formTypeID=0 />
		<cfelse>
			<cfset Var formTypeID=formTypeIDResult.formTypeID/>
		</cfif>
		<cfreturn formTypeID>
	</cffunction>
	
	<!-- Get Application Link based on a state -->
	<cffunction name="getDirectLink" displayname="getDirectLinkFromState" hint="retrieve the direct link for a indicated State" 
	returntype="String" >
		<cfargument name="stateInput" hint="state of Interest to get formTypeID for" type="string" >
		<cfquery name="directLinkResult" result="queryStat">
			SELECT directLink FROM ApplicationLinks WHERE
			state=<cfqueryparam value="#arguments.stateInput#" cfsqltype="cf_sql_varchar" >
		</cfquery>
		<cfif queryStat.recordCount neq 1>
			<cfset Var directLink=''/>
		<cfelse>
			<cfset Var directLink=directLinkResult.directLink />
		</cfif>
		<cfreturn directLink />
	</cffunction>
	
	<!-- Get State from formTypeID--->
	<cffunction name="getState" displayname="getStateFromFormTypeID" hint="retrieves the state using formTypeID" >
		<cfargument name="formtypeIDInput" type="numeric" hint="formTypeID retrieve from UserApplication Queries" >
		<cfquery name="stateResult" result="queryStats">
			SELECT state FROM Forms WHERE
			formTypeID=<cfqueryparam value="#arguments.formtypeIDInput#" cfsqltype="cf_sql_integer" >
		</cfquery>
		<!-- if no state found -->
		<cfif queryStats.recordCount eq 0>
			<cfset Var state=''/>
		<cfelse>
			<cfset Var state=stateResult.state/>
		</cfif>
		<cfreturn state>
	</cffunction>
		
	<!-- Get Document and Results ---> 
	<cffunction name="getDocuments">
	<cfquery  name="DocumentResult" result="queryStats">
		SELECT appID 
		FROM UserApplication
		WHERE userID = <cfqueryparam value="#userID#">
	</cfquery>
	
	<cfset var appID = DocumentResult.appID />
	
	<cfquery name="DocumentName" result="queryStats">
		SELECT document,isRequired, received, DateReceived
		FROM AppDocument
		WHERE appID = <cfqueryparam value="#appID#">
	</cfquery>
	<cfreturn DocumentName />
	</cffunction>
	
	
</cfcomponent>