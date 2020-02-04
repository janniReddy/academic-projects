

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
 * Servlet implementation class Login7
 */
@WebServlet("/Login7")
public class Login7 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login7() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String s1=request.getParameter("textt_name");
		String s2=request.getParameter("ppassword");
		try{
			Class.forName("com.mysql.jdbc.Driver");	
			Connection con=
		DriverManager.getConnection("jdbc:mysql://localhost:3306/blood","root","root");
		Statement st=con.createStatement();
	//	HttpSession sess=request.getSession(true);
		
		PrintWriter pw=response.getWriter();
		ResultSet rs=st.executeQuery("select * from bankdetails where loginid='"+s1+"' and password='"+s2+"'");
		if(rs.next())
    	 {
			String s3=rs.getString(1);
			//sess.setAttribute("naam", s1);
    		 RequestDispatcher red=request.getRequestDispatcher("bankdetails.jsp");
    			red.include(request,response);
                    		
     	pw.println("<script>document.getElementById('invalid9').innerHTML='<h1>"+s3+"</h1>'</script>");
    	 }
    	 else{
    		
    		RequestDispatcher red=request.getRequestDispatcher("index.html");
    		red.include(request, response);
    		
    		pw.println("<script>document.getElementById('invalid7').innerHTML='INVALID LOGIN'</script>");
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
