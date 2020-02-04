import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login1
 */
@WebServlet("/Login1")
public class Login1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String s1=request.getParameter("text_name");
		String s2=request.getParameter("password");
		try{
			Class.forName("com.mysql.jdbc.Driver");	
			Connection con=
		DriverManager.getConnection("jdbc:mysql://localhost:3306/blood","root","root");
		Statement st=con.createStatement();
		HttpSession sess=request.getSession(true);
		
		PrintWriter pw=response.getWriter();
		ResultSet rs=st.executeQuery("select * from donar where name='"+s1+"' and password='"+s2+"'");
		if(rs.next())
    	 {
			sess.setAttribute("naam", s1);
    		 RequestDispatcher red=request.getRequestDispatcher("loginuser1.jsp");
    			red.include(request,response);
                    		
     pw.println("<script>document.getElementById('invalid2').innerHTML='<h1>"+s1+"</h1>'</script>");
    	 }
    	 else{
    		
    		RequestDispatcher red=request.getRequestDispatcher("index.html");
    		red.include(request, response);
    		
    		pw.println("<script>document.getElementById('invalid1').innerHTML='INVALID LOGIN'</script>");
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
