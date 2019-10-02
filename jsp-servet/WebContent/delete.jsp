<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<% 

String e=request.getParameter("e");
Class.forName("org.mariadb.jdbc.Driver");
Connection  con=DriverManager.getConnection("jdbc:mariadb://localhost:3306/work","root","root");

String query="delete from data where Emailid=?";

PreparedStatement ps=con.prepareStatement(query);
ps.setString(1, e);
ps.executeUpdate();
ps.close();
con.close();


response.sendRedirect("success.jsp");

%>

</body>
</html>