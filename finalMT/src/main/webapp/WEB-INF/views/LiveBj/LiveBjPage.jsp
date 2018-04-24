<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://github.com/muaz-khan/RTCMultiConnection/releases/download/3.4.3/RTCMultiConnection.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.0.4/socket.io.js"></script>
<script src="https://cdn.webrtc-experiment.com/getMediaElement.js"></script>
<!-- <script src="https://cdn.webrtc-experiment.com:443/getScreenId.js"></script> -->
<script src="resources/js/rtcPeerConnection.js"></script>
<script src="resources/js/getScreenId.js"></script>
<script src="resources/js/adapter.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>방송기릿</title>
<style>
	 	video {
            object-fit: fill;
            width: 100%;
            max-width: 100%;
            height:490px;
            max-height:100%;
        }
    
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<div class="slider-area ptb-40">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div style="height: 500px; border: 1px solid black;" align="center" id="broadcastdisplay">
					<!-- <br><br><br>
						<i align="center" class="fa fa-thumbs-o-up fa-5x"></i>
						<h1 align="center">방송 화면 입니다. </h1>
						<h1 align="center">화면조정중입니다. </h1> -->
				    <!-- <article>  -->
        				<!-- <section class="experiment"> -->
            				<div class="make-center">
                				<input type="hidden" id="broadcast-id" placeholder="broadcast-id" value="room-xyz">
               					<!-- <button id="open-or-join">방송하기</button> -->
				            </div>
				            <div id="video-preview" controls loop></div>
       					<!-- </section> -->
					<!-- </article> -->
					</div>
					<div align="right">
					 	<button id="open-or-join" class="w3-btn w3-white w3-border w3-border-blue w3-round-large" style="margin-top:15px"><i align="left" class="fa fa-send-o"></i>&nbsp;&nbsp;스크린 방송하기</button>
						<button class="w3-btn w3-white w3-border w3-border-blue w3-round-large" style="margin-top:15px"><i align="center" class="fa fa-apple"></i>&nbsp;&nbsp;피치</button>
						<button class="w3-btn w3-white w3-border w3-border-blue w3-round-large" style="margin-top:15px"><i align="center" class="fa fa-thumbs-o-up"></i>&nbsp;&nbsp;구독하기</button>
						<button class="w3-btn w3-white w3-border w3-border-blue w3-round-large" style="margin-top:15px"><i align="center" class="fa fa-warning"></i>&nbsp;&nbsp;신고하기</button>
						<button class="w3-btn w3-white w3-border w3-border-blue w3-round-large" style="margin-top:15px"><i align="center" class="fa fa-send-o"></i>&nbsp;&nbsp;공유하기</button>
						<button class="w3-btn w3-white w3-border w3-border-blue w3-round-large" style="margin-top:15px"><i align="center" class="fa fa-heart"></i></button>
						<!-- <button id="open-room">Open Room</button>
                <button id="join-room">Join Room</button>
                <button id="open-or-join-room">Auto Open Or Join Room</button> -->
					</div>
				</div>
			
			
				<div class="col-md-3" id="row3Div">
					<div class="chat-panel panel panel-default">
					
						<div class="panel-heading">
							<i class="fa fa-comments fa-fw"></i> 실시간 채팅
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body" style="height:460px; overflow: overlay;">
							<ul class="chat">
							
							</ul>
						<!-- /.panel-body -->
						</div>
						<div class="panel-footer">
							<div class="input-group">
								<input id="btn-input" type="text" class="form-control input-sm" placeholder="채팅을 입력하세요..."> 
								<span class="input-group-btn">
									<button class="btn btn-warning btn-sm" id="btn-chat">전송</button>
								</span>
							</div>
						</div>
						<!-- /.panel-footer -->
					</div>
				</div>
			</div>
		</div>
	</div>
		<div class="container">
			<div class="row">

				<div class="col-md-12">
					<hr>
					<table>
						<tr>
							<td rowspan="3" style=" width: 15%; height:  15%; padding-right: 15px;">
							 <a href="#"><img alt="" src="${contextPath }/resources/images/bjSemple/bj1.jpg" style="border-radius: 50px;"></a> 
							</td>
							<td><h1>킬당1000개 한시간 현재 10킬중!!</h1></td>
						</tr>
						<tr>
							<td><h3>${loginUser.mId}</h3></td>
						</tr>
						<tr>
							<td><h5>#배틀그라운두&nbsp;&nbsp;#감우성&nbsp;&nbsp;#못생김주의&nbsp;&nbsp;#남캠</h5></td>
						</tr>
					
					</table>
			
				
					<hr>
				</div>
			</div>
		</div> 

	<div id="room-urls" style="text-align: center;display: none;background: #F1EDED;margin: 15px -10px;border: 1px solid rgb(189, 189, 189);border-left: 0;border-right: 0;"></div>
	<jsp:include page="../common/footer.jsp"/>
    
	
	 <!-- jQuery -->
    <script src="${contextPath }/resources/js/jquery-1.12.4.min.js"></script>
    <!-- jQuery Easing -->
    <script src="${contextPath }/resources/js/jquery.easing.js"></script>
    <!-- Bootstrap JS -->
    <script src="${contextPath }/resources/js/bootstrap.min.js"></script>
    <!-- pgwSlideshow JS -->
    <script src="${contextPath }/resources/js/pgwslideshow.min.js"></script>
    <!-- Slider JS -->
    <script src="${contextPath }/resources/js/pgwslider.min.js"></script>
    <!-- Owl Carousel JS -->
    <script src="${contextPath }/resources/js/owl.carousel.min.js"></script>
    <!-- YTPlayes JS -->
    <script src="${contextPath }/resources/js/jquery.mb.YTPlayer.min.js"></script>
    <!-- Mega Menu JS -->
    <script src="${contextPath }/resources/js/megamenu.js"></script>    
	<!-- lazyload JS -->
    <script src="${contextPath }/resources/js/jquery.lazyload.js"></script>
    <!-- Google Map -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDnh74UN6BKgq9U5fMNGhdZOSpmM_QnZqs"></script>
    <!-- Main JS -->
    <script src="${contextPath }/resources/js/main.js"></script>
	
	<script>
		/* 스크린 방송하기 버튼 클릭 function */
		$("#open-or-join").click(function(){
			$("#broadcastdisplay").css({"height":"1000px"});
			$(".panel-body").css({"height":"960px"});
		});
	</script>
	<script>
            // ......................................................
            // .......................UI Code........................
            // ......................................................
            
            document.getElementById('open-or-join').onclick = function() {
                this.disabled = true;
                var cam = document.getElementById('video-preview').getMediaElement;
                /* document.getElementById('newDiv2').onstream(function(cam){
                	
                }); */
                connection.addStream({
                	data : true,
                    screen: true,
                    oneway: true
                });
            };
           /*  document.getElementById('open-room').onclick = function() {
                disableInputButtons();
                connection.open(document.getElementById('broadcast-id').value, function() {
                    showRoomURL(connection.sessionid);
                });
            };
            document.getElementById('join-room').onclick = function() {
                disableInputButtons();
                connection.join(document.getElementById('broadcast-id').value);
            }; */
            window.onload = function() {
                connection.openOrJoin(document.getElementById('broadcast-id').value, function(isRoomExists, roomid) {
                    if(!isRoomExists) {
                        showRoomURL(roomid);
                    }
                });
            };
            // ......................................................
            // ..................RTCMultiConnection Code.............
            // ......................................................
            var connection = new RTCMultiConnection();
            
            // Using getScreenId.js to capture screen from any domain
            // You do NOT need to deploy Chrome Extension YOUR-Self!!
            connection.getScreenConstraints = function(callback) {
                getScreenConstraints(function(error, screen_constraints) {
                    if (!error) {
                    	var screencon = document.getElementById('video-preview');
                        screen_constraints = connection.modifyScreenConstraints(screen_constraints);
                        callback(error, screen_constraints);
                        return;
                    }
                    throw error;
                });
            };
            // by default, socket.io server is assumed to be deployed on your own URL
            connection.socketURL = 'https://rtcmulticonnection.herokuapp.com:443/';
            // comment-out below line if you do not have your own socket.io server
            // connection.socketURL = 'https://rtcmulticonnection.herokuapp.com:443/';
            connection.socketMessageEvent = 'audio-video-screen-demo';
            connection.session = {
                data : true,
            	audio: true,
                video: true,
                oneway: true
            };
            connection.sdpConstraints.mandatory = {
                OfferToReceiveAudio: true,
                OfferToReceiveVideo: true
            };
            /* connection.videosContainer = document.getElementById('newDiv2'); */
            connection.videosContainer = document.getElementById("video-preview");
            connection.onstream = function(event) {
                if(document.getElementById(event.streamid)) {
                    var existing = document.getElementById(event.streamid);
                    existing.parentNode.removeChild(existing);
                }
                
                var width = parseInt(connection.videosContainer.clientWidth) - 10;
                
                if(event.stream.isScreen === true) {
                    width = connection.videosContainer.clientWidth - 10;
                }
                
                var mediaElement = getMediaElement(event.mediaElement, {
                    title: event.userid,
                    buttons: ['full-screen'],
                    width: width,
                    showOnMouseEnter: false
                });

                connection.videosContainer.appendChild(mediaElement);
                setTimeout(function() {
                    mediaElement.media.play();
                }, 5000);
                mediaElement.id = event.streamid;
            };
            connection.onstreamended = function(event) {
                var mediaElement = document.getElementById(event.streamid);
                if(mediaElement) {
                    mediaElement.parentNode.removeChild(mediaElement);
                }
            };
            
            
            
        	/* 채팅 div 형태
        	<div class="panel-body" style="height: 460px; overflow: overlay;">
        		<ul class="chat">
        			<li class="left clearfix">
        				<span class="chat-img pull-left"></span>
        				<div class="chat-body clearfix">
        					<div class="header">
        						<i class="fa fa-github-alt fa-fw"></i> 
        						<strong class="primary-font">아프리카 청춘이다</strong> 
        						<small class="pull-right text-muted"></small>
        					</div>
        				<p>오늘도 즐방 하세요~~!</p>
        				</div>
        			</li>
        		</ul>
        	</div> */
        	
        	/* UI코드 */
        	
        	/*  채팅코드  */ 
        	 document.getElementById('btn-input').onkeyup = function(e) {
                if (e.keyCode != 13) return;
                // 먼저 input의 공백과 특수문자들 제거
                this.value = this.value.replace(/^\s+|\s+$/g, '');
                if (!this.value.length) return;
        		
                connection.send(this.value);
            	appendDIV(this.value);
                this.value = '';
            };
            document.getElementById("btn-chat").click(function(){
            	var text11 = document.getElementById('btn-input');
            	connection.send(text11.value);
            	appendDIV(text11.value);
            	text11.value ='';
            });
            
            function appendDIV(event) {
           		var chatContainer = document.querySelector('div.panel-body ul.chat');
           		
           		var chatli = document.createElement('li');
           		chatli.setAttribute("id","chatli");
           		chatli.setAttribute("class","left clearfix");
           		var chat_span = document.createElement('span');
           		chat_span.setAttribute("class","chat-img pull-left");
           		var chat_body = document.createElement('div');
           		chat_body.setAttribute('id', 'chat-body');
           		chat_body.setAttribute('class', 'chat-body clearfix');
           		var chat_header = document.createElement('div');
           		chat_header.setAttribute("class", "header");
           		chat_header.setAttribute("id", "chat-header");
        		var chat_i = document.createElement('i');
        		chat_i.setAttribute("class", "fa fa-github-alt fa-fw");
           		var chat_strong = document.createElement('strong');
           		chat_strong.setAttribute("class", "primary-font");
           		chat_strong.innerHTML = "아프리카 청춘이다&nbsp&nbsp";
        		var chat_small = document.createElement('small');
        		chat_small.setAttribute('class', "pull-right text-muted");
        		chat_small.setAttribute('id', 'chat_box');
           		
        		chatContainer.append(chatli);
        		chatli.append(chat_span);
        		chatli.append(chat_body);
        		chat_body.append(chat_header);
        		chat_header.append(chat_i);
        		chat_header.append(chat_strong);
        		chat_header.append(chat_small);
        		
             	var div = document.createElement('p');
                div.innerHTML = event.data || event;
                chat_small.append(div);
        		div.tabIndex = 0;
        		div.focus();
                        
                document.getElementById('btn-input').focus();
                console.log('appendDIV(ㅗㅗ)', event);
                if(event.data) {
                    connection.Translator.TranslateText(event.data, function(event) {
                         appendDIV(event.data);
                    });
                    return;
                } 
            }
            
               connection.onmessage = appendDIV;
            
            
            
            // ......................................................
            // ......................Handling Room-ID................
            // ......................................................
            function showRoomURL(roomid) {
                var roomHashURL = '#' + roomid;
                var roomQueryStringURL = '?broadcast-id=' + roomid;
                var html = '<h2>Unique URL for your room:</h2><br>';
                html += 'Hash URL: <a href="' + roomHashURL + '" target="_blank">' + roomHashURL + '</a>';
                html += '<br>';
                html += 'QueryString URL: <a href="' + roomQueryStringURL + '" target="_blank">' + roomQueryStringURL + '</a>';
                var roomURLsDiv = document.getElementById('room-urls');
                roomURLsDiv.innerHTML = html;
                roomURLsDiv.style.display = 'block';
            }
            (function() {
                var params = {},
                    r = /([^&=]+)=?([^&]*)/g;
                function d(s) {
                    return decodeURIComponent(s.replace(/\+/g, ' '));
                }
                var match, search = window.location.search;
                while (match = r.exec(search.substring(1)))
                    params[d(match[1])] = d(match[2]);
                window.params = params;
            })();
            var roomid = '';
            if (localStorage.getItem(connection.socketMessageEvent)) {
                roomid = localStorage.getItem(connection.socketMessageEvent);
            } else {
                roomid = connection.token();
            }
            document.getElementById('broadcast-id').value = roomid;
            document.getElementById('broadcast-id').onkeyup = function() {
                localStorage.setItem(connection.socketMessageEvent, this.value);
            };
            var hashString = location.hash.replace('#', '');
            if(hashString.length && hashString.indexOf('comment-') == 0) {
              hashString = '';
            }
            var roomid = params.roomid;
            if(!roomid && hashString.length) {
                roomid = hashString;
            }
            if(roomid && roomid.length) {
                document.getElementById('broadcast-id').value = roomid;
                localStorage.setItem(connection.socketMessageEvent, roomid);
                // auto-join-room
                (function reCheckRoomPresence() {
                    connection.checkPresence(roomid, function(isRoomExists) {
                        if(isRoomExists) {
                            connection.join(roomid);
                            return;
                        }
                        setTimeout(reCheckRoomPresence, 5000);
                    });
                })();
                disableInputButtons();
            }
        </script>
	
	<script>
	 function singo(){
		 location.href="${contextPath}"
	 }
	</script>

</body>
</html>