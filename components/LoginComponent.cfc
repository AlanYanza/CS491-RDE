<cfcomponent output="false" displayname="LoginCFC" hint="CFC that contains all the queries for the login aspect of the website">
	<cfset Variables.email=''/>
	<cfset Variables.userID=0/>
	<cfset Variables.firstName=''/>
	<cfset Variables.lastName=''/>
	<cfset Variables.accessLevel=''/>
	
	<cffunction name="init" displayname="LoginComponentConstructor" hint="constructor for the LoginComponent CFC" >
		<cfargument name="emailInput" type="string" displayname="email" hint="email address inputed by the user in the form" />
		<cfset email=emailInput/>
		<cfset Var userExist=checkIfUserExist(email)/>
		<cfif userExist eq 1>
			<cfset userDataQuery=getUserLogin()/>
			<cfset userID=userDataQuery.userID/>
			<cfset firstname=userDataQuery.FirstName/>
			<cfset lastname=userDataQuery.LastName/>
			<cfset accessLevel=userDataQuery.accessLevel/>
		</cfif>
		<cfreturn this>
	</cffunction>
	
	<!-- Testing purposes-->
	<cffunction name="test" >
		<cfoutput >#userID#</cfoutput>
		<cfoutput >#firstName#</cfoutput>
		<cfoutput >#lastName#</cfoutput>
		<cfoutput >#accessLevel#</cfoutput>
	</cffunction>
	
	<!-- Query's for User's login data' -->
	<cffunction name="getUserLogin" displayname="GetUserLoginInformation'" hint="Used to query for user's login data" 
	returntype="Query" >
		<cfquery name="userData" result="queryResult">
			SELECT userID,accessLevel,FirstName,LastName FROM "User" WHERE
			email=<cfqueryparam value="#email#" cfsqltype="varchar">
		</cfquery>
		<cfreturn userData>
	</cffunction>
	
	<!-- validate User password -->
	<cffunction name="validateInputPassword" displayname="Validate User Input Password" hint="This is used to validate the user's input password" 
	returntype="Numeric" >
		<cfargument name="inputPass" displayname="UserInputPassword" hint="the password the user put into login form" >
		<cfstoredproc procedure="ValidatePassword" >
			<cfprocparam value="#userID#" cfsqltype="CF_SQL_INTEGER" >
			<cfprocparam value="#inputPass#" cfsqltype="CF_SQL_VARCHAR" >
			<cfprocparam  variable="result"cfsqltype="CF_SQL_INTEGER" type="out">
		</cfstoredproc>
		<cfif result eq 0>
			<cfreturn 0/>
		<cfelse>
			<cfreturn 1/>>
		</cfif>
	</cffunction>
	
	<!-- Check if the user exists on on the database -->
	<cffunction name="checkIfUserExist" displayname="CheckIfUserExist" hint="CHeck to see if User is in the database(return 1 if exist)" 
	returntype="Numeric">
		<cfargument name="email" displayname="userEmailAddress" hint="input for email address inputed by user in login form'" >
		<cfquery result="queryResult">
			SELECT userID,accessLevel,FirstName,LastName FROM "User" WHERE
			email=<cfqueryparam value="#arguments.email#" cfsqltype="varchar">
		</cfquery>
		<cfif queryResult.RecordCount neq 1>
			<cfreturn 0>
		<cfelse>
			<cfreturn 1>
		</cfif>	
	</cffunction>
	
	<!-- Set User Session Variables --->
	<cffunction name="setSessionVariables" displayname="set User Session Variables" hint="Set the Users session variables if user exist" >
		<cfset session.userID=userID/>
		<cfset session.accessLevel=accessLevel/>
		<cfset session.firstName=FirstName/>
		<cfset session.lastName=LastName/>
	</cffunction>
	
</cfcomponent>