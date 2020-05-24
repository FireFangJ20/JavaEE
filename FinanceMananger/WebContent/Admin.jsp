<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="pageGPS.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有管理员信息</title>
<script src="jquery/jquery-1.9.1.min.js"></script>
<script src="js/toast.js"></script>
<link rel="stylesheet" href="css/QueryList.css"/>
<link rel="stylesheet" href="css/button.css"/>
<style>
/* 修改管理员信息窗口 */
.alterAdmArea{
position:fixed;
top:15%;
left:30%;
width:40%;
height:65%;
background:lightgrey;
border-radius:5px;
}
</style>	
<script type="text/javascript">
		$(document).ready(function(){
/*以下注释掉的方法为取出c：foreach中的某一数据，利用数组实现。目的是动态显示当前管理员在表中所在位置，不过未实现，用未注释的即可实现 */
			/* var arr = [];
			alert("0.0"); //测试能否执行至此
			$(".admin").each(function(){
						var id = $(this).attr('id');
						arr.push(id);
						});
			for(var i=0;i<=arr.length;i++){
				if(${currentAid}==arr[i]){
					$('.admin').attr('id',arr[i]);
					var k = i/4+1;
					alert("第"+k+"行"+${currentAid});
					alert("arrID为"+arr[i]); //测试能不能拿到c:forEach中的某一元素的数据
					$('.admin').attr('bgcolor','pink');
					}
			} */
			$("#"+${currentAid}).attr('bgcolor','pink');
			var m = document.getElementById("location${currentAid}");
			var n = document.getElementById("name${currentAid}");
			var o = document.getElementById("pwd${currentAid}");
			var p = document.getElementById("location1");
			m.innerHTML = "您自己";
			m.style.background = "pink";
			n.style.background = "pink";
			if(${currentAid}==1){
				/* $(".Apwd").removeAttr('style'); */
				p.innerHTML = "超级管理员  (您自己)";
			} else {
				p.innerHTML = "超级管理员";
			}
			o.style.background = "pink";			
			p.style.fontSize = "12px";					
		});
		
		if("${InfoAction}"=="afterAlter"){
			Toast("修改成功",2000);
		}
			/* var position = $('.admin');
			for(var i=0,i<=${a.aid},i++){
				if(bianhao==${a.aid}){
					position.innerHTML = "nihao";
				}
			} */
			
		/* $(".admin").each(function(){
			$(this).onload(function(){
				alert($(this).attr('id'));
				});
			}); */
			
		</script>	
</head>

	<body>
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
			<tr class="listHead">
				<td style="text-align: center">
					<div style="float: left; position: fixed">
						<button id="btn_submit" onclick="return delBySelected()"
							type="submit" class="delBySelected" title="删除所选信息" style="display:none">批量删除</button>
					</div> <span id="Title" style="font-size: 25px;">全 部 管 理 员 信 息</span>
				</td>
			</tr>
			<tr>
				<td>

					<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="grey">
						<tr>
							<td width="10%" height="30" bgcolor="skyblue" class="STYLE6">
								<div align="center"><span class="STYLE10">管理员编号</span></div>
							</td>
							<td width="10%" height="30" bgcolor="skyblue" class="STYLE6">
								<div align="center"><span class="STYLE10">管理员姓名</span></div>
							</td>
							<td width="10%" height="30" bgcolor="skyblue" class="STYLE6 Apwd">
								<div align="center"><span class="STYLE10">管理员密码</span></div>
							</td>
							<td width="10%" height="30" bgcolor="skyblue" class="STYLE6">
								<div align="center"><span class="STYLE10">操  作</span></div>
							</td>							
						</tr>
						<c:forEach items="${alist}" var="a">
						
							<tr>
								<td id="${a.aid }" width="10%" height="30" bgcolor="d3eaef" class="STYLE6 admin">
									<div align="center"><span class="STYLE6">${a.aid }</span></div>
								</td>
								<td id="name${a.aid }" width="10%" height="30" bgcolor="d3eaef" class="STYLE6 admin">
									<div align="center"><span class="STYLE6">${a.aname}</span></div>
								</td>
								<td id="pwd${a.aid }" name="Apwd" width="10%" height="30" bgcolor="d3eaef" class="STYLE6 admin Apwd">
									<div align="center"><span class="STYLE6">${a.apwd}</span></div>
								</td>
								<td id="location${a.aid }" width="10%" height="30" bgcolor="d3eaef" class="STYLE6 admin" style="text-align:center">
									<!-- <div align="center"><span class="STYLE10" style="display:block">--</span></div> -->
									<div style="display: block" align="center">
									<span class="STYLE6"> <a
										onclick="return del()" href="AdminServlet?met=delAdmin&aid=${a.aid}" >删除</a> <a
										href="javascript:void(0);" class="revise" value="${a.aid }">修改</a>
									</span>
								</div>
								</td>
							</tr>
							
						</c:forEach>

					</table>
				</td>
			</tr>
		</table>
		
	<div class="PageBox">
			<a id="pre_a"
				href="AdminServlet?met=selAdmin&currentPage=${currentPage-1 }"
				class="Href" title="上一页">&laquo;</a> &nbsp;<span
				class="pageCount">第${currentPage }页/共${totalPage }页</span>
			&nbsp;&nbsp;<a id="last_a"
				href="AdminServlet?met=selAdmin&currentPage=${currentPage+1 }"
				class="Href" title="下一页">&raquo;</a>&nbsp;&nbsp;&nbsp;&nbsp; <input
				type="text" id="GPS" style="width: auto;background: none" placeholder="输入页码跳转" class="pageCount"/>
				<button type="button" class="btn" id="btn_doGPS">跳   转</button>
				<a
				class="Href" id="admPage_doGPS" href="javascript:void(0);" style="display:none">跳转</a>
		</div>
		
		<div class="topArea" style="position:fixed;top:0;left:0;width:100%;height:100%;background:rgb(0,0,0,0.5);display:none">
	<form id="reviseAdmForm" action="" method="post">
	<div class="alterAdmArea" style="display:block">
	<div style="position:relative;top:0;width:100%;height:10%;background:#393939;border-radius:5px;color:white;font-size:30px;text-align:center">修&nbsp;改&nbsp;管&nbsp;理&nbsp;员&nbsp;信&nbsp;息</div>
	<div style="position:relative;top:10%;left:30%;"><label>管理员姓名：</label><input type="text" name="aname"/></div>
	<div style="position:relative;top:30%;left:30%;"><label>管理员密码：</label><input type="text" name="apwd"/></div>
	<button type="button" class="button" onclick="shut()" style="position:relative;top:45%;left:10%">关闭</button>
	<button type="button" class="button" onclick="save()" style="position:relative;top:45%;left:45%">保存</button></div>
	</form>
	</div>
	<script type="text/javascript">
	$(".revise").on('click',function(){
		var c = this.getAttribute("value");
		$("#reviseAdmForm").attr("action","AdminServlet?met=alterAdmin&aid="+c);
		$(".topArea").fadeIn(300);
	});
	function revise(){
		var c = this.getAttribute("value");
		$("#reviseAdmForm").attr("action","AdminServlet?met=alterAdmin&aid="+c);
		
		$(".topArea").fadeIn(300);
	}
	function shut(){
		$(".topArea").fadeOut(300);
	}
	function save(){
		$("#reviseAdmForm").submit();
	}
	</script>
</body>
</html>