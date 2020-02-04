<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <link rel="stylesheet" type="text/css" href="stylingsheet1.css"/> 
 </head>

 <body>
   <center>
   <div id="main">
  <div id="d1" style="width:805px;height:190px;">
  <img src="1.jpg" id="img"/>
  <h1>ALL INDIA BLOOD BANK MANAGEMENT</h1>
  <h2>for the people, by the people    ph.no:8099974379</h2>
  </div>
  <center>
   <div id="d2" style="width:812px;">
  <h1 class="t1">Contact Us</h1>
  <h2 class="jj">plot no:62,Reddy Road</h2>
  <h2 class="jj">Abids,Hanuman Tekdi</h2>
  <h2 class="jj">Hyderabad,500001</h2>
  
  <div id="j4">
<h2>Leave Your Suggestions:</h2>

<form method="get" action="http://localhost:4649/bloodmanagement/suggest">
<textarea cols="50" rows="18" name="textarea" required></textarea>
<input type="submit" value="submit" />
<span id="invalid5"></span>
</form>

</div>
</div>

</center>

</div></center>
 </body>
</html>

