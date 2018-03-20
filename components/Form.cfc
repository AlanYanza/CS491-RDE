<cfcomponent output="false" name="Form" displayName="Form">
	<cfset Variables.state='' />
	<cfset Variables.formTypeID=0 />
	<cfset Variables.userID=0 />
	<cfset Variables.appID=0 />
	
	<!-- Constructor -->
	<cffunction name="init" >
		<cfargument name="stateInput" type="string" />
		<cfargument name="userIDInput" type="string" />
		<cfset state=stateInput /> 
		<cfset userID=userIDInput />
		<cfset formTypeID=getFormID()/>
		<cfset appID=getAppID()/>
		<cfreturn this>
	</cffunction>
	
	<!-- add a new Application to Database -->
	<cffunction name="createApplication">
		<cfset appStatus=CheckApplicationStatus()/>
		<cfif appStatus eq 'M'>
			<cfQuery>
				INSERT INTO UserApplication (userID,formTypeID,HICPApp,status) VALUES(
					<cfqueryparam value="#userID#" cfsqltype="cf_sql_integer" >,
					<cfqueryparam value="#formTypeID#" cfsqltype="cf_sql_integer" >,
					<cfqueryparam value="N" cfsqltype="cf_sql_varchar" >,
					<cfqueryparam value="P" cfsqltype="cf_sql_varchar" >
				)
			</cfquery>
			<cfquery >
				INSERT INTO UserFormData (appID) VALUES(
					<cfqueryparam value="#appID#" cfsqltype="cf_sql_integer">
				)			
			</cfquery>
		</cfif>
	</cffunction>
	
	<!-- update an existing application Status -->
	<cffunction name="updateApplicationStatus">
		<cfargument name="statusInput" type="string" required="false" >
		<cfset status=statusInput />
		<cfquery >
			UPDATE UserApplication SET status=<cfqueryparam value="#status#" cfsqltype="cf_sql_varchar" >
		</cfquery>
	</cffunction>
	
	<!-- update an existing application HICP Status -->
	<cffunction name="updateHICPStatus">
		<cfargument name="HICPStatusInput" type="string" >
		<cfset HICP=HICPStatusInput />
		<cfquery>
			UPDATE UserApplication SET HICPApp=<cfqueryparam value="#HICP#" cfsqltype="cf_sql_varchar" >
			WHERE appID=<cfqueryparam value="#appID#" cfsqltype="cf_sql_integer" >
		</cfquery>
	</cffunction>
	
	<!-- retreive HICP status -->
	<cffunction name="retrieveHICPStatus" returntype="String" >
		<cfquery name="HICPStatusResult" result="queryStats">
			SELECT HICPApp from UserApplication WHERE
			appID=<cfqueryparam value="#appID#" cfsqltype="cf_sql_integer" >
		</cfquery> 
		<cfset Var HICPStatus=HICPStatusResult.HICPApp />
		<cfreturn HICPStatus />
	</cffunction>
	
	<!-- CheckApplicationStatus -->
	<cffunction name="CheckApplicationStatus" returntype="String" >
		<cfset Var appExist=checkIfAppExist()/>
		<cfif appExist eq 0>
			<cfset Var status="M">
		<cfelse>
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
		<cfif AppID eq 0>
			<cfreturn false>
		<cfelse>
			<cfreturn true>
		</cfif>
	</cffunction>
	
	<!-- Retrieved a Application's dataID(helper method) -->
	<cffunction name="getDataID" returntype="numeric" >
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
	
	<!-- redirect if no permission to edit Application -->
	<cffunction name="noAccessRedirect" >
		<cfargument name="destinationInput" type="string" >
		<cfset destination=destinationInput />
		<cfset appStatus=CheckApplicationStatus()/>
		<cfif appStatus neq "M" AND appStatus neq "P" AND appStatus neq "N">
			<cflocation url="#destination#">
		</cfif>
	</cffunction>
	
</cfcomponent>
