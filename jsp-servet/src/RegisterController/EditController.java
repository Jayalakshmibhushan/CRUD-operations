package RegisterController;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/rrr1")
public class EditController extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String s1=request.getParameter("name");
		String s2=request.getParameter("email");
		String s3=request.getParameter("pass");
		String s4=request.getParameter("age");
		String s5=request.getParameter("gender");
		String s6=request.getParameter("city");
		
		System.out.println(s2);
		
		
		 try {
				Class.forName("org.mariadb.jdbc.Driver");
				
				Connection  con=DriverManager.getConnection("jdbc:mariadb://localhost:3306/work","root","root");
				
				PreparedStatement ps=con.prepareStatement("update data set Name=?,Emailid=?,Password=?,Age=?,Gender=?,City=? where Emailid=?; ");
				ps.setString(1,s1);
				ps.setString(2,s2);
				ps.setString(3,s3);
				ps.setString(4,s4);
				ps.setString(5,s5);
				ps.setString(6,s6);
				ps.setString(7,s2);
				
				
				ps.executeUpdate();
				
			/*
			 * RequestDispatcher rd = request.getRequestDispatcher("display.jsp");
			 * rd.forward(request, response);
			 */
				response.sendRedirect("display.jsp?u="+s2);
				
				ps.close();
				con.close();
				
			} 
			 catch (ClassNotFoundException|SQLException e) 
			 {
				
				e.printStackTrace();
			 }
			
			}
		
		
		
		
			
	}

