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


@WebServlet(urlPatterns = ("/rrr"))
public class RegisterController extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
//	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
//	{
		
//		processrequest(request , response);
		
//	}
	
//	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
//	{

//		processrequest(request , response);
	
//	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String s1=request.getParameter("name");
		String s2=request.getParameter("email");
		String s3=request.getParameter("pass");
		String s4=request.getParameter("age");
		String s5=request.getParameter("gender");
		String s6=request.getParameter("city");
		
		
		System.out.println("Connected........"+s1+"    "+s2+"  "+s3+"  "+s4+" "+s5+" "+s6);
		
		
		
		
		
		 try {
			Class.forName("org.mariadb.jdbc.Driver");
			
			Connection  con=DriverManager.getConnection("jdbc:mariadb://localhost:3306/work","root","root");
			
			PreparedStatement ps=con.prepareStatement("insert into data values(?,?,?,?,?,?);");
			ps.setString(1,s1);
			ps.setString(2, s2);
			ps.setString(3, s3);
			ps.setString(4, s4);
			ps.setString(5, s5);
			ps.setString(6, s6);
			
			
			ps.executeUpdate();
	
	        ps.close();
	        con.close();
	        
		} 
		 catch (ClassNotFoundException|SQLException e) 
		 {
			
			e.printStackTrace();
		 }
		 
		 RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		   rd.forward(request, response);
		 
		}
}