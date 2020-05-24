<!-- 页面导航功能的js文件，由于js不能使用el表达式，而jsp页面可以使用，所以将原来的js改为了jsp，这样，在需要引用这个文件的地方改为引用jsp就行了 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<script src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
$(function (){
	//输入页码进行跳转
	$('#btn_doGPS').on('click',function (){
		var sta_GPS = document.getElementById("staPage_doGPS");
		var gst_GPS = document.getElementById("gstPage_doGPS");
		var adm_GPS = document.getElementById("admPage_doGPS");
		var work_GPS = document.getElementById("workPage_doGPS");
		var g = document.getElementById('GPS');
		var v = g.value;
		
		if(v>=1 && v<= ${totalPage}){
			/* 如果输入的页码存在，判断是哪个页面的跳转按钮被点击了  */
			try{
				/* 先尝试是不是员工列表界面的按钮被点击  */
			$('#staPage_doGPS').attr("href","AdminServlet?met=selsta&currentPage="+v);
			sta_GPS.click();
			} catch (e) {
				/* 运行到这里说明不是员工列表界面的跳转按钮，再判断是不是客户列表界面的按钮，又分为员工身份查询和管理员查询 */
				try{
					/* 这里遇到的问题：${action} 不用引号括起来是不能执行的，暂未找到合理的解释 */
					if( "staff" == "${action}"){
						/* 如果是员工查看客户信息，则提交相应参数给servlet */
						$('#gstPage_doGPS').attr("href","AdminServlet?met=selGuest&type=staff&currentPage="+v);
						gst_GPS.click();
					} else if("admin" == "${action}"){
						/* 下面这行代码和上面的if中的两行代码作用是一样的，两种写法 */
						window.location.href = "AdminServlet?met=selGuest&currentPage="+v;
					} else {
						/* 如果既不是员工查看客户信息，也不是管理员查看客户信息，那么就是管理员列表界面的跳转按钮被点击了
						一开始应该写在下面的catch语句块里，不过增加了这里的if条件后，不会catch异常了，暂未找到原因*/
						/* window.location.href = "AdminServlet?met=selAdmin&currentPage="+v; */  /* 注意！！这行代码不能使用了，要用下
						面两行代码代替了，因为后来又加了一个工作报表界面的按钮事件，如果用这行代码，那么工作报表界面的按钮点击时就会进行至此，不会有异常，而是直接跳转到查询管理员列表界面了 */
						$('#admPage_doGPS').attr("href","AdminServlet?met=selAdmin&currentPage="+v);
						adm_GPS.click();
					}
					
				} catch (e) {
						//Toast("未知错误:pageGPS",2000);
						try{
							//如果都不是上面所有的页面的按钮被点击了，那么就是"工作报表"界面的按钮被点击，员工正在查询自己的报表
							$('#workPage_doGPS').attr("href","StaffServlet?met=selWork&currentPage="+v);
								work_GPS.click();
						} catch (e) {
							//或者是管理员查看员工的某个报表
							//Toast("管理员查看员工报表");
							$('#adm_workPage_doGPS').attr("href","AdminServlet?met=staffWork&scope=all&currentPage="+v);
							var awd = document.getElementById("adm_workPage_doGPS");
							awd.click();
						}																	
				}
			}													
		} else {
			Toast("输入的页面不存在",2000);
		}
	});

	//"上一页"功能
	$('#pre_a').on('click',function (){
		if(${currentPage}==1){
			$('#pre_a').attr('href','#');
			Toast('这已是第一页',2000);
		}
	});
	//"下一页"功能
	$('#last_a').on('click',function (){
		if(${currentPage}==${totalPage}){
			$('#last_a').attr('href','#');
			Toast('这已是最后一页',2000);
		}
		
	});
	//如果是添加信息成功后返回的列表界面,则提示成功信息
	var InfoType = '<%=request.getAttribute("InfoAction")%>';
	if(InfoType=="afterAdd"){
		Toast("添加成功",2000);
	} else if(InfoType=="afterAlter"){
		Toast("修改成功",2000);
	} else if(InfoType=="afterDelete"){
		Toast("删除成功",2000);
	}
	//测试c:forEach中的设置ID的问题，循环遍历得到的每一行checkbox的ID都是一样的，则只有第一个的ID起作用，其余的就没有ID了
	$('#selectedGst').on('click',function (){
		var gst = $(this).attr('id');
		Toast(gst,1000);
	});
});

/* 以下是点击"批量删除"或者删除某个信息时,弹出提示信息;也算作页面导航内容,就不用单独写JS了 */
//提示"批量删除"操作
function delBySelected(){
	var checkbox = $('.selectedInfo');
	var isSelected = false;
	for(var i=0;i< checkbox.length;i++){
		if(checkbox[i].checked==true){
			isSelected = true;
		}
	}
	if(isSelected==true){
		/* alert(isSelected); */
		$('#btn_submit').attr('type','submit');
		return window.confirm("确认删除所选信息？");
	} else {
		$('#btn_submit').attr('type','button');
		return Toast("没有选中任何信息！",2000);
	}		
}
//提示"删除"操作
function del(){
	return window.confirm("确认删除此条信息？");
}

//测试c:forEach得到的数据添加id后会怎样
function testGst(){
	var gst = $('#selectedGst').attr('id');
	Toast(gst,1000);
}
</script> 
