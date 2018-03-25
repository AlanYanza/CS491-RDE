<cfcomponent output="false" name="Subform" displayName="Subform" extends="Form">
	<cfset Variables.tableName='' />
	<cfset Variables.fieldNames= []/>
	<cfset Variables.fieldValues= {}/>
	<cfset Variables.dataID=0/>
	
	<!-- Constructor -->
	<cffunction name="init" displayname="subform constructor" hint="constructor for the subform CFC" >
		<cfargument name="stateInput" type="string" />
		<cfargument name="userIDInput" type="string" />
		<cfargument name="tableNameInput" type="string" >
		<cfargument name="fieldNamesInput" type="array" required="false">
		<cfset super.init(stateInput,userIDInput)/>
		<cfset tableName=tableNameInput/>
		<cfif IsDefined('arguments.fieldNameInput')>
			<cfset fieldNames=fieldNamesInput />
		</cfif>
		<cfset dataID=getDataID()/>
		<cfreturn this>
	</cffunction>
	
	<!-- dynamically get the data contained in the Form-->
	<cffunction name="extractFormData" displayname="getDataFromField" hint="Extract the data contain the form field elements" >
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
			
	<!-- check if data already exist for subform -->
	<cffunction name="checkIfDataExist" displayname="checkIfDataExistForUser" hint="Check to see if data exist for the user for a subform" 
	returntype="boolean" >
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
	<cffunction name="createSubformData" displayname="createSubformData" hint="Insert a new entry into the subforms associated Table"> 
		<cfset Var dataExist=checkIfDataExist()/>
		<cfif dataExist eq 0>
			<cfset dataID=getDataID()/>
			<cfquery>
				INSERT INTO #tableName# (dataID)
				VALUES( <cfqueryparam value="#dataID#" cfsqltype="cf_sql_integer"> )
			</cfquery> 
		</cfif>
	</cffunction>
	
	<!-- Retrieve data form subform -->
	<cffunction name="retrieveDataForSubform" displayname="retrieveSubformDataFromTable" 
	hint="Retrieve user subform data from subforms's associated table" returntype="Query" >
		<cfset Var dataID=getDataID()/>
		<cfquery name="formValues">
			SELECT * FROM #tableName# WHERE
			dataID=<cfqueryparam value="#dataID#" cfsqltype="cf_sql_integer" >
		</cfquery>
		<cfreturn formValues>
	</cffunction>  
	
	<!-- Update Subform Data in the Subform Table -->
	<cffunction name="updateSubformData" displayname="updateSubformDataTable" 
	hint="Updates the subform's associated Table with current subform data"  >
		<!-- Prepare Set Statements-->
		<cfset Var arrayCount=0 />
		<cfset setStr=''/>
		<cfoutput >#setStr#</cfoutput>
		<cfset Var queryStr="field3 = ""E""" />
		<cfquery >
			UPDATE <cfoutput>#tableName#</cfoutput> SET
			<!--- loop through fieldValues and add it to query--->
			<cfloop array="#fieldNames#" index="i">
		    	<cfset arrayCount=arrayCount+1 />
		    	<cfif arrayCount neq ArrayLen(#fieldNames#)>
		    		<!--- if not last elements in array use , --->
		 			<cfoutput> #i# = '#fieldValues[i]#', </cfoutput>
		 		<cfelse>
		 			<!--- if last element in array do not add ,--->
		 			<cfoutput> #i# = '#fieldValues[i]#' </cfoutput>
		    	</cfif>
	 		</cfloop> 	
	 		WHERE dataID=<cfqueryparam value="#dataID#">
		</cfquery>
	</cffunction> 
	
</cfcomponent>
