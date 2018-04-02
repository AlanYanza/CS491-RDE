<cfset SessionClass=createObject('component','components.SessionTools')/>
<cfset SessionClass.checkIfLoggedIn()/>
<html !DOCTYPE>
<head>
	<title>Message Center</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head> 
<body>
<cfinclude template="navbar.cfm">
<div class="container">
<app-root></app-root>
</div>
<script type="text/javascript" src="message/dist/inline.bundle.js"></script><script type="text/javascript" src="message/dist/polyfills.bundle.js"></script><script type="text/javascript" src="message/dist/styles.bundle.js"></script><script type="text/javascript" src="message/dist/vendor.bundle.js"></script><script type="text/javascript" src="message/dist/main.bundle.js"></script></body>
</body>
</html>