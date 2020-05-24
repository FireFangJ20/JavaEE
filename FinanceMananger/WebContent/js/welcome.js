$(function() {
	$('#welcome').animate({
		fontSize : '1em'
	}, "slow");
	var username = getMyCookie("cookie_name");
	if(username=="") {
		$("#welcome").text("欢迎您，__");
	} else {
		$("#welcome").text("欢迎您，" + username);
	}
	
});

function getMyCookie(key) {
	var val = "";
	var cookies = document.cookie;
	cookies = cookies.replace(/\s/, "");
	var cookie_array = cookies.split(";");
	for (i = 0; i < cookie_array.length; i++) {
		var cookie = cookie_array[i];
		var array = cookie.split("=");
		if (array[0] == key) {
			val = array[1];
		}
	}
	return val;
}