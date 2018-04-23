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
            height:100%;
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
				            <video id="video-preview" controls loop></video>
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
					</div>
				</div>
			
			
				<div class="col-md-3" id="row3Div">
					<div class="chat-panel panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-comments fa-fw"></i> 실시간 채팅
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body" style="height: 460px; overflow: overlay;">
							<ul class="chat">
							
							</ul>
						</div>
						<!-- /.panel-body -->
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
			console.log("haha");
			$(".chat-panel").css({"height":"305px"});
			$(".panel-body").css({"height":"260px"});
			$("#row3Div").append( "<div id='newDiv1'><div>");
			$("#newDiv1").append( "<div id='newDiv2'>안녕! 반가워!<div>");
			$("#newDiv1").css({"padding-top":"22px"});
			$("#newDiv2").css({"height":"200px", "width":"260px", "border":"1px solid black" });
		});
	</script>
	<script>
	var enableRecordings = false;
		var connection = new RTCMultiConnection(null, {
		useDefaultDevices: true
	});
	// 이것은 v3안에 있는 의무적인 거다 
	connection.enableScalableBroadcast = true;
	// 각 중계 사용자는 1 명의 사용자 만 사용할 수있다..
	connection.maxRelayLimitPerUser = 1;
		// 방을 열어둘 필요가 없다.
	// scalable-broadcast.js는 요소 자체를 다룬다..
	connection.autoCloseEntireSession = true;
	// 기본적으로 socket.io 서버는 자신의 URL에 배포되는 것으로 가정합니다.
	connection.socketURL = 'https://rtcmulticonnection.herokuapp.com:443/';
	// 서버가 없을 시 아래의 소스 사용 무하마드는 상히 친절하네 역시 MIT
	
	/* connection.socketMessageEvent = 'scalable-screen-broadcast-demo'; */
	connection.socketMessageEvent = 'RTCMultiConnection-Message';
	//사용자가 서버에 연결해야 다른 사용자도 이용 할 수 있다.
	connection.connectSocket(function(socket) {
	/* socket.on('logs', function(log) {
	document.querySelector('h1').innerHTML = log.replace(/</g, '----').replace(/>/g, '___').replace(/----/g, '(<span style="color:red;">').replace(/___/g, '</span>)');
	}); */
	window.enableAdapter = true; 
	// 이 이벤트는 브로드 캐스트가 이미 생성 된 경우에 발생합니다.
		socket.on('join-broadcaster', function(hintsToJoinBroadcast) {
			console.log('join-broadcaster', hintsToJoinBroadcast);
			console.log("몇명1");
			connection.session = hintsToJoinBroadcast.typeOfStreams;
			connection.sdpConstraints.mandatory = {
    			OfferToReceiveVideo: true,
    			OfferToReceiveAudio: false
			};
			connection.join(hintsToJoinBroadcast.userid);
		});
	
		socket.on('rejoin-broadcast', function(broadcastId) {
			console.log('rejoin-broadcast', broadcastId);
			console.log("몇명2");
				
			connection.attachStreams = [];
			socket.emit('check-broadcast-presence', broadcastId, function(isBroadcastExists) {
    			if(!isBroadcastExists) {
        			//첫 번째 사람 (즉, 실제 방송사)은 자신의 사용자 ID를 설정해야한다
        			connection.userid = broadcastId;
    			}
    			socket.emit('join-broadcast', {
        			broadcastId: broadcastId,
       				userid: connection.userid,
        			typeOfStreams: connection.session
    			});
			});
		});
		socket.on('broadcast-stopped', function(broadcastId) {
			// alert('Broadcast has been stopped.');
				// location.reload();
			console.error('broadcast-stopped', broadcastId);
			alert('방송종료.');
		});
		// 이 이벤트는 브로드 캐스트가 없을 때 발생합니다.
		socket.on('start-broadcasting', function(typeOfStreams) {
			console.log('start-broadcasting', typeOfStreams);
			// 호스트 즉, 발신자는 항상 이것을 사용해야합니다!
			connection.sdpConstraints.mandatory = {
    			OfferToReceiveVideo: false,
    			OfferToReceiveAudio: false
			};
			connection.session = typeOfStreams;
			// "open" method here will capture media-stream
			// we can skip this function always; it is totally optional here.
			// we can use "connection.getUserMediaHandler" instead
			connection.open(connection.userid, function() {
    			showRoomURL(connection.sessionid);
			});
		});
	});
	window.onbeforeunload = function() {
		// Firefox 는 추악하다(ugly).
		document.getElementById('open-or-join').disabled = false;
	};
	var videoPreview = document.getElementById('video-preview');
	connection.onstream = function(event) {
		console.log("아니 이게뭐야 ?"+event);
		if(connection.isInitiator && event.type !== 'local') {
			return;
    	}
			
    	if(event.mediaElement) {
	    	event.mediaElement.pause();
			delete event.mediaElement;
		}
    	
		connection.isUpperUserLeft = false;
		videoPreview.src = URL.createObjectURL(event.stream);
		videoPreview.play();
		
		videoPreview.userid = event.userid;
		
		if(event.type === 'local') {
    		videoPreview.muted = true;
		}
		
		if (connection.isInitiator == false && event.type === 'remote') {
    		// 그는 단지 미디어를 중계하고있다.
	     	connection.dontCaptureUserMedia = true;
    		connection.attachStreams = [event.stream];
			connection.sdpConstraints.mandatory = {
	    		OfferToReceiveAudio: false,
    			OfferToReceiveVideo: false
			};
			
	 		var socket = connection.getSocket();
			socket.emit('can-relay-broadcast');
			
			if(connection.DetectRTC.browser.name === 'Chrome') {
		     	connection.getAllParticipants().forEach(function(p) {
		         		if(p + '' != event.userid + '') {
    	        		var peer = connection.peers[p].peer;
        	    			peer.getLocalStreams().forEach(function(localStream) {
            	    			peer.removeStream(localStream);
            				});
            		peer.addStream(event.stream);
           		 	connecton.dontAttachStream = true;
           		 	connection.renegotiate(p);
          	 	 	connection.dontAttachStream = false;
        			}
    			});
			}
	        if(connection.DetectRTC.browser.name === 'Firefox') {
	    		// Firefox가 removeStream 메소드를 지원하지 않습니다.
	    		// 그것이 대체 해킹을 사용하는 이유입니다.
	    		//참고 : 파이어 폭스는 리모트 미디어 스트림의 트랙을 대체 할 수없는 것으로 보인다.
	    		// 더 깊은 모든 노드에 다시 참여하도록 요청해야합니다.
	    		connection.getAllParticipants().forEach(function(p) {
	        		if(p + '' != event.userid + '') {
	            		connection.replaceTrack(event.stream, p);
	        		}
		    	});
	  		}
			// Firefox는 원격 MediaStream을 기록하기 위해 UN_ABLE 인 것처럼 보입니다
			// WebAudio 솔루션은 단순히 오디오 만 녹음합니다.
			// 그래서 파이어 폭스에서는 녹음을 건너 뜁니다.
			if(connection.DetectRTC.browser.name === 'Chrome') {
    			repeatedlyRecordStream(event.stream);
			}
		}
	};
	//node.js 서버에 브로드 캐스트를 요청합니다.
	// 브로드 캐스트를 사용할 수 있다면 간단하게 참여하십시오. 즉 "join-broadcaster"이벤트가 발생해야합니다.
	// 브로드 캐스트가 없다면 간단히 만듭니다. 즉"start-broadcasting" 이벤트가 시작되어야합니다.
	document.getElementById('open-or-join').onclick = function() {
		var broadcastId = document.getElementById('broadcast-id').value;
		if (broadcastId.replace(/^\s+|\s+$/g, '').length <= 0) {
			alert('Please enter broadcast-id');
			document.getElementById('broadcast-id').focus();
			return;
		}	
		document.getElementById('open-or-join').disabled = true;
		connection.session = {
			data:true,
			screen: true,
			oneway: true
		};
		
		var socket = connection.getSocket();
		
		socket.emit('check-broadcast-presence', broadcastId, function(isBroadcastExists) {
			if(!isBroadcastExists) {
    		// 첫 번째 사람 (즉, 실제 방송사)은 자신의 사용자 ID를 설정해야합니다
    		connection.userid = broadcastId;
			}
			
			console.log('check-broadcast-presence', broadcastId, isBroadcastExists);
			
			socket.emit('join-broadcast', {
    			broadcastId: broadcastId,
	    		userid: connection.userid,
    			typeOfStreams: connection.session
			});
		});
	};
	connection.onstreamended = function() {};
	
	
	
	function repeatedlyRecordStream(stream) {
		if(!enableRecordings) {
			return;
		}
			connection.currentRecorder = RecordRTC(stream, {
			type: 'video'
			});
		connection.currentRecorder.startRecording();
		setTimeout(function() {
				if(connection.isUpperUserLeft || !connection.currentRecorder) {
    			return;
			}
			connection.currentRecorder.stopRecording(function() {
    			allRecordedBlobs.push(connection.currentRecorder.blob);
    			if(connection.isUpperUserLeft) {
        			return;
    			}
    			connection.currentRecorder = null;
    			repeatedlyRecordStream(stream);
			});
		}, 30 * 1000); // 30-seconds
	};
