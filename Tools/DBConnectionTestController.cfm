<cfset dataSourceIn=FORM.dataSource>
<cfset testCol1=FORM.testCol1>
<cfset testCol2=FORM.testCol2>

dataSource is <cfoutput>#dataSourceIn#</cfoutput><br>
testCol1 <cfoutput>#testCol1#</cfoutput><br>
testCol2 <cfoutput>#testCol2#</cfoutput><br>

<cfquery name="testInsert" datasource=#dataSourceIn#>
  INSERT INTO AlanTest VALUES(
  <cfqueryparam value=#testCol1# cfsqltype="varchar">,
  <cfqueryparam value=#testCol2# cfsqltype="varchar">
  )
</cfquery>

<cfquery name="ResultInsert" datasource=#dataSourceIn#>
  SELECT * FROM AlanTest
</cfquery>
<cfset writeDump(ResultInsert)>
