

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class campReg
 */
@WebServlet("/campReg")
public class campReg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public campReg() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String s1=request.getParameter("full_name");
		String s2=request.getParameter("place");
		String s3=request.getParameter("address");
		String s4=request.getParameter("dop");
		String s5=request.getParameter("doc");
		String s6=request.getParameter("mobile_number");
		
		try{
			Class.forName("com.mysql.jdbc.Driver");	
			Connection con=
		DriverManager.getConnection("jdbc:mysql://localhost:3306/blood","root","root");
		Statement st=con.createStatement();
		st.executeUpdate("insert into camp values('"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"','"+s6+"')");
		RequestDispatcher red=request.getRequestDispatcher("donarsuccess.html");
		red.include(request,response);
		}
		catch(Exception e){
			System.out.println(e.getMessage());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
