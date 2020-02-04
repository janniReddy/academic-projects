

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
 * Servlet implementation class bloodupdate
 */
@WebServlet("/bloodupdate")
public class bloodupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bloodupdate() {
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
		String s3=request.getParameter("op");
		String s4=request.getParameter("ong");
		String s5=request.getParameter("ap");
		String s6=request.getParameter("an");
		String s7=request.getParameter("bp");
		String s8=request.getParameter("bn");
		String s9=request.getParameter("abp");
		String s10=request.getParameter("abn");
		String s11=request.getParameter("ddate");
		String s12=request.getParameter("time");
		try{
			Class.forName("com.mysql.jdbc.Driver");	
			Connection con=
		DriverManager.getConnection("jdbc:mysql://localhost:3306/blood","root","root");
		Statement st=con.createStatement();
		PrintWriter pw=response.getWriter();
		ResultSet rs=st.executeQuery("select * from bankdetails where loginid='"+s1+"' and password='"+s2+"'");
		if(rs.next())
		{
			String temp=rs.getString(1);
			st.executeUpdate("update bankdetails set op='"+s3+"',ong='"+s4+"',ap='"+s5+"',an='"+s6+"',bp='"+s7+"',bn='"+s8+"',abp='"+s9+"',abn='"+s10+"',dou='"+s11+"',time='"+s12+"' where loginid='"+s1+"' and password='"+s2+"'");
			RequestDispatcher red=request.getRequestDispatcher("bankdetails.jsp");
			red.include(request, response);
			pw.println("<script>document.getElementById('invalid9').innerHTML='<h1>"+temp+"</h1>'</script>");//pw.println("</script>");
		}
		else{
		
		RequestDispatcher red=request.getRequestDispatcher("updatenow.html");
		red.include(request,response);
		pw.println("<script>document.getElementById('incorrectid').innerHTML='incorrect id or password'</script>");
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
