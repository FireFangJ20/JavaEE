<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>管理员修改员工信息界面</title>
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/StaffRevise.css">
<link rel="stylesheet" href="css/login.css">
</head>
<body>
	<div class="container information-content">
		<div class="content">
			<div class="information-title">
				<span>当前位置>修改员工信息</span>
			</div>
			<div class="revise-content clearfix ">
				<form action="AdminServlet?met=altersta&sid=${s.sid}" method="post">
					<div class="list fr">
						姓名: <input type="text" name="sname" id="" value="${s.sname}" />
					</div>
					<div class="list fr">
						密码: <input type="text" name="spwd" id="" value="${s.spwd}" />
					</div>
					<div class="list fr">
						部门: <input type="text" name="department" id="" value="${s.department}" />
					</div>
					<div class="list fr">
						薪资: <input type="text" name="salary" id="" value="${s.salary}" />
					</div>
					<div class="list1">
						<input type="submit" class="button" value="修  改" />
					</div>

				</form>
			</div>
		</div>
	</div>
</body>
</html>