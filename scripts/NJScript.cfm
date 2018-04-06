<cfset SessionClass=createObject('component',"CS491-RDE.components.SessionTools")/>
<cfset SessionClass.checkIfLoggedIn()/>
<cfset formObj=createObject('component','CS491-RDE.components.Form').init('NJ',session.userID)>
<cfset formObj.noAccessRedirect('/CS491-RDE/home.cfm')>
<!--- Determine which page form came from --->
<cfset formSource=FORM.formPage/>
<cfset tableName=FORM.tableName/>
<cfset subformObj=createObject('component','CS491-RDE.components.Subform').init('NJ',session.userID,tableName)/>
<cfset appExist=subformObj.checkIfAppExist()/>

<!--- Form Page 1 processing --->
<cfif formSource eq 'page1'>
	<!--- Determined HICP Status--->
	<cfif StructKeyExists(form,'HICP')>  
   		<cfset HICPStatus= "Y" />  
	<cfelse>  
   		<cfset HICPStatus= "N" />  
	</cfif> 
	<!--- Update HICP Status--->
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
	<!--- Update User's signatures'--->
	<cfset subformObj.updateSignature("signature","signatureDate")/>
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
		<!--- Insert Documents into AppDocument Table--->
		<cfif subformObj.CheckApplicationStatus() eq 'P' >
			<cfset InsertNJDocuments()/> 
		</cfif>
		<!--- Change status of Application to Review--->
<!---		<cfset subformObj.updateApplicationStatus("R")>--->
			<cfset subformObj.submitApplication()>
  		<cflocation url="/CS491-RDE/home.cfm?submitApplication">
	</cfif>
</cfif>

<!--- Function that inserts Documents for NJ Application into AppDocument Table--->
<cffunction name="InsertNJDocuments" displayname="InsertNJDocumentsIntoAppDocumetTable" 
hint="Inserts Documents for NJ Appliation into the AppDocument Table" >
	<cfset var label="Verification of Income<br> <b>Note</b>:current pay stubs, unemployment records,etc"/>
	<cfset subformObj.insertDocument(label,'Y') />
	
	<cfset var label="Most Recent Tax Return(Federal, State, and/or City)<br> 
	<b>Note:</b>If no tax return, submit most recent W-2 form(s),1099 forms(s) etc"/>
	<cfset subformObj.insertDocument(label,'Y') />
	
	<cfset var label="Heath Insurance/Prescription Card<br> <b>Note:</b>Front and Back"/>
	<cfset subformObj.insertDocument(label,'Y') />
	
	<cfset var label="Certified by Physician form(DHAS-37)<br> <b>Note:</b>Completed and Signed"/>
	<cfset subformObj.insertDocument(label,'Y') />
	
	<cfset var label="Certified by Pharmacist form(DHAS-38)<br> <b>Note:</b>Completed and Signed"/>
	<cfset subformObj.insertDocument(label,'Y') />
		
	<cfset var label="Certification of Seperation form(DHAS-40)<br> <b>Note:</b>Completed and Signed"/>
	<cfset subformObj.insertDocument(label,'N') />
	
	<cfset var label="Social Security Disability benefits Notice of Award"/>
	<cfset subformObj.insertDocument(label,'N') />
	
	<cfset var label="Current health insurance premium notice<br> 
	<b>Note:</b>must include premium identification number,premimum amounts, payment due dates, and where to send payments"/>
	<cfset subformObj.insertDocument(label,'N') />
	
	<cfset var label="Completed COBRA election form and/or current COBRA billing invoice"/>
	<cfset subformObj.insertDocument(label,'N') />
</cffunction>
