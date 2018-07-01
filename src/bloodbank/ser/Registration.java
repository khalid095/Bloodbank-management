package bloodbank.ser;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bloodbank.dbutil.CrudOperation;
import java.sql.*;
import java.text.SimpleDateFormat;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	private PreparedStatement psuserdel, pslogdel;
private ResultSet rs;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Registration() {
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
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String usrid=request.getParameter("userid");
		System.out.println(usrid);
		String strsql="select userid from logindetails where userid=?";
		 con=CrudOperation.createConnection();
		try{
			psuserdel=con.prepareStatement(strsql);
			psuserdel.setString(1, usrid);
			rs=psuserdel.executeQuery();
			if(rs.next())
			{
				out.println("User Id Already Exists");
			}
			else{
				out.println("not");
			}
				
           
		}
			catch(SQLException se)
			{
				System.out.println(se);
			}
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		response.setContentType("text/html");
		//PrintWriter out = response.getWriter();
		String userid = request.getParameter("txtuserid");
		String userpass = request.getParameter("txtuserpass");
		String name = request.getParameter("txtname");
		String dob= request.getParameter("txtdate");
		String bloodgroup= request.getParameter("cmbblood");
		String email = request.getParameter("txtemail");
		String phoneno = request.getParameter("txtdnrno");
		String address = request.getParameter("txtaddress");
		String gender = request.getParameter("gender");
        String city = request.getParameter("cmbcity");
        
        if(city.equals("others"))
        {
        	
        	
        	city=request.getParameter("txtothers");
        }
		String user = request.getParameter("usertype");
	
		con = CrudOperation.createConnection();
		String strlogdel = "insert into logindetails values(?,?,?)";
		String struserdel = "insert into userdetails(userid, name, address, email, gender, phoneno, dor, dob, cityname, bloodgroup) values(?,?,?,?,?,?,?,?,?,?)";

		try {
			con.setAutoCommit(false);
			pslogdel = con.prepareStatement(strlogdel);
			pslogdel.setString(1, userid);
			pslogdel.setString(2, userpass);
			pslogdel.setString(3, "donor");
			psuserdel = con.prepareStatement(struserdel);
			psuserdel.setString(1, userid);

			psuserdel.setString(2, name);
			psuserdel.setString(3, address);
			psuserdel.setString(4, email);
			psuserdel.setString(5, gender);
			psuserdel.setString(6, phoneno);
			psuserdel.setString(9, city);
			psuserdel.setString(10, bloodgroup);

			java.util.Date b=null;
			java.sql.Date sb=null;
			String dt=request.getParameter("txtdate");
			SimpleDateFormat sdb=new SimpleDateFormat("dd-MM-yyyy");
			psuserdel.setString(8, dt);
			
			java.util.Date d = new java.util.Date();
			long t = d.getTime();
			java.sql.Date sd = new java.sql.Date(t);
			psuserdel.setDate(7, sd);
			
			int value = pslogdel.executeUpdate();// insert//update//delete
			int value1 = psuserdel.executeUpdate();

			if (value > 0 && value1 > 0) 
			{
				con.setAutoCommit(true);
				response.sendRedirect("/bloodbank/html/reginfo.html");
				System.out.println("row inserted");

			}
		} catch (SQLException se) {
			System.out.println(se);
		} finally {
			try {
				if (pslogdel!= null && psuserdel!= null)
					pslogdel.close();
				    psuserdel.close();
				if (con != null)
					con.close();
			    }
			catch (SQLException se) {
				System.out.println(se);
			}
		}
	}

}
