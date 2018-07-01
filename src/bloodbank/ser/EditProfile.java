package bloodbank.ser;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bloodbank.dbutil.CrudOperation;

import java.sql.*;

/**
 * Servlet implementation class EditProfile
 */
@WebServlet("/EditProfile")
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection cn;
	private PreparedStatement ps;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditProfile() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String email=request.getParameter("txtemail");
		String name=request.getParameter("txtname");
		String phoneno=request.getParameter("txtphoneno");
		cn=CrudOperation.createConnection();
		HttpSession hs=request.getSession(false);
		String ui=(String)hs.getAttribute("userinfo");
		String strupdate="update userdetails set email=?,name=?,phoneno=? where userid=?";
		try{
			ps=cn.prepareStatement(strupdate);
			ps.setString(1, email);
			ps.setString(2, name);
			ps.setString(3, phoneno);
			ps.setString(4, ui);
			int rw=ps.executeUpdate();
			if(rw>0)
			{
				response.sendRedirect("/bloodbank/jsp/viewprofile.jsp");
		
			}
		}
			catch(SQLException se)
			{
				System.out.println(se);
			}
		
	}
}

