<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script src="/mt/resources/admin/vendor/metisMenu/metisMenu.min.js"></script>
<link href="/mt/resources/css/reportCss.css" rel="stylesheet">


<div class="hellohi"><label class="hihello"></label></div>

<script>
var sock = new SockJS("<c:url value="/echo"/>");
sock.onmessage = onMessage;
sock.onclose = onClose;

sock.onopen = sendMessage;
var userId = "${loginUser.mId}/"

function sendMessage(){
	sock.send(userId);
}

function onMessage(evt) {
	var data = evt.data.split("/");
	console.log(data);
	if(data[0] != 'admin'){
		$(".hihello").text("N");
		
		var element = $(".hihello");

		var shown = true;

		setInterval(toggle, 500);

		function toggle() {
		   if(shown) {
		       element.hide();

		       shown = false;
		   } else {
		       element.show();

		       shown = true;
		   }
		}
	}else {
		
	}
}

function onClose(evt){
	
}

$(".hellohi").on("click", function(){
	$(".hihello").html("");
	location.href="reportMg.ad";
})
</script>
