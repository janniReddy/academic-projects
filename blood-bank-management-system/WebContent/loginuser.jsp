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
  <center> <div id="d2" style="width:722px;">
 <div id="home"><a href="index.html" >home</a></div> 
 
 <div id="logout">           <a href=index.html title="Logout From My Account">
				<button name="submit" type="submit" value="" id="contact-submit"  >Logout</button></a>
			</div><br>
			<% HttpSession sess=request.getSession();%>
<h3><span id="invalid2"><%=(String)sess.getAttribute("naam")%></span></h3><br>


<div>   
 <a href=active.html title="I Want To Donate">
				<button name="submit" type="submit" value="" id="contact-submit"  >Make me active for donation</button></a>
			</div>
			
			<br><br>

<div>           <a href=inactive.html title="I Don't Want To Donate Now">
				<button name="submit" type="submit" value="" id="contact-submit"  >Make me INactive for donation</button></a>
			</div>
			
			<br><br>

</div></center>
</div></center>

 </body>
</html>

