package RegisterController;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/login")
public class LoginController extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String p1=request.getParameter("uname");
		String p2=request.getParameter("pass");
		
	   System.out.println(p1+" "+p2);	
    
	
		
	
	   try 
	   {
			Class.forName("org.mariadb.jdbc.Driver");
			
			Connection  con=DriverManager.getConnection("jdbc:mariadb://localhost:3306/work","root","root");
	
			 
			 PreparedStatement pss=con.prepareStatement("SELECT Emailid ,Password from data where Emailid=? and password=?");
			 pss.setString(1, p1);
			 pss.setString(2, p2);
			
			 ResultSet rss = pss.executeQuery();
			 
			 while (rss.next()) 
			 {
					response.sendRedirect("success.jsp");
					return;
			 }
				response.sendRedirect("error.html");
				return;
	   }
	  
	   catch (ClassNotFoundException|SQLException z)
	   {
		   z.printStackTrace();
	   }
	}

}
  