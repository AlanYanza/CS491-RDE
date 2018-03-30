<cfcomponent rest="true" restpath="/MessageSystem" produces="application/json" >
		
	<cffunction name="GetEmail" returntype="Query" httpmethod="GET" restpath="GetEmail">
		<cfheader name = "Access-Control-Allow-Origin" value="*">
		<cfset testID = 2/>
		<cfset userID = #session.userID# />
		<cfquery name="MailResult">
			SELECT Inbox.msgID, Inbox.readStatus, Message.sender, Message.receipient, Message.subject, Message.message,
			Message.dateSent 
			FROM Inbox 
			INNER JOIN Message ON Inbox.msgID=Message.msgID
			WHERE Inbox.userID = #session.userID#
		</cfquery>
		<cfreturn MailResult />
<!---		<cfoutput>#serializeJSON(mail, 'struct')#</cfoutput>--->
	</cffunction>
	
	<cffunction name="SendEmail" httpmethod="POST" restpath="SendEmail" > 
		<cfheader name = "Access-Control-Allow-Origin" value="*">
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

</cfcomponent>