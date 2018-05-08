<!-- Session Page Protection -->
<cfset SessionClass=createObject('component',"CS491-RDE.components.SessionTools")/>
<cfset SessionClass.checkIfLoggedIn()/>
<cfif isDefined('url.appID')>
	<!-- create a session variable for appID -->
	<cfset session.appID=url.appID>
</cfif>
<!-- If a user access level,More Session Page Protection -->
<cfif session.accessLevel neq 'admin'>
	<cfset SessionClass.checkIfuser()>
	<cfset SessionClass.NoAppIDRedirect()>
	<cfset SessionClass.validateAppID()>
</cfif>
<cfset tableName='NJSection4'/>
<cfset subformClass=createObject('component','CS491-RDE.components.Subform').init('NJ',session.userID,tableName,session.appID)/>
<!-- Application Page pre-processing -->
<cfset subformClass.createSubformData()/>
<cfset subformData=subformClass.retrieveDataForSubform()/>
<cfset applicantSignature=subformClass.getSignature("signature")/>
<cfset spouseSignature=subformClass.getSignature("spouseSig")/>

<!DOCTYPE html>
<html lang="en">
<head>
 	<title>Application</title>
 	<cfinclude template="../head.cfm"/>
	<link rel="stylesheet" href="../css/signature-pad.css">
	<script src="../js/signature_pad.umd.js"></script>
	<script>
 		"use strict";
		$(document).ready(function(){
			<!--- Determine Flag(reviewing or editing) --->
			<cfif ((session.accessLevel eq 'admin') || (subformClass.isUserReview()))>
				<cfoutput>
					$("##formData").find("*").attr("disabled", "true");
					$("input[type=hidden][name=formPage]").removeAttr("disabled");
					$("input[type=hidden][name=tableName]").removeAttr("disabled");
				</cfoutput>
			</cfif>

			$("form").find("input").attr("autocomplete", "off");

			var requiredFields = ["perm","CPName","Relation","CPAddr"];

			function checkRequired(selector) {
				$(selector).find("*").each(function(){
					if (requiredFields.indexOf($(this).attr("name")) != -1 ){
						$(this).attr("required", true);
					}
				});
			}

			function getSig(sigInput, sigPic) {
				if ($(sigInput).val() != "") {
					var tempCanvas = document.getElementById("getDisplayImage");
					var tempObject = new SignaturePad(tempCanvas, {backgroundColor: 'rgb(255, 255, 255)'});
					var newHeight = $("#getDisplayImage").width() * .5257;
					$("#getDisplayImage").css("height", newHeight.toString() + "px");
					resizeCanvas(tempObject, tempCanvas);
					tempObject.fromData(JSON.parse($(sigInput).val()));
					$(sigPic).html("<img src='" + tempObject.toDataURL() + "' class='img-responsive'  max-width='100%'>");
				}
			}

			getSig("#signature", "#signaturePic");
			getSig("#spouseSig", "#spouseSignaturePic");
			$("#temp").remove();
			
			$("button[type=submit][name=save]").click(function() {
				$("form").find("input").removeAttr("required");
			});
			$("button[type=submit][name=previous]").click(function() {
				$("form").find("input").removeAttr("required");
			});

			function contactCheck() {
				if (typeof $("input[type=radio][name=perm]:checked").val() === "undefined") {
					return;
				}
				if ($("input[type=radio][name=perm]:checked").val() == "Y") {
					$("#contactOption").show("slow");
					checkRequired("#contactOption");
				}
				else {
					$("#contactOption").hide("slow");
					$("#contactOption").find("input").removeAttr("required");
				}
			}

			contactCheck();
			$("input[type=radio][name=perm]").change(contactCheck);

			$("#signatureModal").on('shown.bs.modal', function () {
				var newHeight = $("#signature-pad-body").width() * .5257;
				$("#signature-pad-body").css("height", newHeight.toString() + "px");
				resizeCanvas(applicantSigPad, canvas);
				if ($("#signature").val() != "") {
					applicantSigPad.fromData(JSON.parse($("#signature").val()));
				}
 			});

 			$("#spouseSignatureModal").on('shown.bs.modal', function () {
				var newHeight = $("#spouse-signature-pad-body").width() * .5257;
				$("#spouse-signature-pad-body").css("height", newHeight.toString() + "px");
				resizeCanvas(spouseSigPad, spouseSigCanvas);
				if ($("#spouseSig").val() != "") {
					spouseSigPad.fromData(JSON.parse($("#spouseSig").val()));
				}
 			});
		});
		$(document).keypress(
			function(event){
				if (event.which == '13') {
					event.preventDefault();
				}
			}
		);
		$(window).resize(function() {
		 	var newHeight = $("#signature-pad-body").width() * .5257;
			$("#signature-pad-body").css("height", newHeight.toString() + "px");
			newHeight = $("#spouse-signature-pad-body").width() * .5257;
			$("#spouse-signature-pad-body").css("height", newHeight.toString() + "px");
			resizeCanvas(applicantSigPad, canvas);
			resizeCanvas(spouseSigPad, spouseSigCanvas);
		});
 	</script>
