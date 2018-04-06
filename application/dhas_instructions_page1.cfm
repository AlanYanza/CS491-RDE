<cfset SessionClass=createObject('component',"CS491-RDE.components.SessionTools")/>
<cfset SessionClass.checkIfLoggedIn()/>
<cfset FormClass=createObject('component','CS491-RDE.components.Form').init('NJ',session.userID)/>
<!--- If a new Application create a new Application(inside DB)--->
<cfif isDefined('url.new')>
	<cfset FormClass.createApplication()/>
</cfif>
<!-- Check ApplicationStatus and redirect to homePage is needed -->
<cfset FormClass.noAccessRedirect('/CS491-RDE/home.cfm')/>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Application</title>
	<cfinclude template="../head.cfm"/></head>
<body>
<cfinclude template="../navbar.cfm">
<div class="container">
	<div>
		<p  style="text-align: center;"><strong>	
		New Jersey Department of Health<br/>
		AIDS Drug Distribution Program (ADDP) and<br/>
		Health Insurance Continuation Program (HICP)<br/>
		PO Box 722<br/>
		Trenton, NJ 08625-0722</strong>
		<br/>
		<br/>
		<strong>INSTRUCTIONS FOR COMPLETING</strong>
		<br/>
		<strong>THE APPLICATION FOR PARTICIPATION IN THE ADDP AND/OR HICP PROGRAM</strong>
		</p>
		<br/>
		<p>
			Before you begin completing the application form, please take a few minutes to review these specific instructions. While many of the questions
			are self-explanatory, some require additional clarification to be completed correctly. If you need assistance completing this application, call toll
			free 1-877-613-4533 for ADDP questions or 1-800-353-3232 for HICP questions.
		</p>
		
		<strong><span style="text-decoration: underline;"><h4>SECTION I - APPLICANT INFORMATION</h4></span></strong>
		<p>
			Enter your principal place of residence. Seasonal or temporary residence in New Jersey, of whatever duration, does not constitute
			residency.
		</p>
		
		<p>Include two (2) proofs of residence, one of which must be no more than 6 months old. Sample proofs of residency include:</p>
		<ul>
			<div class="row">
				<div class="col-sm-6">
					<li>Motor Vehicle records(e.g., valid Driver's License)</li>			
					<li>Lease or mortgage</li>			
					<li>Landlord's records and rent receipts</li>
					<li>Public utility records and receipts (electric, gas, phone bill)</li>
					<li>Records of social agencies, public or private</li>
					<li>Employment records</li>
				</div>
				<div class="col-sm-6">
					<li>Social Security records</li>
					<li>Post Office records</li>
					<li>Photo ID from county</li>
					<li>If you are homeless, have case manager/socialworker provide support documentation on facility letter head</li>
				</div>
			</div>
		</ul>
		<p>
			You must submit your Social Security number which will be used to create a unique identifier to track your application, to provide and record
			pharmaceutical benefits, to verify eligibility by matching tax files at the New Jersey Division of Taxation, and to identify other prescription
			coverage by searching health insurance records.
		</p>
		<strong>DOMESTIC STATUS:</strong><br/>
		Check “separated” if:<br/>
		<p>
			(1) You and your spouse/partner live apart AND if you do not have access to, or receive support from, your spouse’s/partner’s income;
			<br/>
			(2) Your spouse/partner has been confined to a long-term care or psychiatric institution for at least 30 days prior to this application.
		</p>
		<strong>If you check “separated,” please fill out and send in DHAS-40 Certification of Separation.<br/><br/>
		FAMILY SIZE:</strong><br/>
		Family is defined as anyone who is related to you, the applicant, by blood, marriage, or adoption. To calculate Family Size, include
		yourself, your spouse (if married and living together) and all people currently living in your household who are related to you.<br/><br/>

		<strong><span style="text-decoration: underline;"><h4>SECTION II - HOUSEHOLD INCOME</h4></span></strong>
		<strong>HOUSEHOLD UNIT:</strong>
		<br/>
		<p>In calculating the number of people in the household, include:</p>
		<ol>
			<li>Yourself, spouse/partner (if married/civil union), AND</li>
			<li>All persons whom you claim as a dependent OR all persons who claim you, the applicant, as their dependent.</li>
		</ol>
		<br/>
		<p>
			Enter your <strong>TOTAL HOUSEHOLD INCOME</strong>, by category, for the past 12 months. Enter your income. If you are married or a member of a
			civil union, enter your income PLUS your spouse's/partner’s income. If you are dependent on others, also enter their total income.
		</p>
		<p>
			Fill in <span style="text-decoration: underline;">ALL</span>of the blanks. List gross figures unless otherwise indicated. If your income for any category is zero, write "0" in that space.
		</p>
		<p>
			If you (and/or your spouse/partner, if married/civil union) have no income, supply a letter of support from the person(s) who provides your
			support. The letter must specifically state if the person(s) providing your support claims you as a dependent for income tax purposes.
		</p>
		<p>
			If you and/or your spouse/partner have Medicare Part B premiums deducted monthly from your Social Security check, multiply this amount
			by 12 (annual amount) and enter it under "Sources of Income." Most individuals who are permanently disabled or over 65 have Medicare
			Part B deducted from their Social Security check.
		</p>
			Examples of income that also must be reported:<br/>
		<ul>
			<div class="row">
				<div class="col-sm-4">
					<li>Business Income (Net)</li>
					<li>Realized Capital Gains</li>
				</div>
				<div class="col-sm-4">
					<li>Death Benefits Received (Net)</li>
					<li>Inheritance</li>
				</div>
				<div class="col-sm-4">
					<li>Royalties</li>
				</div>
			</div>
		</ul>
		Report these in Item Number 22 in the “Other” category
		<ul class="pager">
			<li class="next"><a href="./dhas_instructions_page2.cfm">Next</a></li>
		</ul>
	</div>
</div>
</body>
</html>