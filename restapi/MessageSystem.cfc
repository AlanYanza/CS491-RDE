<cfcomponent rest="true" restpath="/MessageSystem">

	<!-- Retrive the user's access level --> 
	<cffunction name="getAccessLevel" access="remote" returntype="Any" returnFormat="json" httpmethod="GET" restpath="getAccessLevel" produces="application/json">
		<cfset SessionClass=createObject('component',"CS491-RDE.components.SessionTools")/>
		<cfset userLevel = SessionClass.passUserAccessLevel() /> 

		<cfreturn serializeJSON(userLevel, 'struct')/>
	</cffunction>


	<!-- Retrieve Sent mail for given user --> 
	<cffunction name="getSent" access="remote" returntype="Any" returnFormat="json" httpmethod="GET" restpath="getSent" produces="application/json">
		<!-- retrieve current User's userID' -->
		<cfset SessionClass=createObject('component',"CS491-RDE.components.SessionTools")/>
		<cfset userID = SessionClass.passUserID()> 

		<!-- Query DB for user's Message' -->
		<cfquery name="SentMailResult">
			SELECT 
				Sent.msgID, 
				Message.readStatus, Message.subject, Message.message,
				FORMAT(Message.dateSent, 'MM/dd/yy hh:mm tt') as dateSent, 
				concat(sen.FirstName, ' ', sen.LastName) AS sender,
				concat(rec.FirstName, ' ', rec.LastName) AS recipient
			FROM Sent 
			INNER JOIN Message ON Sent.msgID = Message.msgID
			INNER JOIN [User] AS rec ON Message.recipientID=rec.userID 
			INNER JOIN [User] AS sen ON Message.senderID=sen.userID
			WHERE Sent.userID = <cfqueryparam value="#userID#" cfsqltype="cf_sql_integer" > 
			ORDER BY Message.dateSent DESC
		</cfquery>

		<cfreturn serializeJSON(SentMailResult, 'struct') /> 
	</cffunction>

	<!-- Retrieve Trashed mail for given user --> 
	<cffunction name="getTrash" access="remote" returntype="Any" returnFormat="json" httpmethod="GET" restpath="getTrash" produces="application/json">
		<!-- retrieve current User's userID' -->
		<cfset SessionClass=createObject('component',"CS491-RDE.components.SessionTools")/>
		<cfset userID = SessionClass.passUserID()> 

		<!-- Query DB for user's Message' -->
		<cfquery name="TrashMailResult">
			SELECT 
				Trash.msgID, 
				Message.readStatus, Message.subject, Message.message, 
				FORMAT(Message.dateSent, 'MM/dd/yy hh:mm tt') as dateSent, 			
				concat(sen.FirstName, ' ', sen.LastName) AS sender,
				concat(rec.FirstName, ' ', rec.LastName) AS recipient
			FROM Trash 
			INNER JOIN Message ON Trash.msgID = Message.msgID
			INNER JOIN [User] AS rec ON Message.recipientID=rec.userID 
			INNER JOIN [User] AS sen ON Message.senderID=sen.userID
			WHERE Trash.userID = <cfqueryparam value="#userID#" cfsqltype="cf_sql_integer" > 
			ORDER BY Message.dateSent DESC
		</cfquery>

		<cfreturn serializeJSON(TrashMailResult, 'struct') /> 
	</cffunction>
			
	<!-- Retrieve Inbox for given user -->
	<cffunction name="getInbox" access="remote" returntype="Any" returnFormat="json" httpmethod="GET" restpath="getInbox" produces="application/json">

		<!-- retrieve current User's userID' -->
		<cfset SessionClass=createObject('component',"CS491-RDE.components.SessionTools")/>
		<cfset userID = SessionClass.passUserID()> 

		<!-- Query DB for user's Message' -->
		<cfquery name="MailResult">
			SELECT 
				Inbox.msgID, 
				Message.readStatus, Message.subject, Message.message, 
				FORMAT(Message.dateSent, 'MM/dd/yy hh:mm tt') as dateSent, 
				concat(sen.FirstName, ' ', sen.LastName) AS sender,
				concat(rec.FirstName, ' ', rec.LastName) AS recipient
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
	<cffunction name="sendEmail" access="remote" returntype="Any" return Format="json" httpmethod="POST" restpath="sendEmail" produces="application/json">

		<!-- retrieve current User's userID' -->
		<cfset SessionClass=createObject('component',"CS491-RDE.components.SessionTools")/> 
		<cfset senderID = SessionClass.passUserID()>

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
		<cfset dateSent = Now() />

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
				<cfqueryPARAM value ="#senderID#" cfsqltype="CF_SQL_INTEGER">,
				<cfqueryPARAM value ="#recipientID#" cfsqltype="CF_SQL_INTEGER">,
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
			INSERT INTO [Sent] (userID, msgID)
			VALUES (
				<cfqueryPARAM value="#senderID#" cfsqltype="CF_SQL_INTEGER">,
			 	<cfqueryPARAM value="#msgID#" cfsqltype="CF_SQL_INTEGER">
			)
		</cfquery>

		<!-- send email to user informating them of unread emails -->
		<cfset emailToolObj=createObject('component','CS491-RDE.components.emailTool')>
		<cfset emailAddress=emailToolObj.retrieveEmailAddress(recipientID)>
		<cfset emailSubject="RDEApplication Unread messages">
		<cfset emailMessage="You have received a new message in your RDEApplication Inbox<br>">
		<cfset emailToolObj.sendEmail(emailAddress,emailSubject,emailMessage)>

		<cfreturn serializeJSON("sendToSent", 'struct') /> 

	</cffunction>

	<cffunction name="deleteMessage" access="remote" returntype="Any" return Format="json" httpmethod="GET" restpath="deleteEmail" >

		<!-- retrieve current User's userID' -->
		<cfset SessionClass=createObject('component',"CS491-RDE.components.SessionTools")/>
		<cfset senderID = SessionClass.passUserID()> 

		<cfset msgID = url.msgID />

		<!-- Delete message from sender's inbox (Sent Table) --> 
		<cfquery name="deleteFromInbox">
			DELETE FROM Inbox 
			WHERE msgID = <cfqueryPARAM value="#msgID#" cfsqltype="CF_SQL_INTEGER">
			AND userID = <cfqueryPARAM value="#senderID#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>

		<!-- Insert message into sender's trash box (Sent Table) --> 
		<cfquery name="InsertIntoTrash">
			INSERT INTO Trash (msgID, userID)
			VALUES(
				<cfqueryPARAM value="#msgID#" cfsqltype="CF_SQL_INTEGER">,
				<cfqueryPARAM value="#senderID#" cfsqltype="CF_SQL_INTEGER">
			)
		</cfquery>

		<cfreturn serializeJSON("deleteFromInbox", 'struct') /> 

	</cffunction>

	<cffunction name="readMessage" access="remote" returntype="Any" returnFormat="json" httpmethod="PUT" restpath="readMessage" produces="application/json"> 
		<!-- retrieve current User's userID' -->
		<cfset SessionClass=createObject('component',"CS491-RDE.components.SessionTools")/> 
		<cfset userID = SessionClass.passUserID() />

		<cfset msgID = url.msgID />

		<cfquery name="readMessageQuery">
			UPDATE Message 
			SET readStatus = <cfqueryPARAM value ='T' cfsqltype="CF_SQL_IDSTAMP" /> 
			WHERE msgID = <cfqueryPARAM value = #msgID# cfsqltype="CF_SQL_INTEGER" />
		</cfquery>

	</cffunction>

	<cffunction name="getRecipientList" access="remote" returntype="Any" returnFormat="json" httpmethod="GET" restpath="getRecipientList" produces="application/json">
		<!-- Retrieves the user's access level. This is so an error will be thrown if a user isn't logged in -->
		<cfset SessionClass=createObject('component',"CS491-RDE.components.SessionTools")/>
		<cfset userLevel = SessionClass.passUserAccessLevel() /> 

		<cfquery name="recipientListQuery">
			SELECT FirstName, LastName, email
			FROM "User"
		</cfquery>

		<cfreturn serializeJSON(recipientListQuery, 'struct') />
	</cffunction>


</cfcomponent>