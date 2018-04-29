<cfcomponent output="false" name="Subform" displayName="Subform" extends="Form">
	<cfset Variables.tableName='' >
	<cfset Variables.fieldNames= []>
	<cfset Variables.fieldValues= {}>
	<cfset Variables.checkFieldNames=[]>
	<cfset Variables.dataID=0>
	<cfset Variables.appID=0>
	
	<!-- Constructor -->
	<cffunction name="init" displayname="subform constructor" hint="constructor for the subform CFC" >
		<cfargument name="stateInput" type="string" />
		<cfargument name="userIDInput" type="string" />
		<cfargument name="tableNameInput" type="string" >
		<cfargument name="appIDInput" type="numeric" required="false">
		<cfset super.init(stateInput,userIDInput)/>
		<cfif isDefined('arguments.appIDInput')>
			<cfset appID=appIDInput >
		<cfelse>
			<cfset appID=session.appID>
		</cfif>
		<cfset tableName=tableNameInput >
		<cfset dataID=getDataID() >
		<cfreturn this>
	</cffunction>
	
	<!-- Retrieved a Application's dataID(helper method) -->
	<cffunction name="getDataID" returntype="numeric" displayname="retrieveApplicationDataID" hint="retrieves the dataID associated with an Application" >
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
	
	<!-- Setter for fields(if not provided) -->
	<cffunction name="setFields" displayname="setSubformFields" hint="Set the fields for the subform" >
		<cfargument name="fieldArrayInput" type="array" hint="array with the fields for the subform"  >
		<cfset Var numElem=ArrayLen(fieldArrayInput)/>
		<cfloop from="1" to=#numElem#  step="1" index="i"  >
			<cfset fieldNames[i]=fieldArrayInput[i]/>
		</cfloop>
	</cffunction>
	
	<!-- Setter for Checkbox fields(if not provided) -->
	<cffunction name="setCheckFields" displayname="setSubformFields" hint="Set the fields for the subform" >
		<cfargument name="fieldArrayInput" type="array" hint="array with the fields for the subform"  >
		<cfset Var numElem=ArrayLen(fieldArrayInput)/>
		<cfloop from="1" to=#numElem#  step="1" index="i"  >
			<cfset checkFieldNames[i]=fieldArrayInput[i]/>
		</cfloop>
	</cffunction>
	
	<!-- dynamically get the data contained in the Form(non-checkboxes)-->
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
	
	<!-- dynamically get the data contained in the Checkboxes-->
	<cffunction name="extractCheckboxData" displayname="getDataFromField" hint="Extract the data contain the form field elements" >
		<cfloop array="#checkFieldNames#" index="i" >
			<cfset fieldName=#i#/>
			<cfif NOT IsDefined('form.#i#') >
				<cfset fieldValue='N'/>
			<!-- If element is defined get it value -->
			<cfelse>
				<cfset fieldValue=#Form[i]#/>
			</cfif>
			<!-- Insert form field data into fieldValues-->
			<cfset StructInsert(fieldValues,fieldName,fieldValue)/>
		</cfloop>
	</cffunction>
	
	<!-- Send User's signature to database'-->
	<cffunction name="updateSignature" displayname="updateUserSignature" hint="sends user signature to database" >
		<cfargument name="signatureField" hint="the name of the signature field" >
		<cfargument name="dateField" hint="the name of the date field" >
		<!-- Get string of signature from form and remove starting header -->
		<cfset binaryStringRep=form[arguments.signatureField]>
		<cfset binaryStringRep=REReplace(binaryStringRep,'data:image/png;base64,','')>
		<!-- Convert the base64 string representation to a binary string -->
		<!---<cfset binaryString=BinaryDecode(binaryStringRep,"Base64")>--->
		<!-- Insert the binary string into subTable -->
		<cfquery>
			UPDATE #tableName# SET #arguments.signatureField#= <cfqueryparam value="#binaryStringRep#" cfsqltype="cf_sql_longvarchar">,
			#dateField#=getdate()  
			WHERE dataID=<cfqueryparam value="#dataID#" cfsqltype="cf_sql_integer" >
		</cfquery>
	</cffunction>
	
	<!-- Retrieve user's signature from database --->
	<cffunction name="getSignature" displayname="getUserSignatureFromDB" hint="retrieves user signature from database" >
		<cfargument name="signatureField" hint="the name of the signature field" >
		<cfquery name="returnSignature" result="queryStat" >
			SELECT #signatureField# FROM #tableName# WHERE 
			dataID=<cfqueryparam value="#dataID#" cfsqltype="cf_sql_integer" >
		</cfquery>
		<cfreturn returnSignature /> 
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
		<cfquery >
			UPDATE <cfoutput>#tableName#</cfoutput> SET 
			 <!---loop through fieldValues and add it to query--->
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
	 		WHERE dataID=<cfqueryparam value="#dataID#" cfsqltype="cf_sql_integer" >
		</cfquery>
	</cffunction> 
	
	<!-- Update Subform Data in the Subform Table -->
	<cffunction name="updateCheckboxData" displayname="updateCheckboxSubformDataTable" 
	hint="Updates the subform's associated Table with current subform data"  >
		<!-- Prepare Set Statements-->
		<cfset Var arrayCount=0 />
		<cfquery >
			UPDATE <cfoutput>#tableName#</cfoutput> SET 
			 <!---loop through fieldValues and add it to query--->
			<cfloop array="#checkFieldNames#" index="i">
		    	<cfset arrayCount=arrayCount+1 />
		    	<cfif arrayCount neq ArrayLen(#checkFieldNames#)>
		    		<!--- if not last elements in array use , --->
		 			<cfoutput> #i# = '#fieldValues[i]#', </cfoutput>
		 		<cfelse>
		 			<!--- if last element in array do not add ,--->
		 			<cfoutput> #i# = '#fieldValues[i]#' </cfoutput>
		    	</cfif>
	 		</cfloop>
	 		WHERE dataID=<cfqueryparam value="#dataID#" cfsqltype="cf_sql_integer" >
		</cfquery>
	</cffunction> 
	
	<!-- Represent Checkbox Field in Subform-->
	<cffunction name="showCheckbox" displayname="Represent Checkbox Value in subform" hint="represent a checkbox value based on query results" 
	 returntype="string">
	 	<cfargument name="fieldNameInput" hint="fieldName of interest to present query value with" type="string" >
	 	<cfargument name="resultSetInput" hint="resultSet to look for fieldName value" type="query" >
	 	<cfset var fieldName=fieldNameInput />
	 	<cfset var tmpResultSet=resultSetInput />
	 	<cfset value=tmpResultSet[#fieldName#]/>
		<cfif value eq 'Y'>
			<cfoutput>checked</cfoutput>
		</cfif>
	</cffunction>
	
	<!-- Represent Radiobutton Field in Subform-->
	<cffunction name="showRadioButton" displayname="Represent RadioButton Value in subform" hint="represent a RadioButton value based on query results" 
	 returntype="string">
	 	<cfargument name="fieldNameInput" hint="fieldName of interest to present query value with" type="string" >
	 	<cfargument name="resultSetInput" hint="resultSet to look for fieldName value" type="query" >
	 	<cfargument name="valueInput" hint="desired value to check on" type="string" >
	 	<cfset var fieldName=fieldNameInput />
	 	<cfset var tmpResultSet=resultSetInput />
	 	<cfset value=tmpResultSet[#fieldName#]/>
		<cfif value eq arguments.valueInput>
			<cfoutput>checked</cfoutput>
		</cfif>
	</cffunction>
	
		<!-- Represent Selection Fields in Subform-->
	<cffunction name="showSelectionField" displayname="Represent Selection Field Value in subform" hint="represent a Selection Field value based on query results" 
	 returntype="string">
	 	<cfargument name="fieldNameInput" hint="fieldName of interest to present query value with" type="string" >
	 	<cfargument name="resultSetInput" hint="resultSet to look for fieldName value" type="query" >
	 	<cfargument name="valueInput" hint="desired value to check on" type="string" >
	 	<cfset var fieldName=fieldNameInput />
	 	<cfset var tmpResultSet=resultSetInput />
	 	<cfset value=tmpResultSet[#fieldName#]/>
		<cfif value eq arguments.valueInput>
			<cfoutput>selected</cfoutput>
		</cfif>
	</cffunction>
	
</cfcomponent>
