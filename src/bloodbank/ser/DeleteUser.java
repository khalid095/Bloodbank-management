package bloodbank.ser;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bloodbank.dbutil.CrudOperation;

import java.sql.*;

/**
 * Servlet implementation class DeleteUser
 */
@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Connection cn;
	private PreparedStatement ps;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
{
		
		String[] delusers=request.getParameterValues("chk");
		String strdelete="delete from logindetails where userid=?";
		cn=CrudOperation.createConnection();
		try{
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(strdelete);
			for(int i=0;i<delusers.length;i++)
			{
				ps.setString(1, delusers[i]);
				ps.addBatch();
			}
		int[]arr=ps.executeBatch();
		//System.out.println("data deleted");
		int flag=0;
		for(int i=0;i<arr.length;i++)
		{
			if(arr[i]<0)
			{
				flag=1;
				break;
			}
		}
		if(flag==0)
		{
			cn.setAutoCommit(true);
			response.sendRedirect("/bloodbank/jsp/deleteuser.jsp");
		}
		}
	catch(SQLException se)
		{
		System.out.println(se);
		}
	}

}
