<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/pageGPS.jsp"/> <!-- 引入jsp文件，使用其中的js -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>查看全部员工信息</title>
<script src="js/toast.js"></script>
<script src="js/pageGPS.jsp" type="text/javascript"></script>
<script src="js/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" href="css/QueryList.css" />
</head>

<body>	
	<form action="AdminServlet?met=delStaBySelected" method="post">
		<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr class="listHead">
				<td style="text-align: center">
					<div style="float: left; position: fixed">
						<button id="btn_submit" onclick="return delBySelected()"
							type="submit" class="delBySelected" title="删除所选信息">批量删除</button>
					</div> <span style="font-size: 25px;">全 部 员 工 信 息</span>
				</td>
			</tr>
			<tr>
				<td>
					<table width="100%" border="0" cellpadding="0" cellspacing="1"
						bgcolor="grey">
						<tr>
							<td width="4%" height="20" bgcolor="skyblue" class="STYLE10">
								<div align="center">
									<span>选 择</span>
								</div>
							</td>
							<td width="10%" height="30" bgcolor="skyblue" class="STYLE6">
								<div align="center">
									<span class="STYLE10">工号</span>
								</div>
							</td>
							<td width="10%" height="30" bgcolor="skyblue" class="STYLE6">
								<div align="center">
									<span class="STYLE10">姓名</span>
								</div>
							</td>
							<td width="10%" height="30" bgcolor="skyblue" class="STYLE6">
								<div align="center">
									<span class="STYLE10">密码</span>
								</div>
							</td>
							<td width="10%" height="30" bgcolor="skyblue" class="STYLE6">
								<div align="center">
									<span class="STYLE10">部門</span>
								</div>
							</td>
							<td width="10%" height="30" bgcolor="skyblue" class="STYLE6">
								<div align="center">
									<span class="STYLE10">薪資</span>
								</div>
							</td>
							<td bgcolor="skyblue"><div align="center">
									<span class="STYLE10">操 作</span>
								</div></td>
						</tr>
						<c:forEach items="${slist}" var="s">
							<tr>
								<td width="4%" height="20" bgcolor="d3eaef" class="STYLE10">
									<div align="center">
										<input type="checkbox" name="selectedStaff" value="${s.sid }"
											class="selectedInfo" />
									</div>
								</td>
								<td width="10%" height="30" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE6">${s.sid }</span>
									</div>
								</td>
								<td width="10%" height="30" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE6">${s.sname}</span>
									</div>
								</td>
								<td width="10%" height="30" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE6">${s.spwd}</span>
									</div>
								</td>
								<td width="10%" height="30" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE6">${s.department}</span>
									</div>
								</td>
								<td width="10%" height="30" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE6">${s.salary}</span>
									</div>
								</td>

								<td width="15%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE6"> <a
											href="AdminServlet?met=delsta&sid=${s.sid}"
											onclick="return del()">删除</a> <a
											href="AdminServlet?met=selectById&type=alter&sid=${s.sid}">修改</a>
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
				href="AdminServlet?met=selsta&currentPage=${currentPage-1 }"
				class="Href" title="上一页">&laquo;</a> &nbsp;<span
				class="pageCount">第${currentPage }页/共${totalPage }页</span>
			&nbsp;&nbsp;<a id="last_a"
				href="AdminServlet?met=selsta&currentPage=${currentPage+1 }"
				class="Href" title="下一页">&raquo;</a>&nbsp;&nbsp;&nbsp;&nbsp; <input
				type="text" id="GPS" style="width: auto;background: none" placeholder="输入页码跳转" class="pageCount"/>
				<button type="button" class="btn" id="btn_doGPS">跳   转</button>
				<a
				class="Href" id="staPage_doGPS" href="javascript:void(0);" style="display:none">跳转</a>
		</div>
		<%-- <script>
$(function () {
		var InfoType = '<%=request.getAttribute("InfoAction")%>';
		if(InfoType=="afterAdd"){
			Toast("添加成功",2000);
		}
		});
	//提示“批量删除”操作
	function delBySelected(){
		var checkbox = document.getElementsByName('selectedStaff');
		var isSelected = false;
		for(var i=0;i< checkbox.length;i++){
			if(checkbox[i].checked==true){
				isSelected = true;
			}
		}
		if(isSelected==true){
			/* alert(isSelected); */
			$('#btn_submit').attr('type','submit');
			return window.confirm("确认删除所选员工信息？");
		} else {
			/* alert(isSelected); */
			/* alert("没有选中任何信息！"); */
			$('#btn_submit').attr('type','button');
			return Toast("没有选中任何信息！",2000);
		}		
	}
	//提示“删除”操作
	function del(){
		return window.confirm("确认删除此员工信息？");
	}
	
	</script> --%>
	</form>	
	
</body>

</html>