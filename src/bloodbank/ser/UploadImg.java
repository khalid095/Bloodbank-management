		package bloodbank.ser;
		
		import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import bloodbank.dbutil.CrudOperation;
import java.sql.*;
		/**
		 * Servlet implementation class NewUploadImg
		 */
		@WebServlet("/UploadImg")
		@MultipartConfig
		public class UploadImg extends HttpServlet {
			PreparedStatement ps;
			Connection con;
			
		    /**
		     * @see HttpServlet#HttpServlet()
		     */
		    public UploadImg() {
		        super();
		        // TODO Auto-generated constructor stub
		    }
		
			/**
			 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
			 */
			protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
			{
				String path=getServletContext().getRealPath("/");
				System.out.println(path);
						
			}
		
			/**
			 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
			 */
			protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
				 response.setContentType("text/html;charset=UTF-8");
		
				
		
				 ServletContext sc=getServletContext();
				String path=sc.getRealPath("/");
				 
		System.out.println(path);
		
		
		
			HttpSession hs=request.getSession(false);
			String u_id=(String)hs.getAttribute("userinfo");
				
			String utype=(String)hs.getAttribute("ut");
			String newpath=path+u_id;
				File f=new File(newpath);
				if(!f.exists())
				{
					
					f.mkdir();
				}
				
				System.out.println("directorycreated");
		/*	String description = request.getParameter("txtdesc");
				System.out.println(description);*/
				
			    final Part filePart = request.getPart("upload");
			    	final String fileName = getFileName(filePart);
			    	
			    	
	   String strupdate="update userdetails set picname=? where userid=?";
			   
			   
			   try{
				   con=CrudOperation.createConnection();
				   ps=con.prepareStatement(strupdate);
				   ps.setString(1, fileName);
				   ps.setString(2, u_id);
				   System.out.println(ps);
				   int rw=ps.executeUpdate();
			 if(rw>0)
		    {
					   
				   System.out.println("picadded");
				   if(utype.equals("donor"))
				   {
					   response.sendRedirect("/bloodbank/jsp/donor.jsp");
				   }
				   if(utype.equals("receiver"))
				   {
					   response.sendRedirect("/bloodbank/jsp/user.jsp");
				   }
		    }	   
			   }  
			    	catch(SQLException se)
			   {
			    		
			    		
			    		System.out.println(se);
			   }
			    
			   System.out.println(fileName);
		
			    OutputStream out = null;
			    InputStream filecontent = null;
			    final PrintWriter writer = response.getWriter();
		
			    try {
			        out = new FileOutputStream(new File(newpath + File.separator
			                + fileName));
			        filecontent = filePart.getInputStream();
		
			        int read = 0;
			        final byte[] bytes = new byte[1024];
		
			        while ((read = filecontent.read(bytes)) != -1) {
			            out.write(bytes, 0, read);
			        }
			 writer.println("New file " + fileName + " created at " + newpath);
			        
			    } catch (FileNotFoundException fne) {
			       
			        writer.println("<br/> ERROR: " + fne.getMessage());
		
			       
			    } finally {
			        if (out != null) {
			            out.close();
			        }
			        if (filecontent != null) {
			            filecontent.close();
			        }
			        if (writer != null) {
			            writer.close();
			        }
			    }
			}
		
			
				
				
			
		
		private String getFileName(final Part part) {
			
			
			
			
		    final String partHeader = part.getHeader("content-disposition");
		   
		    for (String content : part.getHeader("content-disposition").split(";")) {
		        if (content.trim().startsWith("filename")) {
		            return content.substring(
		                    content.indexOf('=') + 1).trim().replace("\"", "");
		        }
		    }
		    return null;
		}
		
		}
