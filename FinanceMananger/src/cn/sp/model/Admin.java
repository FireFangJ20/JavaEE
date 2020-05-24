package cn.sp.model;

public class Admin {
	private int aid;
	private String aname;
	private String apwd;
//	有参构造方法
	public Admin(int aid,String aname,String apwd) {
		super();
		this.aid = aid;
		this.aname = aname;
		this.apwd = apwd;
	}
//	无参构造方法
	public Admin() {
		super();
	}
//	getter,setter方法
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getApwd() {
		return apwd;
	}
	public void setApwd(String apwd) {
		this.apwd = apwd;
	}
}
