<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/pageGPS.jsp"/> <!-- 引入jsp文件，使用其中的js -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>客户信息界面</title>
<script src="jquery/jquery-1.9.1.min.js"></script>
<script src="js/toast.js"></script>
<link rel="stylesheet" href="css/QueryList.css" />
<link rel="stylesheet" href="css/button.css" />
<style>
/* 修改客户信息窗口 */
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
</head>
<body>
<form action="AdminServlet?met=delGstBySelected" method="post">
	<table width="100%" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr class="listHead">
				<td style="text-align: center">
					<div style="float: left; position: fixed">
						<button id="btn_submit" onclick="return delBySelected()"
							type="submit" class="delBySelected" title="删除所选信息">批量删除</button>
					</div> <span id="Title" style="font-size: 25px;">全 部 客 户 信 息</span>
				</td>
			</tr>
		<tr>
			<td>
				<table width="100%" border="0" cellpadding="0" cellspacing="1"
					bgcolor="grey">
					<tr>
					<td width="4%" height="30" bgcolor="skyblue" class="STYLE6 xuanze">
							<div align="center">
								<span class="STYLE10">选择</span>
							</div>
						</td>
						<td width="10%" height="30" bgcolor="skyblue" class="STYLE6">
							<div align="center">
								<span class="STYLE10">客户编号</span>
							</div>
						</td>
						<td width="10%" height="30" bgcolor="skyblue" class="STYLE6">
							<div align="center">
								<span class="STYLE10">客户姓名</span>
							</div>
						</td>
						<td width="10%" height="30" bgcolor="skyblue" class="STYLE6">
							<div align="center">
								<span class="STYLE10">客户住址</span>
							</div>
						</td>
						<td width="10%" height="30" bgcolor="skyblue" class="STYLE6">
							<div align="center">
								<span class="STYLE10">客户联系方式</span>
							</div>
						</td>
						<td width="10%" height="30" bgcolor="skyblue" class="STYLE6">
							<div align="center">
								<span class="STYLE10">客户添加日期</span>
							</div>
						</td>
						<td width="10%" height="30" bgcolor="skyblue" class="STYLE6">
							<div align="center">
								<span class="STYLE10">管理员编号</span>
							</div>
						</td>
						<td class="caozuo" bgcolor="skyblue"><div align="center">
								<span class="STYLE10">操 作</span>
							</div></td>
					</tr>
					<c:forEach items="${glist}" var="g">
						<tr>
						<td width="4%" height="20" bgcolor="d3eaef" class="STYLE10 xuanze">
									<div align="center">
										<input type="checkbox" name="selectedGuest" value="${g.gid }"
											class="selectedInfo" id="selectedGst"/>
									</div>
								</td>
							<td width="10%" height="30" bgcolor="d3eaef" class="STYLE6">
								<div align="center">
									<span class="STYLE6">${g.gid }</span>
								</div>
							</td>
							<td width="10%" height="30" bgcolor="d3eaef" class="STYLE6">
								<div align="center">
									<span class="STYLE6">${g.gname}</span>
								</div>
							</td>
							<td width="10%" height="30" bgcolor="d3eaef" class="STYLE6">
								<div align="center">
									<span class="STYLE6">${g.gaddress}</span>
								</div>
							</td>
							<td width="10%" height="30" bgcolor="d3eaef" class="STYLE6">
								<div align="center">
									<span class="STYLE6">${g.gphone }</span>
								</div>
							</td>
							<td width="10%" height="30" bgcolor="d3eaef" class="STYLE6">
								<div align="center">
									<span class="STYLE6">${g.gdate }</span>
								</div>
							</td>
							<td width="10%" height="30" bgcolor="d3eaef" class="STYLE6">
								<div align="center">
									<span class="STYLE6">${g.operator }</span>
								</div>
							</td>
							<td width="15%" height="20" bgcolor="d3eaef" class="STYLE6 caozuo">
								<div style="display: block" align="center">
									<span class="STYLE6"> <a
										onclick="return del()" href="AdminServlet?met=delGuest&gid=${g.gid}" >删除</a> <a
										href="javascript:void(0);" class="alter" value="${g.gid }" >修改</a>
									</span>
								</div>
							</td>
						</tr>
						<script type="text/javascript">
						//得到attribute中action的值，判断是员工还是管理员查看客户信息
							window.onload = function(){
								var a = '<%=request.getAttribute("action")%>';
								/* alert("action的值是："+a); */
								if (a=="staff") {
									$('#btn_submit').hide();
									$('.xuanze').hide();
									$('.caozuo').hide();		
								} else if (a=="admin") {
									/* alert("管理员查看客户信息！"); */
							}
							}
							
							function del(){
								return window.confirm("删除此条信息？");
							}
							/* 点击“修改”，修改界面出现 */
							$(".alter").on('click',function(){
								var a = document.getElementsByClassName("alter");
								//var b = a.getAttribute('value');
								var c = this.getAttribute("value");
								$("#reviseGstForm").attr("action","GuestServlet?met=alterGuest&gid="+c);
								
								$(".topArea").fadeIn(300);
							});
							function shut(){
								$(".topArea").fadeOut(300);
							}
							function save(){
								//var message = document.getElementById("reviseGstForm").getAttribute("action");
								//Toast(message,2000);
								$("#reviseGstForm").submit();
							}
							
						</script>
					</c:forEach>
				</table>
			</td>
		</tr>
	</table>
	<div class="PageBox">
				<a id="pre_a"
				href="AdminServlet?met=selGuest&type=${action }&currentPage=${currentPage - 1}"
				class="Href" title="上一页">&laquo;</a> &nbsp;<span
				class="pageCount">第${currentPage }页/共${totalPage }页</span>
			&nbsp;&nbsp;<a id="last_a"
				href="AdminServlet?met=selGuest&type=${action }&currentPage=${currentPage + 1}"
				class="Href" title="下一页">&raquo;</a>&nbsp;&nbsp;&nbsp;&nbsp; <input
				type="text" id="GPS" style="width: auto;background: none;" placeholder="输入页码跳转" class="pageCount"/> <button id="btn_doGPS" class="btn" type="button">跳    转</button>
				<a class="Href" id="gstPage_doGPS" href="javascript:void(0);" style="display:none">跳转</a>
				<button type="button" onclick="testGst()" style="display:none">测试</button>
	</div>
	</form>
	
	<div class="topArea" style="position:fixed;top:0;left:0;width:100%;height:100%;background:rgb(0,0,0,0.5);display:none">
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
	
</body>
</html>