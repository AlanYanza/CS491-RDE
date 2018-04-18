<cfcomponent>

	<!-- User Application view -->
	<cffunction name="GetAllApplications" returntype = "Query">
		<cfquery name="Results1">
			SELECT appID,userID,dateSubmited,formTypeID
			FROM UserApplication
		</cfquery>
		<cfreturn Results1>
	</cffunction>
	<cffunction name="getNameInfo" returntype = "Query">
		<cfquery name="formResult">
			SELECT accessLevel,firstName,lastName,userID
			FROM [User]
		</cfquery>
		<cfreturn formResult>
	</cffunction>
</cfcomponent>