<cfcomponent output="false" name="Form" displayName="Form">
	<cfset Variables.state='' />
	<cfset Variables.formTypeID=0 />
	<cfset Variables.userID=0 />
	
	<!-- Constructor -->
	<cffunction name="init" >
		<cfargument name="stateInput" type="string" />
		<cfargument name="userIDInput" type="string" />
		<cfset state=stateInput /> 
		<cfset userID=userIDInput />
		<cfset formTypeID=getFormID()/>
		<cfreturn this>
	</cffunction>
	
	<!-- add a new Application to Database -->
	<cffunction name="createApplication">
		<cfargument name="HICPStatusInput" type="string" >
		<cfset HICPStatus=HICPStatusInput/>
		<cfQuery>
			INSERT INTO UserApplication (userID,formTypeID,HICPApp,status) VALUES(
				<cfqueryparam value="#userID#" cfsqltype="cf_sql_integer" >,
				<cfqueryparam value="#formTypeID#" cfsqltype="cf_sql_integer" >,
				<cfqueryparam value="#HICPStatus#" cfsqltype="cf_sql_varchar" >,
				<cfqueryparam value="P" cfsqltype="cf_sql_varchar" >
			)
		</cfquery>
		<cfset Var appID=getAppID()/>
		<cfquery >
			INSERT INTO UserFormData (appID) VALUES(
				<cfqueryparam value="#appID#" cfsqltype="cf_sql_integer">
			)			
		</cfquery>
	</cffunction>
	
	<!-- update an existing application Status -->
	<cffunction name="updateApplicationStatus">
		<cfargument name="statusInput" type="string" required="false" >
		<cfset status=statusInput />
		<cfset Var appID=getAppID() />
		<cfquery >
			UPDATE UserApplication SET status=<cfqueryparam value="#status#" cfsqltype="cf_sql_varchar" >
		</cfquery>
	</cffunction>
	
	<!-- update an existing application HICP Status -->
	<cffunction name="updateHICPStatus">
		<cfargument name="HICPStatusInput" type="string" >
		<cfset HICP=HICPStatusInput />
		<cfset Var appID=getAppID() />
		<cfquery>
			UPDATE UserApplication SET HICPApp=<cfqueryparam value="#HICP#" cfsqltype="cf_sql_varchar" >
			WHERE appID=<cfqueryparam value="#appID#" cfsqltype="cf_sql_integer" >
		</cfquery>
	</cffunction>
	
	<!-- CheckApplicationStatus -->
	<cffunction name="CheckApplicationStatus" returntype="String" >
		<cfset Var appExist=checkIfAppExist()/>
		<cfif appExist eq 0>
			<cfset Var status="M">
		<cfelse>
			<cfset Var appID=getAppID()/>
			<cfquery name="statusResult" result="queryStats">
				SELECT status from UserApplication WHERE 
				appID=<cfqueryparam value="#appID#" cfsqltype="cf_sql_integer">
			</cfquery>
			<cfset Var status=#statusResult.status#/>
		</cfif>
		<cfreturn status>
	</cffunction>
	
	<!-- check if Application exist -->
	<cffunction name="checkIfAppExist" returntype="boolean" >
		<cfset Var AppID=getAppID() />
		<cfif AppID eq 0>
			<cfreturn false>
		<cfelse>
			<cfreturn true>
		</cfif>
	</cffunction>
	
	<!-- Retrieved a Application's dataID(helper method) -->
	<cffunction name="getDataID" returntype="numeric" access="private">
		<cfset Var appID=getAppID() />
		<cfquery name="dataIDResult" result="queryStats">
			SELECT dataID FROM UserFormData WHERE 
			appID=<cfqueryparam value="#appID#" cfsqltype="cf_sql_integer" >
		</cfquery>
		<cfif queryStats.recordCount neq 1>
			<cfset Var dataID=0 />
		<cfelse>
			<cfset Var dataID=#dataIDResult.dataID# />
		</cfif>
		<cfreturn dataID>
	</cffunction>
	
	<!-- Retrieve a Form's AppID, returns 0 if none found(helper method)-->
	<cffunction name="getAppID" returntype="Numeric" access="private" >
		<cfquery name="AppIDResult" result="queryStats">
			SELECT appID FROM UserApplication WHERE 
			userID=<cfqueryparam value="#Variables.userID#" cfsqltype="cf_sql_integer" > AND 
			formTypeID=<cfqueryparam value="#Variables.formTypeID#" cfsqltype="cf_sql_integer" >
		</cfquery>
		<cfif queryStats.recordCount eq 0>
			<cfset Var AppID=0 />
		<cfelse>
			<cfset Var AppID=#AppIDResult.appID# />
		</cfif>
		<cfreturn AppID>
	</cffunction>
	
	<!-- Retrieve a Form's FormID'(helper method)-->
	<cffunction name="getFormID" returntype="Numeric" access="private" >
		<cfquery name="FormIDResult" result="queryStats">
			SELECT formTypeID FROM Forms WHERE
			state=<cfqueryparam value="#state#" cfsqltype="varchar">
		</cfquery>
		<cfset formTypeID=#formIDResult.formTypeID#/>
		<cfreturn formTypeID>
	</cffunction>
	
</cfcomponent>
