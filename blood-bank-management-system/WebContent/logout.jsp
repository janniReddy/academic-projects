<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
HttpSession sess=request.getSession();

System.out.println((String)sess.getAttribute("naam"));
RequestDispatcher rd=request.getRequestDispatcher("index.html");
rd.forward(request, response);
%>