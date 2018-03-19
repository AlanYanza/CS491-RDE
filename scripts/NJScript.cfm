<!-- Determine which page form came from -->
<cfset formSource=FORM.formPage/>
<cfset tableName=FORM.tableName/>
<cfset subformObj=createObject('component','CS491-RDE.components.Subform').init('NJ',session.userID,tableName)/>
<cfset appExist=subformObj.checkIfAppExist()/>
<!-- if first page of form, determine status of HICP checkbox -->
<cfif StructKeyExists(form,'HICP')>  
   <cfset HICPStatus= "Y" />  
<cfelse>  
   <cfset HICPStatus= "N" />  
</cfif> 

<!-- Form Page 1 processing -->
<cfif formSource eq 'page1'>
	<cfif appExist eq 1>
		<cfset subformObj.updateHICPStatus(HICPStatus)/>
	</cfif>
</cfif>







<!-- Redirect to desired destination page(performed last) -->
<!-- If 'save progress' button hit submit form and redirect to homepage(do not change application status) -->
<cfif IsDefined('Form.save')>
	<cflocation url="/CS491-RDE/home.cfm?savedApplication">
</cfif>
<cfif formSource eq 'page1'>
	<cfif IsDefined("FORM.previous")>
		<cflocation url="/CS491-RDE/application/dhas_instructions_page3.cfm">
	<cfelseif IsDefined("FORM.next")>
  		<cflocation url="/CS491-RDE/application/dhas_page2.cfm">
	</cfif>
<cfelseif formSource eq 'page2'>
	<cfif IsDefined("FORM.previous")>
		<cflocation url="/CS491-RDE/application/dhas_page1.cfm">
	<cfelseif IsDefined("FORM.next")>
  		<cflocation url="/CS491-RDE/application/dhas_page3.cfm">
	</cfif>
<cfelseif formSource eq 'page3A'>
	<cfif IsDefined("FORM.previous")>
		<cflocation url="/CS491-RDE/application/dhas_page2.cfm">
	<cfelseif IsDefined("FORM.next")>
  		<cflocation url="/CS491-RDE/application/dhas_page4.cfm">
	</cfif>
<cfelseif formSource eq 'page3B'>
	<cfif IsDefined("FORM.previous")>
		<cflocation url="/CS491-RDE/application/dhas_page3.cfm">
	<cfelseif IsDefined("FORM.next")>
  		<cflocation url="/CS491-RDE/application/dhas_page5.cfm">
	</cfif>
<cfelseif formSource eq 'page4'>
	<cfif IsDefined("FORM.previous")>
		<cflocation url="/CS491-RDE/application/dhas_page4.cfm">
	<cfelseif IsDefined("FORM.next")>
		<!-- Change status of Application to Review-->
		<cfset subformObj.updateApplicationStatus("R")/>
  		<cflocation url="/CS491-RDE/home.cfm?submitApplication">
	</cfif>--->
</cfif>
