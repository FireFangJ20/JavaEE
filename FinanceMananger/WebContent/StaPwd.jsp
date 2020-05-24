<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>员工信息界面-修改密码</title>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/StaffRevise.css">
    <link rel="stylesheet" href="css/button.css">
</head>
<body>
<div class="container information-content">
    <div class="content">
        <div class="information-title">
            <span>当前位置>修改密码</span>
        </div>
        <div class="revise-content clearfix ">
        <%
        	String name = request.getParameter("name");
        	request.setAttribute("name", name);
        %>
        <form action="StaffServlet?met=alterspwd&name=${name}" method="post">
            <div class="list fr"><label>新密码</label> : <input id="NewPwd1" type="password" name="spwd1"/></div>
            <div class="list fr "><label>确认密码</label> : <input id="NewPwd2" type="password" value="" name="spwd2"/></div>
            <div class="list1 "> <button type="submit" class="button">提    交</button></div>
        </form>
        </div>     
    </div>
</div>
</body>
</html>