

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

/**
 * Servlet implementation class suggest
 */
@WebServlet("/suggest")
public class suggest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public suggest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String s1=request.getParameter("textarea");
		
		try{
			Class.forName("com.mysql.jdbc.Driver");	
			Connection con=
		DriverManager.getConnection("jdbc:mysql://localhost:3306/blood","root","root");
			PrintWriter pw=response.getWriter();
		Statement st=con.createStatement();
		if(s1.length()!=0)
		{
		st.executeUpdate("insert into suggestions values('"+s1+"')");
		RequestDispatcher red=request.getRequestDispatcher("index.html");
		red.include(request,response);
		pw.println("<script>document.getElementById('invalid5').innerHTML='<h3>Thanks For Your Valuable Suggestion</h3>'</script>");
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
