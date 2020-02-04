<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <link rel="stylesheet" type="text/css" href="stylingsheet1.css"/> 
 </head>

 <body>
  <center><div id="main">
  <div id="d1" style="width:715px;height:190px;">
  <img src="1.jpg" id="img"/>
  <h1>ALL INDIA BLOOD BANK MANAGEMENT</h1>
  <h2>for the people, by the people    ph.no:8099974379</h2>
  </div>
  <center><div id="d3" style="width:700px;">
  <a href="index.html" >home</a>
  <div id="logout">           <a href=index.html title="Logout From My Account">
				<button name="submit" type="submit" value="" id="contact-submit"  >Logout</button></a>
			</div><br>
<form id="donarform" action="http://localhost:4649/bloodmanagement/loginActive" method="get">
<div id="f1">
<br>
				<label>
					<span>Full Name: (required)</span>
					<input type="text" name="full_name"  placeholder="Please enter your full name" tabindex="1" required autofocus>
				</label>
			</div></br><br>
<div id="f0">
				<label>
					<span>Password: </span>
					<input type="password" name="password"  placeholder="Please create your password" tabindex="2" required autofocus>
				</label>
				<span id="invalid"></span>
			</div></br><br>
<div>   

				<button name="submit" type="submit" value="" id="contact-submit"  >Make me active for donation</button>
			</div>
			
			<br><br>
 </form>
 </div></center>
</div></center>
 </body>
</html>
    