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
<CFOUTPUT><b>APPLICATION FOR PARTICIPATION IN THE AIDS DRUG DISTRIBUTION PROGRAM AND/OR HEALTH INSURANCE CONTINUATION PROGRAM (Continued)</b></CFOUTPUT><br><br>
<CFOUTPUT><b>Section 2 - HOUSEHOLD INCOME</b></CFOUTPUT><br><br>
<div class="small" align="left">
<form class="form-inline" action="">
<CFOUTPUT><b>17. What if your current employment status?</b></CFOUTPUT>&nbsp;&nbsp;
  <input type="checkbox" name="employment" value="employment"/>Full Time(35 or more hours per week&nbsp;&nbsp;
  <input type="checkbox" name="employment" value="employment"/>Part Time(less than 35 hours per week&nbsp;&nbsp;
  <input type="checkbox" name="employment" value="employment"/>Not employed&nbsp;&nbsp;
</form><br>
<form class="form-inline" action="">
<CFOUTPUT><b>18. Are you medically UNABLE to work?</b></CFOUTPUT>&nbsp;&nbsp;
  <input type="checkbox" name="UnableToWork" value="UnableToWork"/>Yes&nbsp;&nbsp;
  <input type="checkbox" name="UnableToWork" value="UnableToWork"/>No&nbsp;&nbsp;
</form><br> 
<form class="form-inline" action="">
<CFOUTPUT><b>19. Medically unable to work LESS than 12 months?</b></CFOUTPUT>&nbsp;&nbsp;
  <input type="checkbox" name="UnableToWork12" value="UnableToWork"/>Yes&nbsp;&nbsp;
  <input type="checkbox" name="UnableToWork12" value="UnableToWork"/>No&nbsp;&nbsp;
</form><br>
<form class="form-inline" action="">
<CFOUTPUT><b>20. Medically unable to work MORE than 12 months?</b></CFOUTPUT>&nbsp;&nbsp;
  <input type="checkbox" name="UnableToWork12Up" value="UnableToWork"/>Yes&nbsp;&nbsp;
  <input type="checkbox" name="UnableToWork12Up" value="UnableToWork"/>No&nbsp;&nbsp;
</form><br>
	<form class="form-inline">
	  <label for="NumberHousehold">21. Number of person in your household unit (include yourself):</label>
      <input type="" class="form-control" id="NumberHousehold" pname="NumberHousehold">
    </form><br>
	<form class="form-inline">
      <label for="HouseholdIncome">22. List any annual household income:</label><br>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Salary/Wages</CFOUTPUT>&nbsp;&nbsp;
      $<input type="" class="form-control" id="Salary/Wages" pname="Salary/Wages"><br>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Disability Benefit</CFOUTPUT>&nbsp;&nbsp;;
      $<input type="" class="form-control" id="DisabilityBenefits" pname="DisabilityBenefits"><br>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>General Assistance</CFOUTPUT>&nbsp;&nbsp;
      $<input type="" class="form-control" id="GeneralAssistance" pname="GeneralAssistance"><br>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Unemployment</CFOUTPUT>&nbsp;&nbsp;
      $<input type="" class="form-control" id="Unemployment" pname="Unemployment"><br>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Social Security</CFOUTPUT>&nbsp;&nbsp;
      $<input type="" class="form-control" id="SocialSecurity" pname="SocialSecurity"><br>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Pension/Retirement</CFOUTPUT>&nbsp;&nbsp;
      $<input type="" class="form-control" id="PensionRetirement" pname="PensionRetirement"><br>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Alimony/Palimony</CFOUTPUT>&nbsp;&nbsp;
      $<input type="" class="form-control" id="AlimonyPalimony" pname="AlimonyPalimony"><br>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Other</CFOUTPUT>&nbsp;&nbsp;
      $<input type="" class="form-control" id="Other" pname="Other"><br>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Total Annual Household Income</CFOUTPUT>&nbsp;&nbsp;
      $<input type="" class="form-control" id="TotalIncome" pname="TotalIncome"><br>
    </form><br><br>
<form class="form-inline" action="">
  <CFOUTPUT><b>23. a. Did you and/or any member of your household file a Federal, State or City Income Tax return lasy year?</b></CFOUTPUT>&nbsp;&nbsp;
  <input type="checkbox" name="Federal" value="Federal"/>Yes&nbsp;&nbsp;
  <input type="checkbox" name="Federal" value="Federal"/>No&nbsp;&nbsp;
</form><br>
<form class="form-inline" action="">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT><b>b. Were you listed as a dependent on a family member's Federal, State, or City Income tax return last year?</b></CFOUTPUT>&nbsp;&nbsp;
  <input type="checkbox" name="Dependent" value="Dependent"/>Yes&nbsp;&nbsp;
  <input type="checkbox" name="Dependent" value="Dependent"/>No&nbsp;&nbsp;
</form><br><br>
<CFOUTPUT><b>24. Have you applied for or are you currently receiving any of the following? (Check ALL that apply)</b></CFOUTPUT><br>
<CFOUTPUT><b>Applied For</b></CFOUTPUT>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT><b>Receiving</b></CFOUTPUT><br>
<form class="form-inline" action="">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="Federal" value="Federal"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="checkbox" name="Federal" value="Federal"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Temporary Assistance to Needy Families (TANF)<br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="Federal" value="Federal"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="checkbox" name="Federal" value="Federal"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Supportive Assistance to Individuals and Families (SAIF) Program<br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="Federal" value="Federal"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="checkbox" name="Federal" value="Federal"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Supplemental Security Income (SSI) Program<br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="Federal" value="Federal"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="checkbox" name="Federal" value="Federal"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;General Assistance (GA)<br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="Federal" value="Federal"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="checkbox" name="Federal" value="Federal"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Supplemental Nutrition Assistance Program (SNAP) (formerly Food Stamps)<br>
</form><br>
  </form>
</div> <br>
</div> 
<form method="get" action="./Page4.cfm">
    <button type="submit">Back</button>
</form>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<form method="get" action="./Page6.cfm?">
    <button type="submit">Next</button>
</form>
</center>