<!---
This was used to generate the hidden fields required so the javaScript function can retrieve the
ColdFusion query results and reflect the result set on the page for the non-text field values.
This outputs all the hidden text fields tags, so it can be copied and pasted into the application pages
To Retrive generated Fields: Use inspect tool to inspect browswer source code
--->
<!--- Enter field name matching the column names in the database --->
cfset fieldNames=[]/>

<!-- NJpage1 -->
<!---<cfset fieldNames=["FName","MName","LName","DateBirth","gender","genderBirth","SSNum","street","city","state","zip",
"county","aptNum","HPhone","WPhone","CPhone","VHomeMsgPerm","VCellMsgPerm","VWorkMsgPerm","AltComPerm","AddrRes","MStreet",
"MCity","MState","MZip","MCountry","MaptNum","USCitizen","veteran","RelStatus","RWhite","RBlack","RAsian","RAmInd","RNatHa",
"RUnk","AAsInd","AChinese","AJap","AKorean","AViet","AOther","NHNatHa","NHGua","NHSam","NHOther","EHisp","ENonHisp","HispMex","HispPR",
"HispCub","HispOther"]/>--->

<!--NJpage2 -->
<!---<cfset fieldNames=["EmplyStatus","unableWork","unable12LMonth","unable12MMonth","HPersonNum","salary","disBen","genAssist","unemploy",
"socialSecurity","persion","allimony","OtherIncome","totalHIncome","taxFile","dependant","TANF","SAIF","SSI","GA","SNAP"]/>--->

<!--NJpage3-->
<!---<cfset fieldNames=["insured","Medium","EmpUnName","EmpUnAddr","EmpUnContact","EmpUnPhone","Medicaid","MedicareAB","MedicareD","PrivateIns","CHIP",
"COBRA","COBRAStart","COBRAEND","NxtPremDue","Other","PresCov","PresCovCap","PresCovCapAmt","PresCovMail","AMedicaid","AMedicaidDate","UMedicaidDate",
"RespMedicaid","AMedicare","AMedicareDate","UMedicareDate","RespMedicare","AmedicareD","ALIS"]/>--->

<!--NJpage4-->
<!---<cfset fieldNames=["NoASSISSDI","UASSISSDI","YesSSI","YesSSDI","ASSISSDIDate","UASSISSDIDate","RespASSISSI","AMarket","AMarketDate","UMarketDate",
"CovMed","CovPres","CovOther","CovOtherTxt","CovOtherTxt","relation","relOther","InsName","InsAddr","InsAddrCounty","InsSS","InsPhone","InsCarrier",
"InsCarAddr","InsCarPhone","InsCarPolicyNum","EmpUnmame","EmpUnAddr","PresCar","PresCarAddr","PresCarPhone","PresCarID","PresCoPay","PresDeduct",
"EligVetDrugBen","RecPresDrugBen"]/>--->

<!--NJpage5 (no signature or signature date fields) -->
<!---<cfset fieldNames=["CName","agency","CMaddr","CMWPhone","CMFaxNum","CMCPhone","email","perm","HIVAware","CPName","relation","CPAddr","CPHPhone",
"CPWPhone","CPCPhone","PName","Phone"]/>--->

<!--- Enter resultset name--->
<cfset resultSetName='subformData'/>

<cfloop array="#fieldNames#" index="field" >
	<cfoutput><input type="text" hidden="true" name="HF#field#" value="###resultSetName#.#field###"></cfoutput>
</cfloop>