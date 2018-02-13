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
<CFOUTPUT><b>Section 3 - INSURANCE STATUS</b></CFOUTPUT><br><br>
<div class="small" align="left">
<form class="form-inline" action="">
<CFOUTPUT><b>25. What if your current employment status?</b></CFOUTPUT>&nbsp;&nbsp;
  <input type="checkbox" name="Insurance" value="Insurance"/>Yes&nbsp;&nbsp;
  <input type="checkbox" name="Insurance" value="Insurance"/>No&nbsp;&nbsp;
  <input type="checkbox" name="Insurance" value="Insurance"/>Don't Know <br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT><b>a. If yes, is your insurance Policy through:</b></CFOUTPUT>&nbsp;&nbsp;
  &nbsp;&nbsp;<input type="checkbox" name="CurrentEmployer" value="CurrentEmployer"/>Current Employer&nbsp;&nbsp;
  <input type="checkbox" name="FormerEmployer" value="FormerEmployer"/>Former Employer&nbsp;&nbsp;
  <input type="checkbox" name="Union" value="Union"/>Union&nbsp;&nbsp;
  <input type="checkbox" name="Self" value="Self"/>Self&nbsp;&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>(1) Employer or Union Providing Insurance Coverage:</CFOUTPUT><br>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>(a) Name:</CFOUTPUT>
      <input type="" class="form-control" id="Name" pname="Name"><br>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>(b) Address:</CFOUTPUT>
      <input type="" class="form-control" id="Address" pname="Adress"><br>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>(c) City, State, Zip:</CFOUTPUT>
      <input type="" class="form-control" id="CSZ" pname="CSZ"><br>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>(d) Contact Person:</CFOUTPUT>
      <input type="" class="form-control" id="CP" pname="Cp"><br>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>(e) Telephone Number:</CFOUTPUT>
      <input type="" class="form-control" id="TN" pname="TN"><br><br>
	  &nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT><b>b. If yes, check all types that you currently have:</b></CFOUTPUT>
	  &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="Medicaid" value="Medicaid"/>Medicaid&nbsp;&nbsp;
	  <input type="checkbox" name="MedicareAB" value="MedicareAB"/>Medicare A/B&nbsp;&nbsp;
	  <input type="checkbox" name="MedicareD" value="MedicareD"/>Medicare D&nbsp;&nbsp;
	  <input type="checkbox" name="PV" value="PV"/>Private Insurance&nbsp;&nbsp;
	  <input type="checkbox" name="CHIP" value="CHIP"/>CHIP&nbsp;&nbsp;
	  <input type="checkbox" name="COBRA" value="COBRA"/>COBRA<br>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <CFOUTPUT>(1) When does it start?</CFOUTPUT>
      <input type="" class="form-control" id="start" pname="start">
	  <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <CFOUTPUT>(2) When does it end?</CFOUTPUT>
      <input type="" class="form-control" id="end" pname="end"><br><br>
	  &nbsp;&nbsp;&nbsp;&nbsp;
	  <CFOUTPUT><b>c. When is the next premium due?</b></CFOUTPUT>
      <input type="" class="form-control" id="premium" pname="premium">
	  &nbsp;&nbsp;&nbsp;&nbsp;<form class="form-inline"><br><br>&nbsp;&nbsp;&nbsp;&nbsp;
	  <CFOUTPUT><b>d. Other(specify): </b></CFOUTPUT>
      <input type="" class="form-control" id="OS" pname="OS"><br><br>
	  &nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT><b>e. If you have insurance, does it provide prescription coverage?</b></CFOUTPUT><br>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="Y" value="Y"/>Yes&nbsp;&nbsp;
	  <input type="checkbox" name="N" value="N"/>No&nbsp;&nbsp;
	  <input type="checkbox" name="DK" value="DK"/>Don't Know<br>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>(1) If you have prescription drug coverage through insurance, is there a cap on the annual amount your insurance will pay for medications?</CFOUTPUT><br>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="Y" value="Y"/>Yes&nbsp;&nbsp;
	  <input type="checkbox" name="N" value="N"/>No&nbsp;&nbsp;
	  <input type="checkbox" name="DK" value="DK"/>Don't Know<br>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>(2) If yes, what is the amount of the cap?</CFOUTPUT><br>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="Y" value="Y"/>Yes&nbsp;&nbsp;
	  <input type="checkbox" name="N" value="N"/>No&nbsp;&nbsp;
	  <input type="checkbox" name="DK" value="DK"/>Don't Know&nbsp;&nbsp;
	  </form><br><br>
	  &nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT><b>f. Do you have prescription coverage through a mail order company?</b></CFOUTPUT><br>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="Y" value="Y"/>Yes&nbsp;&nbsp;
	  <input type="checkbox" name="N" value="N"/>No&nbsp;&nbsp;
	  <input type="checkbox" name="P" value="P"/>Partial&nbsp;&nbsp;
