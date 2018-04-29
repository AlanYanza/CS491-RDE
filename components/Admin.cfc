<cfcomponent>

	<!--- User Application view --->
	<cffunction name="GetAllApplications" returntype = "Query">
		<cfquery name="Results1">
			SELECT 
				UserApplication.appID AS appID,
				userID,
				FName,
				LName,
				dateSubmited,
				formTypeID,
				[status]
			FROM UserApplication
			join (
				select
					appID,
					dataID
				FROM UserFormData
				) as formData on UserApplication.appID = formData.appID
			left outer join (
				select
					dataID,
					FName,
					LName
				FROM NJSection1
				) as fullName on formData.dataID = fullName.dataID
			ORDER BY dateSubmited ASC, UserApplication.appID DESC
		</cfquery>
		<cfreturn Results1>
	</cffunction>
	
	<!--- Changes the status of an Application to Approved --->
	<cffunction name="Approve">
		<cfargument name="appIDInput">
		<cfargument name="Status">
		<cfquery name="ApproveChange">
			UPDATE UserApplication
			SET status = <cfqueryparam value="#arguments.Status#" cfsqltype="cf_sql_varchar"/>
			WHERE appID = <cfqueryparam value="#arguments.appIDInput#" cfsqltype="cf_sql_integar"/>			
		</cfquery>
		<!--- get destination email --->
		<cfset email=getEmailFromAppID(arguments.appIDInput)>
		<!--- Email user notifiying them of status change --->
		<cfset mailer=createObject('component',"CS491-RDE.components.emailTool")/>
		<cfset mailer.sendStatusChangeEmail(email,"NJ ADDP/HICP","Approved")>
	</cffunction>
	
	<!--- Changes the status of an Application to Needs Review --->
	<cffunction name="Returned">
		<cfargument name="appIDInput">
		<cfquery name="ReturnChange">
			UPDATE UserApplication
			SET status = 'N'
			WHERE appID = <cfqueryparam value="#arguments.appIDInput#" cfsqltype="cf_sql_integar"/>			
		</cfquery>
		<!--- get destination email --->
		<cfset email=getEmailFromAppID(arguments.appIDInput)>
		<!--- Email user notifiying them of status change --->
		<cfset mailer=createObject('component',"CS491-RDE.components.emailTool")/>
		<cfset mailer.sendStatusChangeEmail(email,"NJ ADDP/HICP","Needs Attention")>
	</cffunction>
	
	<!--- Changes the status of an Application to Denied --->
	<cffunction name="Deny">
		<cfargument name="appIDInput">
		<cfquery name="DenyChange">
			UPDATE UserApplication
			SET status = 'D'
			WHERE appID = <cfqueryparam value="#arguments.appIDInput#" cfsqltype="cf_sql_integar"/>			
		</cfquery>
		<!--- get destination email --->
		<cfset email=getEmailFromAppID(arguments.appIDInput)>
		<!--- Email user notifiying them of status change --->
		<cfset mailer=createObject('component',"CS491-RDE.components.emailTool")/>
		<cfset mailer.sendStatusChangeEmail(email,"NJ ADDP/HICP","Denied")>
	</cffunction>
	
	<!--- Retrieves the email address of user for a given appID --->
	<cffunction name="getEmailFromAppID" returntype="String" >
		<cfargument name="appIDInput">
		<cfquery name="destEmail" result="queryStat" >
			SELECT email FROM [User] 
			INNER JOIN UserApplication on [User].[userID]=UserApplication.userID 
			WHERE appID=<cfqueryparam value="#arguments.appIDInput#" cfsqltype="cf_sql_integer" >
		</cfquery>
		<cfset email=destEmail['email']>
		<cfreturn email>
	</cffunction>
	
</cfcomponent>