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
 * Servlet implementation class AddNews
 */
@WebServlet("/AddNews")
public class AddNews extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	private PreparedStatement ps;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddNews() {
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
		String content = request.getParameter("txtcontent");
		String subject = request.getParameter("txtsub");
		String date = request.getParameter("txtdate");
		//System.out.println("hello" + emailid + "<br>yr name" + name + "<br>date" + date + "<br>text" + text);
		
		con=CrudOperation.createConnection();
		String strnews="insert into news (content, subject, date) values(?,?,?)"; 
				
				try {
					con.setAutoCommit(false);
					ps = con.prepareStatement(strnews);
					ps.setString(1, content);
					ps.setString(2, subject);
					
					java.util.Date b=null;
					java.sql.Date sb=null;
					String dt=request.getParameter("txtdate");
					SimpleDateFormat sdb=new SimpleDateFormat("dd-MM-yyyy");
					ps.setString(3, dt);
					int value = ps.executeUpdate();

					if (value > 0) 
					{
						con.setAutoCommit(true);
						response.sendRedirect("/bloodbank/jsp/home.jsp");
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





