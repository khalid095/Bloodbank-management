 package bloodbank.ser;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bloodbank.dbutil.CrudOperation;

import java.sql.*;
/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet
{
	HttpSession hs;
	private static final long serialVersionUID = 1L;
	private Connection cn;
	private PreparedStatement ps;
	public ResultSet rs;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String userid=request.getParameter("txtuserid");
		String userpass=request.getParameter("txtuserpass");
		
		cn=CrudOperation.createConnection();
		String strsql="select * from logindetails where  userid=? and userpass=?";
		try{
			ps=cn.prepareStatement(strsql);
			
			ps.setString(1, userid);
			ps.setString(2, userpass);
			rs=ps.executeQuery();
			if(rs.next())
			{
				hs=request.getSession();
				hs.setAttribute("userinfo", userid);
				
				
				String utype=rs.getString("usertype");
				hs.setAttribute("ut", utype);
				if(utype.equals("admin"))
				{
					response.sendRedirect("/bloodbank/jsp/admin.jsp");
				}
				if(utype.equals("donor"))
				{
					response.sendRedirect("/bloodbank/jsp/donor.jsp");
				}
				
				if(utype.equals("receiver"))
				{
					response.sendRedirect("/bloodbank/jsp/user.jsp");
				}
			}
			else
			{
				request.setAttribute("msg", "invaliduseridpassword");
				RequestDispatcher rd=request.getRequestDispatcher("/bloodbank/jsp/login.jsp");
				rd.forward(request, response);
			}
		}
		
		catch(SQLException se)
		{
			
		}
		}
		
	}


