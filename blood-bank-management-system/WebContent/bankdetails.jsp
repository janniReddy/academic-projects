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
   <center><div id="main">
  <div id="d1" style="width:805px;height:190px;">
  <img src="1.jpg" id="img"/>
  <h1>ALL INDIA BLOOD BANK MANAGEMENT</h1>
  <h2>for the people, by the people    ph.no:8099974379</h2>
  </div>
  <center> <div id="d2" style="width:812px;">
  <h3><span id="invalid9"></span></h3>
  <h3 class="t1">Blood Stock Details</h3>
  
</center>

<div id="logout7">     <a href="index.html" >
				<button name="submit" type="submit" value="" id="contact-submit"  >Logout</button></a>
			</div><br>
			
<div id="result">
 <%
 	PrintWriter pw=response.getWriter();
  String s1=request.getParameter("textt_name");
  String s2=request.getParameter("ppassword");
 
  pw.println("<div id='result7' style='width:804px;'>");
  try{
 		Class.forName("com.mysql.jdbc.Driver");	
 		
 		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/blood","root","root");
 	Statement st=con.createStatement();
 	ResultSet rs=st.executeQuery("select * from bankdetails where loginid='"+s1+"' and password='"+s2+"'");
 	
 	pw.println("<table colspan='5' border='1' width='500' id='table'>");
 	 pw.println("<tr>");
 	pw.println("<td>");pw.println("blood groups");pw.println("</td>");
 	pw.println("<td>");pw.println("available stock(in ml)");pw.println("</td>");
  	pw.println("</tr>");
 while(rs.next())
 {
	 
	
	 pw.println("<tr>"); pw.println("<td>");pw.println("o+");pw.println("</td>");pw.println("<td>");pw.println(rs.getString(5));pw.println("</td>");pw.println("</tr>");
	 pw.println("<tr>");pw.println("<td>");pw.println("o-");pw.println("</td>");pw.println("<td>");pw.println(rs.getString(6));pw.println("</td>");pw.println("</tr>");
	pw.println("<tr>");pw.println("<td>");pw.println("a+");pw.println("</td>");pw.println("<td>");pw.println(rs.getString(7));pw.println("</td>");pw.println("</tr>");
	pw.println("<tr>");pw.println("<td>");pw.println("a-");pw.println("</td>");pw.println("<td>");pw.println(rs.getString(8));pw.println("</td>");pw.println("</tr>");
	pw.println("<tr>");pw.println("<td>");pw.println("b+");pw.println("</td>");pw.println("<td>");pw.println(rs.getString(9));pw.println("</td>");pw.println("</tr>");
	pw.println("<tr>");pw.println("<td>");pw.println("b-");pw.println("</td>");pw.println("<td>");pw.println(rs.getString(10));pw.println("</td>");pw.println("</tr>");
	pw.println("<tr>");pw.println("<td>");pw.println("ab+");pw.println("</td>");pw.println("<td>");pw.println(rs.getString(11));pw.println("</td>");pw.println("</tr>");
	pw.println("<tr>");pw.println("<td>");pw.println("ab-");pw.println("</td>");pw.println("<td>");pw.println(rs.getString(12));pw.println("</td>");pw.println("</tr>");
 	
 	
 }
 
 pw.println("</table>");pw.println("<br>");pw.println("<br>");
 pw.println("<a href='updatenow.html'>");pw.println("<input type='submit' value=' UPDATE NOW '></input><br>");pw.println("</a>");pw.println("<br>");
 pw.println("</div>");
 	}
 	catch(Exception e){
 		pw.println(e.getMessage());
 	}
 %>
</div>
</div></center>
</div></center>
 </body>
</html>

