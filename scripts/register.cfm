<cfparam name = "form.email" type = "email" default="">
<cfparam name = "form.password" type = "string" default ="">
<cfparam name = "form.firstName" type = "string" default = "">
<cfparam name = "form.lastName" type = "string" default = "">

<cfquery name = "register" datasource = "Database"> 
    INSERT INTO [User] VALUES('sms46', '#form.email#', HASHBYTES('sha2_512', '#form.password#'), 'user')
</cfquery>

<cflocation url="../home.cfm">
<cfabort>