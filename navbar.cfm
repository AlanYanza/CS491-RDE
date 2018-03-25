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
						<li><a href="/CS491-RDE/message.cfm">Messages <span class="badge">1</span></a></li>
					</cfoutput>
				</cfif>
			</ul>		
			<ul class="nav navbar-nav navbar-right">
			  <cfif IsDefined('session.firstName')>
			  	<cfoutput>
				  	<li><a href="##"><span class="glyphicon glyphicon-user"></span> >#session.firstName# #session.lastName#</a></li>
				  	<li><a href="/CS491-RDE/scripts/signout.cfm"><span class="glyphicon glyphicon-log-in"></span> Signout</a></li>
			  	</cfoutput>
			  </cfif>		      
		    </ul>
		</div>
	</div>
</nav>
<!--end of header.cfm-->