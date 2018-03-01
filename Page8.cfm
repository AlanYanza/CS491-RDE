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
		<div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width:80%">
			80% Completed
		</div>
	</div>
</div>
<br><br>
<center><div class="solid">
<CFOUTPUT><b>APPLICATION FOR PARTICIPATION IN THE AIDS DRUG DISTRIBUTION PROGRAM AND/OR HEALTH INSURANCE CONTINUATION PROGRAM (Continued)</b></CFOUTPUT><br><br>
<CFOUTPUT><b>Section 4 - CERTIFICATION AND AUTHORIZATION BY APPLICANT</b></CFOUTPUT><br><br>
<div class="small" align="left">
<center><CFOUTPUT><b>I certify that the information above is true and accurate to the best of my knowledge and I know that I can be prosecuted for perjury if I
have intentionally provided false information. I will notify the Program immediately if my/our income rises above legal limits (as stated
in the Instructions); if I move from New Jersey; if I change my present residential address or telephone number; if there is any change
in premium payments or policy type; if I become Medicaid/Welfare/PAAD eligible; or if there is a change in any other information
pertinent to my participation in ADDP and/or HICP. I authorize the release of information necessary to determine my ADDP and/or
HICP eligibility from the records in possession of the Social Security Administration, Internal Revenue Service and New Jersey
Division of Taxation, employers, banks and others as the need arises. I authorize my physician to release information concerning
prescriptions which have been paid on my behalf by ADDP, or my eligibility for HICP. I hereby assign the State of New Jersey as my
authorized representative, any right to drug benefits to which I may be entitled under any other plan of assistance or insurance, from
any other liable third party or drug benefits under any other plan of governmental assistance. I understand that the ADDP or the HICP
is entitled to repayment for incorrectly provided benefits. I further understand that I will be held liable for any ADDP and/or HICP
benefits which are determined to have been incorrectly paid on my behalf. I understand that the ADDP and the HICP reserve the
right to limit enrollment based upon the availability of funds.</b></CFOUTPUT></center><br>
<form class="form-inline" action="">
<CFOUTPUT><b>33. Signature of Applicant</b></CFOUTPUT>
<input type="" class="form-control" id="Signature" pname="Signature">&nbsp;&nbsp;
<CFOUTPUT><b>Date</b></CFOUTPUT>
<input type="date" class="form-control" id="Date" pname="Date"><br>
</form><br><br>
<form class="form-inline" action="">
<CFOUTPUT><b>34. Signature of Spouse/Partner</b></CFOUTPUT>
<input type="" class="form-control" id="SignatureP" pname="SignatureP">&nbsp;&nbsp;
<CFOUTPUT><b>Date</b></CFOUTPUT>
<input type="date" class="form-control" id="Date" pname="Date"><br>
</form><br><br>
<form class="form-inline" action="">
<CFOUTPUT><b>35. Contact Person</b></CFOUTPUT><br>
&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>May the Department of Human Services and the Department of Health contact an alternate person?</CFOUTPUT>
<input type="checkbox" name="Y" value="Y"/>Yes&nbsp;&nbsp;
<input type="checkbox" name="N" value="N"/>No&nbsp;&nbsp;<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>In the event that we need information regarding your participation in the program and you are unavailable, please indicate someone
we may contact on your behalf.</CFOUTPUT><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Is this person aware of your HIV Status?</CFOUTPUT>
<input type="checkbox" name="Y" value="Y"/>Yes&nbsp;&nbsp;
<input type="checkbox" name="N" value="N"/>No<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Name of Contact Person</CFOUTPUT>
<input type="" class="form-control" id="NOC" pname="NOC"><br>
&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Relationship to Applicant</CFOUTPUT>
<input type="" class="form-control" id="RA" pname="RA"><br>
&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Street Address, City, State, Zip</CFOUTPUT>
<input type="" class="form-control" id="ACSZ" pname="ACSZ"><br>
&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Home Phone</CFOUTPUT>
<input type="" class="form-control" id="HP" pname="HP"><br>
&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Work Phone</CFOUTPUT>
<input type="" class="form-control" id="WP" pname="WP"><br>
&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Cell Phone</CFOUTPUT>
<input type="" class="form-control" id="CP" pname="CP"><br>
</form><br><br>
<form class="form-inline" action="">
<CFOUTPUT><b>36. Preparer: </b></CFOUTPUT><br>
&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Anyone other than the applicant who prepared the form must provide his/her name and telephone number, in case questions should
arise concerning the application.</CFOUTPUT><br>
&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Name of Preparer</CFOUTPUT>
<input type="" class="form-control" id="NP" pname="NP"><br>
&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Phone</CFOUTPUT>
<input type="" class="form-control" id="P" pname="P"><br>
</form><br><br>
<form class="form-inline" action="">
<CFOUTPUT><b>37. Case Manager Information </b></CFOUTPUT><br>
&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Name of Case Manager</CFOUTPUT>
<input type="" class="form-control" id="NCM" pname="NCM"><br>
&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Agency Affiliation</CFOUTPUT>
<input type="" class="form-control" id="AA" pname="AA"><br>
&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Street Address, City, State, Zip</CFOUTPUT>
<input type="" class="form-control" id="SACSZ" pname="SACSZ"><br>
&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Work Phone</CFOUTPUT>
<input type="" class="form-control" id="WP" pname="WP"><br>
&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Fax Phone</CFOUTPUT>
<input type="" class="form-control" id="FP" pname="FP"><br>
&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Cell Number</CFOUTPUT>
<input type="" class="form-control" id="CM" pname="CM"><br>
&nbsp;&nbsp;&nbsp;&nbsp;<CFOUTPUT>Case Manager's Email Address:</CFOUTPUT>
<input type="" class="form-control" id="EA" pname="EA"><br>
</form><br><br><br><br><br>
<form class="form-inline" action="">
<center><CFOUTPUT><b>FOR ADDP STAFF USE ONLY:</b></CFOUTPUT>
<CFOUTPUT>Date eligibility determined: </CFOUTPUT>
<input type="date" class="form-control" id="WP" pname="WP"><br></center>
</form>
  </form>
</div> <br>
</div>
<form method="get" action="./Page7.cfm">
    <button type="submit">Back</button>
</form>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<form method="get" action="./Home.cfm?">
    <button type="submit">Next</button>
</form>
</center>
