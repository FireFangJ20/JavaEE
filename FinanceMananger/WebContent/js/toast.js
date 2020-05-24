//Toast提示信息
function Toast(msg, duration) {
	duration = isNaN(duration) ? 3000 : duration;
	var m = document.createElement('div');
	m.innerHTML = msg;
	m.style.cssText = "box-shadow:10px 10px 10px black;width: 40%;min-width: 150px;opacity: 0.7;height: 50px;color: rgb(255, 255, 255);line-height: 50px;text-position:fixed;text-align: center;border-radius: 10px;position: fixed;top: 40%;left: 30%;z-index: 999999;background: black;font-size: 25px";
	setTimeout(function() {
		document.body.appendChild(m);
	}, 10);
	/*document.body.appendChild(m);*/
	setTimeout(function() {
		var d = 0.5;
		m.style.webkitTransition = '-webkit-transform ' + d
				+ 's ease-in, opacity ' + d + 's ease-in';
		m.style.opacity = '0';
		setTimeout(function() {
			document.body.removeChild(m)
		}, d * 1000);
	}, duration);
}

function Toast_tryByMyself(msg, duration) {
	var m = document.createElement('div');
	m.innerHTML = msg;
	m.style.cssText = "box-shadow:10px 10px 10px black;" + "width: 40%;"
			+ "min-width: 150px;" + "opacity: 0.7;" + "height: 50px;"
			+ "color: rgb(255, 255, 255);" + "line-height: 50px;"
			+ "text-position:fixed;" + "text-align: center;"
			+ "border-radius: 10px;" + "position: fixed;" + "top: 40%;"
			+ "left: 30%;" + "z-index: 999999;" + "background: black;"
			+ "font-size: 25px";
	document.body.appendChild(m);
	setTimeout(function() {
		m.innerHTML = '测试成功';
		m.style.display = "none;slow";

	}, duration);
}

function test(msg, duration) {
	duration = isNaN(duration) ? 3000 : duration;
	var m = document.createElement('div');
	m.innerHTML = msg;
	m.style.cssText = "box-shadow:10px 10px 10px black;width: 40%;min-width: 150px;opacity: 0.7;height: 50px;color: rgb(255, 255, 255);line-height: 50px;text-position:fixed;text-align: center;border-radius: 10px;position: fixed;top: 40%;left: 30%;z-index: 999999;background: black;font-size: 25px";

	/*
	 * var jkl = 0.5; m.style.webkitTransition = '-webkit-transform ' + jkl + 's
	 * ease-out, 0.3 ' + jkl + 's ease-out';
	 */
	setTimeout(function() {
		document.body.appendChild(m);
		var gh = 0.3;
		m.style.webkitTransition = '-webkit-transform ' + gh + 's ease-in,opacity '
				+ gh + 's ease-in';
		m.style.opacity = "0.8";
		
	}, 500);

	setTimeout(function() {
		var d = 0.5;
		m.style.webkitTransition = '-webkit-transform ' + d
				+ 's ease-in, opacity ' + d + 's ease-in';
		m.style.opacity = '0';
		setTimeout(function() {
			document.body.removeChild(m)
		}, d * 1000);
	}, duration);
}
