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
  <h3 class="t1">Need Blood</h3>
</center>
<center><div id="d3" style="width:790px;">
<form id="donarform" action="" method="get">
<div id="f2">
				<label>
					<span>Blood Group: (required)</span>
					<select name="blood_group" id="blood_group" tabindex="3" required>
						<option value="">Please select your blood group</option>
						<option value="o+" >o+</option>
						<option value="o-" >o-</option>
						<option value="a+" >a+</option>
						<option value="a-" >a-</option>
						<option value="b+" >b+</option>
						<option value="b-" >b-</option>
						<option value="ab+" >ab+</option>
						<option value="ab-" >ab-</option>
																			
					</select>
				</label>
			</div></br>
<div>
				<button name="submit" type="submit" value="" id="contact-submit">submit</button>
			</div>
			
			</form>
<div id="">
<h3>Donar List:</h3>
 <%
 	PrintWriter pw=response.getWriter();
  String s1=request.getParameter("blood_group");
  String s2="active";
  pw.println("<div id='result1' style='width:804px;'>");
  try{
 		Class.forName("com.mysql.jdbc.Driver");	
 		
 		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/blood","root","root");
 	Statement st=con.createStatement();
 	ResultSet rs=st.executeQuery("select * from donar where bloodgroup='"+s1+"' and state='"+s2+"'");
 	pw.println("<table colspan='5' border='1' name='table'>");pw.println("<tr>");
 	pw.println("<th>");pw.println("Name");pw.println("</th>");
 	pw.println("<th>");pw.println("BloodGroup");pw.println("</th>");
 	pw.println("<th>");pw.println("Phone No.");pw.println("</th>");
 	pw.println("<th>");pw.println("Mail Id ");pw.println("</th>");
 	pw.println("<th>");pw.println("Address");pw.println("</th>");
 	pw.println("<th>");pw.println("Age");pw.println("</th>");
 	pw.println("<th>");pw.println("Gender");pw.println("</th>");
 	pw.println("</tr>");
 	
 while(rs.next())
 {
	 pw.println("<tr>");
 	pw.println("<td>");pw.println(rs.getString(1));pw.println("</td>");
 	pw.println("<td>");pw.println(rs.getString(3));pw.println("</td>");
 	pw.println("<td>");pw.println(rs.getString(5));pw.println("</td>");
 	pw.println("<td>");pw.println(rs.getString(4));pw.println("</td>");
 	pw.println("<td>");pw.println(rs.getString(7));pw.println("</td>");
 	pw.println("<td>");pw.println(rs.getString(8));pw.println("</td>");
 	pw.println("<td>");pw.println(rs.getString(9));pw.println("</td>");
 	
 	
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

