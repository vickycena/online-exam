import been.user;
import dao.logindao;

import java.io.*;  

import javax.servlet.*;  
import javax.servlet.http.*;  
  
  
public class logincontroller extends HttpServlet {  
  
  public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException
  {
  response.setContentType("text/html");
  PrintWriter out =response.getWriter();
  String n=request.getParameter("id");
   String p=request.getParameter("name");
   user u=new user();
   u.setn(n);
   u.setp(p);
   logindao d=new logindao();
   int f=d.authenticate(u);
   if(f==1)
	   request.getRequestDispatcher("rule.jsp").forward(request,response);
   else
	 request.getRequestDispatcher("failure.jsp").forward(request,response);
}
  
  
}
   
	
	