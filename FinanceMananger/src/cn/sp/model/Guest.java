package cn.sp.model;

//客户实体类
public class Guest {
	private int gid;//客户编号（主键）
	private String gname;//客户姓名
	private String gaddress;//客户住址
	private String gphone;//客户联系方式（不一定只是手机号）
	private String gdate;//客户添加日期
	private int operator;//客户添加操作者（管理员id）
	public Guest(int gid,String gname,String gaddress,String gphone,String gdate,int operator) {
		super();
		this.gid = gid;
		this.gname = gname;
		this.gaddress = gaddress;
		this.gphone = gphone;
		this.gdate = gdate;
		this.operator = operator;
	}
	public Guest() {
		super();
	}
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public String getGaddress() {
		return gaddress;
	}
	public void setGaddress(String gaddress) {
		this.gaddress = gaddress;
	}
	public String getGphone() {
		return gphone;
	}
	public void setGphone(String gphone) {
		this.gphone = gphone;
	}
	public String getGdate() {
		return gdate;
	}
	public void setGdate(String gdate) {
		this.gdate = gdate;
	}
	public int getOperator() {
		return operator;
	}
	public void setOperator(int operator) {
		this.operator = operator;
	}	
}
