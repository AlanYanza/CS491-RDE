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
			ORDER BY appID DESC
		</cfquery>
		<cfreturn Results1>
	</cffunction>
	<cffunction name="getNameInfo" returntype = "Query">
		<cfquery name="formResult">
			SELECT accessLevel, firstName, lastName, userID
			FROM [User]
		</cfquery>
		<cfreturn formResult>
	</cffunction>
	
</cfcomponent>