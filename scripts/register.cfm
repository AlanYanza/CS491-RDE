<!--- If user are already sign in, do not let them access --->
<cfset SessionClass=createObject('component',"CS491-RDE.components.SessionTools")/>
<cfset SessionClass.ClearSessionAppID() > <!-- If appID session variable set, clear it -->
<cfset SessionClass.ifAlreadySignIn()>

<cfparam name = "form.email" type = "email" default="">
<cfparam name = "form.password" type = "string" default ="">
<cfparam name = "form.firstName" type = "string" default = "">
<cfparam name = "form.lastName" type = "string" default = "">

<!-- If user exist, create an UserObj -->
<cfset LoginObj=createObject('component',"CS491-RDE.components.LoginComponent").init(form.email)/>
<cfset userExist=LoginObj.checkIfUserExist(form.email)>

<cfif userExist eq 0>
	<cfquery name = "register"> 
	    INSERT INTO [User](email,FirstName,LastName,password,accessLevel) VALUES('#form.email#','#form.firstName#','#form.lastName#', 
	    HASHBYTES('sha2_512', '#form.password#'), 'user')
	</cfquery>
	<cflocation url="../index.cfm?registered">
<cfelse>
	<cflocation url="../register.cfm?Exist">
</cfif>