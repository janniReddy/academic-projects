

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class loginActive
 */
@WebServlet("/loginActive")
public class loginActive extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginActive() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String s1=request.getParameter("full_name");
		String s2=request.getParameter("password");
		HttpSession sess=request.getSession();
		try{
			Class.forName("com.mysql.jdbc.Driver");	
			Connection con=
		DriverManager.getConnection("jdbc:mysql://localhost:3306/blood","root","root");
		Statement st=con.createStatement();
		PrintWriter pw=response.getWriter();
		int r=st.executeUpdate("update donar set state='active' where name='"+s1+"' and password='"+s2+"'");
		if(r!=0)
		{
    		 RequestDispatcher red=request.getRequestDispatcher("loginuser1.jsp");
    			red.include(request,response);
     		
     		pw.println("<script>document.getElementById('invalid2').innerHTML='<h1>"+(String)sess.getAttribute("naam")+"</h1> </br><h2>Your Made Active For Donation<br>Thank You</h2>'</script>");
    	
		}
    		
    		
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
