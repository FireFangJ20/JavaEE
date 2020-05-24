<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>工作报表</title>
<jsp:include page="pageGPS.jsp"></jsp:include>
<link rel="stylesheet" href="css/button.css">
<link rel="stylesheet" href="css/QueryList.css"/>
<script src="js/toast.js"></script>
<script src="js/jquery-1.9.1.min.js"></script>
<style type="text/css">
.tbody{
position:fixed;
width:40%;
height:30%;
top:20%;
left:30%;
border:5px outset green;
}
td{
background:silver;
}
.bottom{
posotion:fixed;
margin-top:450px;
margin-left:530px;
width:200px;
height:80px;
background:none;
}
.floatWindow{  /* 新建报表弹窗 */
width:700px;
height:450px;
position:fixed;
top:10%;
left:20%;
background:lightgrey;
z-index:10;
opacity:1;
border-radius:10px;
border:4px outset #262626;
box-shadow:5px 5px 5px black;
-webkit-animation-duration: 1s;
-webkit-animation-name: hiddenArea;
}
.floatWindow_selWork{  /* 我的报表弹窗  和上面的样式是一样的*/
width:700px;
height:450px;
position:fixed;
top:10%;
left:20%;
background:lightgrey;
z-index:10;
opacity:1;
border-radius:10px;
border:4px outset #262626;
box-shadow:5px 5px 5px black;
-webkit-animation-duration: 1s;
-webkit-animation-name: hiddenArea;
}
@-webkit-keyframes hiddenArea {  
  from { width:0px;opacity: 0; }
  to { width:700px;opacity: 1; }  
}
.hh{
-webkit-animation-duration: 5s;
-webkit-animation-name: hiddenArea;
}
.btn_shut{
background:orangered;
color:white;
position:relative;
top:80%;
left:25%;
z-index:15;
}
.btn_save{
color:white;
position:relative;
top:80%;
left:45%;
z-index:15;
}
.label_buy{
position:absolute;
color:black;
font-size:20px;
top:20%;
left:5%;
z-index:15;
}
.input_buy{
position:absolute;
width:150px;
height:20px;
border:3px outset blue;
top:20%;
left:20%;
z-index:15;
}
input:hover{
box-shadow: 2px 2px 3px black
}
</style>
<script type="text/javascript">


$(function (){	
	var s = '<%=request.getAttribute("workFormStat")%>';
	if(s == "success"){
		Toast("保存成功！");
	}
	
	var aa = '<%=request.getAttribute("type")%>';
	if(aa == "sta_selWork"){
		look();
	}

	
	$(".btn_shut").on('click',function (){
		$(".floatWindow").slideUp();
		$('.btn_shut,.btn_save,.label_buy,.input_buy,.title,.list1,.list2').fadeOut(300);
	});
	$(".btn_save").on('click',function (){
		var u = document.getElementById("ipt").value;
		var v = document.getElementById("ipt1").value;
		var w = document.getElementById("ipt2").value;
		var x = document.getElementById("ipt3").value;
		var flag1 = u+v=="" ;//支出记录为空
		var flag2 = w+x=="" ;//收入记录为空
		var flag3 = flag1&&flag2 ;//全部为空
		var flag1_1 = u!=""&&v=="";//购入金额为空
		var flag1_2 = u==""&&v!="";//购入商品为空
		var flag1_3 = flag1_1||flag1_2;//支出记录不完整
		var flag2_1 = w!=""&&x=="";//销售金额为空
		var flag2_2 = w==""&&x!="";//销售商品为空
		var flag2_3 = flag2_1||flag2_2;//收入记录不完整

		if(!flag1_3&&!flag2_3&&!flag3){
			/* Toast("所有记录完整,可以保存！"); */
			$('.floatWindow').slideUp();
			setTimeout(function (){
				var submit = document.getElementById("work-form");
				submit.submit();
			},1000);
			
		}
		if(flag3){
			Toast("未填写任何信息！",3000);
		}
		if(flag1_3&&!flag2_3){
			Toast("支出记录不完整",3000);
		}
		if(flag2_3&&!flag1_3){
			Toast("收入记录不完整",3000);
		}
		if(flag1_3&&flag2_3){
			Toast("请检查输入的信息是否完整",3500);
		}
	});
	//'查看我的报表'弹窗开启
	$(".look").on('click',function (){

			var a = $(this).attr('value');
			var b = document.getElementsByTagName("c:if");
			//var aa = document.createElement("c:forEach");
			//var bb = document.createElement("c:if");
			var cc = document.getElementById("tab_selWork");
			//$("#cif").attr('test','${w.date}=='+this.value);
			$(".floatWindow_selWork").fadeIn(300);
		
	});
	//'查看我的报表'弹窗关闭
	$("#selWork_btn_shut").on('click',function (){
		var a = document.createElement("a");
		a.href = "StaffServlet?met=selWork&sname=${name }";
		a.click();
	});
});
function look(){
	$(".floatWindow_selWork").fadeIn(300);
}
function aadd(){
	Toast("${name} 正在创建报表");
	$('.floatWindow,.btn_shut,.btn_save,.label_buy,.input_buy,.title,.list1,.list2').fadeIn();	
}
</script>
</head>
<body style="background-image:url(images/世界地图2.jpg);background-size:100% 128%;">
<table class="tbody">
<c:forEach items="${wlist}" var="w">
<tr><td><span style="position:relative;left:0%">${w.id }&nbsp;</span><center>${w.date}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="look" href="StaffServlet?met=sta_selWork&id=${w.id }">查看</a></center></td></tr>
</c:forEach>
</table>
<div class="PageBox" style="top:65%;height:65px">
			<a id="pre_a"
				href="StaffServlet?met=selWork&currentPage=${currentPage-1 }&sname=${name}"
				class="Href" title="上一页">&laquo;</a> &nbsp;<span
				class="pageCount">第${currentPage }页/共${totalPage }页</span>
			&nbsp;&nbsp;<a id="last_a"
				href="StaffServlet?met=selWork&currentPage=${currentPage+1 }&sname=${name}"
				class="Href" title="下一页">&raquo;</a>&nbsp;&nbsp;&nbsp;&nbsp; <input
				type="text" id="GPS" style="display:none;width: auto;background: none" placeholder="输入页码跳转" class="pageCount"/>
				<button style="display:none" type="button" class="btn" id="btn_doGPS">跳   转</button>
				<a
				class="Href" id="workPage_doGPS" href="javascript:void(0);" style="display:none">跳转</a>
		</div>
