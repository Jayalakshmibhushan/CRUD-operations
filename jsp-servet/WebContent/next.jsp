<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 


String s1=request.getParameter("name");
String s2=request.getParameter("email");
String s3=request.getParameter("pass");
String s4=request.getParameter("age");
String s5=request.getParameter("gender");
String s6=request.getParameter("city");

%>

<table> 
<tr> 

<td>Name  </td>

<td> <%=s1 %></td>


</tr>
<tr> 

<td>  EmailId   </td>
<td>    <%=s2 %>       </td>
</tr>  

<tr>
<td> Password </td>
<td>  <%=s3 %>  </td>

</tr>
<tr>

<td> Age </td>
<td> <%=s4 %> </td>
</tr>

<tr>
<td> Gender </td>
<td> <%=s5 %></td>

</tr>

<tr> 
<td>  City </td>
<td> <%=s6 %> </td>

</tr>

</table>

<br>

<%

response.sendRedirect("login.jsp");

%>>
</body>
</html>