</form><br>
<center><CFOUTPUT><b>A dedicated pharmacy is required even if not utilized</b></CFOUTPUT></center><br><br>
<form class="form-inline" action="">
<CFOUTPUT><b>26. Are you applying or have applied for Medicare?</b></CFOUTPUT><br>
  &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="Insurance" value="Insurance"/>Yes&nbsp;&nbsp;
  <input type="checkbox" name="Insurance" value="Insurance"/>No&nbsp;&nbsp;
  <input type="checkbox" name="Insurance" value="Insurance"/>Don't Know <br>
  &nbsp;&nbsp;&nbsp;&nbsp;<form class="form-inline">
  <CFOUTPUT>a. If yes, when did you apply for Medicaid?</CFOUTPUT>
  <input type="" class="form-control" id="Medi" pname="Medi"><br>
  &nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>b. Have you received a response?</CFOUTPUT>
  &nbsp;&nbsp;<input type="checkbox" name="Y" value="Y"/>Yes&nbsp;&nbsp;
  <input type="checkbox" name="N" value="N"/>No&nbsp;&nbsp;
</form><br><br>
<form class="form-inline" action="">
<CFOUTPUT><b>27. Are you applying or have applied for Medicare?</b></CFOUTPUT><br>
  <input type="checkbox" name="Insurance" value="Insurance"/>Yes&nbsp;&nbsp;
  <input type="checkbox" name="Insurance" value="Insurance"/>No&nbsp;&nbsp;
  <input type="checkbox" name="Insurance" value="Insurance"/>Don't Know <br>
  &nbsp;&nbsp;&nbsp;&nbsp;<form class="form-inline">
  <CFOUTPUT>a. If yes, when did you apply for Medicaid?</CFOUTPUT>
  <input type="" class="form-control" id="Medi" pname="Medi"><br>
  &nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>b. Have you received a response?</CFOUTPUT><br>
  &nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;<input type="checkbox" name="Y" value="Y"/>Yes&nbsp;&nbsp;
  <input type="checkbox" name="N" value="N"/>No<br>
  &nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>c. If yes, have you applied for Medicare Part D(medical coverage)</CFOUTPUT><br>
  &nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;<input type="checkbox" name="Y" value="Y"/>Yes&nbsp;&nbsp;
  <input type="checkbox" name="N" value="N"/>No&nbsp;&nbsp;
  <input type="checkbox" name="DK" value="Dk"/>Don't Know&nbsp;&nbsp;<br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>(1) If yes, have you applied for Low Income Subsidy (LIS)</CFOUTPUT><br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="Y" value="Y"/>Yes&nbsp;&nbsp;
  <input type="checkbox" name="N" value="N"/>No&nbsp;&nbsp;
  <input type="checkbox" name="DK" value="Dk"/>Don't Know&nbsp;&nbsp;
  </form><br>
<center><CFOUTPUT><b>* Private Insurance Definition:
Plans provided by the private insurance industry
as a benefit of employment or through the
Marketplace (e.g. Horizon Blue Cross Blue
Shield, Aetna, Amerihealth, etc.).</b></CFOUTPUT></center><br><br>
<center><CFOUTPUT><b>**COBRA Definition:
COBRA stands for Consolidated Omnibus Budget Reconciliation Act. The law generally
applies to all group health plans maintained by private-sector employers with 20 or more
employees and sponsored by most state and local governments. If elected, COBRA
allows individuals to continue group health coverage that would otherwise be lost due to
certain specific events such as termination of employment. COBRA coverage extends
from the date of the qualifying event for a limited period of time.</b></CFOUTPUT></center><br><br>
</div> <br>
</div> 
<form method="get" action="./Page5.cfm">
    <button type="submit">Back</button>
</form>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<form method="get" action="./Page7.cfm?">
    <button type="submit">Next</button>
</form>
</center>