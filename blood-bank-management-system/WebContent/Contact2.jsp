<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Driver"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
PrintWriter pw=response.getWriter();
//System.out.println("janni");
//pw.println("hi");
try
{
	Class.forName("com.mysql.jdbc.Driver");	
	Connection con=
DriverManager.getConnection("jdbc:mysql://localhost:3306/blood","root","root");
Statement st=con.createStatement();
String s="";
ResultSet rs=st.executeQuery("select distinct place from bloodbank ");
while(rs.next())
{
	s=s+rs.getString("place")+",";
	s=s.trim();
}
pw.println(s);
}
catch(Exception e){
	System.out.println(e.getMessage());
}

%>