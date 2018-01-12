package com.codechobo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/HellowServlet2")
public class HellowServlet2 extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse respond) 
	throws ServletException, IOException{
		respond.setContentType("text/html;charset=UTF-8");
		PrintWriter out = respond.getWriter();
		
		for(int i=1; i<26;i++) {
			if(i%5==0) {
				out.print("★<br>");
			}else {
				out.print("★");
			}
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse respond) 
	throws ServletException, IOException{
		doGet(request,respond);
	}
	
}
