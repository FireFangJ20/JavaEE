<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>搜索结果-客户信息</title>
<link rel="stylesheet" href="css/button.css"/>
<style>
.STYLE6 {color: #000000; font-size: 12; }
.STYLE10 {color: #000000; font-size: 12px; }
.STYLE1 {
position:fixed;
width:100%;
top:1%;
background:#393939;
  color: #e1e2e3;
  font-size: 12px;
}
.alterGstArea{
position:fixed;
top:15%;
left:30%;
width:40%;
height:65%;
background:lightgrey;
border-radius:5px;
}
</style>
<script src="js/toast.js"></script>
<script src="js/jquery-1.9.1.min.js"></script>
<script>
window.onload = function(){
	if(${g.gid}==0){
		Toast("没有相关信息！",2000);
	}
}
function alter(){
	if(${g.gid} == 0){
		Toast("没有可修改的信息",2000);
	} else {
		$(".topArea").fadeIn(300);
	}
	
}
function del(){
	if(${g.gid} == 0){
		Toast("没有可删除的信息",2000);
	} else {
		var s = window.confirm("确认删除？");
		if(s){
			var b = document.getElementById("href_delete");
			b.click();
		} else {
			return false;
		}		
	}
}
function shut(){
	$(".topArea").fadeOut(300);
}
function save(){
	var a = ${g.gid};
	$("#reviseGstForm").attr("action","GuestServlet?met=alterGuest&gid="+a);
	$("#reviseGstForm").submit();
}
</script>
</head>
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="94%" valign="bottom"><span class="STYLE1"> 客户基本信息列表</span></td>
              </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" style="position:fixed;top:5%;">
      <tr>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">客户编号</span></div></td>
        <td width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">客户姓名</span></div></td>
        <td width="14%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">客户地址</span></div></td>
        <td width="14%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">客户联系方式</span></div></td>
        <td width="14%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">客户添加日期</span></div></td>
        <td width="14%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">操作员编号</span></div></td>
      </tr>
      <tr>
        <td  width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">${g.gid }</span></div></td>
        <td  width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">${g.gname}</span></div></td>
        <td   width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">${g.gaddress}</span></div></td>
        <td   width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">${g.gphone}</span></div></td>
        <td   width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">${g.gdate }</span></div></td>
        <td   width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">${g.operator}</span></div></td>
        </td>
      </tr>     
    </table>
    
    <div class="topArea" style="position:fixed;top:0;left:0;width:100%;height:100%;background:rgb(0,0,0,0.5);z-index:10;display:none">
	<form id="reviseGstForm" action="" method="post">
	<div class="alterGstArea" style="display:block">
	<div style="position:relative;top:0;width:100%;height:15%;background:#393939;border-radius:5px;color:white;font-size:30px;text-align:center">修&nbsp;改&nbsp;客&nbsp;户&nbsp;信&nbsp;息</div>
	<div style="position:relative;top:10%;left:25%;"><label>客户姓名：</label><input type="text" name="gname"/></div>
	<div style="position:relative;top:20%;left:25%;"><label>客户地址：</label><input type="text" name="gaddress"/></div>
	<div style="position:relative;top:30%;left:25%;"><label>联系方式：</label><input type="text" name="gphone"/></div>
	<button type="button" class="button" onclick="shut()" style="position:relative;top:55%;left:10%">关闭</button>
	<button type="button" class="button" onclick="save()" style="position:relative;top:55%;left:45%">保存</button></div>
	</form>
	</div>
	
	<div style="width:230px;height:50px;background:none;margin-top:300px;margin-left:450px;position:fixed">
	<button class="button" onclick="alter()">修    改</button>
	<button class="button" onclick="del()">删    除</button></div>
	<a id="href_alter" href="GuestServlet?met=alterGuest&type=alter&gid=${g.gid}" style="display:none">修  改</a>
	<a id="href_delete" href="GuestServlet?met=delGuest&gid=${g.gid}" style="display:none">删  除</a>
</body>
</html>