<cfheader name = "Access-Control-Allow-Origin" value="*">

<cffunction name="GetEmail" httpmethod="GET" >
	<cfset testID = 2/>
	<cfset userID = #session.userID#/>
	<cfquery name="MailResult">
		SELECT Inbox.msgID, Inbox.readStatus, Message.sender, Message.receipient, Message.subject, Message.message,
		Message.dateSent 
		FROM Inbox 
		INNER JOIN Message ON Inbox.msgID=Message.msgID
		WHERE Inbox.userID = #session.userID#
	</cfquery>

	<cfset mail = #MailResult# />

	<cfreturn mail />
</cffunction>

<cfset EmailGetter=GetEmail()/> 

<cfoutput>#serializeJSON(EmailGetter, 'struct')#</cfoutput>
