<!--- If user is not logged in, redirect them to login page --->
<cfset SessionClass=createObject('component',"CS491-RDE.components.SessionTools")/>
<cfset SessionClass.checkIfLoggedIn()/>
<cfset FormClass=createObject('component','CS491-RDE.components.Form').init('NJ',session.userID)/>
<cfif isDefined('url.appID')>
	<!--- create a session variable for appID --->
	<cfset session.appID=url.appID>
</cfif>
<!--- If appID is not sent via url passing, redirects back to user home page --->
<cfset SessionClass.NoAppIDRedirect()>
<!--- If a user access level,checks to see appID set in session in valid --->
<cfif session.accessLevel neq 'admin'>
	<cfset SessionClass.validateAppID()>
</cfif>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Application</title>
  <cfinclude template="../head.cfm"/>
</head>
<body>
<cfinclude template="../navbar.cfm">
<div class="container">
	<p><strong>BEFORE YOU MAIL YOUR APPLICATION:</strong></p>
	<p>
		<h4>
			REVIEW THIS CHECKLIST AND MAKE SURE THAT ALL OF THE FOLLOWING ITEMS ARE MAILED WITH
			YOUR COMPLETED APPLICATION.
		</h4>
	</p>

	<p>
		<strong>IMPORTANT: Send copies of any requested documents. Do not send original documents as they WILL
			NOT be returned
		</strong>
	</p>

	<ul type="square">
		<li> Two (2) different proofs of residency </li>
		<li> Verification of income (current pay stubs, unemployment records, etc.)</li>
		<li>Most recent signed Federal, State and/or City Income Tax Returns, including any and all attached schedules or,
		if no income tax return filed, submit most recent W-2 form(s), 1099 form(s), etc.</li>
		<li> If you receive Social Security Disability benefits, please include the Notice of Award letter.</li>
		<li>Copies of the FRONT and BACK of all health insurance/prescription cards</li>
		<li>Certification by Physician form (DHAS-37) (completed and signed)</li>
		<li>Certification by Pharmacist form (DHAS-38) (completed and signed) (only for ADDP)</li>
		<li>Certification of Separation form (DHAS-40) (completed and signed) if you are separated as defined in these
		Instructions, page I, Applicant Information, Domestic Status.</li>
		<li><strong>If applying for HICP, also include also include current health insurance premium billing notice that
				includes premium identification, number, premium, amounts, payments due date, and where to send
				payments.</strong></li>
		<li><strong>If you are a COBRA applicant, please include a copy of the completed COBRA election form and/or
		current COBRA billing invoice.</strong></li>
	</ul>

	
	<h4>APPLICATIONS ARE ACCEPTED ONLY AT THE FOLLOWING ADDRESS:</h4>
	<br/>
	ADDP<br/>
	PO Box 722<br/>
	Trenton, NJ 08625-0722<br/>
	<br/>
	or fax to: 609-588-7037<br/>
	<br/>
	If you want more information on the AIDS Drug Distribution Program (ADDP)
	or the Health Insurance Continuation Program (HICP),
	please go to our websites at:<br/>
	<strong>FOR ADDP: </strong><a href="http://nj.gov/health/hivstdtb/hiv-aids/medications.shtml" target="_blank">http://nj.gov/health/hivstdtb/hiv-aids/medications.shtml</a><br/>
	<strong>FOR HICP: </strong><a href="http://nj.gov/health/hivstdtb/hiv-aids/hicp.shtml" target="_blank">http://nj.gov/health/hivstdtb/hiv-aids/hicp.shtml</a><br>

	<br/>
	
	<p>
	<strong>IT IS THE CLIENT&#39;S RESPONSIBIITY TO REPORT ANY CHANGES IN
	CIRCUMSTANCES THAT WOULD IMPACT ELIGIBILITY FOR ADDP OR HICP.</strong><br>
	</p>

	<ul class="pager">
		<cfset urlDirect="./dhas_instructions_page2.cfm?appID=" & session.appID>
		<li class="previous"><a href="<cfoutput>#urlDirect#</cfoutput>">Previous</a></li>
		<cfset urlDirect="./dhas_page1.cfm?appID=" & session.appID>
		<li class="next"><a href="<cfoutput>#urlDirect#</cfoutput>">Go to Application</a></li>
	</ul>
</div>
</body>
</html>