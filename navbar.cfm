<!-- Retrieve Number of unread Messages -->
<!---<cffunction name="getUnreadEmails" displayname="getNumberOfUnreadEmail" 
hint="retrieves the number of unread emails for a user (for nav-bar purposes) and its not rest enabled">
	<!-- retrieve current User's userID' -->
	<cfset var userID = #Application.userID# >
	<!-- Query for number of messages with readStatus='N' -->
	<cfquery result="queryStat">
		SELECT msgID FROM Inbox WHERE
		userID=<cfqueryparam value="#userID#" cfsqltype="cf_sql_integer" >  AND
		readStatus='N'
	</cfquery>
	<cfset var numUnreadMsg=queryStat.recordCount>
	<!-- output the number of unread message-->
	<cfif numUnreadMsg neq 0>
		<cfoutput>
			<li><a href="/CS491-RDE/message.cfm">Messages <span class="badge">#numUnreadMsg#</span></a></li>
		</cfoutput>
	<cfelse>
		<cfoutput >
			<li><a href="/CS491-RDE/message.cfm">Messages</a></li>
		</cfoutput>
	</cfif>
</cffunction>--->

<!--header.cfm-->
<nav class="navbar navbar-inverse">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>                        
			</button>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li><a href="/CS491-RDE/home.cfm">Home</a></li>
				<cfif IsDefined('session.firstName')>
				  	<cfoutput>
				  		<!---<cfset getUnreadEmails()>--->
				  		<li><a href="/CS491-RDE/message.cfm">Messages <span class="badge">1</span></a></li>
					</cfoutput>
				</cfif>
			</ul>		
			<ul class="nav navbar-nav navbar-right">
			  <cfif IsDefined('session.firstName')>
			  	<cfoutput>
				  	<li><a href="##"><span class="glyphicon glyphicon-user"></span> #session.firstName# #session.lastName#</a></li>
				  	<li><a href="/CS491-RDE/scripts/signout.cfm"><span class="glyphicon glyphicon-log-in"></span> Signout</a></li>
			  	</cfoutput>
			  </cfif>		      
		    </ul>
		</div>
	</div>
</nav>
<!--end of header.cfm-->