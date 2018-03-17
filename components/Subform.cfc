<cfcomponent output="false" name="Subform" displayName="Subform" extends="Form">
	<cfset Variables.tableName='' />
	
	<!-- Constructor -->
	<cffunction name="init" >
		<cfargument name="stateInput" type="string" />
		<cfargument name="userIDInput" type="string" />
		<cfargument name="tableNameInput" type="string" >
		<cfset super.init(stateInput,userIDInput)/>
		<cfset tableName=tableNameInput/>
		<cfreturn this>
	</cffunction>
	
	<!-- check if data already exist for subform -->
	<cffunction name="checkIfDataExist" returntype="boolean" >
		<cfset dataID=getDataID() />
		<cfif dataID eq 0 >
			<cfreturn false>
		<cfelse>
			<cfreturn true>
		</cfif>
	</cffunction>
	
</cfcomponent>
