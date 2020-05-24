package cn.sp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.sp.dao.AdminDAO;
import cn.sp.dao.StaffDAO;
import cn.sp.model.Admin;
import cn.sp.model.Staff;
import cn.sp.model.Work;

@WebServlet("/StaffServlet")
public class StaffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String met = request.getParameter("met");
		if("stalogin".equals(met)){
			stalogin(request, response);
		}else if("alterspwd".equals(met)){
			alterspwd(request, response);
		}else if("selsta".equals(met)){
			selsta(request, response);
		} else if("addWork".equals(met)) {
			addWork(request,response);//增加报表
		} else if("selWork".equals(met)) {
			selWork(request,response);//工作报表列表
		} else if("sta_selWork".equals(met)) {
			sta_selWork(request,response);//查看某个报表
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	//员工登录
	protected void stalogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
//		创建session对象，保存信息至session域，防止刷新页面时数据丢失
		HttpSession session = request.getSession();		
		//创建out对象
		PrintWriter out = response.getWriter();
		//获取表单提交的数据
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		
		//将获取的数据传回staff
		Staff s = new Staff();
		s.setSname(name);
		s.setSpwd(pwd);
		
		//判断是否登录成功
		StaffDAO sta = new StaffDAO();
		boolean isok = sta.login(s);
		if(isok){
			Cookie cookie = new Cookie("LoginStat","success");
			cookie.setMaxAge(10);
			response.addCookie(cookie);
			request.setAttribute("name", name);
			session.setAttribute("name", name);//注：此行代码的作用：在Staff.jsp中取值：${sessionScope.name}，这样防止点击“首页”后，再点击“个人信息”，数据就没了。但是目前这行代码没用上，因为实验了数次后，数据没有丢失了。
			//跳转到员工界面
			request.getRequestDispatcher("StaffIndex.jsp").forward(request, response);	
		}else{
			//登录失败    返回当前界面
			out.println("<Script>alert('登陆失败,请检查用户或密码');history.go(-1);</Script>");
		}
	}

	//员工修改密码
	protected void alterspwd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		
		PrintWriter out = response.getWriter();//创建out对象
		
		String name = request.getParameter("name");
		String pwd1 = request.getParameter("spwd1");
		String pwd2 = request.getParameter("spwd2");
		
		if(pwd1.equals(pwd2)&&pwd1!=""){
			Staff s = new Staff();
			s.setSpwd(pwd1);
			StaffDAO sta = new StaffDAO();
			boolean isok = sta.alterspwd(s,name);
			if(isok){
				out.println("<Script>alert('修改成功'); location.href='skip.html';</Script>");
			}else{
				//修改失败 返回当前界面
				out.println("<Script>alert('修改失败');history.go(-1);</Script>");
			}
		} else if(pwd1.equals("")&&pwd2.equals("")){
			 out.println("<Script>alert('密码不能为空！');history.go(-1);</Script>"); 
			 } else {
			out.println("<Script>alert('两次输入密码不一致');history.go(-1);</Script>");
		}	
	}
	//员工查询个人信息
	protected void selsta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		Staff s = new Staff();
		StaffDAO sta = new StaffDAO();
		s = sta.selsta(name);
		
		request.setAttribute("s", s);
		request.getRequestDispatcher("Staff.jsp").forward(request, response);
	}
	//添加报表
	protected void addWork(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		String buyName = request.getParameter("buyName");
		if(buyName == "") {
			buyName = "无";
		}
//		int buyPrice = Integer.parseInt(request.getParameter("buyPrice"));
		String sellName = request.getParameter("sellName");
		if(sellName == "") {
			sellName = "无";
		}
//		int sellPrice = Integer.parseInt(request.getParameter("sellPrice"));

		String sname = request.getParameter("sname");
		System.out.println("name值为："+sname);
		Work w = new Work();
		w.setEditor(sname);
		w.setBuyName(buyName);
		if(request.getParameter("buyPrice") == "") {
//			w.setBuyPrice(0);
		}  else {
			w.setBuyPrice(Integer.parseInt(request.getParameter("buyPrice")));
		}
		w.setSellName(sellName);
//		w.setSellPrice(sellPrice);
		if(request.getParameter("sellPrice") == "") {
//			w.setSellPrice(0);
		}  else {
			w.setSellPrice(Integer.parseInt(request.getParameter("sellPrice")));
		}
		StaffDAO sdao = new StaffDAO();
		boolean isok = sdao.addWork(w);
		if(isok) {
		request.setAttribute("workFormStat", "success");//添加报表成功，返回给报表界面成功信息
		selWork(request,response);
		//request.getRequestDispatcher("work.jsp").forward(request, response);
		} else {
			out.println("<Script src='js/toast.js'></Script>");
			out.println("<Script>Toast('发生未知错误，保存失败：addWork');</Script>");
		}
	}
	//查询当前员工已创建的报表
		protected void selWork(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			List<Work> list = new ArrayList<>();
			int currentPage = 1;
			String page = request.getParameter("currentPage");
			if(page != null){
				currentPage = Integer.parseInt(page);
			}
			int datePage = new StaffDAO().datePage("work");
			int totalPage = 0;
			if(datePage % 5 == 0){
				totalPage = datePage / 5;
			}else{
				totalPage = datePage / 5 + 1;
			}
				
			if(currentPage <= 0){
				currentPage = 1;
			}else if(currentPage >= totalPage){
				currentPage = totalPage;
			}
			String sname = null;
			if(request.getParameter("sname") == null){
				System.out.println("1..sname为："+request.getAttribute("name"));
			} else {
				sname = request.getParameter("sname");
			}
			//String sname = request.getParameter("sname");
			System.out.println("得到的sname为："+sname);//delete this sentence.
			list = new StaffDAO().selWork(currentPage,sname);
			request.setAttribute("wlist", list);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("currentPage", currentPage);
			request.getRequestDispatcher("work.jsp").forward(request, response);
		}
		//查询某个指定的报表
		protected void sta_selWork(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {			
			int id = Integer.parseInt(request.getParameter("id"));//按id查询添加的报表
			Work w = new Work();
			StaffDAO sdao = new StaffDAO();
			w = sdao.sta_selWork(id);
			request.setAttribute("w", w);
			String who = request.getParameter("sname");/*为了不让数据丢失，再接收一下是谁查看，也即是谁添加的 这是为了下
			面调用selWork()方法进行的存值操作，因为selWork()里不能得到当前员工的姓名*/
			request.getSession().setAttribute("who", who);
			request.setAttribute("type", "sta_selWork");//设置标志给work.jsp，判断动作为查看某个报表
			selWork(request,response);
			//request.getRequestDispatcher("work.jsp").forward(request, response);								
		}		
}
