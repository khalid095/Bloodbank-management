package bloodbank.dbutil;
import java.sql.*;
import java.util.ArrayList;

import jdk.internal.dynalink.beans.StaticClass;
import bloodbank.bens.Account;
public class CrudOperation {
private static Connection con;
private static PreparedStatement ps;
public static ResultSet rs;
private static ArrayList<Account>accountlist=new ArrayList<>();
public static Connection createConnection()
{
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank","root","root");
	}
	catch(SQLException |ClassNotFoundException cse)
	{
		System.out.println(cse);
	}
	return con;
}



public static ArrayList<Account>fetchData(String sql)
{
	Account ac=null;
	con=createConnection();
	try{
		ps=con.prepareStatement(sql);
		rs=ps.executeQuery();
		while(rs.next())
		{
			ac=new Account();
		ac.setUserid(rs.getString("userid"));
		ac.setUserpass(rs.getString("userpass"));
		ac.setUsertype(rs.getString("userid"));
		}
	}
	catch(SQLException se)
	{
		System.out.println(se);
	}
	return accountlist;
}

public static ResultSet getData(String sql)

{
	try{
		con=createConnection();
		ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
	}
	catch(SQLException se)
	{
		System.out.println(se);
	}
	
	return rs;
}
public static ResultSet getData(String sql,String ui)

{
	try{
		con=createConnection();
		ps=con.prepareStatement(sql);
		ps.setString(1, ui);
			rs=ps.executeQuery();
	}
	catch(SQLException se)
	{
		System.out.println(se);
	}
	
	return rs;
}




public static ResultSet getData(String sql,String ci,String bd)

{
	try{
		con=createConnection();
		ps=con.prepareStatement(sql);
		ps.setString(1, ci);
		ps.setString(2, bd);
			rs=ps.executeQuery();
	}
	catch(SQLException se)
	{
		System.out.println(se);
	}
	
	return rs;
}
public static ResultSet getData(String sql,int id)

{
	try{
		con=createConnection();
		ps=con.prepareStatement(sql);
		ps.setInt(1, id);
			rs=ps.executeQuery();
	}
	catch(SQLException se)
	{
		System.out.println(se);
	}
	
	return rs;
}

}