1	// getScreenId.js를 사용하여 모든 도메인에서 화면 캡처
	// Chrome 확장 프로그램 YOUR-Self를 배포 할 필요가 없습니다.
	connection.getScreenConstraints = function(callback) {
		getScreenConstraints(function(error, screen_constraints) {
			if (!error) {
    			screen_constraints = connection.modifyScreenConstraints(screen_constraints);
    			callback(error, screen_constraints);
   				return;
			}
			throw error;
		});
	};
	function disableInputButtons() {
		document.getElementById('open-or-join').disabled = true;
		document.getElementById('broadcast-id').disabled = true;
	}
	// ......................................................
		// ......................Handling 브로드 캐스트 ID................
		// ......................................................
		function showRoomURL(broadcastId) {
		var roomHashURL = '#' + broadcastId;
		var roomQueryStringURL = '?broadcastId=' + broadcastId;
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
	var broadcastId = '';
	if (localStorage.getItem(connection.socketMessageEvent)) {
			broadcastId = localStorage.getItem(connection.socketMessageEvent);
	} else {
		broadcastId = connection.token();
	}
	document.getElementById('broadcast-id').value = broadcastId;
	document.getElementById('broadcast-id').onkeyup = function() {
		localStorage.setItem(connection.socketMessageEvent, this.value);
	};
	var hashString = location.hash.replace('#', '');
	if(hashString.length && hashString.indexOf('comment-') == 0) {
			hashString = '';
	}
	var broadcastId = params.broadcastId;
	if(!broadcastId && hashString.length) {
			broadcastId = hashString;
		}
	if(broadcastId && broadcastId.length) {
		document.getElementById('broadcast-id').value = broadcastId;
		localStorage.setItem(connection.socketMessageEvent, broadcastId);
			// auto-join-room
			(function reCheckRoomPresence() {
				connection.checkPresence(broadcastId, function(isRoomExists) {
    				if(isRoomExists) {
        				document.getElementById('open-or-join').onclick();
        				return;
    				}
    				setTimeout(reCheckRoomPresence, 5000);
				});
			})();
			disableInputButtons();
		}

	
	
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