</head>
<body>
<cfinclude template="../navbar.cfm">
<div class="container">
	<h3>Progress</h3>
	<div class="progress">
		<div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width:100%">
			Page 5 of 5
		</div>
	</div>

	<!--<strong>APPLICATION FOR PARTICIPATION IN THE AIDS DRUG DISTRIBUTION PROGRAM AND/OR HEALTH INSURANCE CONTINUATION PROGRAM (Continued)</strong><br/><br/>-->
	<div class="well text-center"><h4>Section 4 - CERTIFICATION AND AUTHORIZATION BY APPLICANT</h4></div>

	<div class="text-justify">
		I certify that the information above is true and accurate to the best of my knowledge and I know that I can be prosecuted for perjury if I
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
		right to limit enrollment based upon the availability of funds.
	</div>

	<hr/>

	<form action="../scripts/NJScript.cfm" method="POST">
	<div id="formData">
	<input type="hidden" id="formPage" name="formPage" value="page4"/>
	<input type="hidden" id="tableName" name="tableName" value="<cfoutput>#tableName#</cfoutput>"/>

	<div class="row">
		<div class="col-sm-3">
			<label for="signature">Signature of Applicant <span style="color: red;">*</span></label>	
			<button type="button" class="btn btn-info" data-toggle="modal" data-target="#signatureModal">Attach/Update your signature</button>
			<input type="hidden" name="signature" id="signature" value='<cfoutput>#applicantSignature.signature#</cfoutput>' />
		</div>
		<div class="col-sm-6">
			<div id="signaturePic">
			</div>
		</div>
		<div class="col-sm-3">
			<label for="signatureDate">Date</label>
			<input type="date" class="form-control" id="signatureDate" name="signatureDate" value="<cfoutput>#subformData.signatureDate#</cfoutput>" readonly />
		</div>
	</div>

	<div class="row">
		<div class="col-sm-3">
			<label for="SpouseSig">Signature of Spouse/Partner</label>
			<button type="button" class="btn btn-info" data-toggle="modal" data-target="#spouseSignatureModal">Attach/Update your signature</button>
			<input type="hidden" name="spouseSig" id="spouseSig" value='<cfoutput>#spouseSignature.spouseSig#</cfoutput>' />
		</div>
		<div class="col-sm-6" id="spouseSignaturePic">
		</div>
		<div class="col-sm-3">
			<label for="spouseSigDate">Date</label>
			<input type="date" class="form-control" name="spouseSigDate" value="<cfoutput>#subformData.spouseSigDate#</cfoutput>" readonly />
		</div>
	</div>

	<hr/>

	<div class="form-group">
		<strong>Contact Person</strong>
		<br/>
		<label>May the Department of Human Services and the Department of Health contact an alternate person? <span style="color: red;">*</span></label>
		<br/>
		<label class="radio-inline"><input type="radio" name="perm" value="Y" <cfset subformClass.showRadioButton('perm',subformData,'Y')/> required />Yes</label>
		<label class="radio-inline"><input type="radio" name="perm" value="N" <cfset subformClass.showRadioButton('perm',subformData,'N')/>/>No</label>
	</div>

	<div id="contactOption">
		<div class="form-group">
			In the event that we need information regarding your participation in the program and you are unavailable, please indicate someone
			we may contact on your behalf.<br/>
			<label>Is this person aware of your HIV Status?</label>
			<br/>
			<label class="radio-inline"><input type="radio" name="HIVAware" value="Y" <cfset subformClass.showRadioButton('HIVAware',subformData,'Y')/>/>Yes</label>
			<label class="radio-inline"><input type="radio" name="HIVAware" value="N" <cfset subformClass.showRadioButton('HIVAware',subformData,'N')/>/>No</label>
		</div>

		<div class="row">
			<div class="col-sm-6"><div class="form-group">
				<label for="CPName">Name of Contact Person <span style="color: red;">*</span></label>
				<input type="text" class="form-control" name="CPName" value="<cfoutput>#subformData.CPName#</cfoutput>" required />
			</div></div>
			<div class="col-sm-6"><div class="form-group">
				<label for="Relation">Relationship to Applicant <span style="color: red;">*</span></label>
				<input type="text" class="form-control" name="Relation" value="<cfoutput>#subformData.Relation#</cfoutput>" required />
			</div></div>
		</div>
		<strong>Street Address, City, State, Zip <span style="color: red;">*</span></strong>
		<input type="text" class="form-control" name="CPAddr" value="<cfoutput>#subformData.CPAddr#</cfoutput>" required />
		<div class="row">
			<div class="col-sm-4"><div class="form-group">
				<label for="CPWPhone">Work Number</label>
				<input type="tel" class="form-control" name="CPWPhone" value="<cfoutput>#subformData.CPWPhone#</cfoutput>"/>
			</div></div>
			<div class="col-sm-4"><div class="form-group">
			  	<label for="CPHPhone">Home Number</label>
			  	<input type="tel" class="form-control" name="CPHPhone" value="<cfoutput>#subformData.CPHPhone#</cfoutput>"/>
			</div></div>
			<div class="col-sm-4"><div class="form-group">
			  	<label for="CPCPhone">Cell Number</label>
			  	<input type="tel" class="form-control" name="CPCPhone" value="<cfoutput>#subformData.CPCPhone#</cfoutput>"/>
			</div></div>
		</div>
	</div>

	<hr/>

	<strong>Preparer: </strong>
	<p>
		Anyone other than the applicant who prepared the form must provide his/her name and telephone number, in case questions should
		arise concerning the application.
	</p>

	<div class="row">
		<div class="col-sm-6">
			<label for="PName">Name of Preparer</label>
			<input type="text" class="form-control" name="PName" value="<cfoutput>#subformData.PName#</cfoutput>">
		</div>
		<div class="col-sm-6">
			<label for="PPhone">Phone</label>
			<input type="tel" class="form-control" name="PPhone" value="<cfoutput>#subformData.PPhone#</cfoutput>">
		</div>
	</div>

	<hr/>

	<strong>Case Manager Information</strong><br/>
	<div class="row">
		<div class="col-sm-6"><div class="form-group">
			<label for="CMName">Name of Case Manager:</label>
			<input type="text" class="form-control" name="CMName" value="<cfoutput>#subformData.CMName#</cfoutput>"></div></div>
		<div class="col-sm-6"><div class="form-group">
			<label for="agency">Agency Affiliation:</label>
			<input type="text" class="form-control" name="agency" value="<cfoutput>#subformData.agency#</cfoutput>"></div></div>
	</div>
	<strong>Address:</strong>
	<input type="" class="form-control" name="CMaddr" value="<cfoutput>#subformData.CMaddr#</cfoutput>"><br/>

	<div class="row">
		<div class="col-sm-4"><div class="form-group">
			<label for="CMWPhone">Work Number</label>
			<input type="tel" class="form-control" name="CMWPhone" value="<cfoutput>#subformData.CMWPhone#</cfoutput>">
		</div></div>
		<div class="col-sm-4"><div class="form-group">
		  	<label for="CMFaxNum">Fax Number</label>
		  	<input type="tel" class="form-control" name="CMFaxNum" value="<cfoutput>#subformData.CMFaxNum#</cfoutput>">
		</div></div>
		<div class="col-sm-4"><div class="form-group">
		  	<label for="CMCPhone">Cell Number</label>
		  	<input type="tel" class="form-control" id="CMCPhone" name="CMCPhone" value="<cfoutput>#subformData.CMCPhone#</cfoutput>">
		</div></div>
	</div>

	<div class="form-group">
	<label for="email">Case Manager's Email Address:</label>
	<input type="email" class="form-control" name="email" value="<cfoutput>#subformData.email#</cfoutput>"><br/>
	</div>
	</div>
	<div class="text-center">
		<button type="submit" class="btn btn-default" name="previous" value="prevous">Previous</button>
		<cfif ((session.accessLevel eq 'admin') || (subformClass.isUserReview()))>
			<button type="submit" class="btn btn-default" name="exit" value="exit">Exit</button>
		<cfelse>
			<button type="submit" class="btn btn-default" name="save" value="save">Save Progress &#38; Exit</button>
		</cfif>
		<cfif ((session.accessLevel neq 'admin') AND (NOT subformClass.isUserReview()))>
			<button type="submit" class="btn btn-default" name="next" value="next">Submit Application</button>
		</cfif>
	</div>
	</form>
	<div style="height: 50px;"></div>

	<div id="signatureModal" class="modal fade" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-body">
					<div id="sigBody">
						<div id="signature-pad" class="signature-pad">
							<div id="signature-pad-body" class="signature-pad--body">
								<canvas id="canvas"></canvas>
							</div>
						    <div class="signature-pad--footer">
						      <div class="description"><font size="3" color="black">Sign Above</font></div>

						      <div class="signature-pad--actions">
						        <div>
						        	<button type="button" class="btn btn-info" data-action="clear">Clear</button>
						        	<button type="button" class="btn btn-info" data-action="undo">Undo</button>
						        </div>
						        <div>
						          	<button type="button" class="btn btn-success" data-action="save">Save</button>
						        </div>
						      </div>
						    </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="spouseSignatureModal" class="modal fade" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-body">
					<div id="sigBody">
						<div id="spouseSignaturePad" class="signature-pad">
							<div id="spouse-signature-pad-body" class="signature-pad--body">
								<canvas id="spouseCanvas"></canvas>
							</div>
						    <div class="signature-pad--footer">
						      <div class="description"><font size="3" color="black">Sign Above</font></div>

						      <div class="signature-pad--actions">
						        <div>
						        	<button type="button" class="btn btn-info" data-action="clear">Clear</button>
						        	<button type="button" class="btn btn-info" data-action="undo">Undo</button>
						        </div>
						        <div>
						          	<button type="button" class="btn btn-success" data-action="save">Save</button>
						        </div>
						      </div>
						    </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="temp" style="position: relative; visibility: hidden; width: 100%; height: 100%; max-width: 660px; max-height: 347px;">
		<canvas id="getDisplayImage" style="position: relative; width: 100%; height: 100%;"></canvas>
	</div>	
  	<script src="../js/app.js"></script>
  	<div style="height: 50px;"></div>
</div>
</body>
</html>