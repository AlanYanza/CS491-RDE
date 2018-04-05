<cfcomponent rest="true" restpath="/MessageSystem" produces="application/json" >

	<!-- Used to test connection to rest CFC-->
	<cffunction name="testMethod" access="remote" returntype="String" httpmethod="GET" restpath="test" >
		<cfdump var="#Application.userID#" >
		<cfset string="testString">
		<cfreturn string >
	</cffunction>
			
	<!-- Retrieve email for given user -->
	<cffunction name="GetEmail" access="remote" returntype="Any" returnFormat="json" httpmethod="GET" restpath="GetEmail" >
		<!---<cfheader name = "Access-Control-Allow-Origin" value="*">--->
		<!-- retrieve current User's userID' -->
		<cfset userID = #Application.userID# >
		<!-- Query DB for user's Message' -->
		<cfquery name="MailResult">
			SELECT Inbox.msgID, Inbox.readStatus, Message.sender, Message.receipient, Message.subject, Message.message,
			Message.dateSent 
			FROM Inbox 
			INNER JOIN Message ON Inbox.msgID=Message.msgID
			WHERE Inbox.userID = <cfqueryparam value="#userID#" cfsqltype="cf_sql_integer" > 
			ORDER BY Message.dateSent DESC
		</cfquery>
		<!-- Return ResultSet as JSON -->
		<cfreturn serializeJSON(MailResult, 'struct') /> 
	</cffunction>

	<!-- Send email for given user -->
	<cffunction name="sendEmail" access="remote" returntype="Any" httpmethod="PUT" restpath="sendEmail" >
		<!---<cfheader name = "Access-Control-Allow-Origin" value="*"> --->
		<!---<cfheader name = "Access-Control-Allow-Methods" value = "GET, POST, PUT, DELETE, OPTIONS">--->
		<!-- retrieve current User's userID' -->
		<cfset senderID = #Application.userID# />
		<!-- Retrieve sender's identity from DB' -->
		<cfquery name="senderNameResult">
			SELECT FirstName, LastName FROM "User"
			WHERE userID=<cfqueryPARAM value="#senderID#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfset senderName= senderNameResult.FirstName&" "&senderNameResult.LastName />
		<!-- Retrieve fields sent from Angular -->
		<cfset subject = url.subject />
		<cfset recipient = url.recipient /> 
		<cfset message = url.message />
		<cfset dateSent = ParseDateTime(Now()) />
		<!-- Insert message data into DB(message table) -->
	 	<cfquery result="sendToMessageResult">
			INSERT INTO Message (sender, receipient, subject, message, dateSent)
			VALUES ( 
				<cfqueryPARAM value ="#senderName#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryPARAM value ="#recipient#" cfsqltype="CF_SQL_VARCHAR">,
			 	<cfqueryPARAM value ="#subject#" cfsqltype="CF_SQL_VARCHAR">,
			 	<cfqueryPARAM value ="#message#" cfsqltype="CF_SQL_VARCHAR">,
			 	<cfqueryPARAM value ="#dateSent#" cfsqltype="CF_SQL_TIMESTAMP">
			 )
		</cfquery> 
		<cfset msgID = sendToMessageResult.generatedkey />
		<!-- Retrieve receipient's userID -->
		<cfquery name="recipientUserID">
			SELECT userID FROM "User"
			WHERE email=<cfqueryPARAM value="#recipient#" cfsqltype="CF_SQL_VARCHAR">
		</cfquery>
		<cfset userID=recipientUserID.userID />
		<!-- Insert message into recipient inbox (Inbox Table) -->
		<cfquery name="sendToInbox">
			INSERT INTO Inbox (userID, dateRevc, msgID, readStatus)
			VALUES (
				<cfqueryPARAM value="#userID#" cfsqltype="CF_SQL_INTEGER">,
			 	<cfqueryPARAM value="#dateSent#" cfsqltype="CF_SQL_TIMESTAMP">,
			 	<cfqueryPARAM value="#msgID#" cfsqltype="CF_SQL_INTEGER">,
			 	<cfqueryPARAM value='N' cfsqltype="CF_SQL_IDSTAMP"> 
			)
		</cfquery>
	</cffunction>

</cfcomponent>