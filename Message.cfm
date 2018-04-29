<!--- If user isn't logged in, redirect them back to login page --->
<cfset SessionClass=createObject('component','components.SessionTools')/>
<cfset SessionClass.checkIfLoggedIn()/>
<cfset SessionClass.ClearSessionAppID() > <!--- If appID session variable set, clear it --->
<html !DOCTYPE>
<head>
	<title>Message Center</title>
	<cfinclude template="head.cfm">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
</head> 
<body>
<cfinclude template="navbar.cfm">
<div class="container" style="outline:2px solid #136AA9; padding:0; height:calc(100% - 72px);">
<app-root></app-root>
</div>
<script type="text/javascript" src="message/dist/inline.bundle.js"></script><script type="text/javascript" src="message/dist/polyfills.bundle.js"></script><script type="text/javascript" src="message/dist/styles.bundle.js"></script><script type="text/javascript" src="message/dist/vendor.bundle.js"></script><script type="text/javascript" src="message/dist/main.bundle.js"></script></body>
</body>
</html>