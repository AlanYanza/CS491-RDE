<cfcomponent output="false">
	<cfset this.name = 'RDEApplication'/>
	<cfset this.applicationTimeout= createtimespan(0,0,10,0)/> <!-- Application timeout of 10 minutes (days,hours,minutes,seconds)-->
	<cfset this.sessionTimeout= createtimespan(0,0,10,0)/> <!--  Session timeout of 10 minutes(days,hours,minutes,seconds) -->
	<cfset this.datasource='Database'/> <!-- default to this datasource (datasource is optional)-->
	<cfset this.sessionManagement=true /> <!--allows for Session scope variables -->
	
	
</cfcomponent>