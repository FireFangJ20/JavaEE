package cn.sp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.sp.dao.GuestDAO;
import cn.sp.dao.StaffDAO;
import cn.sp.model.Guest;
import cn.sp.model.Staff;
import cn.sp.servlet.AdminServlet;

@WebServlet("/GuestServlet")
//对客户信息的操作处理
public class GuestServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String met = request.getParameter("met");
		if("alterGuest".equals(met)) {
			alterGuest(request,response);//修改客户信息
		} else if("searchGuest".equals(met)) {
			searchGuest(request,response);//搜索客户信息
		}
	}
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

	// 管理员-批量删除客户信息
	protected void delGstBySelected(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		String [] para = request.getParameterValues("selectedGuest");
		StringBuffer inParas = new StringBuffer();
		for(int i=0;i<para.length;i++) {
			inParas.append(para[i]);
			inParas.append(",");
		}
		String para2 = inParas.substring(0,inParas.length()-1);
		GuestDAO gdao = new GuestDAO();
		AdminServlet Asrvlet = new AdminServlet();
		boolean isok = gdao.delGstBySelected(para2);
		if(isok) {
			request.setAttribute("InfoAction", "afterDelete");
			Asrvlet.selGuest(request,response);
			System.out.println("成功删除所选客户信息！");
		} else {
			PrintWriter out = response.getWriter();
			out.println("<Script>alert('删除失败！');history.go(-1);</Script>");
		}
	} 
	
	// 管理员-删除客户信息
	protected void delGuest(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
		int gid = Integer.parseInt(request.getParameter("gid"));
		GuestDAO gdao = new GuestDAO();
		AdminServlet Aserv = new AdminServlet();
		boolean isok = gdao.delGuest(gid);
		if(isok) {
			request.setAttribute("InfoAction", "afterDelete");
			Aserv.selGuest(request,response);
		} else {
			PrintWriter out = response.getWriter();
			out.println("<Script>alert('删除失败！');history.go(-1);</Script>");
		}
	}
	
	//修改客户信息
	protected void alterGuest(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
		int gid = Integer.parseInt(request.getParameter("gid"));
		String name = request.getParameter("gname");
		String address = request.getParameter("gaddress");
		String phone = request.getParameter("gphone");
		HttpSession session = request.getSession();
		int operator = (int) session.getAttribute("currentAid");
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date(); 
		String ts = format.format(date);
		Guest g = new Guest();
		g.setGname(name);
		g.setGaddress(address);
		g.setGphone(phone);
		g.setGdate(ts);
		g.setOperator(operator);
		GuestDAO gdao = new GuestDAO();
		boolean isok = gdao.alterGuest(g,gid);
		if(isok) {
			AdminServlet Aserv = new AdminServlet();
			request.setAttribute("InfoAction", "afterAlter");//给前端界面一个修改成功信号
			Aserv.selGuest(request,response);
		}else {
			PrintWriter out = response.getWriter();
			out.println("<Script>alert('添加失败,请重试');history.go(-1);</Script>");
		}
	}
	//搜索客户信息
	protected void searchGuest(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
		String para = request.getParameter("SID");
		AdminServlet Aserv = new AdminServlet();
		if(Aserv.isNumber(para)){	
			int GID = Integer.parseInt(para);
			Guest guest = new Guest();
			GuestDAO gdao = new GuestDAO();
			guest = gdao.searchGuest(GID,"");
			request.setAttribute("g", guest);
			request.getRequestDispatcher("GuestInfo.jsp").forward(request, response);
		} else if(request.getParameter("SID") != ""){
			Guest guest = new Guest();
			GuestDAO gdao = new GuestDAO();
			guest = gdao.searchGuest(0, para);
			request.setAttribute("g", guest);
			request.getRequestDispatcher("GuestInfo.jsp").forward(request,response);
		} else {
			PrintWriter out = response.getWriter();
			out.println("<Script>alert('请输入客户的信息进行查询！');location.href='search.html';</Script>");
		}
	}

}
