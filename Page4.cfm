<style>
div.solid {
	border-style: solid;
	width: 95%;
}
div.small {
	border-style: dotted;
	width: 85%;
}
div.smaller {
	border-style: dotted;
	width: 40%;
}
table, th, td {
    border: 1px solid black;
	
}
form{ display: inline-block; }
</style>
<cfinclude template="header.cfm">
<br><br>
<center><div class="solid">
<CFOUTPUT><b>APPLICATION FOR PARTICIPATION IN THE AIDS DRUG DISTRIBUTION PROGRAM AND/OR HEALTH INSURANCE CONTINUATION PROGRAM</b></CFOUTPUT><br><br>
<CFOUTPUT>Please print clearly and answer all questions. Review the attached instructions before you begin. If you need assistance completing this
application, call toll free 1-877-613-4533 for ADDP questions or 1-800-353-3232 for HICP questions. Mail the completed application to the
ADDP/HICP Program at the address given above or fax to 609-588-7037. Send copies of any requested documents. Do NOT send original
documents as they WILL NOT be returned.</CFOUTPUT><br><br>
<form class="form-inline" action="">
  <input type="checkbox" name="HICP" value="HICP"/> I am also applying for HICP<br>
</form><br><br>
<CFOUTPUT><b>Section 1 - APPLICANT INCOME</b></CFOUTPUT><br><br>
<div class="small" align="left">
<form class="form-inline" action=""> 
    <div class="form-group">
      <label for="LastName">1. Last Name:</label>
      <input type="" class="form-control" id="lastname" name="lastname">
      <label for="FirstName">First Name:</label>
      <input type="" class="form-control" id="firstname" pname="firstname">
      <label for="MI">MI:</label>
      <input type="" class="form-control" id="MI" pname="MI">
    </div><br><br> 
	<div class="form-group">
      <label for="DOB">2. DOB:</label>
      <input type="date" class="form-control" id="DOB" pname="DOB">
    </div><br><br>
	<div class="form-group">
      <label for="StreetAddress">3. Street Address</label>
      <input type="" class="form-control" id="StreetAddress" pname="StreetAddress">
      <label for="AptNumber">Apt. Number</label>
      <input type="" class="form-control" id="AptNumber" pname="AptNumber">
      <label for="CityStateZip">City, State, Zip Code</label>
      <input type="" class="form-control" id="CityStateZip" pname="CityStateZip">
    </div><br><br>  
	<div class="form-group">
      <label for="County">4. County</label>
      <input type="" class="form-control" id="County" pname="County">
    </div><br><br>  
	<div class="form-group">
      <label for="MailingAdresss">5. Mailing Address (if different) </label>
      <input type="" class="form-control" id="MailingAdresss" pname="MailingAdresss">
    </div><br><br>
	<div class="form-group">
      <label for="HomeNumber">6. Home Phone Number </label>
      <input type="" class="form-control" id="HomeNumber" pname="HomeNumber">
      <label for="CellNumber">Cell Phone Number </label>
      <input type="" class="form-control" id="CellNumber" pname="CellNumber">
      <label for="WorkNumber">Work Phone Number </label>
      <input type="" class="form-control" id="WorkNumber" pname="WorkNumber">
    </div><br><br>
<CFOUTPUT><b>7. Residency</b></CFOUTPUT><br>&nbsp;&nbsp;&nbsp;&nbsp;
<form class="form-inline ">
<CFOUTPUT>a. Is the address above your principal place of residence?</CFOUTPUT>
    <input type="checkbox" name="Residency" value="Residency"/>Yes&nbsp;&nbsp;
    <input type="checkbox" name="Residency" value="Residency"/>No&nbsp;&nbsp;
    </form><br><br>
<center><CFOUTPUT><b>NOTE: Two (2) proofs of residency MUST accompany this application. See Instructions.</b></CFOUTPUT></center><br><br>
<center><CFOUTPUT><b>NO HOME ADDRESS DECLARATION </CFOUTPUT>&#45;<CFOUTPUT> If you do not have a home address, have a case manager/social worker provide support
documentation on facility letterhead.</b></CFOUTPUT></center><br><br>
<div class="form-inline">
      <label for="SSN">8. What is your Social Security Number (if you have one)?</label>
      <input type="" class="form-control" id="SSN" pname="SSN">
    </div><br><br>
