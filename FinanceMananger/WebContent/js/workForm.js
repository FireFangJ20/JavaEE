//工作报表界面原始的"新建"按钮功能,由于动态添加元素的代码量大,并且重复率高,已找到解决办法,将原始方法记录在这里,备用。
function add(){
	var a = document.createElement('div');
	var title = document.createElement('div');
	var list1 = document.createElement('div');
	var list2 = document.createElement('div');
	var b = document.createElement('button');
	var b1 = document.createElement('button');
	var c = document.createElement('div');
	var c1 = document.createElement('div');
	var c2 = document.createElement('div');
	var c3 = document.createElement('div');
	var d = document.createElement('input');
	var d1 = document.createElement('input');
	var d2 = document.createElement('input');
	var d3 = document.createElement('input');
	a.className = "floatWindow";
	title.style.cssText = "width:100%;height:10%;border-radius:6px;background:#393939;font-size:30px;text-align:center;position:absolute;left:0%;color:white;top:0%;"
	title.innerHTML = "新  建  报  表";
	title.className = "title";
	list1.className = "list1";
	list1.style.cssText = "width:100px;height:20px;background:crimson;color:white;position:absolute;left:5px;top:15%";
	list1.innerHTML = "支 出 记 录";
	list2.className = "list2";
	list2.style.cssText = "width:100px;height:20px;background:crimson;color:white;position:absolute;left:5px;top:50%";
	list2.innerHTML = "收  入 记 录";
	b.className = "btn_shut button";
	b1.className = "btn_save button";
	c.className = "label_buy";
	c1.className = "label_buy";
	c1.style.cssText = "left:50%;";
	c2.className = "label_buy";
	c2.style.cssText = "top:55%";
	c3.className = "label_buy";
	c3.style.cssText = "top:55%;left:50%";
	d.type = "text";
	d.id = "ipt";
	d.className = "input_buy";
	d1.type = "text";
	d1.id = "ipt1";
	d1.className = "input_buy";
	d1.style.cssText = "left:65%;";
		d2.type = "text";
		d2.id = "ipt2";
	d2.className = "input_buy";
	d2.style.cssText = "top:55%;";
		d3.type = "text";
		d3.id = "ipt3";
	d3.className = "input_buy";
	d3.style.cssText = "top:55%;left:65%;";
	a.appendChild(title);
	a.appendChild(list1);
	a.appendChild(list2);
	a.appendChild(b);
	a.appendChild(b1);
	a.appendChild(c);
	a.appendChild(c1);
	a.appendChild(c2);
	a.appendChild(c3);
	a.appendChild(d);
	a.appendChild(d1);
	a.appendChild(d2);
	a.appendChild(d3);
	document.body.appendChild(a);
	
	b.innerHTML = "关    闭";
	b1.innerHTML = "保    存";
	c.innerHTML = "购入商品：";
	c1.innerHTML = "购入金额：";
	c2.innerHTML = "销售商品：";
	c3.innerHTML = "销售金额：";
	
	$(".btn_shut").on('click',function (){
		$('.floatWindow').animate({
			width : '0px',height : '0px',border : '0px'
		}, "slow");
		/* $(".floatWindow").fadeOut(300); */
		$('.btn_shut,.btn_save,.label_buy,.input_buy,.title,.list1,.list2').fadeOut(300);
	});
	$(".btn_save").on('click',function (){
		var u = document.getElementById("ipt").value;
		var v = document.getElementById("ipt1").value;
		var w = document.getElementById("ipt2").value;
		var x = document.getElementById("ipt3").value;
		var flag1 = u+v=="" ;//支出记录为空
		var flag2 = w+x=="" ;//收入记录为空
		var flag3 = flag1&&flag2 ;//全部为空
		var flag1_1 = u!=""&&v=="";//购入金额为空
		var flag1_2 = u==""&&v!="";//购入商品为空
		var flag1_3 = flag1_1||flag1_2;//支出记录不完整
		var flag2_1 = w!=""&&x=="";//销售金额为空
		var flag2_2 = w==""&&x!="";//销售商品为空
		var flag2_3 = flag2_1||flag2_2;//收入记录不完整

		if(!flag1_3&&!flag2_3&&!flag3){
			/* Toast("所有记录完整,可以保存！"); */
			//$('.floatWindow').animate({height:'0px',border:'0px'},"slow");
			//$('.floatWindow').fadeOut(500);
			$('.floatWindow').slideUp();
			setTimeout(function (){
				var submit = document.getElementById("a_save");
				submit.click();
			},1000);
			
		}
		if(flag3){
			Toast("未填写任何信息！",3000);
		}
		if(flag1_3&&!flag2_3){
			Toast("支出记录不完整",3000);
		}
		if(flag2_3&&!flag1_3){
			Toast("收入记录不完整",3000);
		}
		if(flag1_3&&flag2_3){
			Toast("请检查输入的信息是否完整",3500);
		}
	});
}