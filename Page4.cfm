<cfinclude template="header.cfm">
<div class="container">
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
	<br>
	<br>
	<strong>Section 1 - APPLICANT INCOME</strong>
	<br>
	<br>
	<div>
		<div class="row">
			<div class="col-sm-4"><div class="form-group">
				<label for="LastName">1. Last Name:</label>
				<input type="text" class="form-control" id="lastname" name="lastname"></div></div>
			<div class="col-sm-4"><div class="form-group">
				<label for="FirstName">First Name:</label>
				<input type="text" class="form-control" id="firstname" name="firstname"></div></div>
			<div class="col-sm-2"><div class="form-group">
				<label for="MI">MI:</label>
				<input type="text" class="form-control" id="MI" name="MI"></div></div>			
			<div class="col-sm-2"><div class="form-group">
				<label for="DOB">2. DOB:</label>
				<input type="date" class="form-control" id="DOB" name="DOB"></div></div>
		</div>
		<div class="row">
			<div class="col-sm-9"><div class="form-group">
			<label for="StreetAddress">3. Street Address</label>
			<input type="" class="form-control" id="StreetAddress" name="StreetAddress"></div></div>
			<div class="col-sm-3"><div class="form-group">
			<label for="AptNumber">Apt. Number</label><input type="" class="form-control" id="AptNumber" name="AptNumber"></div></div>
		</div>
		</div>
		<div class="row">
			<div class="col-sm-3"><div class="form-group"><label for="City">City</label>
				<input type="" class="form-control" id="City" name="City"></div></div>
			<div class="col-sm-3"><div class="form-group"><label for="State">State</label>
				<input type="" class="form-control" id="State" name="State"></div></div>
			<div class="col-sm-3"><div class="form-group"><label for="Zip">Zip Code</label>
				<input type="" class="form-control" id="Zip" name="Zip"></div></div>
			<div class="col-sm-3"><div class="form-group">
				<label for="County">4. County</label>
				<input type="" class="form-control" id="County" name="County"></div></div>
		</div>		
		
		<div class="form-group">
		  <label for="MailingAdresss">5. Mailing Address (if different) </label>
		  <input type="" class="form-control" id="MailingAdresss" name="MailingAdresss">
		</div>
		<div class="row">
			<div class="col-sm-4"><div class="form-group">
				<label for="HomeNumber">6. Home Phone Number </label>
				<input type="tel" class="form-control" id="HomeNumber" name="HomeNumber">
			</div></div>
			<div class="col-sm-4"><div class="form-group">
			  <label for="CellNumber">Cell Phone Number </label>
			  <input type="tel" class="form-control" id="CellNumber" name="CellNumber">
			</div></div>
			<div class="col-sm-4"><div class="form-group">
			  <label for="WorkNumber">Work Phone Number </label>
			  <input type="tel" class="form-control" id="WorkNumber" name="WorkNumber">
			</div></div>
		</div>
	<label>7. Residency</label>
	<p>a. Is the address above your principal place of residence?</p>
		<div class="radio">
			<label><input type="radio" name="Residency" value="Yes"/>Yes</label>
			<label><input type="radio" name="Residency" value="No"/>No</label>
		</div>
			
	<p class="text-center"><strong>NOTE: Two (2) proofs of residency MUST accompany this application. See Instructions.</strong></p>
	<p class="text-center"><strong>NO HOME ADDRESS DECLARATION &#45; If you do not have a home address, have a case manager/social worker provide support
	documentation on facility letterhead.</strong></p>
	<br>
	<br>
	<div class="form-group">
		  <label for="SSN">8. What is your Social Security Number (if you have one)?</label>
		  <input type="" class="form-control" id="SSN" name="SSN">
	</div>
	<div class="form-group">
		<label for="Citizenship">9. Are you a U.S. citizen? (Responding to this question will not affect your eligibility for ADDP.)</label>
		<div class="radio">
			<label><input type="radio" name="Citizenship" value="Yes"/>Yes</label>
			<label><input type="radio" name="Citizenship" value="No"/>No</label>
		</div>
	</div>
	<div class="form-group">
		<label for="Veteran">10. Are you a veteran?</label>
		<div class="radio">
			<label><input type="radio" name="Veteran" value="Yes"/>Yes</label>
			<label><input type="radio" name="Veteran" value="No"/>No</label>
		</div>
	</div>
	
	<div class="form-group">
		<label for="relationship" >11. Relationship Status</label>
		<select class="form-control" name="relationship">
			<option selected>Select one</option>
			<option value="Single"/>Single</option>
			<option value="Married"/>Married</option>
			<option value="Civil Union"/>Civil Union</option>
			<option value="Domestic Partner"/>Domestic Partner</option>
			<option value="Divorced"/>Divorced</option>
			<option value="Widowed"/>Widowed</option>
			<option value="Separated"/>*Separated</option>
		</select>
		<em>*(See instructions, Page 1. Applicant information.)</em>
	</div>
	
	<div class="form-group">
		<label for="gender">12. Gender</label>
		<select class="form-control" name="gender">
			<option selected>Select one</option>
			<option value="Male">Male</option>
			<option value="Female">Female</option>
			<option value="Transgendered Male to Female">Transgendered Male to Female</option>
			<option value="Transgendered Female to Male">Transgendered Female to Male</option>
		</select>
	</div>
	 
	<div class="form-group">
		<label>13. Gender at Birth</label>
		<br/>
		<label class="radio-inline"><input type="radio" name="GAB" value="Male"/>Male</label>
		<label class="radio-inline"><input type="radio" name="GAB" value="Female"/>Female</label>
	</div>
	
	<div class="form-group">
		<label for="race">14. Race</label>
		<select class="form-control" name="Race">
			<option selected>Select one</option>
			<option value="White">White</option>
			<option value="Black">Black</option>
			<option value="Asian">Asian</option>
			<option value="American Indian/Alaskan Native">American Indian/Alaskan Nativev</option>
			<option value="Native Hawaiian/Pacific Islander">Native Hawaiian/Pacific Islander</option>
			<option value="Unknown">Unknown</option>
		</select>
	</div>
	
	<div class="form-group">
		<label>15. Ethnicity</label>
		<input type="radio" name="Ethnicity" value="Hispanic/Latino"/>Hispanic/Latino
		<input type="radio" name="Ethnicity" value="Non-Hispanic"/>Non-Hispanic
	</div>
	
	<label>16. Female Applicants Only:</label>
	<div class="form-group">
		<label for="pregnant">Are you pregnant?</label>
		<br/>
		<label class="radio-inline"><input type="radio" name="pregnant" value="Yes"/> Yes</label>
		<label class="radio-inline"><input type="radio" name="pregnant" value="No"/> No</label>
	</div>
	</form>
	<div class="text-center">
		<a href="./Page3.cfm"><button type="button" class="btn btn-default">Previous</button></a>
		<a href="./Page5.cfm"><button type="button" class="btn btn-default">Next</button></a>
	</div>
</div>