<div class="form-inline">
      <label for="Citizenship">9. Are you a U.S. citizen? (Responding to this question will not affect your eligibility for ADDP.)</label>
      <input type="" class="form-control" id="Citizenship" pname="Citizenship">
    </div><br><br>
<div class="form-inline">
      <label for="Veteran">10. Are you a veteran?</label>
      <input type="" class="form-control" id="Veteran" pname="Veteran">
    </div><br><br>
<form class="form-inline" action="">
<CFOUTPUT><b>11. Relationship Status</b></CFOUTPUT>&nbsp;&nbsp;
  <input type="checkbox" name="Relationship" value="Relationship"/>Single&nbsp;&nbsp;
  <input type="checkbox" name="Relationship" value="Relationship"/>Married&nbsp;&nbsp;
  <input type="checkbox" name="Relationship" value="Relationship"/>Civil Union&nbsp;&nbsp;
  <input type="checkbox" name="Relationship" value="Relationship"/>Domestic Partner&nbsp;&nbsp;
  <input type="checkbox" name="Relationship" value="Relationship"/>Divorced&nbsp;&nbsp;
  <input type="checkbox" name="Relationship" value="Relationship"/>Widowed&nbsp;&nbsp;
  <input type="checkbox" name="Relationship" value="Relationship"/>Separated (See instructions, Page 1. Applicant information.)&nbsp;&nbsp;
</form><br><br>
<form class="form-inline" action="">
<CFOUTPUT><b>12. Gender</b></CFOUTPUT>&nbsp;&nbsp;
  <input type="checkbox" name="Gender" value="Gender"/>Male&nbsp;&nbsp;
  <input type="checkbox" name="Gender" value="Gender"/>Female&nbsp;&nbsp;
  <input type="checkbox" name="Gender" value="Gender"/>Transgendered Male to Female&nbsp;&nbsp;
  <input type="checkbox" name="Gender" value="Gender"/>Transgendered Female to Male&nbsp;&nbsp;
</form><br><br>
<form class="form-inline" action="">
<CFOUTPUT><b>13. Gender at Birth</b></CFOUTPUT>&nbsp;&nbsp;
  <input type="checkbox" name="GAB" value="GAB"/>Male&nbsp;&nbsp;
  <input type="checkbox" name="GAB" value="GAB"/>Female&nbsp;&nbsp;
</form><br><br>
<form class="form-inline" action="">
<CFOUTPUT><b>14. Race</b></CFOUTPUT>&nbsp;&nbsp;
  <input type="checkbox" name="Race" value="Race"/>White&nbsp;&nbsp;
  <input type="checkbox" name="Race" value="Race"/>Black&nbsp;&nbsp;
  <input type="checkbox" name="Race" value="Race"/>Asian&nbsp;&nbsp;
  <input type="checkbox" name="Race" value="Race"/>American Indian/Alaskan Native&nbsp;&nbsp;
  <input type="checkbox" name="Race" value="Race"/>Native Hawaiian/Pacific Islander&nbsp;&nbsp;
  <input type="checkbox" name="Race" value="Race"/>Unknown&nbsp;&nbsp;
</form><br><br>
<form class="form-inline" action="">
<CFOUTPUT><b>15. Ethnicity</b></CFOUTPUT>&nbsp;&nbsp;
  <input type="checkbox" name="Ethnicity" value="Ethnicity"/>Hispanic/Latino&nbsp;&nbsp;
  <input type="checkbox" name="Ethnicity" value="Ethnicity"/>Non-Hispanic&nbsp;&nbsp;
</form><br><br>
<form class="form-inline" action="">
<CFOUTPUT><b>16. Female Applicants Only:</b></CFOUTPUT><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT><b>Are you pregnant?</b></CFOUTPUT>&nbsp;&nbsp;
  <input type="checkbox" name="pregnant" value="pregnant"/>Yes&nbsp;&nbsp;
  <input type="checkbox" name="pregnant" value="pregnant"/>No&nbsp;&nbsp;
</form>
  </form>
</div> <br>
</div> 
<form method="get" action="./Page3.cfm">
    <button type="submit">Back</button>
</form>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<form method="get" action="./Page5.cfm?">
    <button type="submit">Next</button>
</form>
</center>