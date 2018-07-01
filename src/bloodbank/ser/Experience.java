package bloodbank.ser;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.DefaultEditorKit.InsertBreakAction;

import java.sql.*;
import java.text.SimpleDateFormat;

import bloodbank.dbutil.CrudOperation;
/**
 * Servlet implementation class Experience
 */
@WebServlet("/Experience")
public class Experience extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	private PreparedStatement ps;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Experience() {
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String userid = request.getParameter("txtuserid");
		String subject = request.getParameter("txtsub");
		String veiw=request.getParameter("txtveiw");
		String date = request.getParameter("txtdate");
		
		con=CrudOperation.createConnection();
		String strexp="insert into experience (userid, subject, views, date) values(?,?,?,?)"; 
				
				try {
					con.setAutoCommit(false);
					ps = con.prepareStatement(strexp);
					ps.setString(1, userid);
					ps.setString(2, subject);
					ps.setString(3, veiw);
					
					java.util.Date b=null;
					java.sql.Date sb=null;
					String dt=request.getParameter("txtdate");
					SimpleDateFormat sdb=new SimpleDateFormat("dd-MM-yyyy");
					ps.setString(4, dt);
					int value = ps.executeUpdate();

					if (value > 0) 
					{
						con.setAutoCommit(true);
						response.sendRedirect("/bloodbank/jsp/expinfo.jsp");
						System.out.println("row inserted");

					}
				} catch (SQLException se) {
					System.out.println(se);
				} finally {
					try {
						if (ps!= null)
							ps.close();
						if (con != null)
							con.close();
					    }
					catch (SQLException se) {
						System.out.println(se);
					}
				}
			}



			}





