package bloodbank.ser;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bloodbank.dbutil.CrudOperation;
/**
 * Servlet implementation class Compose
 */
@WebServlet("/Compose")
public class Compose extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	private PreparedStatement ps,psin;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Compose() {
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
		PrintWriter out = response.getWriter();
		String receiverid = request.getParameter("txtrecid");
		String subject = request.getParameter("txtsub");
		String message= request.getParameter("txtmsg");
		
		HttpSession hs;
		hs=request.getSession(false);
				String ui=(String)hs.getAttribute("userinfo");
		con=CrudOperation.createConnection();
		String strnews="insert into senditem(senderid, receiverid, subject, message, dateofmsg) values(?,?,?,?,?)"; 
		

		String strin="insert into inbox(senderid, receiverid, subject, message, dateofmsg) values(?,?,?,?,?)"; 
				
				try {
					con.setAutoCommit(false);
					ps = con.prepareStatement(strnews);
					ps.setString(1, ui);
					ps.setString(2, receiverid);
					ps.setString(3, subject);
					ps.setString(4, message);
					ps.setDate(5, new java.sql.Date(new java.util.Date().getTime()));
				psin=con.prepareStatement(strin);
					
					psin.setString(1, ui);
					psin.setString(2, receiverid);
					psin.setString(3, subject);
					psin.setString(4, message);
					psin.setDate(5, new java.sql.Date(new java.util.Date().getTime()));
					
				
					int value = ps.executeUpdate();

					int valuein = psin.executeUpdate();
					if (value > 0 &&valuein>0) 
					{
						con.setAutoCommit(true);
						response.sendRedirect("/bloodbank/jsp/composemsg.jsp");
						System.out.println("row inserted");

					}
				    } 
				catch (SQLException se) 
				{
					System.out.println(se);
				}
				finally
				{
					try 
					    {
						if (ps!= null)
							ps.close();
						if (con != null)
							con.close();
					    }
					catch (SQLException se) 
					{
						System.out.println(se);
					}
				}
			}
}


