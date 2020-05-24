package cn.sp.model;

// 工作报表实体
public class Work {
	private String buyName;		//购入商品的名称
	private int buyPrice;		//购入商品的价格
	private String sellName;	//销售商品的名称
	private int sellPrice;		//销售商品的价格
	private String editor;			//添加者id
	private String date;		//添加日期
	private int id;				//报表编号
	
	public Work(String buyName,int buyPrice,String sellName,int sellPrice,String editor,String date,int id) {
		super();
		this.buyName = buyName;
		this.buyPrice = buyPrice;
		this.sellName = sellName;
		this.sellPrice = sellPrice;
		this.editor = editor;
		this.date = date;
		this.id = id;
	}
	public Work() {
		super();
	}
	public String getBuyName() {
		return buyName;
	}
	public void setBuyName(String buyName) {
		this.buyName = buyName;
	}
	public int getBuyPrice() {
		return buyPrice;
	}
	public void setBuyPrice(int buyPrice) {
		this.buyPrice = buyPrice;
	}
	public String getSellName() {
		return sellName;
	}
	public void setSellName(String sellName) {
		this.sellName = sellName;
	}
	public int getSellPrice() {
		return sellPrice;
	}
	public void setSellPrice(int sellPrice) {
		this.sellPrice = sellPrice;
	}
	public String getEditor() {
		return editor;
	}
	public void setEditor(String editor) {
		this.editor = editor;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}				
}
