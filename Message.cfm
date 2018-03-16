<cfset SessionClass=createObject('component','components.SessionTools')/>
<cfset SessionClass.checkIfLoggedIn()/>
<html !DOCTYPE>
<head>
	<title>Message Center</title>
	<cfinclude template="head.cfm">
</head> 
<body>
<cfinclude template="header.cfm">
<app-root></app-root>
<script type="text/javascript" src="message/dist/inline.bundle.js"></script><script type="text/javascript" src="message/dist/polyfills.bundle.js"></script><script type="text/javascript" src="message/dist/styles.bundle.js"></script><script type="text/javascript" src="message/dist/vendor.bundle.js"></script><script type="text/javascript" src="message/dist/main.bundle.js"></script></body>
</body>
</html>