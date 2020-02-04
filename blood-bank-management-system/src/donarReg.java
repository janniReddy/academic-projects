

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

/**
 * Servlet implementation class donarReg
 */
@WebServlet("/donarReg")
public class donarReg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public donarReg() {
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
		String s3=request.getParameter("blood_group");
		String s4=request.getParameter("email_id");
		String s5=request.getParameter("mobile_number");
		String s6=request.getParameter("place");
		String s7=request.getParameter("address");
		String s8=request.getParameter("age");
		String s9=request.getParameter("gender");
		String s10="active";
		try{
			Class.forName("com.mysql.jdbc.Driver");	
			Connection con=
		DriverManager.getConnection("jdbc:mysql://localhost:3306/blood","root","root");
		Statement st=con.createStatement();
		PrintWriter pw=response.getWriter();
		ResultSet rs=st.executeQuery("select * from donar where name='"+s1+"' and password='"+s2+"'");
		if(rs.next())
		{
			RequestDispatcher red=request.getRequestDispatcher("donarregistration.html");
			red.include(request, response);
			pw.println("<script>document.getElementById('invalid').innerHTML='The password already exist please enter another password'</script>");
		}
		else{
		st.executeUpdate("insert into donar values('"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"','"+s6+"','"+s7+"','"+s8+"','"+s9+"','"+s10+"')");
		RequestDispatcher red=request.getRequestDispatcher("donarsuccess.html");
		red.include(request,response);
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
