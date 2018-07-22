<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<html>
  <body>
  
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "");
      Cookie cookie=null;
      Cookie[] cookies = null;
      cookies = request.getCookies();
      response.setContentType("text/html");
      String name1=null;

      for (int i=0; i<cookies.length; i++) {
        cookie=cookies[i];
        if (cookie.getName().equals("name")){
          name1=cookie.getValue();
          break;
        }
      }

Statement stmt=null;
         stmt = conn.createStatement();
         String sql;
         sql = "SELECT * FROM question";
         ResultSet rs = stmt.executeQuery(sql);
      int i=1, score=0;
      while (rs.next()) {

        String answer=request.getParameter("q"+i);
        String ans=rs.getString("answer");
        if (answer.equals(ans)) {
          score++;
        }
        i++;
      }

      sql="UPDATE details SET score=? WHERE name=?";
     PreparedStatement ps=conn.prepareStatement(sql);
      ps.setString(2, name1);
      ps.setInt(1, score);
      ps.executeUpdate();
      ps.close();
      out.println("<center><h1><b>Result</b></center></h1>");
      sql="SELECT * FROM details WHERE name=?";
      ps=conn.prepareStatement(sql);
      ps.setString(1, name1);
      rs=ps.executeQuery();
      while (rs.next()) {
        out.println("<br>Name : " + name1);
        out.println("<br>ID : " + rs.getInt("id"));
        out.println("<br>Score: " + rs.getInt("score"));
      }
       out.println("<form action='index.html'>");
       out.println("<input type='submit' value='LOGOUT'/>");
      out.println("</form>");
      out.close();
    %>
  </body>
</html>
