<!--- if user is not logged in, redirect them log in page --->
<cfset SessionClass=createObject('component',"CS491-RDE.components.SessionTools")/>
<cfset SessionClass.checkIfLoggedIn()/>
<!--- if user doesn't have admin level access, redirect to home page --->
<cfset SessionClass.checkIfadmin()>

<!--- Determine which button was pressed on admin Homepage --->
<cfif Form.button eq 'Approve'>
	<cfset appID=form.appID/>
	<cfset STATUS2 = 'A'/>
	<cfdump var = '#STATUS2#'/>
	<cfset AdminPull=createObject('component','CS491-RDE.components.Admin')/>
	<cfset AdminPull.Approve(appID, STATUS2)/>
	<cflocation url="/CS491-RDE/admin.cfm?ApproveChange">
</cfif>
<cfif Form.button eq 'Return' >
	<cfset appID=form.appID/>
	<cfset AdminPull=createObject('component','CS491-RDE.components.Admin')/>
	<cfset AdminPull.Returned(appID)/>
	<cflocation url="/CS491-RDE/admin.cfm?ReturnChange">
</cfif>
<cfif Form.button eq 'Deny' >
	<cfset appID=form.appID/>
	<cfset AdminPull=createObject('component','CS491-RDE.components.Admin')/>
	<cfset AdminPull.Deny(appID)/>
	<cflocation url="/CS491-RDE/admin.cfm?DenyChange">
</cfif>