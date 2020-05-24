package cn.sp.model;

public class Staff {
	private int sid;
	private String sname;
	private String spwd;
	private String department;
	private int salary;
	public Staff(int sid,String sname,String spwd,String department,int salary) {
		super();
		this.sid = sid;
		this.sname = sname;
		this.spwd = spwd;
		this.department = department;
		this.salary = salary;
	}
	public Staff() {
		super();
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSpwd() {
		return spwd;
	}
	public void setSpwd(String spwd) {
		this.spwd = spwd;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}

}
