<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>小型财务管理系统-管理员左侧界面</title>
		<link rel="stylesheet" href="css/AdminLeft.css">
		<script src="js/jquery-1.9.1.min.js"></script>
		<style type="text/css">
		.listActive{
		background: lightseagreen;
		box-shadow: 2px 2px 2px orangered;
		}
		</style>
	</head>

	<body>
		<div class="nav">
			<div class="nav-list">
				

				<div class="nav-tit" id="personal">

					<img src="images/personal-msg.png" style="height: 30px" alt="">
					<span style="cursor:pointer;color:white">职工信息</span>

				</div>
				<div class="personal-list" id="personal-child">
					<ul>
						<li>
							<a href="AdminServlet?met=selsta" target="main">查看信息</a>
						</li>
						<li>
							<a href="AddStaff.html" target="main">添加信息</a>
						</li>
					</ul>
				</div>
				<div class="nav-tit" id="personal04">

					<img src="images/job-msg.png" style="height: 20px" alt="">
					<span style="cursor:pointer;color:white">客户信息</span>

				</div>
				<div class="personal-list" id="personal04-child">
					<ul>
						<li>
							<a href="AdminServlet?met=selGuest&type=admin" target="main">查看信息</a>
						</li>
						<li>
							<a href="AddGuest.html" target="main">添加信息</a>
						</li>
					</ul>
				</div>
				<div class="nav-tit" id="personal01" style="display:none">
						<img src="images/archives-msg.png" style="height:19px" alt="">
						<span id="AdminInfo" style="cursor:pointer;color:white">管理员信息</span>
				</div>
				
				<div class="personal-list" id="personal01-child">
					<ul>
						<li>
							<a href="AdminServlet?met=selAdmin" target="main">查看信息</a>
						</li>
						<li>
							<a href="AddAdmin.html" target="main">添加信息</a>
						</li>
					</ul>
				</div>
				<div class="nav-tit" id="workForm">
					<a href="AdminServlet?met=staffWork&scope=all" target="main">
						<img src="images/job-msg.png" style="height:19px" alt="">
						<span style="cursor:pointer;color:white">财务报表</span>
					</a>
				</div>
				<div id="personal02" class="nav-tit">
				<%
					String name = request.getParameter("name");
				 	request.setAttribute("name", name);
				%>
					<a href="AdminServlet?met=selByName&name=${name}" target="main">
						<img src="images/modify-password.png" alt="">
						<span>修改密码</span>
					</a>
				</div>
				<div id="personal03" class="nav-tit">
					<a href="search.html" target="main">
						<img src="images/soso-white.png" alt="">
						<span>搜索</span>
					</a>
				</div>
			</div>
		</div>

		<script>
			$(document).ready(function() {
				if(${currentAid==1}){
					$('#personal01').removeAttr('style');	
				}
				$('#personal').on('click', function() {
					$('#personal-child').fadeToggle(300);
				});
				$('#personal01').on('click',function(){
					$('#personal01-child').fadeToggle(300);
				});
				$('#personal04').on('click',function(){
					$('#personal04-child').fadeToggle(300);
				});
				let aLi = $('#personal-child li');
				aLi.on('click', function() {
					$(this).addClass('active').siblings('li').removeClass('active');
					$('#personal01,#personal02,#personal03,#personal04,#workForm').removeClass('listActive');
					$('#personal01-child li,#personal04-child li').removeClass('active');
				});
				let bLi = $('#personal01-child li');
				bLi.on('click', function() {
					$(this).addClass('active').siblings('li').removeClass('active');
					$('#personal,#personal02,#personal03,#personal04,#workForm').removeClass('listActive');
					$('#personal-child li,#personal04-child li').removeClass('active');
				});
				let cLi = $('#personal04-child li');
				cLi.on('click', function() {
					$(this).addClass('active').siblings('li').removeClass('active');
					$('#personal,#personal02,#personal03,#personal01,#workForm').removeClass('listActive');
					$('#personal-child li,#personal01-child li').removeClass('active');
				});
				let aHref = $('#personal,#personal01,#personal02,#personal03,#personal04,#workForm');
				aHref.on('click',function(){
					$(this).addClass('listActive').siblings('div').removeClass('listActive');
					$('#personal01-child li,#personal-child li,#personal04-child li').removeClass('active');
				});
				
			});
		</script>
	</body>

</html>