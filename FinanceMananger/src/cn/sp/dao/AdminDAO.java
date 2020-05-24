package cn.sp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import cn.sp.model.Admin;
import cn.sp.model.Staff;
import cn.sp.model.Work;
import cn.sp.util.SQLHelper;

public class AdminDAO {
	
	private  Connection ct = null;
	private  PreparedStatement ps = null;
	private  ResultSet rs = null;
	private  Statement st = null;
	//判断登录身份为管理员时的用户名和密码是否匹配，返回boolean值给Servlet进行判断是否登录成功
	public boolean login(Admin a){
		boolean flag = false;
		
		try {
			ct = SQLHelper.getConnection();
			String sql = "select *from admin_login where aname = ? and apwd = ?";
//			System.out.println("登录：查询管理员表");//debug语句
			ps = ct.prepareStatement(sql);
			ps.setString(1,a.getAname());
			ps.setString(2,a.getApwd());
			rs = ps.executeQuery();
			if(rs.next()){
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			SQLHelper.close(rs, ps,ct);
		}
		return flag;
	}
	
//	获得当前登录的管理员的id，用于高亮显示信息
//	public int CurrentAid(Admin a) {
//		int currentAid;
//		try {
//			ct = SQLHelper.getConnection();
//			String sql = "select aid from admin_login where aname = ? and apwd = ?";
//			ps = ct.prepareStatement(sql);
//			ps.setString(1, a.getAname());
//			ps.setString(2, a.getApwd());
//			rs = ps.executeQuery();
//			if(rs.next()) {
//				currentAid = a.getAid();
//			}
//			
//		}
//		
//		return currentAid;
//	}
	//管理员更改密码操作
	public boolean alterApwd(Admin a,int aid){
		boolean flag = false;
		
		try {
			ct = SQLHelper.getConnection();
			String sql = "update admin_login set apwd = ? where aid = ?;";
			ps = ct.prepareStatement(sql);
			ps.setString(1, a.getApwd());
			ps.setInt(2, aid);
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
	//当前管理员添加管理员
	public boolean addAdmin(Admin a){
		boolean flag = false;
	
		try {
			ct = SQLHelper.getConnection();
			String sql = "insert into admin_login (aname,apwd) values (?,?);";
			ps = ct.prepareStatement(sql);
			ps.setString(1, a.getAname());
			ps.setString(2, a.getApwd());
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
	//根据管理员id查询管理员信息
	public Admin SelById(int aid){
		Admin a = new Admin();
		
		try {
			ct = SQLHelper.getConnection();
			String sql = "select *from admin_login where aid = ?;";
			ps = ct.prepareStatement(sql);
			ps.setInt(1, aid);
			rs = ps.executeQuery();
			while(rs.next()){
				a.setAid(rs.getInt(1));
				a.setAname(rs.getString(2));
				a.setApwd(rs.getString(3));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			SQLHelper.close(ct, ps);
			}
		return a;
	}
	//根据当前登录的管理员的姓名查询其id号码
	public Admin selByName(String aname){
		Admin a = new Admin();
		
		try {
			ct = SQLHelper.getConnection();
			String sql = "Select aid from admin_login where aname = ?;";
			ps = ct.prepareStatement(sql);
			ps.setString(1, aname);
			rs = ps.executeQuery();
			while (rs.next()){
				a.setAid(rs.getInt(1));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			SQLHelper.close(ct, ps);
		}
		return a;
	}
	//查询所有管理员的信息
	public List<Admin> selAdmin(int currentPage){
		List<Admin> list = new ArrayList<>();
		
		try {
			ct = SQLHelper.getConnection();
			String sql = "select *from admin_login limit ?,10;";
			ps = ct.prepareStatement(sql);
			ps.setInt(1, (currentPage - 1) * 10);
			rs = ps.executeQuery();
			while(rs.next()){
				Admin a = new Admin();
				a.setAid(rs.getInt(1));
				a.setAname(rs.getString(2));
				a.setApwd(rs.getString(3));
				list.add(a);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			SQLHelper.close(rs,ps,ct);
		}
		return list;
	}
	//超级管理员删除管理员
	public boolean delAdmin(int aid){
		boolean flag = false;
		
		try {
			ct = SQLHelper.getConnection();
			String sql = "DELETE FROM admin_login WHERE aid = ?;";
			ps = ct.prepareStatement(sql);
			ps.setInt(1, aid);
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
	//修改管理员信息
	public boolean alterAdmin(Admin a,int aid){
		boolean flag = false;
		
		try {
			ct = SQLHelper.getConnection();
			String sql = "UPDATE admin_login SET aname = ? ,apwd = ? WHERE aid = ?;";
			ps = ct.prepareStatement(sql);
			ps.setString(1, a.getAname());
			ps.setString(2, a.getApwd());
			ps.setInt(3, aid);
			
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
	//查询管理员表中的数据一共有多少条，返回给Servlet进行分页
	public int datePage(){
		int count = 0;
		
		try {
			ct = SQLHelper.getConnection();
			String sql = "select count(*) from admin_login;";
			st = ct.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			SQLHelper.close(rs, st,ct);
		}
		return count;
	}
	//查询work表里的所有内容
	public List<Work> selWork(int currentPage){
		List<Work> list = new ArrayList<>();
		
		try {
			ct = SQLHelper.getConnection();
			String sql = "select * from work limit ?,10;";
			ps = ct.prepareStatement(sql);
			ps.setInt(1, (currentPage - 1) * 10);
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
			System.out.println("获取work表的所有内容 失败！！");
		}finally{
			SQLHelper.close(rs,ps,ct);
		}
		return list;
	}
}
