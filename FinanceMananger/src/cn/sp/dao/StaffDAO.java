package cn.sp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.xml.ws.Response;

import cn.sp.model.Admin;
import cn.sp.model.Staff;
import cn.sp.model.Work;
import cn.sp.util.SQLHelper;

public class StaffDAO {
	private  Connection ct = null;
	private  Statement st = null;
	private  PreparedStatement ps = null;
	private  ResultSet rs = null;
		
	//员工登录
	public boolean login(Staff s){
		boolean flag = false;
			
		try {
			ct = SQLHelper.getConnection();
			String sql = "select *from staff_login where sname = ? and spwd = ?";
			ps = ct.prepareStatement(sql);
			ps.setString(1,s.getSname());
			ps.setString(2,s.getSpwd());
			rs = ps.executeQuery();
			if(rs.next()){
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			SQLHelper.close(rs,ps,ct);
		}
			
		return flag;
	}
	//增加员工
		public boolean addStaff(Staff s){
			boolean flag = false;
			
			try {
				ct = SQLHelper.getConnection();
				String sql = "INSERT INTO staff_login (sname,spwd,salary,department) VALUES (?,?,?,?);";
				ps = ct.prepareStatement(sql);
				ps.setString(1,s.getSname());
				ps.setString(2, s.getSpwd());
//				未完善的字段，先保存两个字段：name和pwd
				ps.setInt(3, s.getSalary());
				ps.setString(4, s.getDepartment());
//				ps.setString(5, s.getSphone());
//				ps.setString(6, s.getSemail());
//				ps.setString(7, s.getSaddress());
				if(ps!=null){
					int count = ps.executeUpdate();
					if(count > 0){
						flag = true;
					}
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				SQLHelper.close(ct, ps);
			}
			
			return flag;
		}
	//查询全部员工信息
		public List<Staff> selStaff(int currentPage){
			List<Staff> list = new ArrayList<>();
			
			try {
				ct = SQLHelper.getConnection();
				String sql = "select *from staff_login limit ?,10;";
				ps = ct.prepareStatement(sql);
				ps.setInt(1, (currentPage - 1) * 10);
				rs = ps.executeQuery();
				//把从数据库里得到得数据传送到Staff里面，再把Staff里的数据给list
				while(rs.next()){
					Staff s = new Staff();//实例化一个staff，让每一行数据存入一个s
					s.setSid(rs.getInt(1));
					s.setSname(rs.getString(2));
					s.setSpwd(rs.getString(3));
					s.setSalary(rs.getInt(4));
					s.setDepartment(rs.getString(5));
//					s.setSphone(rs.getString(6));
//					s.setSemail(rs.getString(7));
//					s.setSaddress(rs.getString(8));
					list.add(s);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				SQLHelper.close(rs,ps,ct);
			}
			return list;
		}
		// 按照ID查询
		public Staff selectById(int sid,String sname){
			Staff s = new Staff();
			
			try {				
				ct = SQLHelper.getConnection();
//				String sql ="select * from staff_login where sid =?";
				String sql = "select * from staff_login where sid = ? or sname = ?;";
				ps = ct.prepareStatement(sql);
				ps.setInt(1, sid);
				ps.setString(2, sname);
				rs=ps.executeQuery();
				while(rs.next()){
					
					s.setSid(rs.getInt(1));
					s.setSname(rs.getString(2));
					s.setSpwd(rs.getString(3));
					s.setSalary(rs.getInt(4));
					s.setDepartment(rs.getString(5));	
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				SQLHelper.close(rs, ps, ct);
			}
			return s;
		}
		//修改员工密码
		public boolean alterspwd(Staff s,String sname){
			
			boolean flag = false;
			
			try {
				ct = SQLHelper.getConnection();
				String sql = "update staff_login set spwd = ? where sname = ?;";
				ps = ct.prepareStatement(sql);
				ps.setString(1,s.getSpwd() );
				ps.setString(2, sname);
				int count = ps.executeUpdate();
				if(count > 0){
					flag = true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				SQLHelper.close(ct, ps);
			}
			return flag;
		}
		//删除员工
		public boolean delsta(int sid){
			boolean flag = false;
			
			try {
				ct = SQLHelper.getConnection();
				String sql = "DELETE FROM staff_login WHERE sid = ?;";
				ps = ct.prepareStatement(sql);
				ps.setInt(1, sid);
				int count = ps.executeUpdate();
				if(count > 0){
					flag = true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				SQLHelper.close(ct, ps);
			}
			
			return flag;
		}
		//修改员工信息
		public boolean altersta(Staff s,int sid){
			boolean flag = false;
			
			try {
				ct = SQLHelper.getConnection();
				String sql = "UPDATE staff_login SET sname = ? ,spwd = ? ,salary = ? ,department = ? WHERE sid = ?;";
				ps = ct.prepareStatement(sql);
				ps.setString(1, s.getSname());
				ps.setString(2, s.getSpwd());
				ps.setInt(3, s.getSalary());
				ps.setString(4, s.getDepartment());
				ps.setInt(5, sid);
				
				int count = ps.executeUpdate();
				if(count > 0){
					flag = true;
				}
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				SQLHelper.close(ct, ps);
			}
			return flag;
		}
		//查看员工个人信息
		public Staff selsta(String sname){
			Staff s = new Staff();
			
			try {
				ct = SQLHelper.getConnection();
				String sql = "select *from staff_login where sname = ?;";
				ps = ct.prepareStatement(sql);
				ps.setString(1, sname);
				rs = ps.executeQuery();
				while(rs.next()){
					s.setSid(rs.getInt(1));
					s.setSname(rs.getString(2));
					s.setSpwd(rs.getString(3));
					s.setSalary(rs.getInt(4));
					s.setDepartment(rs.getString(5));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				SQLHelper.close(rs, ps,ct);
			}
			return s;
		}
		//根据选择的员工信息进行删除操作
		public boolean delStaBySelected(String para){
			boolean flag = false;
			
			try {
				ct = SQLHelper.getConnection();
				String sql = "DELETE FROM staff_login WHERE sid in ("+para+");";
				ps = ct.prepareStatement(sql);
				int count = ps.executeUpdate();
				if(count > 0){
					flag = true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				SQLHelper.close(ct, ps);
			}
			
			return flag;
		}
		//新建报表
		public boolean addWork(Work w) {
			boolean flag = false;
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			String ts = format.format(date);
					
			try {
				ct = SQLHelper.getConnection();
				String sql = "INSERT INTO work (editor,date,sellname,sellprice,buyname,buyprice) VALUES (?,?,?,?,?,?);";
				ps = ct.prepareStatement(sql);
				ps.setString(1, w.getEditor());
				ps.setString(2, ts);
				ps.setString(3, w.getSellName());
				ps.setInt(4, w.getSellPrice());
				ps.setString(5, w.getBuyName());
				ps.setInt(6, w.getBuyPrice());
				int count = ps.executeUpdate();
				if(count > 0){
					flag = true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				SQLHelper.close(ct, ps);
			}
			
			return flag;
			
		}
		//查询当前员工已创建的报表
		public List<Work> selWork(int currentPage,String sname){
			List<Work> list = new ArrayList<>();
			
			try {
				ct = SQLHelper.getConnection();
				String sql = "select * from ((select * from work where editor = ?) as worktab) limit ?,5;";
				ps = ct.prepareStatement(sql);
				ps.setString(1, sname);
				ps.setInt(2, (currentPage - 1) * 5);
				rs = ps.executeQuery();
				while(rs.next()){
					Work w = new Work();
					w.setId((rs.getInt(1)));
					w.setEditor(rs.getString(2));
					w.setDate(rs.getString(3));
					w.setSellName(rs.getString(4));
					w.setSellPrice(rs.getInt(5));
					w.setBuyName(rs.getString(6));
					w.setBuyPrice(rs.getInt(7));
					list.add(w);
				}
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("获取当前员工已经创建的报表 失败！！");
			}finally{
				SQLHelper.close(rs,ps,ct);
			}
			return list;
		}
		//查看某个报表
		public Work sta_selWork(int id){
			Work w = new Work();
			
			try {
				ct = SQLHelper.getConnection();
				String sql = "select * from work where id = ?;";
				ps = ct.prepareStatement(sql);								
				ps.setInt(1, id);
				System.out.println("DAO得到的报表id是"+id);
				rs = ps.executeQuery();
				while(rs.next()){
					w.setId((rs.getInt(1)));
					w.setEditor(rs.getString(2));
					w.setDate(rs.getString(3));
					w.setSellName(rs.getString(4));
					w.setSellPrice(rs.getInt(5));
					w.setBuyName(rs.getString(6));
					w.setBuyPrice(rs.getInt(7));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				SQLHelper.close(rs,ps,ct);
			}
			return w;
		}
		//获取数据总的行数
		public int datePage(String table){
			int count = 0;
			
			try {
				ct = SQLHelper.getConnection();
				if(table == "staff_login") {
					String sql = "select count(*) from staff_login;";				
					st = ct.createStatement();
					rs = st.executeQuery(sql);
					while(rs.next()){
						count = rs.getInt(1);//将获取的行数赋给count
					}
				} else if(table == "work") {
					System.out.println("---表是work表");
					String sql2 = "select count(*) from work;";
					st = ct.createStatement();
					rs = st.executeQuery(sql2);
					while(rs.next()){
						count = rs.getInt(1);
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				SQLHelper.close(rs, st,ct);
			}
			return count;
		}
}

