<cfcomponent >
	
	<!--- retrieve the email address of a given userID --->
	<cffunction name="retrieveEmailAddress" hint="retrieve the email address for a specified user" >
		<cfargument name="userIDInput" hint="indicated userID for which email address is needed" type="numeric" >
		<cfquery name="emailResult" result="queryStat" >
			SELECT email FROM [User] WHERE userID=<cfqueryparam value="#arguments.userIDInput#" cfsqltype="cf_sql_integer" >
		</cfquery>
		<cfset email=emailResult['email'] >
		<cfreturn email>
	</cffunction>
	
	<!--- send an email notification to a given email address --->
	<cffunction name="sendEmail" hint="sends an email" >
		<cfargument name="emailAddressInput" hint="destination email address" type="string" >
		<cfargument name="subjectInput" hint="Subject of message to be sent" type="string" >
		<cfargument name="messageInput" hint="message content of email to be sent" type="string" > 
		<cfmail type="html" from="CS491Test@company.com" subject="#arguments.subjectInput#" to="#arguments.emailAddressInput#" >
			<cfoutput >
				#messageInput#<br>
				Note:Please do not reply to this email
			</cfoutput>
		</cfmail>
	</cffunction>
	
	<!--- send a notification email when successful registration --->
	<cffunction name="sendRegistrationEmail" hint="email send to indicated user's email after registration of an account" >
		<cfargument name="emailAddressInput" hint="email address to send email to" >
		<cfset var toEmail=arguments.emailAddressInput>
		<cfset subject="Registered Account">
		<cfset message="You have registered an Account">
		<cfset sendEmail(toEmail,subject,message)>
	</cffunction>
	
	<!--- send a notification when a new application is created --->
	<cffunction name="sendNewApplicationEmail" hint="email sent to tell user that they created a new Application" >
		<cfargument name="emailAddressInput" hint="email address to send email to" >
		<cfargument name="formTypeInput" hint="the name of the Application started" >
		<cfset var toEmail=arguments.emailAddressInput>
		<cfset var dateStarted=DateFormat(Now())>
		<cfset var timeStart=TimeFormat(Now())>
		<cfset subject=arguments.formTypeInput & " Application Created">
		<cfset message="You have created a " & arguments.formTypeInput & " Application on " & dateStarted  & " at " & timeStart>
		<cfset sendEmail(toEmail,subject,message)>
	</cffunction>
	
	<!--- send a notification when a application is submitted  --->
	<cffunction name="sendSubmitApplicationEmail" hint="email sent to tell user that they have submitted an application" >
		<cfargument name="emailAddressInput" hint="email address to send email to" >
		<cfargument name="formTypeInput" hint="the name of the Application started" >
		<cfset var toEmail=arguments.emailAddressInput>
		<cfset var dateStarted=DateFormat(Now())>
		<cfset var timeStart=TimeFormat(Now())>
		<cfset subject=arguments.formTypeInput & " Application Submited">
		<cfset message="You have Submitted a " & arguments.formTypeInput & " Application on " & dateStarted  & " at " & 
		                timeStart & "<br>Your Application is now Under Review.You will be notified when the status " &
		                "of your application has been determined<br>">
		<cfset sendEmail(toEmail,subject,message)>
	</cffunction> 
	
	<!--- send a notification when user's application status changes  --->
	<cffunction name="sendStatusChangeEmail" hint="emails user when a status change occurs on their account" >
		<cfargument name="emailAddressInput" hint="email address to send email to" >
		<cfargument name="formTypeInput" hint="the name of the Application started" >
		<cfargument name="newStatus" hint="the new status after the Application status change" >
		<cfset var toEmail=arguments.emailAddressInput>
		<cfset var dateStarted=DateFormat(Now())>
		<cfset var timeStart=TimeFormat(Now())>
		<cfset subject=arguments.formTypeInput & " Application status changed: " & arguments.newStatus>
		<cfset message="Your " & arguments.formTypeInput & " has been changed to the following Status: " & arguments.newStatus>
		<cfset sendEmail(toEmail,subject,message)>
	</cffunction>      
	
</cfcomponent>