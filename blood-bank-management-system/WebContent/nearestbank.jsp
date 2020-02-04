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
  <h3 class="t1">Nearest Blood Banks</h3>
</center>
<center><div id="d3" style="width:790px;">
<form id="donarform" action="" method="get">
<div id="f2">
				<label>
					<span>Place: (required)</span>
					<select name="blood_group" id="blood_group" tabindex="3" required>
						<option value="">Please select your Place</option>
						<option value="hyderabad" >Hyderabad</option>
						<option value="secunderabad" >secunderabad</option>
						<option value="warangal" >warangal</option>
						<option value="delhi" >delhi</option>
						<option value="jangaon" >jangaon</option>
						<option value="nizamabad" >nizamabad</option>
						<option value="maharastra" >maharastra</option>
						<option value="gujarat" >gujarat</option>
																			
					</select>
				</label>
			</div></br>
<div>
				<button name="submit" type="submit" value="" id="contact-submit">search</button>
			</div>
			
			</form>
<div id="result">
 <%
 	PrintWriter pw=response.getWriter();
  String s1=request.getParameter("blood_group");
  String s2="active";
 
  pw.println("<div id='result2' style='width:804px;'>");
  pw.println("<h3>BloodBank List In '"+s1+"':</h3>");
  try{
 		Class.forName("com.mysql.jdbc.Driver");	
 		
 		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/blood","root","root");
 	Statement st=con.createStatement();
 	ResultSet rs=st.executeQuery("select * from bloodbank where place='"+s1+"'");
 	pw.println("<table colspan='15' width='500' border='1' id='table'>");
 while(rs.next())
 {
	 pw.println("<tr>");
 	pw.println("<td>");
 	pw.println(rs.getString(1));pw.println("</br>");
 	pw.println(rs.getString(3));pw.println("</br>");
 	pw.println(rs.getString(4));pw.println("</br>");
 	pw.println(rs.getString(5));pw.println("</br>");
 	
 	pw.println("</td>");
 	pw.println("</tr>");
 }
 
 pw.println("</table>");
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

