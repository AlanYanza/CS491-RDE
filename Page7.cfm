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
<div class="container">
	<h3>Progress</h3>
	<div class="progress">
		<div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width:60%">
			60% Completed
		</div>
	</div>
</div>
<br><br>
<center><div class="solid">
<CFOUTPUT><b>APPLICATION FOR PARTICIPATION IN THE AIDS DRUG DISTRIBUTION PROGRAM AND/OR HEALTH INSURANCE CONTINUATION PROGRAM (Continued)</b></CFOUTPUT><br><br>
<CFOUTPUT><b>Section 3 - INSURANCE STATUS, CONTINUED</b></CFOUTPUT><br><br>
<div class="small" align="left">
<form class="form-inline" action="">
<CFOUTPUT><b>28. Are you applying or have you applied for Social Security Income (SSI) or Social Security Disability Income (SSDI)?</b></CFOUTPUT><br>
  <input type="checkbox" name="SSI" value="SSI"/>Yes, for SSI&nbsp;&nbsp;
  <input type="checkbox" name="SSID" value="SSID, for SSID&nbsp;&nbsp;
  <input type="checkbox" name="No" value="No"/>No&nbsp;&nbsp;
  <input type="checkbox" name="DK" value="DK"/>Non't Know&nbsp;&nbsp;<br>
  &nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT><b>a. If yes, when did you apply for Medicaid?</b></CFOUTPUT>
  <input type="" class="form-control" id="Medi" pname="Medi"><br>
  &nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT><b>b. Have you received a response?</b></CFOUTPUT>
  <input type="checkbox" name="Yes" value="Yes"/>Yes&nbsp;&nbsp;
  <input type="checkbox" name="No" value="No"/>No&nbsp;&nbsp;
</form><br><br>
<form class="form-inline" action="">
<CFOUTPUT><b>29. Are you applying or have you applied for insurance through the health Insurance Reform Act (Marketplace/Exchange)?</b></CFOUTPUT><br>
<form class="form-inline" action="">
  <input type="checkbox" name="Yes" value="Yes"/>Yes&nbsp;&nbsp;
  <input type="checkbox" name="No" value="No"/>No&nbsp;&nbsp;
  <input type="checkbox" name="DK" value="DK"/>Non't Know&nbsp;&nbsp;<br>
  &nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT><b>a. If yes, when did you apply for Medicaid?</b></CFOUTPUT>
  <input type="" class="form-control" id="Medi" pname="Medi"><br>
  &nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT><b>b. Have you received a response?</b></CFOUTPUT>
  <input type="checkbox" name="Yes" value="Yes"/>Yes&nbsp;&nbsp;
  <input type="checkbox" name="No" value="No"/>No&nbsp;&nbsp;
</form><br><br>
<center><CFOUTPUT><b>NOTE: You MUST include a photocopy of the FRONT and BACK of your insurance card(s)/prescription card(s).</b></CFOUTPUT></center><br><br>
<form class="form-inline" action="">
<CFOUTPUT><b>Type of Coverage(Check all that apply):</b></CFOUTPUT>
  <input type="checkbox" name="MP" value="MP"/>Medical Plan&nbsp;&nbsp;
  <input type="checkbox" name="PP" value="PP"/>Prescription Plan&nbsp;&nbsp;
  <CFOUTPUT>Other (Specify)</CFOUTPUT>
  <input type="" class="form-control" id="Other" pname="Other"><br>
</form><br><br>
<form class="form-inline" action="">
  <CFOUTPUT><b>30. Private Health Insurance</b></CFOUTPUT><br><br>
  &nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Insurance Carrier:</CFOUTPUT>
  <input type="" class="form-control" id="IC" pname="IC"><br>
  &nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Address:</CFOUTPUT>
  <input type="" class="form-control" id="A" pname="A"><br>
  &nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Telephone Number:</CFOUTPUT>
  <input type="" class="form-control" id="TN" pname="TN"><br>
  &nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Policy Number:</CFOUTPUT>
  <input type="" class="form-control" id="PN" pname="PN"><br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>If provided by Union or Employer:</CFOUTPUT><br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Employer/Union Name:</CFOUTPUT>
  <input type="" class="form-control" id="EUN" pname="EUN"><br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Address:</CFOUTPUT>
  <input type="" class="form-control" id="A" pname="A"><br>
</form><br><br>
<form class="form-inline" action="">
  <CFOUTPUT><b>31. Prescription Coverage</b></CFOUTPUT><br><br>
  &nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Insurance Carrier:</CFOUTPUT>
  <input type="" class="form-control" id="IC" pname="IC"><br>
  &nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Address:</CFOUTPUT>
  <input type="" class="form-control" id="A" pname="A"><br>
  &nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Telephone Number:</CFOUTPUT>
  <input type="" class="form-control" id="TN" pname="TN"><br>
  &nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>ID Number:</CFOUTPUT>
  <input type="" class="form-control" id="IDN" pname="IDN"><br>
  &nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>IWhat is the Co-Pay Amount?</CFOUTPUT>
  <input type="" class="form-control" id="CPA" pname="CPA"><br>
  &nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>What is the Deductible?</CFOUTPUT>
  <input type="" class="form-control" id="D" pname="D"><br>
</form><br><br>
<form class="form-inline" action="">
<CFOUTPUT><b>Identify your relationship to the insured: </b></CFOUTPUT>
  <input type="checkbox" name="S" value="S"/>Self&nbsp;&nbsp;
  <input type="checkbox" name="SP" value="SP"/>Spouse/Partner&nbsp;&nbsp;
  <input type="checkbox" name="C" value="C"/>Child&nbsp;&nbsp;
  <CFOUTPUT>Other (Specify)</CFOUTPUT>
  <input type="" class="form-control" id="Other" pname="Other"><br>
  &nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Name of Insured</CFOUTPUT>
  <input type="" class="form-control" id="NI" pname="NI"><br>
  &nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>County:</CFOUTPUT>
  <input type="" class="form-control" id="C" pname="C"><br>
  &nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Social Security Number:</CFOUTPUT>
  <input type="" class="form-control" id="SSN" pname="SSN"><br>
  &nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Telephone Number</CFOUTPUT>
  <input type="" class="form-control" id="TN" pname="TN"><br>
</form><br><br>
<form class="form-inline" action="">
<CFOUTPUT><b>32. a. Are you eligible for Veterans Administration prescription drug benefits?</b></CFOUTPUT>
<input type="checkbox" name="Y" value="Y"/>Yes&nbsp;&nbsp;
<input type="checkbox" name="N" value="N"/>No&nbsp;&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<CFOUTPUT><b>b. Are you currently receiving prescription drug benefits?</b></CFOUTPUT>
<input type="checkbox" name="Y" value="Y"/>Yes&nbsp;&nbsp;
<input type="checkbox" name="N" value="N"/>No&nbsp;&nbsp;
</form><br><br>
  </form>
<center><CFOUTPUT><b>NOTE: You MUST include a photocopy of the FRONT and BACK of your insurance card(s)/prescription card(s)
and any notice from your Insurance Company regarding Medicare Part D.</b></CFOUTPUT></center>
</div> <br>
</div>
<form method="get" action="./Page6.cfm">
    <button type="submit">Back</button>
</form>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<form method="get" action="./Page8.cfm?">
    <button type="submit">Next</button>
</form>
</center>
