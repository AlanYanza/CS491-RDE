<cfcomponent>

	<!-- User Application view -->
	<cffunction name="GetAllApplications" returntype = "Query">
		<cfquery name="Results1">
			SELECT 
				UserApplication.appID,
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
	<cffunction name="Approve">
		<cfargument name="appIDInput">
		<cfargument name="Status">
		<cfquery name="ApproveChange">
			UPDATE UserApplication
			SET status = <cfqueryparam value="#arguments.Status#" cfsqltype="cf_sql_varchar"/>
			WHERE appID = <cfqueryparam value="#arguments.appIDInput#" cfsqltype="cf_sql_integar"/>			
		</cfquery>
	</cffunction>
	<cffunction name="Returned">
		<cfargument name="appIDInput">
		<cfquery name="ReturnChange">
			UPDATE UserApplication
			SET status = 'N'
			WHERE appID = <cfqueryparam value="#arguments.appIDInput#" cfsqltype="cf_sql_integar"/>			
		</cfquery>
	</cffunction>
	<cffunction name="Deny">
		<cfargument name="appIDInput">
		<cfquery name="DenyChange">
			UPDATE UserApplication
			SET status = 'D'
			WHERE appID = <cfqueryparam value="#arguments.appIDInput#" cfsqltype="cf_sql_integar"/>			
		</cfquery>
	</cffunction>
</cfcomponent>