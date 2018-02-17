<cfinclude template="header.cfm">
<div class="container">
<div class="solid">
	<p class="text-center"><strong>APPLICATION FOR PARTICIPATION IN THE AIDS DRUG DISTRIBUTION PROGRAM AND/OR HEALTH INSURANCE CONTINUATION PROGRAM</strong></p>
	<p class="text-center">
		Please print clearly and answer all questions. Review the attached instructions before you begin. If you need assistance completing this
		application, call toll free 1-877-613-4533 for ADDP questions or 1-800-353-3232 for HICP questions. Mail the completed application to the
		ADDP/HICP Program at the address given above or fax to 609-588-7037. Send copies of any requested documents. Do NOT send original
		documents as they WILL NOT be returned.
	</p>
	<form action="">
	  <div class="text-center">
	    <input type="checkbox" name="HICP" value="HICP"/> I am also applying for HICP
	  </div>
	<br><br>
	<CFOUTPUT><strong>Section 1 - APPLICANT INCOME</strong></CFOUTPUT><br><br>
	<div>
		<div class="row">
		  <div class="col-sm-4"><div class="form-group"><label for="LastName">1. Last Name:</label><input type="text" class="form-control" id="lastname" name="lastname"></div></div>
		  <div class="col-sm-4"><div class="form-group"><label for="FirstName">First Name:</label><input type="text" class="form-control" id="firstname" name="firstname"></div></div>
		  <div class="col-sm-2"><div class="form-group"><label for="MI">MI:</label><input type="text" class="form-control" id="MI" name="MI"></div></div>			
		  <div class="col-sm-2"><div class="form-group"><label for="DOB">2. DOB:</label><input type="date" class="form-control" id="DOB" name="DOB"></div></div>
		</div>
		<div class="form-group">
		  <label for="StreetAddress">3. Street Address</label>
		  <input type="" class="form-control" id="StreetAddress" name="StreetAddress">
		  <label for="AptNumber">Apt. Number</label>
		  <input type="" class="form-control" id="AptNumber" name="AptNumber">
		  <label for="CityStateZip">City, State, Zip Code</label>
		  <input type="" class="form-control" id="CityStateZip" name="CityStateZip">
		</div>
		<div class="form-group">
		  <label for="County">4. County</label>
		  <input type="" class="form-control" id="County" name="County">
		</div>
		<div class="form-group">
		  <label for="MailingAdresss">5. Mailing Address (if different) </label>
		  <input type="" class="form-control" id="MailingAdresss" name="MailingAdresss">
		</div>
		<div class="form-group">
		  <label for="HomeNumber">6. Home Phone Number </label>
		  <input type="tel" class="form-control" id="HomeNumber" name="HomeNumber">
		  <label for="CellNumber">Cell Phone Number </label>
		  <input type="tel" class="form-control" id="CellNumber" name="CellNumber">
		  <label for="WorkNumber">Work Phone Number </label>
		  <input type="tel" class="form-control" id="WorkNumber" name="WorkNumber">
		</div>
	<strong>7. Residency</strong>
	<div class="row">
		<div class="col-sm-4">a. Is the address above your principal place of residence?</div>
		<div class="col-sm-8">
			<div class="radio"><label><input type="radio" name="Residency" value="Yes"/>Yes</label></div>
			<div class="radio"><label><input type="radio" name="Residency" value="No"/>No</label></div>
		</div>
	</div>
	<p class="text-center"><strong>NOTE: Two (2) proofs of residency MUST accompany this application. See Instructions.</strong></p>
	<p class="text-center"><strong>NO HOME ADDRESS DECLARATION &#45;<CFOUTPUT> If you do not have a home address, have a case manager/social worker provide support
	documentation on facility letterhead.</strong></CFOUTPUT></center><br><br>
	<div class="form-group">
		  <label for="SSN">8. What is your Social Security Number (if you have one)?</label>
		  <input type="" class="form-control" id="SSN" name="SSN">
	</div>
	<div class="form-inline">
		  <label for="Citizenship">9. Are you a U.S. citizen? (Responding to this question will not affect your eligibility for ADDP.)</label>
		  <input type="" class="form-control" id="Citizenship" name="Citizenship">
	</div>
	<div class="form-inline">
		  <label for="Veteran">10. Are you a veteran?</label>
		  <input type="" class="form-control" id="Veteran" name="Veteran">
		</div>

	<CFOUTPUT><strong>11. Relationship Status</strong></CFOUTPUT>
	  <input type="checkbox" name="Relationship" value="Relationship"/>Single
	  <input type="checkbox" name="Relationship" value="Relationship"/>Married
	  <input type="checkbox" name="Relationship" value="Relationship"/>Civil Union
	  <input type="checkbox" name="Relationship" value="Relationship"/>Domestic Partner
	  <input type="checkbox" name="Relationship" value="Relationship"/>Divorced
	  <input type="checkbox" name="Relationship" value="Relationship"/>Widowed
	  <input type="checkbox" name="Relationship" value="Relationship"/>Separated (See instructions, Page 1. Applicant information.)
	<br><br>

	<CFOUTPUT><strong>12. Gender</strong></CFOUTPUT>
	  <input type="checkbox" name="Gender" value="Gender"/>Male
	  <input type="checkbox" name="Gender" value="Gender"/>Female
	  <input type="checkbox" name="Gender" value="Gender"/>Transgendered Male to Female
	  <input type="checkbox" name="Gender" value="Gender"/>Transgendered Female to Male
	<br><br>

	<CFOUTPUT><strong>13. Gender at Birth</strong></CFOUTPUT>
	  <input type="checkbox" name="GAB" value="GAB"/>Male
	  <input type="checkbox" name="GAB" value="GAB"/>Female
	<br>
	<br>
	<strong>14. Race</strong>
	  <div class="checkbox"><label><input type="checkbox" name="Race" value="Race"/>White</label></div>
	  <div class="checkbox"><label><input type="checkbox" name="Race" value="Race"/>Black</label></div>
	  <div class="checkbox"><label><input type="checkbox" name="Race" value="Race"/>Asian</label></div>
	  <div class="checkbox"><label><input type="checkbox" name="Race" value="Race"/>American Indian/Alaskan Native</label></div>
	  <div class="checkbox"><label><input type="checkbox" name="Race" value="Race"/>Native Hawaiian/Pacific Islander</label></div>
	  <div class="checkbox"><label><input type="checkbox" name="Race" value="Race"/>Unknown</label></div>
	<br>
	<br>
	<CFOUTPUT><strong>15. Ethnicity</strong></CFOUTPUT>
	  <input type="checkbox" name="Ethnicity" value="Ethnicity"/>Hispanic/Latino
	  <input type="checkbox" name="Ethnicity" value="Ethnicity"/>Non-Hispanic
	<br>
	<br>
	<CFOUTPUT><strong>16. Female Applicants Only:</strong></CFOUTPUT><br>
	<CFOUTPUT><strong>Are you pregnant?</strong></CFOUTPUT>
	  <input type="checkbox" name="pregnant" value="pregnant"/>Yes
	  <input type="checkbox" name="pregnant" value="pregnant"/>No	  
	</div>
	</div> 
	</form>
	<div class="text-center">
		<a href="./Page3.cfm"><button type="button" class="btn btn-default">Previous</button></a>
		<a href="./Page5.cfm"><button type="button" class="btn btn-default">Next</button></a>
	</div>
</div>