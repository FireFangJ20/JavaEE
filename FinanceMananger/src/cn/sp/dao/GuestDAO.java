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

import cn.sp.model.Guest;
import cn.sp.util.SQLHelper;

public class GuestDAO {
	private Connection ct = null;
	private Statement st = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	// 查询全部客户信息
	public List<Guest> selGuest(int currentPage) {
		List<Guest> list = new ArrayList<>();

		try {
			ct = SQLHelper.getConnection();
			String sql = "select *from guest limit ?,10;";
			ps = ct.prepareStatement(sql);
			ps.setInt(1, (currentPage - 1) * 10);
			rs = ps.executeQuery();
			while (rs.next()) {
				Guest g = new Guest();
				g.setGid(rs.getInt(1));
				g.setGname(rs.getString(2));
				g.setGaddress(rs.getString(3));
				g.setGphone(rs.getString(4));
				g.setGdate(rs.getString(5));
				g.setOperator(rs.getInt(6));
				list.add(g);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SQLHelper.close(rs, ps, ct);
		}
		return list;
	}
	
	//添加客户,返回给AdminServlet进行判断是否添加成功
	public boolean addGuest(Guest g) {
		boolean flag = false;
		try {
			ct = SQLHelper.getConnection();
			String sql = "insert into guest (gname,gaddress,gphone,gdate,operator) values (?,?,?,?,?)";
			ps = ct.prepareStatement(sql);
			ps.setString(1, g.getGname());
			ps.setString(2, g.getGaddress());
			ps.setString(3, g.getGphone());
			//获取添加日期
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date(); 
			String ts = format.format(date);
			ps.setString(4, ts);
			ps.setInt(5, g.getOperator());
			int count = ps.executeUpdate();
			if(count > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SQLHelper.close(ct, ps);
		}
		return flag;
	}
	//批量删除客户信息
	public boolean delGstBySelected(String para){
		boolean flag = false;
		
		try {
			ct = SQLHelper.getConnection();
			String sql = "DELETE FROM guest WHERE gid in ("+para+");";
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
	//删除客户信息
	public boolean delGuest(int gid) {
		boolean flag = false;
		try {
			ct = SQLHelper.getConnection();
			String sql = "DELETE FROM guest WHERE gid = ? ;";
			ps = ct.prepareStatement(sql);
			ps.setInt(1, gid);
			int count = ps.executeUpdate();
			if(count > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SQLHelper.close(ct,ps);
		}
		return flag;
	}
	//修改客户信息
	public boolean alterGuest(Guest g,int gid) {
		boolean flag = false;
		try {
			ct = SQLHelper.getConnection();
			String sql = "UPDATE guest SET gname = ? ,gaddress = ? ,gphone = ? ,gdate = ? ,operator = ? WHERE gid = ?;";
			ps = ct.prepareStatement(sql);
			ps.setString(1, g.getGname());
			ps.setString(2, g.getGaddress());
			ps.setString(3, g.getGphone());
			ps.setString(4, g.getGdate());
			ps.setInt(5, g.getOperator());
			ps.setInt(6, gid);
			
			int count = ps.executeUpdate();
			if(count > 0){
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SQLHelper.close(ct,ps);
		}
		return flag;
	}
	//搜索客户信息
	public Guest searchGuest(int gid,String gname) {
		Guest g = new Guest();
		try {				
			ct = SQLHelper.getConnection();
			String sql = "select * from guest where gid = ? or gname = ?;";
			ps = ct.prepareStatement(sql);
			ps.setInt(1, gid);
			ps.setString(2, gname);
			rs=ps.executeQuery();
			while(rs.next()){				
				g.setGid(rs.getInt(1));
				g.setGname(rs.getString(2));
				g.setGaddress(rs.getString(3));
				g.setGphone(rs.getString(4));
				g.setGdate(rs.getString(5));
				g.setOperator(rs.getInt(6));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			SQLHelper.close(rs, ps, ct);
		}
		return g;
	}
	//查询guest表中所有的数据，返回给servlet进行分页
	public int datePage(){
		int count = 0;
		
		try {
			ct = SQLHelper.getConnection();
			String sql = "select count(*) from guest;";
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
}
