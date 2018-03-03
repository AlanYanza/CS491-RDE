<!DOCTYPE html>
<html lang="en">
<head>
    <title>Application</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        function myFunction() {
            document.getElementById("demo").innerHTML = "<form action=''><input type='file' name='pic' accept='image/*'></form>";
        
        }
        function Gone() {
            document.getElementById("demo").innerHTML = "YOU CLICKED ME!";
        }
</script>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav">
          <li class="active"><a href="#">Home</a></li>
          <li><a href="#">Application</a></li>
          <li><a href="./message.cfm">Messages <span class="badge">1</span></a></li>
        </ul>   
      <ul class="nav navbar-nav navbar-right">
          <li><a href="#"><span class="glyphicon glyphicon-user"></span> Name</a></li>
          <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Signout</a></li>
        </ul>
    </div>
  </div>
</nav>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">Start New Application</div>
        <div class="panel-body">
            <ul>
                <li><a href="application/dhas_instructions_page1.cfm">Participation in the AIDS Drug Distribution Program (ADDP) and Health Insurance Continuation Program (HICP)</a></li>
            </ul> 
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">Edit Existing Application</div>
        <div class="panel-body">Pick up where you left off or make edits to your application<form method="get" action="Page4.cfm"><button class="btn btn-default pull-right" type="submit">Click Here</button></form></div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">Application Status</div>
        <div class="panel-body">You do not have any pending applications at this time.</div>
        <p id="demo"></p>
    </div>
</div>
</body>
</html>
