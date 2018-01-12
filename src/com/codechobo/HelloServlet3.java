package com.codechobo;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/HelloServ")
public class HelloServlet3 extends HttpServlet {
	int cnt = 0;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html;charset=UTF-8");
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		PrintWriter out = resp.getWriter();
		
		out.println("<h1>Hello,"+id+"</h1>            ");
	    out.println("<h1>your password is "+pw+"</h1> ");
	    out.println("count = "+(cnt++));
		
	}
	
}        
         