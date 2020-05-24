<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="pageGPS.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员-查看员工报表</title>
<link rel="stylesheet" href="css/QueryList.css"/>
<link rel="stylesheet" href="css/button.css">
<style>
.label_buy{
position:absolute;
color:black;
background:grey;
font-size:20px;
top:25%;
left:5%;
width:400px;
height:50px;
z-index:15;
}

</style>
<script src="js/jquery-1.9.1.min.js"></script>
<script src="js/toast.js"></script>
<script type="text/javascript">
$(function () {
	var a = '<%=request.getAttribute("flag")%>';
	if(a=="someone"){
		$("#hidediv").fadeIn(300);
	}
	$(".shut").on("click",function () {
		location.href = "AdminServlet?met=staffWork&scope=all";
	})
})
</script>
</head>
<body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
			<tr class="listHead">
				<td style="text-align: center">
					<div style="float: left; position: fixed">
						<button id="btn_submit" onclick="return delBySelected()"
							type="submit" class="delBySelected" title="删除所选信息" style="display:none">批量删除</button>
					</div> <span id="Title" style="font-size: 25px;">全 部 报 表</span>
				</td>
			</tr>
			<tr>
				<td>

					<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="grey">
						<tr>
							<td width="10%" height="30" bgcolor="skyblue" class="STYLE6">
								<div align="center"><span class="STYLE10">报表编号</span></div>
							</td>
							<td width="10%" height="30" bgcolor="skyblue" class="STYLE6">
								<div align="center"><span class="STYLE10">编辑者</span></div>
							</td>
							<td width="10%" height="30" bgcolor="skyblue" class="STYLE6 Apwd">
								<div align="center"><span class="STYLE10">添加日期</span></div>
							</td>
							<td width="10%" height="30" bgcolor="skyblue" class="STYLE6">
								<div align="center"><span class="STYLE10">操  作</span></div>
							</td>							
						</tr>
						<c:forEach items="${adm_wlist}" var="w">
						
							<tr>
								<td id="" width="10%" height="30" bgcolor="d3eaef" class="STYLE6 admin">
									<div align="center"><span class="STYLE6">${w.id }</span></div>
								</td>
								<td id="" width="10%" height="30" bgcolor="d3eaef" class="STYLE6 admin">
									<div align="center"><span class="STYLE6">${w.editor}</span></div>
								</td>
								<td id="" name="Apwd" width="10%" height="30" bgcolor="d3eaef" class="STYLE6 admin Apwd">
									<div align="center"><span class="STYLE6">${w.date}</span></div>
								</td>
								<td id="" width="10%" height="30" bgcolor="d3eaef" class="STYLE6 admin" style="text-align:center">
									<div style="display: block" align="center">
									<span class="STYLE6"> <a
										 href="AdminServlet?met=staffWork&id=${w.id}&scope=someone" >查看</a>	</span>
								</div>
								</td>
							</tr>
							
						</c:forEach>

					</table>
				</td>
			</tr>
		</table>
		<div id="hidediv" style="position:fixed;top:0px;width:1366px;height:768px;background:white;display:none;z-index:999">
		<div style="position:fixed;width:80%;height:60%;top:15%;left:10%;background:lightgrey;border-radius:10px;box-shadow:5px 5px 5px black;">
		<div style="position:relative;top:0;width:100%;background:#393939;font-size:20px;border-radius:5px;color:white">编号：${w.id }&nbsp;&nbsp;&nbsp;&nbsp;添加日期：${w.date }&nbsp;&nbsp;&nbsp;&nbsp;添加者：${w.editor }</div>
		<div class="list1" style="width:100px;height:20px;background:crimson;color:white;position:absolute;left:5px;top:15%">支出记录</div>
			<label class="label_buy">购入商品：&nbsp;&nbsp;&nbsp;&nbsp;${w.buyName }</label>
			<label class="label_buy" style="left:50%;">购入金额：&nbsp;&nbsp;&nbsp;&nbsp;${w.buyPrice }</label>
		<div class="list2" style="width:100px;height:20px;background:crimson;color:white;position:absolute;left:5px;top:50%">收入记录</div>
			<label class="label_buy" style="top:60%">销售商品：&nbsp;&nbsp;&nbsp;&nbsp;${w.sellName }</label>
			<label class="label_buy" style="top:60%;left:50%;">销售金额：&nbsp;&nbsp;&nbsp;&nbsp;${w.sellPrice }</label>
		<button class="button shut" style="position:absolute;bottom:0px;left:40%">关  闭</button>
		</div>
		</div>
		
	<div class="PageBox">
			<a id="pre_a"
				href="AdminServlet?met=staffWork&currentPage=${currentPage-1 }&scope=all"
				class="Href" title="上一页">&laquo;</a> &nbsp;<span
				class="pageCount">第${currentPage }页/共${totalPage }页</span>
			&nbsp;&nbsp;<a id="last_a"
				href="AdminServlet?met=staffWork&currentPage=${currentPage+1 }&scope=all"
				class="Href" title="下一页">&raquo;</a>&nbsp;&nbsp;&nbsp;&nbsp; <input
				type="text" id="GPS" style="width: auto;background: none" placeholder="输入页码跳转" class="pageCount"/>
				<button type="button" class="btn" id="btn_doGPS">跳   转</button>
				<a
				class="Href" id="adm_workPage_doGPS" href="javascript:void(0);" style="display:none">跳转</a>
		</div>

</body>
</html>