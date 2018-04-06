<cfcomponent output="false" name="Form" displayName="Form">
	<cfset Variables.state='' />
	<cfset Variables.formTypeID=0 />
	<cfset Variables.userID=0 />
	
	<!-- Constructor -->
	<cffunction name="init" displayname="Form constructor" hint="Form CFC constructor" >
		<cfargument name="stateInput" type="string" >
		<cfargument name="userIDInput" type="string" >
		<cfset state=stateInput > 
		<cfset userID=userIDInput >
		<cfset formTypeID=getFormID()>
		<cfreturn this>
	</cffunction>
	
	<!-- add a new Application to Database -->
	<cffunction name="createApplication" displayname="createNewApplicationTableEntry" 
	hint="create an new entry in the UserApplication Table">
		<!-- Insert Application Into Database -->
		<cfQuery>
			INSERT INTO UserApplication (userID,formTypeID,HICPApp,status) VALUES(
				<cfqueryparam value="#userID#" cfsqltype="cf_sql_integer" >,
				<cfqueryparam value="#formTypeID#" cfsqltype="cf_sql_integer" >,
				<cfqueryparam value="N" cfsqltype="cf_sql_varchar" >,
				<cfqueryparam value="P" cfsqltype="cf_sql_varchar" >
			)
		</cfquery>
		<!-- query DB for appID of newly inserted Application-->
		<cfQuery name="appIDResult" result="queryStat">
			SELECT MAX(appID) As LastAppID FROM UserApplication WHERE
			userID=<cfqueryparam value="#userID#" cfsqltype="cf_sql_integer" >   
		</cfquery>
		<cfset var appID=appIDResult.LastAppID >
		<!-- Insert Application Into UserForm Data to create a dataID -->
		<cfquery >
			INSERT INTO UserFormData (appID) VALUES(
				<cfqueryparam value="#appID#" cfsqltype="cf_sql_integer">
			)			
		</cfquery>
	</cffunction>
	
	<!-- update an existing application Status -->
	<cffunction name="updateApplicationStatus" displayname="UpdateExistingApplicationTableEntry"
	hint="update data about an existing UserApplication Table Entry">
		<cfargument name="statusInput" type="string" required="false" >
		<cfset status=statusInput />
		<cfquery >
			UPDATE UserApplication SET status=<cfqueryparam value="#status#" cfsqltype="cf_sql_varchar" > WHERE
			appID=<cfqueryparam value="#session.appID#" cfsqltype="cf_sql_integer" > 
		</cfquery>
	</cffunction>
	
	<!-- submit an Application -->
	<cffunction name="submitApplication" displayname="submitApplication" 
	hint="Submit an Application into the DB" >
		<!-- set Application Status to 'R' -->
		<cfset updateApplicationStatus('R')>
		<!-- Update DateSubmited to current date -->
		<cfquery >
			Update UserApplication SET dateSubmited=getDate() WHERE 
			appID=<cfqueryparam value="#session.appID#" cfsqltype="cf_sql_integer" >
		</cfquery>
	</cffunction>
	
	<!-- update an existing application HICP Status -->
	<cffunction name="updateHICPStatus" displayname="updateHICPStatus" hint="updates HICP Status for an application">
		<cfargument name="HICPStatusInput" type="string" >
		<cfset HICP=HICPStatusInput />
		<cfquery>
			UPDATE UserApplication SET HICPApp=<cfqueryparam value="#HICP#" cfsqltype="cf_sql_varchar" >
			WHERE appID=<cfqueryparam value="#session.appID#" cfsqltype="cf_sql_integer" >
		</cfquery>
	</cffunction>
	
	<!-- retreive HICP status -->
	<cffunction name="retrieveHICPStatus" displayname="retrieveHICPStatus" hint="get the current HICP status" 
	returntype="String" >
		<cfquery name="HICPStatusResult" result="queryStats">
			SELECT HICPApp from UserApplication WHERE
			appID=<cfqueryparam value="#session.appID#" cfsqltype="cf_sql_integer" >
		</cfquery> 
		<cfset Var HICPStatus=HICPStatusResult.HICPApp />
		<cfreturn HICPStatus />
	</cffunction>
	
	<!-- CheckApplicationStatus -->
	<cffunction name="CheckApplicationStatus" displayname="CheckApplicationStatus" hint="checks the current Application status" 
	returntype="String"  >
		<cfset Var appExist=checkIfAppExist()/>
		<cfif appExist eq 0>
			<cfset Var status="M">
		<cfelse>
			<cfquery name="statusResult" result="queryStats">
				SELECT status from UserApplication WHERE 
				appID=<cfqueryparam value="#session.appID#" cfsqltype="cf_sql_integer">
			</cfquery>
			<cfset Var status=#statusResult.status#/>
		</cfif>
		<cfreturn status>
	</cffunction>
	
	<!-- check if Application exist -->
	<cffunction name="checkIfAppExist" returntype="boolean" displayname="checkIfAppExist" hint="Checks to see if user has an application" >
		<cfif session.appID eq 0>
			<cfreturn false>
		<cfelse>
			<cfreturn true>
		</cfif>
	</cffunction>
		
	<!-- Retrieve a Form's AppID, returns 0 if none found -->
	<cffunction name="getAppID" displayname="getUserApplicationID" hint="get the Application associted for the User" 
	returntype="Numeric"  >
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
	
	<!-- Retrieve a Form's FormID-->
	<cffunction name="getFormID"  displayname="getFormIDForAState" hint="retrieves the formID for a specified State" 
	returntype="Numeric" >
		<cfquery name="FormIDResult" result="queryStats">
			SELECT formTypeID FROM Forms WHERE
			state=<cfqueryparam value="#state#" cfsqltype="varchar">
		</cfquery>
		<cfset formTypeID=#formIDResult.formTypeID#/>
		<cfreturn formTypeID>
	</cffunction>
	
	<!-- redirect if no permission to edit Application -->
	<cffunction name="noAccessRedirect" displayname="ifNoAccessToApplicationRedirect"
	hint="If user doesn't have access to edit form, redirect to specific location">
		<cfargument name="destinationInput" type="string" >
		<cfset destination=destinationInput />
		<cfset appStatus=CheckApplicationStatus()/>
		<cfif appStatus neq "M" AND appStatus neq "P" AND appStatus neq "N">
			<cflocation url="#destination#">
		</cfif>
	</cffunction>
	
	<!-- Insert Required Document into Documents Table -->
	<cffunction name="insertDocument" displayname="insertDocumentForApplication" 
	hint="add a entry into the Application Documents Table for a specified Document" >
		<cfargument name="documentlabelInput" hint="label on website for document to be inserted" type="string" >
		<cfargument name="requiredInput" hint="specifies if document to be inserted is required by user" type="string" > 
		<cfquery >
			INSERT INTO AppDocument VALUES(
				<cfqueryparam value="#session.appID#" cfsqltype="cf_sql_integer" >,
				<cfqueryparam value="#arguments.documentlabelInput#" cfsqltype="cf_sql_varchar" >,
				<cfqueryparam value="#arguments.requiredInput#" cfsqltype="cf_sql_varchar" >,
				'N',NULL)
		</cfquery>
	</cffunction>
	
</cfcomponent>
