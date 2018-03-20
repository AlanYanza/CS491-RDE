<cfcomponent output="false" name="Subform" displayName="Subform" extends="Form">
	<cfset Variables.tableName='' />
	<cfset Variables.fieldNames= []/>
	<cfset Variables.fieldValues= {}/>
	
	<!-- Constructor -->
	<cffunction name="init" >
		<cfargument name="stateInput" type="string" />
		<cfargument name="userIDInput" type="string" />
		<cfargument name="tableNameInput" type="string" >
		<cfargument name="fieldNamesInput" type="array">
		<cfset super.init(stateInput,userIDInput)/>
		<cfset tableName=tableNameInput/>
		<cfset fieldNames=fieldNamesInput />
		<cfreturn this>
	</cffunction>
	
	<!-- dynamically get the data contained in the Form-->
	<cffunction name="getFormData" >
		<cfloop array="#fieldNames#" index="i" >
			<cfset fieldName=#i#/>
			<!-- If element is undefined (not selected) put 'X' as its value -->
			<cfif NOT IsDefined('form.#i#') >
				<cfset fieldValue='X'/>
			<!-- If element is defined get it value -->
			<cfelse>
				<cfset fieldValue=#Form[i]#/>
			</cfif>
			<!-- Insert form field data into fieldValues-->
			<cfset StructInsert(fieldValues,fieldName,fieldValue)/>
		</cfloop> 
	</cffunction>
	
	<!-- Testing purposes-->
	<cffunction name="testing" >
		<cfdump var="#fieldNames#" >
		<cfdump var="#fieldValues#" >
	</cffunction>
		
	<!-- check if data already exist for subform -->
	<cffunction name="checkIfDataExist" returntype="boolean" >
		<cfset Var dataID=getDataID() />
		<cfquery name="formDataCountResult" result="queryStats">
			SELECT * FROM #tableName# WHERE
			dataID=<cfqueryparam value="#dataID#" cfsqltype="cf_sql_integer" >
		</cfquery>
		<cfif queryStats.recordCount eq 0 >
			<cfreturn false>
		<cfelse>
			<cfreturn true>
		</cfif>
	</cffunction>
	
	<!-- Create new subForm data (insert into table blank values) -->
	<cffunction name="createSubformData"> 
		<cfset Var dataExist=checkIfDataExist()/>
		<cfif dataExist eq 0>
			<cfset dataID=getDataID()/>
			<cfquery>
				INSERT INTO #tableName# (dataID)
				VALUES( <cfqueryparam value="#dataID#" cfsqltype="cf_sql_integer"> )
			</cfquery> 
		</cfif>
	</cffunction>
	
	<!-- Retrieve data from subform -->
	<cffunction name="retrieveDataFromSubform" returntype="Query" >
		<cfset Var dataID=getDataID()/>
		<cfquery name="formValues">
			SELECT * FROM #tableName# WHERE
			dataID=<cfqueryparam value="#dataID#" cfsqltype="cf_sql_integer" >
		</cfquery>
		<cfreturn formValues>
	</cffunction>   
	
</cfcomponent>
