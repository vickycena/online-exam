<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<html>
  <body>
<h1> <b style="color:gold; ">Please follow these rules for the exam: </b></h1>
<br> <br>
               <ul>
                   <li style="color: plum">Switch off your mobile phones.</li>
                   <li>Do not malpractice</li>
                   <li style="color: green">Keep the testing material face down until we indicate you can start.</li>
                   <li><strong>Know your limits</strong></li>
                   <li style="color: darkblue;">When we indicate time is up, do not write anything else.</li>
                   <li>Make sure you write your name immediately after starting the exam/quiz.
                       We will not wait for you at the end.</li>
                   <li style="color: orange;">It is recommended you complete your work using a mouse</li>
                   <li>Bring a watch if you want to keep track of time</li>
                   <li><strong></strong></li>
	         </ul>

    <%
      String name=request.getParameter("name");
      String id1=request.getParameter("id");

       int id=Integer.parseInt(id1);
      Class.forName("com.mysql.jdbc.Driver");
      Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "");
      String sql="INSERT INTO details(id,name) VALUES ("+id+",'"+name+"')";
      Statement stmt;
      stmt = conn.createStatement();

      response.setContentType("text/html");
      Cookie c=new Cookie("name", name);
      response.addCookie(c);
      try{
        out.println("<form action='ques.jsp'>");
         stmt.executeUpdate(sql);        
         response.setContentType("text/html");
        out.println("<center><input type='submit' value='Take Exam'></center></form>");


      }
      catch (SQLException se){
        sql="SELECT * FROM details WHERE name=?";
        PreparedStatement ps=conn.prepareStatement(sql);
        ps.setString(1, name);
        ResultSet rs=ps.executeQuery();
        rs.next();
        out.println("<br><br><h1>You have already written test "+name+"</h1><br>");
      }

      out.close();

    %>

  </body>
</html>



