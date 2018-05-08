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
	<p><strong>INSTRUCTIONS FOR COMPLETING THE APPLICATION FOR PARTICIPATION IN THE
	AIDS DRUG DISTRIBUTION PROGRAM AND/OR HEALTH INSURANCE CONTINUATION PROGRAM
	(Continued)</strong></p>
	<p>Maximum Allowable Household Income Limits for this ADDP and HICP as of January 2015 are listed below.</p>
	<p>If you need current income limits, call 1-877-613-4533</p>
	<table class="table text-center">
		<tbody>
			<tr><th colspan="2" class="text-center">Federal Poverty Level for January 2015 to January 2016</th></tr>
			<tr><td>Number of Person in Household</td><td>Maximum Allowable Household Income</td></tr>
			<tr><td >1</td><td >$58,850</td></tr>
			<tr><td >2</td><td >$79,650</td></tr>
			<tr><td >3</td><td >$100,450</td></tr>
			<tr><td >4</td><td >$121,250</td></tr>
			<tr><td >5</td><td >$142,050</td></tr>
		</tbody>
	</table>
	<br/>
	<p>For households with more than 5 persons, add $20,800 for each additional person.</p>
	<p>
		If you or any member of your household filed a Federal, State and/or City Income Tax Return last year, a copy of each completed and
		signed tax return, including any and all attached schedules, must accompany your application.
	</p>
	<p>
		If you have applied for Social Security Disability benefits, forward a copy of your Notification of Social Security Disability Entitlement, once
		received.
	</p>
	<h4 style="text-decoration: underline;">SECTION III - INSURANCE COVERAGE</h4>
	<p>
		Check all that apply regarding your health insurance coverage. If you have "Private Health Insurance" through any source, provide the
		policy number(s) as well as name and address of the insurance carrier(s). If this coverage is provided by an employer (current or previous)
		or union, enter the name and address of the employer or union. "Private Health Insurance" includes the health insurance provided by
		private insurance carriers such as Blue Cross/Blue Shield, HMO, PPO, etc.
	</p>
	<strong>You must include a legible photocopy of the front and back of your insurance card(s)/prescription card(s).</strong><br/><br/>
	<h4 style="text-decoration: underline;">SECTION IV - CERTIFICATION AND AUTHORIZATION BY APPLICANT</h4>
	<p>The Certification and Authorization must be dated and signed (or marked) by you, your spouse/partner (if married/civil union).</p>
	<p><strong>CONTACT PERSON:</strong></p>
	<p>
		Provide the name of someone we may contact in the event that we are unable to reach you. Please indicate if your contact person is aware
		of your HIV status.
	</p>
	<p><strong>PREPARER INFORMATION:</strong></p>
	<p>Anyone other than the applicant who prepares the form must provide his/her name and telephone number, in case questions should arise
	concerning the application.</p>
	<p><strong>CASE MANAGER INFORMATION:</strong></p>
	<p>
		All applicants should have a case manager determined by county of residence. You may contact your county board of social services or a
		Ryan White funded facility for a case manager.
	</p>
	<h4 style="text-decoration: underline;">CERTIFICATION BY PHYSICIAN (Form DHAS-37)</h4>
	<p>
		Complete the requested information in Section I and forward to your physician for completion of Section II. Make sure that all requested
		information has been clearly entered. Ask your physician to return the completed form to you. Return the completed certification along with
		your completed application.
	</p>
	<h4 style="text-decoration: underline;">CERTIFICATION BY PHARMACIST (Form DHAS-38) (ONLY IF APPLYING FOR ADDP)</h4>
	<p>
		You must make an agreement with a New Jersey Medicaid/PAAD participating pharmacist to dispense FDA-approved drugs on your behalf.
		Complete the requested information in Section I and forward to your pharmacist for completion of Section II. Make sure that all requested
		information has been clearly entered. Ask your pharmacist to return the completed form to you. Return the completed certification along
		with your completed application.
	</p>

	<ul class="pager">
		<cfset urlDirect="./dhas_instructions_page1.cfm?appID=" & session.appID>
		<li class="previous"><a href="<cfoutput>#urlDirect#</cfoutput>">Previous</a></li>
		<cfset urlDirect="./dhas_instructions_page3.cfm?appID=" & session.appID>
		<li class="next"><a href="<cfoutput>#urlDirect#</cfoutput>">Next</a></li>
		<cfset urlDirect="./dhas_page1.cfm?appID=" & session.appID>
		<li class="nextTest"><a href="<cfoutput>#urlDirect#</cfoutput>">Go to Application</a></li>
	</ul>
</div>
</body>
</html>