<div class="bottom">
<button class="button" type="button" onclick="aadd()">新    建</button>
<form action="StaffServlet?met=selWork&sname=${name }" method="post" style="display:none"><button class="button">我的报表</button></form>
</div>
<form id="work-form" action="StaffServlet?met=addWork&sname=${name}" method="post">
<div class="floatWindow" style="display:none">
<div class="title" style="width:100%;height:10%;border-radius:6px;background:#393939;font-size:30px;text-align:center;position:absolute;left:0%;color:white;top:0%;">新&nbsp;建&nbsp;报&nbsp;表</div>
<div class="list1" style="width:100px;height:20px;background:crimson;color:white;position:absolute;left:5px;top:15%">支出记录</div><label class="label_buy">购入商品：</label><input id="ipt" name="buyName" type="text" class="input_buy"/>
<label class="label_buy" style="left:50%">购入金额：</label><input id="ipt1" name="buyPrice" class="input_buy" style="left:65%"/>
<div class="list2" style="width:100px;height:20px;background:crimson;color:white;position:absolute;left:5px;top:50%">收入记录</div><label class="label_buy" style="top:55%">销售商品：</label><input id="ipt2" name="sellName" type="text" class="input_buy" style="top:55%"/>
<label class="label_buy" style="top:55%;left:50%">销售金额：</label><input id="ipt3" name="sellPrice" class="input_buy" type="text" style="top:55%;left:65%"/>
<button type="button" class="button btn_shut">关    闭</button><button type="button" class="button btn_save">保    存</button>
</div>
<a id="a_save" href="StaffServlet?met=addWork&sid=${name}" style="display:none">保    存</a>
</form>
<div class="floatWindow_selWork" style="display:none">
<div class="title" style="width:100%;height:10%;border-radius:6px;background:#393939;font-size:30px;text-align:center;position:absolute;left:0%;color:white;top:0%;">我&nbsp;的&nbsp;报&nbsp;表</div>
<div class="list1" style="width:100px;height:20px;background:crimson;color:white;position:absolute;left:5px;top:15%">支出记录</div><label class="label_buy">购入商品：${w.buyName}</label>
<label class="label_buy" style="left:50%">购入金额：${w.buyPrice}</label>
<div class="list2" style="width:100px;height:20px;background:crimson;color:white;position:absolute;left:5px;top:50%">收入记录</div><label class="label_buy" style="top:55%">销售商品：${w.sellName}</label>
<label class="label_buy" style="top:55%;left:50%">销售金额：${w.sellPrice}</label>
报表编号：${w.id }
<%-- <table id="tab_selWork" style="position:relative;width:75%;height:65%;background:skyblue;top:15%;left:12.5%">
<tr><td>销售商品：${w.sellName}</td><td>销售金额：${w.sellPrice}</td></tr>
<tr><td>购入商品：${w.buyName}</td><td>购入金额：${w.buyPrice}</td></tr>
</table> --%>
<button id="selWork_btn_shut" type="button" class="button" style="position:absolute;bottom:10px;left:40%;">关    闭</button>
</div>
</body>
</html>