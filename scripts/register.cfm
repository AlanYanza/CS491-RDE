<cfparam name = "form.email" type = "email" default="">
<cfparam name = "form.password" type = "string" default ="">
<cfparam name = "form.firstName" type = "string" default = "">
<cfparam name = "form.lastName" type = "string" default = "">

<cfquery name = "register"> 
    INSERT INTO [User](email,FirstName,LastName,password,accessLevel) VALUES('#form.email#','#form.firstName#','#form.lastName#', 
    HASHBYTES('sha2_512', '#form.password#'), 'user')
</cfquery>

<cflocation url="../index.cfm?registered">
<cfabort>