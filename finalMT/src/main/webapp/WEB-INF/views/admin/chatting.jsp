<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script src="/mt/resources/admin/vendor/metisMenu/metisMenu.min.js"></script>


<div class="hellohi" style="position: fixed; bottom: 5px; right: 5px; width: 50px; height: 50px; background: black; z-index: 1;"><label class="hihello"></label></div>

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
	if(data[0] != 'admin'){
		$(".hihello").text("N").css("color", "red");
	}

}

function onClose(evt){
	
}

$(".hellohi").on("click", function(){
	$(".hihello").html("");
	location.href="reportMg.ad";
})
</script>
