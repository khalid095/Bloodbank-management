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
 * Servlet implementation class Feedback
 */
@WebServlet("/Feedback")
public class Feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	private PreparedStatement ps;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Feedback() {
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
		String emailid = request.getParameter("txtemailid");
		String name = request.getParameter("txtname");
		String text = request.getParameter("text");
		//System.out.println("hello" + emailid + "<br>yr name" + name + "<br>date" + date + "<br>text" + text);
		
		con=CrudOperation.createConnection();
		String strfeed="insert into feedback (emailid, name, text,date) values(?,?,?,?)"; 
				
				try {
					con.setAutoCommit(false);
					ps = con.prepareStatement(strfeed);
					ps.setString(2, name);
					ps.setString(1, emailid);
					ps.setString(3, text);

					java.util.Date d = new java.util.Date();
					long t = d.getTime();
					java.sql.Date sd = new java.sql.Date(t);
					ps.setDate(4, sd);
					int value = ps.executeUpdate();// insert//update//delete

					if (value > 0) 
					{
						con.setAutoCommit(true);
						response.sendRedirect("/bloodbank/html/feedbackinfo.html");
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





