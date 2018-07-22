package dao;
import been.user;
import java.sql.*;
public class logindao{
	public int authenticate(user u)
	{
	try{
		String s=u.getn();
		String p=u.getp();
	final String JDBC_DRIVER="com.mysql.jdbc.Driver";  
       final String DB_URL="jdbc:mysql://localhost:3306/student";
	 final String USER = "root";
       final String PASS = "vicky";
       Connection  conn = null;
       Statement stmt = null; 
	Class.forName("com.mysql.jdbc.Driver");

         conn = DriverManager.getConnection(DB_URL,USER,PASS);
          stmt = conn.createStatement();
	PreparedStatement pst = conn.prepareStatement("Select id,name from uc where id=? and name=?");    
	pst.setString(1, s);
            pst.setString(2, p);
            ResultSet rs = pst.executeQuery();
       //  String sql;     
        // sql = "select name,password from user where name='"+s+"' password='"+p+"'";
		//sql = "select name,password from user where name=? password=?";
	//stmt.setString(1, s);
        //stmt.setString(2, p);
        // ResultSet rs = stmt.executeQuery(sql);
         if(rs.next())
         
	      return 1;
                        
	}
	catch(Exception e){
		e.printStackTrace();
	}        
       
	return 0;
	}
	
}