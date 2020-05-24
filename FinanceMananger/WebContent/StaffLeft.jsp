<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>企业小型财务管理系统-员工左侧界面</title>
		<link rel="stylesheet" href="css/StaffLeft.css">
		<script src="jquery/jquery-1.9.1.min.js"></script>
		<script src="js/toast.js"></script>
	</head>

	<body>
		<div class="nav">
			<div class="nav-list">
				<div class="nav-tit" id="personal">
				<%
					request.setCharacterEncoding("utf-8");
					response.setCharacterEncoding("utf-8");
					String name = request.getParameter("name");
					request.setAttribute("name", name);
				%>
					<a href="StaffServlet?met=selsta&name=${name}" target="main">
						<img src="images/personal-msg.png" style="height: 30px">
						<span>个人信息</span>
					</a>
				</div>
				
				<div class="nav-tit" id="personal01">
					<a href="company.html" target="main">
						<img src="images/job-msg.png" alt="">
						<span>公司信息</span>
					</a>
				</div>
				
				<div class="nav-tit" id="personal03">
					<a href="AdminServlet?met=selGuest&type=staff" target="main">
						<img src="images/personal-msg.png" style="height:30px" alt="">
						<span>客户信息</span>
					</a>
				</div>
				
				<div class="nav-tit" id="workForm">
					<a id="baobiao" href="StaffServlet?met=selWork&sname=${name }" target="main">
						<img src="images/job-msg.png">
						<span>工作报表</span>
					</a>
				</div>

				<div class="nav-tit" id="personal02">
					<a href="StaPwd.jsp?name=${name}" target="main">
						<img src="images/modify-password.png" alt="">
						<span>修改密码</span>
					</a>
				</div>
			</div>
		</div>

		<script>
			$(document).ready(function() {
				$('#personal').on('click', function() {
					$('#personal-child').fadeToggle(300);
				});
				let aHref = $('#personal,#personal01,#personal02,#personal03,#workForm');
				aHref.on('click',function(){
					$(this).addClass('listActive').siblings('div').removeClass('listActive');
				});
				let aLi = $('#personal-child li');
				aLi.on('click', function() {
					$(this).addClass('active').siblings('li').removeClass('active');
				});
			});
		</script>
	</body>

</html>