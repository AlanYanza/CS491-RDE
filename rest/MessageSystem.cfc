<cfcomponent rest="true" restpath="/MessageSystem" produces="application/json" >

	<!-- Used to test connection to rest CFC-->
	<cffunction name="testMethod" access="remote" returntype="String" httpmethod="GET" restpath="test" >
		<cfdump var="#Application.userID#" >
		<cfset string="testString">
		<cfreturn string >
	</cffunction>
		
	<!-- Retrieve email for given user -->
	<cffunction name="GetEmail" access="remote" returntype="Any" returnFormat="json" httpmethod="GET" restpath="GetEmail" >
		<cfheader name = "Access-Control-Allow-Origin" value="*">

		<cfset testID = 2/>
		<cfset userID = #Application.userID# >
		<cfquery name="MailResult">
			SELECT Inbox.msgID, Inbox.readStatus, Message.sender, Message.receipient, Message.subject, Message.message,
			Message.dateSent 
			FROM Inbox 
			INNER JOIN Message ON Inbox.msgID=Message.msgID
			WHERE Inbox.userID = #userID#
		</cfquery>

		<cfreturn serializeJSON(MailResult, 'struct') /> 

	</cffunction>
</cfcomponent>