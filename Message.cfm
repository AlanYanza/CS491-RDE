<cfinclude template="header.cfm">

<html !DOCTYPE>
<header>
	<title>Message Center</title>
</header> 
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-3" id="sidebar">
			THIS IS THE SIDEBAR 
		</div>
		<div class="col-lg-9 hidden-xs hidden-sm hidden-md" id="content">
			THIS IS WHERE EMAILS ARE 
			WILL HIDE WHEN ON MOBILE 
		</div>
	</div>
</div>
</html>

<style>

#sidebar { 
	background-color: green;
	min-height: 100vh;
}

#content {
	background-color: pink;
	min-height: 100vh;
}

</style>