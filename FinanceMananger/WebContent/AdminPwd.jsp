<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>管理员界面-修改管理员密码</title>
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/StaffRevise.css">
<link rel="stylesheet" href="css/button.css">
<script src="jquery/jquery-1.9.1.min.js"></script>
</head>
<body>
	<div class="container information-content">
		<div class="content">
			<div class="information-title">
				<span>当前位置>修改密码</span>
			</div>
			<div>
				<pre>&nbsp;&nbsp;&nbsp;&nbsp;编号为[  ${currentAid} ]的管理员,您正在修改密码！</pre>
			</div>
			<div class="revise-content clearfix ">
			
				<form action="AdminServlet?met=alterApwd&aid=${a.aid}" method="post" style="width:300px">
					<div class="list fr">
						<label style="margin-left:15px;">新密码</label> : <input  type="password" value="" name="apwd1" />
					</div>
					<div class="list fr ">
						<label>确认密码</label> : <input type="password" value="" name="apwd2" />
					</div>
					<div class="list1 ">
						<button id="yes" type="submit" class="button">提   交</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>