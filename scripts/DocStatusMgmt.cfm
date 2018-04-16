<!--- Session Protection from user level access --->
<cfset SessionClass=createObject('component',"CS491-RDE.components.SessionTools")/>
<cfset SessionClass.checkIfLoggedIn()/>
<cfif session.accessLevel neq 'admin'>
	<cfset SessionClass.checkIfadmin()>
	<cfset SessionClass.NoAppIDRedirect()>
	<cfset SessionClass.validateAppID()>
</cfif>

<!--- Get the appID from the session --->
<cfset appID=session.appID>

<!--- Get the number of documents --->
<cfset numDocs=form.numDocuments>
<cfoutput >numOfDocuments=#numDocs#<br></cfoutput>
<!--- iterate through each row(each document type) --->
<cfloop index="i" from="1" to="#numDocs#" >
	<cfoutput >#i#<br></cfoutput>
	<!--- Gather all data to use in Update Query --->
	<!-- Get the document Name -->
	<cfset tmpNameField="documentName" & i>
	<cfset tempNameValue=form[tmpNameField]>
	<!-- Get the required,received,and dateReceivedFields -->
	<cfset tempReqField="documentRequired" & i>
	<cfset documentRequired=form[tempReqField]>
	<cfset tempRecvField="documentReceived" & i>
	<cfset documentReceived=form[tempRecvField]>
	<cfset tempDateRecvField="DateReceived" & i>
	<cfset dateReceived=form[tempDateRecvField]>
	<!--- Send Update Query DB --->
	<cfquery>
		UPDATE AppDocument SET
		isRequired=<cfqueryparam value="#documentRequired#" cfsqltype="cf_sql_varchar" >,
		received=<cfqueryparam value="#documentReceived#" cfsqltype="cf_sql_varchar" >,
		dateReceived=<cfqueryparam value="#dateReceived#" cfsqltype="cf_sql_date" >
		WHERE appID=<cfqueryparam value="#appID#" cfsqltype="cf_sql_integer" > AND
		document=<cfqueryparam value="#tempNameValue#">
	</cfquery>
</cfloop>
<cfset urlDirect="/CS491-RDE/DocumentStatus.cfm?appID=" & appID & "&update">
<cflocation url=#urlDirect# >