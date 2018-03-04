What Form Submitted to Script
<cfset writeDump(FORM)><br><br>

<!-- TextBox -->
<b>TextBox:</b><br>
<cfset textBox=FORM.textBox>
<b>no cfoutput tag:</b><br>
<cfset writeDump(textBox)><br>
<b>cfoutput tag:</b><br>
<cfoutput>#textBox#</cfoutput><br><br>
