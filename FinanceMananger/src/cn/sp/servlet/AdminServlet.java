package cn.sp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.sp.dao.AdminDAO;
import cn.sp.dao.GuestDAO;
import cn.sp.dao.StaffDAO;
import cn.sp.model.Admin;
import cn.sp.model.Guest;
import cn.sp.model.Staff;
import cn.sp.model.Work;
import cn.sp.servlet.GuestServlet;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String met = request.getParameter("met");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		if("adminlogin".equals(met)){
			adminlogin(request, response);//管理员登录
		}else if("alterApwd".equals(met)){
			alterApwd(request, response);//更改管理员密码
		}else if("selsta".equals(met)){
			selsta(request, response);//查看全部员工信息
		}else if("addAdmin".equals(met)){
			addAdmin(request, response);//添加管理员
		} else if ("delAdmin".equals(met)){
			delAdmin(request,response);//删除管理员
		} else if("alterAdmin".equals(met)){
			alterAdmin(request,response);//修改管理员信息
		} else if("delsta".equals(met)){
			delsta(request, response);//删除员工
		}else if("addStaff".equals(met)){
			addStaff(request, response);//添加员工
		}else if("altersta".equals(met)){
			altersta(request, response);//修改员工信息
		}else if("selectById".equals(met)){
			selectById(request, response);//按id查询员工
		}else if("SelById".equals(met)){
			SelById(request, response);//按id查询管理员
		}else if("selByName".equals(met)){
			selByName(request, response);//按用户名查id
		}else if("selAdmin".equals(met)) {
			selAdmin(request,response);//查询所有管理员
		}else if("selGuest".equals(met)) {
			selGuest(request,response);//查询所有客户信息
		}else if("addGuest".equals(met)) {
			addGuest(request,response);//添加客户
		} else if("delStaBySelected".equals(met)) {
			delStaBySelected(request,response);//批量删除已选择的员工信息
		} else if("delGstBySelected".equals(met)) {
			GuestServlet gstServ = new GuestServlet();
			gstServ.delGstBySelected(request,response);//批量删除已选择的客户信息
		} else if("delGuest".equals(met)) {
			GuestServlet gstServ = new GuestServlet();
			gstServ.delGuest(request, response);//删除客户信息
		} else if("alterGuest".equals(met)){
			GuestServlet gstServ = new GuestServlet();
			gstServ.alterGuest(request, response);//修改客户信息
		} else if("staffWork".contentEquals(met)) {
			staffWork(request,response);//查看所有员工报表
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	//管理员登录
	protected void adminlogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();//创建out对象
		HttpSession session = request.getSession();
		//获取表单提交的数据
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
//		System.out.println("管理员登录：测试"+name);//debug语句，若控制台没出现此语句，则表示程序未进行到此
		
		//将获取的数据传回Admin类
		Admin a = new Admin();
		a.setAname(name);
		a.setApwd(pwd);
		
		//判断登录是否成功
		AdminDAO adm = new AdminDAO();
		Admin nowAid = adm.selByName(name);
		int currentAid = nowAid.getAid();
		boolean isok = adm.login(a);
		if(isok){
			Cookie cookie = new Cookie("LoginStat","success");
			cookie.setMaxAge(10);
			response.addCookie(cookie);
			request.setAttribute("name", name);
			session.setAttribute("currentAid", currentAid);
			request.getRequestDispatcher("AdminIndex.jsp").forward(request, response);//  请求跳转到管理员界面
			//request.getRequestDispatcher("xxx.jsp").forward(request, response);//跳转到xxx界面	
		}else{
			//登录失败    返回当前界面
			out.println("<Script>alert('登陆失败,请检查用户名或密码');history.go(-1);</Script>");
		}
	}
	//修改管理员密码
	protected void alterApwd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		//获取表单数据
		int id = Integer.parseInt(request.getParameter("aid"));
		String pwd1 = request.getParameter("apwd1");
		String pwd2 = request.getParameter("apwd2");
		
		if(pwd1.equals(pwd2)){//判断密码是否相同
			//将获取数据传回Admin
			Admin a = new Admin();
			a.setApwd(pwd2);
			//判断是否修改成功
			AdminDAO adm = new AdminDAO();
			boolean isok = adm.alterApwd(a,id);
			if(isok){
				out.println("<Script>alert('修改成功，请重新登录！');location.href='skip.html';</Script>");
			     //response.sendRedirect("login.html");//重定向  跳转到登录界面
			}else{
				//修改失败    返回当前界面
				out.println("<Script>alert('修改失败');history.go(-1);</Script>");
			}
			
		}else{
			out.println("<Script>alert('两次密码不同，重新输入！');history.go(-1);</Script>");
		}
	
	}
	//查询全部员工信息
	protected void selsta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		List<Staff> list = new ArrayList<>();
		int currentPage = 1;
		//获取t
		String page = request.getParameter("currentPage");
		if(page != null){
			currentPage = Integer.parseInt(page);
		}
		
		//获取总的数据的行数
		int datePage = new StaffDAO().datePage("staff_login");
				
		//计算总的页数
		int totalPage = 0;
		if(datePage % 10 == 0){//如果能够整除
			totalPage = datePage / 10;
		}else{
			totalPage = datePage / 10 + 1;//如果不能整除，则需要加1
		}
			
		if(currentPage <= 0){//如果页码小于0（页码不能小于0）
			currentPage = 1;
		}else if(currentPage >= totalPage){//如果页码大于最大值（页码不能大于最大页数）
			currentPage = totalPage;
		}
		list = new StaffDAO().selStaff(currentPage);
		request.setAttribute("slist", list);//将list传出去
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("currentPage", currentPage);//传回当前页的页码   以作完成功能“上一页和下一页”
		request.getRequestDispatcher("AdminRight.jsp").forward(request, response);//跳转到查询结果界面
	}
	//删除员工
	protected void delsta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		int sid = Integer.parseInt(request.getParameter("sid"));//获取查询界面传过来的sid
		
		StaffDAO sta = new StaffDAO();
		boolean isok = sta.delsta(sid);
		if(isok){
			selsta(request, response);//如果删除成功，跳转到查询界面
		}else{
			out.println("<Script>alert('修改失败');history.go(-1);</Script>");
		}
	}
	//添加管理员
	protected void addAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String name = request.getParameter("aname");
		String pwd = request.getParameter("apwd");
		
		Admin a = new Admin();
		a.setAname(name);
		if(pwd == ""){
			pwd = "111111";
			a.setApwd(pwd);
		}else{
			a.setApwd(pwd);
		}
		
		
		AdminDAO adm = new AdminDAO();
		boolean isok = adm.addAdmin(a);
		
		if(isok){
			out.println("<Script>alert('添加成功！');</Script>");
			selAdmin(request,response);
//			response.sendRedirect("login.html");
		}else{
			out.println("<Script>alert('添加失败');history.go(-1);</Script>");
		}
	}
	//删除管理员
	protected void delAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		int aid = Integer.parseInt(request.getParameter("aid"));
		
		AdminDAO adao = new AdminDAO();
		boolean isok = adao.delAdmin(aid);
		if(isok){
			selAdmin(request, response);
		}else{
			out.println("<Script>alert('删除失败');history.go(-1);</Script>");
		}
	}
	//修改管理员信息
	protected void alterAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int id = Integer.parseInt(request.getParameter("aid"));
		String name = request.getParameter("aname");
		String pwd = request.getParameter("apwd");	
		Admin a = new Admin();
		a.setAid(id);
		a.setAname(name);
		a.setApwd(pwd);
		AdminDAO adao = new AdminDAO();
		boolean isok = adao.alterAdmin(a, id);
		
		if(isok){
			request.setAttribute("InfoAction", "afterAlter");
			selAdmin(request, response);
		}else{
			out.println("<Script>alert('修改失败');history.go(-1);</Script>");
		}
	}
	//添加员工
	protected void addStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("sname");
		String pwd = request.getParameter("spwd");
		int salary = Integer.parseInt(request.getParameter("salary"));
		String department = request.getParameter("department");
		
		Staff s = new Staff();
		s.setSname(name);
		if(pwd == ""){
			pwd = "111111";
			s.setSpwd(pwd);
		}else{
			s.setSpwd(pwd);
		}
		s.setSalary(salary);
		s.setDepartment(department);		
		StaffDAO sta = new StaffDAO();
		boolean isok = sta.addStaff(s);
		if(isok){
			//设置标志,用于弹出Toast
			request.setAttribute("InfoAction", "afterAdd");
			//添加成功,调用查询功能
			selsta(request, response);		
		}else{
			out.println("<Script>alert('添加失败');history.go(-1);</Script>");
		}
	}
	//修改员工
	protected void altersta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int id = Integer.parseInt(request.getParameter("sid"));
		String name = request.getParameter("sname");
		String pwd = request.getParameter("spwd");
		String department = request.getParameter("department");
		int salary = Integer.parseInt(request.getParameter("salary"));
		
		Staff s = new Staff();
		s.setSid(id);
		s.setSname(name);
		s.setSpwd(pwd);
		s.setSalary(salary);
		s.setDepartment(department);

		StaffDAO sta = new StaffDAO();
		boolean isok = sta.altersta(s, id);
		
		if(isok){
			//修改成功,调用查询方法
			out.println("<Script>alert('修改成功'); </Script>");
			selsta(request, response);
		}else{
			out.println("<Script>alert('修改失败');history.go(-1);</Script>");
		}
	}
	//按id查询员工
		protected void selectById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String type = request.getParameter("type");
			if("alter".equals(type)){
				int id = Integer.parseInt(request.getParameter("sid"));				
				Staff s = new Staff();
				StaffDAO sta = new StaffDAO();
				s = sta.selectById(id,"");
				request.setAttribute("s", s);
				request.getRequestDispatcher("AlterSta.jsp").forward(request, response);
			}else {
//				Object SID = request.getParameter("SID");
				String para = request.getParameter("SID");
				if(isNumber(para)){	
					System.out.println("搜索输入的内容："+para);
//					int SID = Integer.parseInt(request.getParameter("SID"));
					int SID = Integer.parseInt(para);
					Staff staff = new Staff();
					StaffDAO staDao = new StaffDAO();
					staff = staDao.selectById(SID,"");
					request.setAttribute("s", staff);
					request.getRequestDispatcher("StaffRight.jsp").forward(request, response);
				} else if(request.getParameter("SID") != ""){
					System.out.println("------"+para);
					Staff staff = new Staff();
					StaffDAO sdao = new StaffDAO();
					staff = sdao.selectById(0, para);
					request.setAttribute("s", staff);
					request.getRequestDispatcher("StaffRight.jsp").forward(request,response);
				} else {
					PrintWriter out = response.getWriter();
					out.println("<Script>alert('请输入员工的信息进行查询！');location.href='search.html';</Script>");
				}
			}
		}
	//按ID查询管理员
	protected void SelById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("aid"));
		Admin a = new Admin();
		AdminDAO adm = new AdminDAO();
		a = adm.SelById(id);
		
		request.setAttribute("a", a);
		request.getRequestDispatcher("AdminLeft.jsp").forward(request, response);
	}
	//按用户名查询管理员ID(管理员点击“修改密码”后提交动作至此，由于管理员的姓名可能有多个，所以对id进行判断)
	protected void selByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		Admin a = new Admin();
		AdminDAO adm = new AdminDAO();
		a = adm.selByName(name);
		
		request.setAttribute("a", a);
		request.getRequestDispatcher("AdminPwd.jsp").forward(request, response);
	}
	
	//查询所有管理员信息
	protected void selAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Admin> list = new ArrayList<>();
