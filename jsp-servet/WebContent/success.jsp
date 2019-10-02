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
<title> Welcome User </title>
</head>
<body style="background-color:#00bfff">
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.*" %>

<br><br><br>
<form method="post">
<table align="center">
<caption> <b>User Database </b></caption>
<tr>

<td> Name     </td>
<td> Emailid  </td>

<td> City     </td>


</tr>
<%

try
{
	Class.forName("org.mariadb.jdbc.Driver");
	
	Connection  con=DriverManager.getConnection("jdbc:mariadb://localhost:3306/work","root","root");
	String q="select * from data";
	Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery(q);
   
    while(rs.next())
    {
    	
%>

    <tr> <td> <a href="display.jsp?u=<%=rs.getString("Emailid")%>"> <%=rs.getString("Name") %>  </a>   </td>  
    <td><%=rs.getString("Emailid") %>  </td>  
    
    <td><%=rs.getString("City") %>     </td>  </tr>
    <%
    }
    
    %>
    </table>
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
   
    	

</form>
	
    
<center> <br>

<input type="button" value="LogOut" onClick="window.location.href='login.jsp'">

</center>

</body>

</html>