<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>员工个人信息界面</title>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/StaffRevise.css">
    <link rel="stylesheet" href="css/login.css">
</head>

<body>
<div class="container information-content">
    <div class="content">
        <div class="information-title">
            <span>当前位置>个人信息</span>
        </div>
        <div class="revise-content clearfix ">
        
        <form action="StaffServlet?met=alterSname&id=${s.sid }" method="post">
        	<div class="list fr"><label>工号</label> : <input id="StaffId" type="text" value="${s.sid }" disabled/></div>
            <div class="list fr"><label>姓名</label> : <input id="StaffName" name="StaffName" type="text" value="${s.sname}" disabled/></div>
            <div class="list fr "><label>部门</label> : <input type="text" value="${s.department}" disabled/></div>
            <div class="list fr"><label>薪资</label> : <input type="text" value="${s.salary }" disabled/></div>
            <div class="list1"><input id="yes" type="submit" value="修  改"  class="button" style="display:none"/></div>
        </form> 
              
        </div>     
    </div>
</div>
</body>

</html>