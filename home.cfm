<cfset SessionClass=createObject('component','components.SessionTools')/>
<cfset SessionClass.checkIfLoggedIn()/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Application</title>
    <cfinclude template="head.cfm"/>
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
<cfinclude template="navbar.cfm">
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
