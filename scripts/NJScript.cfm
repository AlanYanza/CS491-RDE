<!--- Determine which page form came from --->
<cfset formSource=FORM.formPage/>
<cfset tableName=FORM.tableName/>
<cfset subformObj=createObject('component','CS491-RDE.components.Subform').init('NJ',session.userID,tableName)/>
<cfset appExist=subformObj.checkIfAppExist()/>
<!--- if first page of form, determine status of HICP checkbox --->
<cfif StructKeyExists(form,'HICP')>  
   <cfset HICPStatus= "Y" />  
<cfelse>  
   <cfset HICPStatus= "N" />  
</cfif> 

<!--- Form Page 1 processing --->
<cfif formSource eq 'page1'>
	<!--- Update HICP Stauts--->
	<cfif appExist eq 1>
		<cfset subformObj.updateHICPStatus(HICPStatus)/>
	</cfif>
	<!--- Set fields of the sub-form --->
	<cfset fields=['FName','MName','LName','DateBirth','gender','genderBirth','SSNum','street','city','state','zip','county','aptNum','HPhone','WPhone','CPhone','MStreet','MCity','MState','MZip','MCounty',
	'MaptNum','USCitizen','veteran','RelStatus','preg','AddrRes'] />
	<cfset checkFields=['VHomeMsgPerm','VCellMsgPerm','VWorkMsgPerm','AltComPerm','RWhite','RBlack','RAsian','RAmInd','RNatHa','RUnk','AAsind','AChinese','AJap',
	'AKorean','AFilipino','AViet','AOther','NHNatHaw','NHGua','NHSam','NHOther','EHisp','HispMex','HispPR','HispCub','HispOther']/>
	<cfset subformObj.setFields(fields)/>
	<cfset subformObj.setCheckFields(checkFields)/>
	<!--- extract user inputs from subform --->
	<cfset subformObj.extractFormData()/>
	<cfset subformObj.extractCheckboxData()/>
	<!--- update subform table entry for user --->
	<cfset subformObj.updateSubformData()/>
	<cfset subformObj.updateCheckboxData()/>
</cfif>

<!--- Form Page 2 processing --->
<cfif formSource eq 'page2'>
	<!--- Set fields of the sub-form --->
	<cfset fields=['EmplyStatus','unableWork','unable12LMonth','unable12MMonth','taxFile','dependant','TANF','SAIF','SSI','GA','SNAP','HPersonNum','salary','disBen','genAssist','unemploy',
	'socialSecurity','pension','allimony','OtherIncome','totalHIncome'] />
	<cfset subformObj.setFields(fields)/>
	<!--- extract user inputs from subform --->
	<cfset subformObj.extractFormData()/>
	<!--- update subform table entry for user --->
	<cfset subformObj.updateSubformData()/>
</cfif>

<!--- Form Page 3A processing --->
<cfif formSource eq 'page3A'>
	<!--- Set fields of the sub-form --->
	<cfset fields=['insured','Medium','EmpUnName','EmpUnAddr','EmpUnContact','EmpUnPhone','COBRAStart','COBRAEnd','NxtPremDue','Other','PresCov','PresCovCap','PresCovCapAmt','PresCovMail',
	'AMedicaid','AMedicaidDate','RespMedicaid','AMedicare','AMedicareDate','RespMedicare','AMedicareD','ALIS'] />
	<cfset checkFields=['Medicaid','MedicareAB','MedicareD','PrivateIns','UMedicaidDate','UMedicareDate','COBRA','CHIP']/>
	<cfset subformObj.setFields(fields)/>
	<cfset subformObj.setCheckFields(checkFields)/>
	<!--- extract user inputs from subform --->
	<cfset subformObj.extractFormData()/>
	<cfset subformObj.extractCheckboxData()/>
	<!--- update subform table entry for user --->
	<cfset subformObj.updateSubformData()/>
	<cfset subformObj.updateCheckboxData()/>
</cfif>

