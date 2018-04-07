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
		<cfset SessionClass=createObject('component',"CS491-RDE.components.SessionTools")/>
		<cfset userID = SessionClass.passUserID()>
		<!---<cfset userID = Application.userID>--->

		<!-- Query DB for user's Message' -->
		<cfquery name="MailResult">
			SELECT Inbox.msgID, Message.readStatus, Message.senderID, Message.subject, Message.message, Message.dateSent, sen.FirstName, sen.LastName, rec.FirstName, rec.LastName
			FROM Inbox 
			INNER JOIN Message ON Inbox.msgID = Message.msgID
			INNER JOIN [User] AS rec ON Message.recipientID=rec.userID 
			INNER JOIN [User] AS sen ON Message.senderID=sen.userID
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
		<cfset recipientEmail = url.recipient /> 
		<cfset message = url.message />
		<cfset dateSent = ParseDateTime(Now()) />

		<!-- Retrieve receipient's userID -->
		<cfquery name="recipientUserID">
			SELECT userID FROM "User"
			WHERE email=<cfqueryPARAM value="#recipientEmail#" cfsqltype="CF_SQL_VARCHAR">
		</cfquery>
		<cfset recipientID=recipientUserID.userID />

		<!-- Insert message data into DB(message table) -->
	 	<cfquery result="sendToMessageResult">
			INSERT INTO Message (senderID, recipientID, subject, message, dateSent, dateRecv, readStatus)
			VALUES ( 
				<cfqueryPARAM value ="#senderID#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryPARAM value ="#recipientID#" cfsqltype="CF_SQL_VARCHAR">,
			 	<cfqueryPARAM value ="#subject#" cfsqltype="CF_SQL_VARCHAR">,
			 	<cfqueryPARAM value ="#message#" cfsqltype="CF_SQL_VARCHAR">,
			 	<cfqueryPARAM value ="#dateSent#" cfsqltype="CF_SQL_TIMESTAMP">,
			 	<cfqueryPARAM value ="#dateSent#" cfsqltype="CF_SQL_TIMESTAMP">,	 		
				<cfqueryPARAM value ='F' cfsqltype="CF_SQL_IDSTAMP"> 
			 )
		</cfquery> 
		<cfset msgID = sendToMessageResult.generatedkey />

		<!-- Insert message into recipient inbox (Inbox Table) -->
		<cfquery name="sendToInbox">
			INSERT INTO Inbox (userID, msgID)
			VALUES (
				<cfqueryPARAM value="#recipientID#" cfsqltype="CF_SQL_INTEGER">,
			 	<cfqueryPARAM value="#msgID#" cfsqltype="CF_SQL_INTEGER">
			)
		</cfquery>

		<!-- Insert message into sender's sent box (Sent Table) --> 
		<cfquery name="sendToSent">
			INSERT INTO Sent (userID, msgID)
			VALUES (
				<cfqueryPARAM value="#senderID#" cfsqltype="CF_SQL_INTEGER">,
			 	<cfqueryPARAM value="#msgID#" cfsqltype="CF_SQL_INTEGER">,
			)
		</cfquery>
	</cffunction>

</cfcomponent>