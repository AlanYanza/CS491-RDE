<!--- code starts --->
<cftry>
<cfset restInitApplication("#expandpath("./restapi")#","restapi")>
 
<cfcatch type="any">
    <cfdump var="#cfcatch#">
</cfcatch>
</cftry>
successfull!!
<!--- code ends --->