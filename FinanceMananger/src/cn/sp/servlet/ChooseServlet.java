package cn.sp.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ChooseServlet")

public class ChooseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		if("login".equals(type)){
			login(request, response);
		} 
}
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
//	获取登录数据并进行判断
	protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String choose = request.getParameter("choose");
		HttpSession session = request.getSession();
		if("staff".equals(choose)){
			request.setAttribute("name", name);
			request.setAttribute("pwd", pwd);
			session.setAttribute("name", name);
			//设置cookie，用于显示“xxx，欢迎你”
			Cookie cookie = new Cookie("cookie_name",name);
			response.addCookie(cookie);
			//跳转至员工界面
			request.getRequestDispatcher("StaffServlet?met=stalogin").forward(request, response);
			
		} else if("admin".equals(choose)){
			request.setAttribute("name", name);
			request.setAttribute("pwd", pwd);
			session.setAttribute("name", name);
			//设置cookie，用于显示“xxx，欢迎你”
			Cookie cookie = new Cookie("cookie_name",name);
			response.addCookie(cookie);
//			System.out.println("管理员登录："+name);//debug语句
			//跳转至管理员界面
			request.getRequestDispatcher("AdminServlet?met=adminlogin").forward(request, response);
		}
	}
}
