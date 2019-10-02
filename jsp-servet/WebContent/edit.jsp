<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<form action="rrr1"  method="post">
<%
String u=null;
u=request.getParameter("e");
Class.forName("org.mariadb.jdbc.Driver");

Connection  con=DriverManager.getConnection("jdbc:mariadb://localhost:3306/work","root","root");


PreparedStatement ps=con.prepareStatement("SELECT * from data where Emailid=?");
ps.setString(1,u);
ResultSet rs=ps.executeQuery();

while(rs.next())
{
%>
.<table>
<tr>
<td> Name: </td>
<td> <input type="text"  name="name" value=<%=rs.getString("Name") %>> </td>

</tr>

<tr>

<td> EmailId: </td>
<td> <input type="text"  name="email" value=<%=rs.getString("Emailid") %>> </td> 
</tr>

<tr>
<td> Password: </td>
<td> <input type="password" name="pass" value=<%=rs.getString("Password") %>> </td>
</tr>

<tr>
<td> Age: </td>
<td> <input type="number"   name="age" value=<%=rs.getString("Age") %>> </td>
</tr>

<tr>
<td> Gender: </td>
<td> <input type="text"     name="gender" value=<%=rs.getString("Gender") %>> </td>
</tr>

<tr>
<td> City: </td>
<td> <input type="text"     name="city" value=<%=rs.getString("City") %>>  </td>
</tr>
</table>
<%
}
%>


<input type="submit" value="update">
</form>

</body>
</html>