<!--- Form Page 3B processing --->
<cfif formSource eq 'page3B'>
	<!--- Set fields of the sub-form --->
	<cfset fields=['ASSISSDIDate','RespASSISSI','AMarket','AMarketDate','RespAMarket','CovOtherTxt','relation','relOther','InsName','InsAddr','InsAddrCounty','InsSS','InsPhone','InsCarrier',
	'InsCarAddr','InsCarPhone','InsCarPolicyNum','EmpUnName','EmpUnAddr','PresCar','PresCarAddr','PresCarPhone','PrescarID','PresCoPay','PresDeduct','EligVetDrugBen','RecPresDrugBen'] />
	<cfset checkFields=['NoASSISSDI','UASSISSDI','YesSSI','YesSSDI','UASSISSDIDate','UMarketDate','CovMed','CovPres','CovOther']/>
	<cfset subformObj.setFields(fields)/>
	<cfset subformObj.setCheckFields(checkFields)/>
	<!--- extract user inputs from subform --->
	<cfset subformObj.extractFormData()/>
	<cfset subformObj.extractCheckboxData()/>
	<!--- update subform table entry for user --->
	<cfset subformObj.updateSubformData()/>
	<cfset subformObj.updateCheckboxData()/>
</cfif>

<!--- Form Page 4 processing ---> 
<cfif formSource eq 'page4'>
	<!--- Set fields of the sub-form --->
	<cfset fields=['CMName','agency','CMaddr','CMWPhone','CMFaxNum','CMCPhone','email','perm','HIVAware','CPName','relation','CPAddr','CPHPhone','CPWPhone','CPCPhone','PName','PPhone'] />
	<cfset subformObj.setFields(fields)/>
	<!--- extract user inputs from subform --->
	<cfset subformObj.extractFormData()/>
	<!--- update subform table entry for user --->
	<cfset subformObj.updateSubformData()/>
</cfif>

<!--- Redirect to desired destination page(performed last) --->
<!--- If 'save progress' button hit submit form and redirect to homepage(do not change application status) --->
<cfif IsDefined('Form.save')>
	<cflocation url="/CS491-RDE/home.cfm?savedApplication">
</cfif>
<cfif formSource eq 'page1'>
	<cfif IsDefined("FORM.previous")>
		<cflocation url="/CS491-RDE/application/dhas_instructions_page3.cfm">
	<cfelseif IsDefined("FORM.next")>
  		<cflocation url="/CS491-RDE/application/dhas_page2.cfm">
	</cfif>
<cfelseif formSource eq 'page2'>
	<cfif IsDefined("FORM.previous")>
		<cflocation url="/CS491-RDE/application/dhas_page1.cfm">
	<cfelseif IsDefined("FORM.next")>
  		<cflocation url="/CS491-RDE/application/dhas_page3.cfm">
	</cfif>
<cfelseif formSource eq 'page3A'>
	<cfif IsDefined("FORM.previous")>
		<cflocation url="/CS491-RDE/application/dhas_page2.cfm">
	<cfelseif IsDefined("FORM.next")>
  		<cflocation url="/CS491-RDE/application/dhas_page4.cfm">
	</cfif>
<cfelseif formSource eq 'page3B'>
	<cfif IsDefined("FORM.previous")>
		<cflocation url="/CS491-RDE/application/dhas_page3.cfm">
	<cfelseif IsDefined("FORM.next")>
  		<cflocation url="/CS491-RDE/application/dhas_page5.cfm">
	</cfif>
<cfelseif formSource eq 'page4'>
	<cfif IsDefined("FORM.previous")>
		<cflocation url="/CS491-RDE/application/dhas_page4.cfm">
	<cfelseif IsDefined("FORM.next")>
		<!-- Change status of Application to Review-->
		<cfset subformObj.updateApplicationStatus("R")/>
  		<cflocation url="/CS491-RDE/home.cfm?submitApplication">
	</cfif>
</cfif>
