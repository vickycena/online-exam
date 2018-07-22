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


      
      int i=1;
      out.println("<form action='result.jsp'>");
      while (rs.next()) {
        String ques=rs.getString("ques");
        String A=rs.getString("choicea");
        String B=rs.getString("choiceb");
        out.println(i+"."+ques+"<br>");
        out.print("<input type='radio' value='a' name='q"+i+"'/>"+A+"</br>");
        out.print("<input type='radio' value='b' name='q"+i+"'/>"+B+"</br>");
        i++;
      }
      out.println("<input type='submit' value='Submit'/>");
      out.println("</form>");
      out.close();
    

    %>

  </body>
</html>
