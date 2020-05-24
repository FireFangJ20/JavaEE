<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>财务管理系统-管理员主界面</title>
		<script src="js/jquery-1.9.1.min.js"></script>
		<link rel="stylesheet" href="css/MainPage.css"/>
		<link rel="icon" href="images/my01.ico" type="image/x-icon" />
		<link rel="shortcut icon" href="images/my01.ico" type="image/x-icon" />
		<link rel="bookmark" href="images/my01.ico" type="image/x-icon" />
	</head>
	<!-- frameset 标签在H5中不支持使用，但是也可以使用，不过会提示黄色下划波浪线，H5中使用 iframe 替换 frameset  -->
	<%-- <frameset frameborder="0" rows="60,*">
		<frame src="AdminTop.html" noresize="noresize" scrolling="no" />
		 <frameset frameborder="5" cols="210,*">
			<frame src="AdminLeft.jsp?name=${name}" noresize="noresize" scrolling="no" />
			<!-- <frame noresize="noresize" scrolling="yes" name="main" /> -->
			 <frame noresize="noresize" scrolling="no" name="main"  src="index.html"/> 
		</frameset>
	</frameset> --%>

	<iframe name="top" src="AdminTop.html" class="top" scrolling="no"></iframe>
	<iframe name="left" src="AdminLeft.jsp" class=" left" scrolling="no"></iframe>
	<iframe name="main" src="index.html" class=" main" scrolling="no"></iframe>
</html>
