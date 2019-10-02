<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
table, th, td 
{
  border: 1px solid black;
  border-collapse: collapse;
  background-color:	#7CFC00;
  text-align:center;
  padding: 15px;
  
}
</style>
<title> All Data Here </title>
</head>
<body  style="background-color:#00bfff">
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<br><br><br>
<form method="post">
<input type="button" value="back" onClick="window.location.href='success.jsp'">
<table align="center">
<caption> <b>User Database </b></caption>
<tr>
<td> Name </td>
<td> EmailId </td>
<td> Password </td>
<td> Age </td>
<td> Gender </td>
<td> City </td>

</tr>
<%

try
{
	String e=null;
	e=request.getParameter("u");
	Class.forName("org.mariadb.jdbc.Driver");
	
	Connection  con=DriverManager.getConnection("jdbc:mariadb://localhost:3306/work","root","root");
	
	
	PreparedStatement stmt=con.prepareStatement("SELECT * from data where Emailid=?");
	stmt.setString(1, e);
    ResultSet rs=stmt.executeQuery();
   
    while(rs.next())
    {
    	 //email=rs.getString("EmailId");
%>
<tr>
<td> <%=rs.getString("Name") %> </td>
<td> <%=rs.getString("Emailid") %> </td>
<td> <%=rs.getString("Password") %></td>
<td> <%=rs.getString("Age") %> </td>
<td> <%=rs.getString("Gender") %> </td>
<td> <%=rs.getString("City") %> </td>

</tr>
 <%
    }
    
  %>
    </table>
   
</form>
<center>
<br>
<button onclick="window.location.href='delete.jsp?e=<%=e%>'">delete</button>
<button onclick="window.location.href='edit.jsp?e=<%=e%>'"> edit </button>
</center>

<%
    rs.close();
    stmt.close();
    con.close();
}
catch(Exception e)
{
	e.printStackTrace();
}
    %>
   
</body>
</html>