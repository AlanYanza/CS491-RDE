<html>
<head>
  <title>Application</title>
  <cfinclude template="head.cfm">
</head>
<body>
<cfinclude template="header.cfm">
<div class="container">
<center><b><font size="6" color="black">ADDP Application Page</font></b></center>
<br><br>
<script>
function myFunction() {
    document.getElementById("demo").innerHTML = "<form action=''><input type='file' name='pic' accept='image/*'></form>";
	
}
function Gone() {
    document.getElementById("demo").innerHTML = "YOU CLICKED ME!";
	
}
</script>
    <div class="panel panel-success">
      <div class="panel-heading">New Application</div>
      <div class="panel-body">Haven't started an application yet? <form method="get" action="Page1.cfm"><button class="btn btn-default pull-right" type="submit">Click Here</button></form></div>
    </div>
  <div class="panel panel-warning">
      <div class="panel-heading">Edit Existing Application</div>
      <div class="panel-body">Pick up where you left off or make edits to your application<form method="get" action="Page4.cfm"><button class="btn btn-default pull-right" type="submit">Click Here</button></form></div>
    </div>
    <div class="panel panel-danger">
      <div class="panel-heading">Application Status</div>
      <div class="panel-body">See where is your application is <button class="btn btn-default pull-right" onclick="myFunction()">Click Here</button></div>
	  <p id="demo"></p>
    </div>
  </div>
</div>
</body>
</html>
