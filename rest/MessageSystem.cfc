<cfcomponent rest="true">
	<cfheader name = "Access-Control-Allow-Origin" value="*">
	
	<cffunction name="GetEmail">
		<cfset testID = 2/>
		<cfset userID = #session.userID# />
		<cfquery name="MailResult">
			SELECT Inbox.msgID, Inbox.readStatus, Message.sender, Message.receipient, Message.subject, Message.message,
			Message.dateSent 
			FROM Inbox 
			INNER JOIN Message ON Inbox.msgID=Message.msgID
			WHERE Inbox.userID = #session.userID#
		</cfquery>
		<cfset mail = #MailResult# />
		<cfoutput>#serializeJSON(mail, 'struct')#</cfoutput>
	</cffunction>

</cfcomponent>