//		HttpSession session = request.getSession();
//		Object AID = session.getAttribute("currentAid");
//		System.out.println("当前管理员的ID为"+AID);
//		System.out.println("正在进行查询管理员操作！");
		int currentPage = 1;
		//获取t
		String page = request.getParameter("currentPage");
		if(page != null){
			currentPage = Integer.parseInt(page);
		}
		
		//获取总的数据的行数
		int datePage = new AdminDAO().datePage();
				
		//计算总的页数
		int totalPage = 0;
		if(datePage % 10 == 0){//如果能够整除
			totalPage = datePage / 10;
		}else{
			totalPage = datePage / 10 + 1;//如果不能整除，则需要加1
		}
			
		if(currentPage <= 0){//如果页码小于0（页码不能小于0）
			currentPage = 1;
		}else if(currentPage >= totalPage){//如果页码大于最大值（页码不能大于最大页数）
			currentPage = totalPage;
		}
		list = new AdminDAO().selAdmin(currentPage);
		request.setAttribute("alist", list);//将list传出去
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("currentPage", currentPage);//传回当前页的页码   以作完成功能“上一页和下一页”
		request.getRequestDispatcher("Admin.jsp").forward(request, response);
	}
	
	//查看所有客户信息
	public void selGuest(HttpServletRequest request,HttpServletResponse response)throws ServletException , IOException{
		List<Guest> list = new ArrayList<>();
		int currentPage = 1;
		String page = request.getParameter("currentPage");
		if(page != null){
			currentPage = Integer.parseInt(page);
		}		
		int datePage = new GuestDAO().datePage();
		int totalPage = 0;
		if(datePage % 10 == 0){
			totalPage = datePage / 10;
		}else{
			totalPage = datePage / 10 + 1;
		}
			
		if(currentPage <= 0){
			currentPage = 1;
		}else if(currentPage >= totalPage){
			currentPage = totalPage;
		}
		
		list = new GuestDAO().selGuest(currentPage);
		request.setAttribute("glist", list);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("currentPage", currentPage);
		String type = request.getParameter("type");
		if("staff".equals(type)) {
			request.setAttribute("action", "staff");
			request.setAttribute("identity", "staff");
//			System.out.println("接收到了前端参数“type”为staff");
			request.getRequestDispatcher("Guest.jsp").forward(request, response);
		} else {
			request.setAttribute("action", "admin");
//			System.out.println("接收到前端参数为admin");
			request.getRequestDispatcher("Guest.jsp").forward(request, response);
		}
	}
	
	
	//添加客户信息
	public void addGuest(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		PrintWriter out = response.getWriter();		
		String name = request.getParameter("gname");
		String address = request.getParameter("gaddress");
		String phone = request.getParameter("gphone");
		HttpSession session = request.getSession();
		int operator = (int) session.getAttribute("currentAid");
		Guest g = new Guest();
		g.setGname(name);
		g.setGaddress(address);
		g.setGphone(phone);
		g.setOperator(operator);
		GuestDAO gdao = new GuestDAO();
		boolean isok = gdao.addGuest(g);
		if(isok) {
			request.setAttribute("InfoAction", "afterAdd");
			selGuest(request,response);
		}else {
			out.println("<Script>alert('添加失败,请重试');history.go(-1);</Script>");
		}
	}
	//根据勾选的员工 id 删除员工
	public void delStaBySelected(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
	
		String [] para = request.getParameterValues("selectedStaff");
		StringBuffer inParas = new StringBuffer();
		for(int i=0;i<para.length;i++) {
			inParas.append(para[i]);
			inParas.append(",");
		}
		String para2 = inParas.substring(0,inParas.length()-1);
		StaffDAO sdao = new StaffDAO();
		boolean isok = sdao.delStaBySelected(para2);
		if(isok) {
			selsta(request,response);
			System.out.println("成功删除所选员工信息！");
		} else {
			PrintWriter out = response.getWriter();
			out.println("<Script>alert('删除失败！');history.go(-1);</Script>");
		}
	}
	
	//查看员工报表 包括 所有的报表、某一个报表
	protected void staffWork(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
		//查看所有报表
		if(request.getParameter("scope").equals("all")) {
			List<Work> list = new ArrayList<>();
			int currentPage = 1;
			String page = request.getParameter("currentPage");
			if(page != null){
				currentPage = Integer.parseInt(page);
			}
			int datePage = new StaffDAO().datePage("work");
			int totalPage = 0;
			if(datePage % 10 == 0){
				totalPage = datePage / 10;
			}else{
				totalPage = datePage / 10 + 1;
			}
				
			if(currentPage <= 0){
				currentPage = 1;
			}else if(currentPage >= totalPage){
				currentPage = totalPage;
			}
			list = new AdminDAO().selWork(currentPage);
			request.setAttribute("adm_wlist", list);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("currentPage", currentPage);
			request.getRequestDispatcher("finance.jsp").forward(request, response);
		} else { //查看某一个报表				
		int id = Integer.parseInt(request.getParameter("id"));//按id查询员工添加的报表
		Work w = new Work();
		StaffDAO sdao = new StaffDAO();
		w = sdao.sta_selWork(id);
		request.setAttribute("w", w);
		request.setAttribute("flag", "someone");
		request.getRequestDispatcher("finance.jsp").forward(request, response);
		}
	}
	
	//判断输入的字符是不是纯数字,要使用正则表达式，导入Pattern和Matcher
	public boolean isNumber(String str) {
		Pattern pattern = Pattern.compile("[0-9]*");
		Matcher isNum = pattern.matcher(str);
		if(!isNum.matches()||str == "") {
			return false;
		}
		return true;
	}
}



