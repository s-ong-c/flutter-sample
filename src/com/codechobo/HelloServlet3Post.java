package com.codechobo;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginAction")
public class HelloServlet3Post extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html;charset=UTF-8");
		resp.setCharacterEncoding("utf-8");
		
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		if(id.equals("lswkim")&&pw.equals("1234")) {
			resp.sendRedirect("/");
		}else {
			req.setAttribute("msg", "id 또는 비번이 틀렸습니다.");
			
			RequestDispatcher reqDis = req.getRequestDispatcher("/testLogin.jsp");
			reqDis.forward(req, resp);
		}
		
	
		
	
	
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
	
}        
         