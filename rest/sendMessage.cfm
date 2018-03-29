<cfheader name = "Access-Control-Allow-Origin" value="*">

<cffunction name="sendEmail">
	<cfset testID = 2/>

	<cfset sender = #session.userID# />
	<cfset subject = url.subject />
	<cfset recipient = url.recipient /> 
	<cfset message = url.message />

	<cfset dateSent = #ParseDateTime(Now())# />

 	<cfquery name="SendMail">
		INSERT INTO Message (sender, receipient, subject, message, dateSent)
		VALUES #sender#, #recipient#, #subject#, #message#, #dateSent#
	</cfquery> 

</cffunction>


