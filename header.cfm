<style>
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}
li {
    float: left;
}
li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}
li a:hover {
    background-color: #111;
}
p.small {
	border-style: dotted;
	width: 80%;
}
</style>
<cfinclude template="bootstrap.html">
<p>
<ul>
  <li><a href="./Home.cfm">Home</a></li>
  <li><a href="./index.cfm">Application</a></li>
  <li><a href="./Message.cfm">Messages</a></li>
  <li style="float:right"><a href="./Signout.cfm">Signout</a></li>
  <li style="float:right"><a href="">Name</a></li>
</ul>
</p>