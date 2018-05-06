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
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
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
           	/* height:490px; */
            max-height:100%;
        }
   		#broadcastdisplay{
    		height:1000px;
   		}
    	.panel-body{
    		height:960px;
    		overflow-y:scroll;
    	}
    	.dropdown1{
    		display: inline-block;
    	}
    	.dropdown1 li ul {
			background: white;
			display:none;  /* 평상시에는 서브메뉴가 안보이게 하기 */
			height:auto;
			/* position:absolute; */
			position:relative;
			width:90px;
			z-index:200;
		}
		.dropdown1 li:hover ul {
			display:block;   /* 마우스 커서 올리면 서브메뉴 보이게 하기 */
		}
	.dropdown1 li ul button{
 		background:white;
 		 color:black;
  		border:none;
  		position:relative;
  		/* position:absolute; */
  		height:20px;
  		font-size:0.6em;
  		cursor:pointer;
  		transition:800ms ease all;
  		outline:none;
	}
	.dropdown1 li ul .black{
 		background:white;
 		 color:black;
  		border:none;
  		position:relative;
  		position:absolute;
  		height:20px;
  		font-size:0.6em;
  		cursor:pointer;
  		transition:800ms ease all;
  		outline:none;
  		display:none;
	}
	
	.dropdown1 li ul button:hover{
  		background:#fff;
  		color:#1AAB8A;
	}
 	.dropdown1 li ul button:before, .dropdown1 li ul button:after{
  		content:'';
  		position:absolute;
  		/* position:relative; */
  		top:0;
  		right:0;
  		height:2px;
  		width:0;
  		background: #1AAB8A;
  		transition:400ms ease all;
	}
	.dropdown1 li ul button:after{
  		right:inherit;
  		top:inherit;
  		left:0;
  		bottom:0;	
	}
	.dropdown1 li ul button:hover:before,button:hover:after{
  		width:100%;
  		transition:800ms ease all;
	}
		
</style>
</head>
<body>
<div class="modal fade blackCChungja" id="layerpop" >
     <div class="modal-dialog">
       <div class="modal-content">
         <!-- header -->
         <div class="modal-header">
           <!-- 닫기(x) 버튼 -->
           <button type="button" class="close" data-dismiss="modal">×</button>
           <!-- header title -->
           <h4 class="modal-title" align="center">블랙하기</h4>
         </div>
         <!-- body -->
         <div class="modal-body">
             <div class="modal-left">
               <img style="width: 100%; height: 100%;" src="resources/images/catch.jpg" class="screen"/>
            </div>
            <div class="modal-right">
               <table class="modalTable" align="center">
                     <tr>
                        <td><input type="text" class="adminbj" readonly/><label>&nbsp;님의 방송에서</label></td>
                     </tr>
                     <tr>
                        <td><input type="text" class="blackMember" readonly/><label>&nbsp;님을 블랙</label></td>
                     </tr>
                  </table>
            </div>
         </div>
         <!-- Footer -->
         <div class="modal-footer" align="center">
           <button type="button" class="btn btn-default answer" align="center" onclick="BlackC();">시청자 블랙 하기</button>
         </div>
       </div>
     </div>
   </div>
<!-- ---------------------------------------------------------------- -->
<div class="modal fade singo1" id="layerpop" >
     <div class="modal-dialog">
       <div class="modal-content">
         <!-- header -->
         <div class="modal-header">
           <!-- 닫기(x) 버튼 -->
           <button type="button" class="close" data-dismiss="modal">×</button>
           <!-- header title -->
           <h4 class="modal-title" align="center">부적절한채팅내용 신고하기</h4>
         </div>
         <!-- body -->
         <div class="modal-body" style="align:center;">
            <div class="modal-left">
               <img style="width: 100%; height: 100%;" src="resources/images/singo.jpg" class="screen"/>
            </div>
            <div class="modal-right">
               <table class="modalTable">
                     
                     <tr>
                        <td><label>신고자</label><input type="text" id="singoja" class="writer" value="${loginUser.nickName}" readonly/></td>
                     </tr>
                     <tr>
                        <td style="width: 49%;"><label>신고 대상</label><input type="text" id="singoMem" class="singoMem" readonly/></td>
                     </tr>
                     <tr>
                        <td><label>내용</label><textarea id="singoContent" class="singoContent" readonly></textarea></td>
                     </tr>
                  </table>
            </div>
         </div>
         <!-- Footer -->
         <div class="modal-footer">
           <button type="button" class="btn btn-default answer" onclick="singogo();">신고하기</button>
         </div>
       </div>
     </div>
   </div>
   
<div class="modal fade peach11" id="layerpop" >
     <div class="modal-dialog">
       <div class="modal-content">
         <!-- header -->
         <div class="modal-header">
           <!-- 닫기(x) 버튼 -->
           <button type="button" class="close" data-dismiss="modal">×</button>
           <!-- header title -->
           <h4 class="modal-title" align="center">피치쏘기</h4>
         </div>
         <!-- body -->
         <div class="modal-body">
            <div class="modal-left">
               <b>${loginUser.nickName}님</b>
            </div>
            <div class="modal-right">
               <table class="modalTable">
                     <tr>
                        <td><label>후원 가능 피치</label><input id="peachNumber" type="text" class="date" value="${loginUser.peach}" readonly/></td>
                        <td style="display: none;" class="code"></td>
                     </tr>
                     <tr>
                        <td><label>후원 할 피치</label><input type="text" id="peachNum" class="writer"/></td>
                     </tr>
                     <tr>
                        <td><label>후원 할 BJ</label><input type="text" id="bjId" class="writer" value="${bj.mid}" readonly/></td>
                     </tr>
                  </table>
            </div>
         </div>
         <!-- Footer -->
         <div class="modal-footer">
           <button type="button" class="btn btn-default answer" onclick="peach();">후원하기</button>
         </div>
       </div>
     </div>
   </div>
	<jsp:include page="../common/menubar.jsp"/>
	<div class="slider-area ptb-40">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div align="center" id="broadcastdisplay">
            				<div class="make-center">
                				<input type="hidden" id="broadcast-id" placeholder="broadcast-id" value="room-xyz">
				            </div>
				            <div id="video-preview" controls loop></div>
					</div>
					<div id="buttons" align="right">
					
						<button id="open-or-join-cam" class="w3-btn w3-white w3-border w3-border-blue w3-round-large" style="margin-top:15px; display:none"><i align="left" class="fa fa-send-o"></i>&nbsp;&nbsp;방송시작하기</button>
					 	<button id="open-or-join" class="w3-btn w3-white w3-border w3-border-blue w3-round-large" style="margin-top:15px; display:none"><i align="left" class="fa fa-send-o"></i>&nbsp;&nbsp;스크린 방송하기</button>
						<button id="peach" class="w3-btn w3-white w3-border w3-border-blue w3-round-large" style="margin-top:15px"><i align='center' class='fa fa-apple'></i>&nbsp;&nbsp;피치</button>
						<button id="gudock" class="w3-btn w3-white w3-border w3-border-blue w3-round-large" style="margin-top:15px"><i align='center' class='fa fa-thumbs-o-up'></i>&nbsp;&nbsp;구독하기</button>
						<button id="BJSinggo"class="w3-btn w3-white w3-border w3-border-blue w3-round-large" style="margin-top:15px"><i align="center" class="fa fa-warning"></i>&nbsp;&nbsp;신고하기</button>
						<button id="stop-broadcast"class="w3-btn w3-white w3-border w3-border-blue w3-round-large" style="margin-top:15px; display:none"><i align="center" class="fa fa-send-o"></i>&nbsp;&nbsp;방송종료</button>
						
					</div>
				</div>
			
			
				<div class="col-md-3" id="row3Div">
					<div class="chat-panel panel panel-default">
					
						<div class="panel-heading">
							<i class="fa fa-comments fa-fw"></i> 실시간 채팅
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body" style="outline none; text-align:left;">
							<ul class="chat" style="text-align:left;">
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
                      <a href="#"><img alt="" src="${contextPath}/resources/images/bjSemple/bj1.jpg" style="border-radius: 50px;"></a> 
                     </td>
                     <td><h1 id='title1'></h1></td>
                     <td>
                     	<h1 id="viewers" row="3" style="color:blue">0 명</h1>
                     </td>
                  </tr>
                  <tr>
                     <td><h3 id='nick1'></h3></td>
                  </tr>
                  <tr>
                     <td><h5 id='content1'></h5></td>
                  </tr>
               
               </table>
         
            
               <hr>
            </div>
         </div>
      </div> 
      <div id="fan" style="display:none;">
      </div>
     
      
      <input id="maxViewer" class="maxViewer" type="hidden" value="0"/>
    <input id="bjJCode" class="bjJCode" type="hidden" value="${bjJ.jcode}"/>
	<input id="bjId1" class="bjId1" type="hidden"/>
	<input id="mid" type="hidden" value="${loginUser.mId}"/>
	<input id="myId" type="hidden" value="${loginUser.mId}"/>
	<input id="nickName" type="hidden" value="${loginUser.nickName}"/>
	<div id="blackMemberList" style="display:none"></div>
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
		/* $("#open-or-join").click(function(){
			$("#broadcastdisplay").css({"height":"1000px"});
			$(".panel-body").css({"height":"960px"});
		}); */
		document.getElementById("stop-broadcast").onclick = function(){
			connection.send("<i class='fa fa-github-alt fa-fw'></i><strong class='primary-font'>"+"${loginUser.nickName}"+"</strong>"+"<div style='position:relative; width:240px; height:127px;'><img src='resources/images/bangjong.jpg' style='position:absolute'/></div>+<h3>방송종료</h2>");
			connection.close();
			var bjId8 = $("#bjId1").val();
			var maxViewer = $("#maxViewer").val();		
			$.ajax({
				url:"bangjong.lb",
				type:"POST",
				data:{
					"bjid":bjId8,
					"maxViewer":maxViewer
				},
				success:function(data){
					
					appendDIV("<i class='fa fa-github-alt fa-fw'></i><strong class='primary-font'>"+"${loginUser.nickName}"+"</strong>"+"<div style='position:relative; width:240px; height:127px;'><img src='resources/images/bangjong.jpg' style='position:absolute'/></div>+<h3>방송종료</h2>");
					alert("수고하셨어요!");
					
				}
			});
			$("#viewers").text(0 +" 명");
			$('#stop-broadcast').attr('disabled', true);
			$("#open-or-join").attr('disabled', true);
		};
			
		
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
            	 $('#stop-broadcast').attr('disabled', true);
            	var jCode = $("#bjJCode").val();
            	console.log("jCode"+jCode);
                connection.openOrJoin(document.getElementById('broadcast-id').value, function(isRoomExists, roomid) {
                    if(!isRoomExists) {
                        showRoomURL(roomid);
                    }
                });
                var loginUser = "${loginUser.mId}";
                console.log(loginUser == null);
                console.log(loginUser == "");
                if(loginUser == ""){
                	$("#buttons").css({"display":"none"});
                	$(".panel-footer").css({"display":"none"});
                }
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
            //connection.socketURL = 'http://localhost:9001/';
            // comment-out below line if you do not have your own socket.io server
            // connection.socketURL = 'https://rtcmulticonnection.herokuapp.com:443/';
            connection.socketMessageEvent = 'audio-video-screen-demo';
            connection.session = {
               	audio: true,
                video: true,
                oneway: true,
                data : true
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
                
                //시청자수
                var numberOfUsers = connection.getAllParticipants().length;
                connection.connectSocket(function() {
                	numberOfUsers = connection.getAllParticipants().length;
	                viewerCount(numberOfUsers);
       		        console.log(numberOfUsers+"명이다!");
       		        if(numberOfUsers === "0"){
       		        	$("#viewers").text(0 +" 명");
       		        	var maxViewers = $("#maxViewer").val();
       		        	if(maxViewers < numberOfUsers){
       		        		$("#maxViewer").val(numberOfUsers);
       		        	}
       		        }
                });
                
            };
            connection.onExtraDataUpdated = function(event) {
            	var numberOfUsers = connection.getAllParticipants().length;
            	 viewerCount(numberOfUsers);
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
               
                var fans = $("#fan").text();
            	var fan = fans.split(", ");
            	var bool = 1;
            	var userid = "${loginUser.mId}";
            	for(var i in fan){
					console.log("fan[i]"+fan[i]);	            		
            		if(fan[i] == userid){
					bool=2;	
            		break;
            		}
            	}
            	if(bool == 1){
 	           		connection.send("<i class='fa fa-github-alt fa-fw'></i><div class='dropdown1'><li><strong class='primary-font'>"+"${loginUser.nickName} : "+"</strong><ul><li><button id='singo' class='singo122' onclick='singo(this);'>신고하기</button></li><li><button id='black' class='black' onclick='CchungjaBlack(this)'>블랙하기</button></li></ul></li></div>"+this.value);
            		appendDIV("<i class='fa fa-github-alt fa-fw'></i><div class='dropdown1'><li><strong class='primary-font'>"+"${loginUser.nickName} : "+"</strong><ul><li><button id='singo' class='singo122' onclick='singo(this);'>신고하기</button></li><li><button id='black' class='black' onclick='CchungjaBlack(this)'>블랙하기</button></li></ul></li></div>"+this.value);
            		this.value = '';
            		BJblack();
            	}else if(bool == 2){
            		connection.send("<i class='fa fa-github-alt fa-fw'></i><div class='dropdown1'><li><strong class='primary-font' style='color:blue'>"+"${loginUser.nickName} : "+"</strong><ul><li><button id='singo' class='singo122' onclick='singo(this);'>신고하기</button></li><li><button id='black' class='black' onclick='CchungjaBlack(this)'>블랙하기</button></li></ul></li></div>"++this.value);
            		appendDIV("<i class='fa fa-github-alt fa-fw'></i><div class='dropdown1'><li><strong class='primary-font' style='color:blue'>"+"${loginUser.nickName} : "+"</strong><ul><li><button id='singo' class='singo122' onclick='singo(this);'>신고하기</button></li><li><button id='black' class='black' onclick='CchungjaBlack(this)'>블랙하기</button></li></ul></li></div>"++this.value);
            		this.value = '';
            		BJblack();
            	}
               /* connection.send("<i class='fa fa-github-alt fa-fw'></i><div class='dropdown1'><li><strong class='primary-font'>"+"${loginUser.nickName} : "+"</strong><ul><li><button id='singo' class='singo122' onclick='singo(this);'>신고하기</button></li><li><button id='black' class='black' onclick='CchungjaBlack(this)'>블랙하기</button></li></ul></li></div>"+this.value);
               appendDIV("<i class='fa fa-github-alt fa-fw'></i><div class='dropdown1'><li><strong class='primary-font'>"+"${loginUser.nickName} : "+"</strong><ul><li><button id='singo' class='singo122' onclick='singo(this);'>신고하기</button></li><li><button id='black' class='black' onclick='CchungjaBlack(this)'>블랙하기</button></li></ul></li></div>"+this.value);
                this.value = '';
                BJblack(); */
            };
            //피치쏘기
            /* document.getElementById("peach").onclick = function(){

            	var myId = document.getElementById("myId").value;
            	console.log("쉬벨"+myId);
            	var url = "peach.lb";
            	$.ajax({
            		url:url,
            		type:"post",
            		data:{"mId":myId},
            		success:function(data){
            			alert("당신의 보유 피치 수는 : "+data.peach);
            			console.log("당신의 보유 피치 수는 : "+data.peach);
            		},
            		error:function(data){
            			
            		}
            	});
            } */
            
            document.getElementById("peach").onclick = function(){
            	 var userid = document.getElementById("myId");
	             var bjnickName = $("#nick1").text();
	             $("#bjId").text(bjnickName);
	             $("#bjId").val(bjnickName);
	             var userPeach = $("#peachNumber").text();
            	$(".peach11").modal();
            	if(userpeach = 0){
            		
            	}
            	/* console.log("기리리잇"+"${loginUser.peach}");
            	console.log("기리리잇"+bjnickName); */
            	
            }; 
            document.getElementById("btn-chat").onclick = function(){
            	var text11 = document.getElementById('btn-input');
            	var fans = $("#fan").text();
            	var fan = fans.split(", ");
            	var bool = 1;
            	var userid = "${loginUser.mId}";
            	for(var i in fan){
					console.log("fan[i]"+fan[i]);
					console.log(fans);
            		if(fan[i] == userid){
					bool=2;	
            		break;
            		}
            	}
            	if(bool == 1){
 	           		connection.send("<i class='fa fa-github-alt fa-fw'></i><div class='dropdown1'><li><strong class='primary-font'>"+"${loginUser.nickName} : "+"</strong><ul><li><button id='singo' class='singo122' onclick='singo(this);'>신고하기</button></li><li><button id='black' class='black' onclick='CchungjaBlack(this)'>블랙하기</button></li></ul></li></div>"+text11.value);
            		appendDIV("<i class='fa fa-github-alt fa-fw'></i><div class='dropdown1'><li><strong class='primary-font'>"+"${loginUser.nickName} : "+"</strong><ul><li><button id='singo' class='singo122' onclick='singo(this);'>신고하기</button></li><li><button id='black' class='black' onclick='CchungjaBlack(this)'>블랙하기</button></li></ul></li></div>"+text11.value);
            		text11.value ='';
            		BJblack();
            	}else if(bool == 2){
            		connection.send("<i class='fa fa-github-alt fa-fw'></i><div class='dropdown1'><li><strong class='primary-font' style='color:blue'>"+"${loginUser.nickName} : "+"</strong><ul><li><button id='singo' class='singo122' onclick='singo(this);'>신고하기</button></li><li><button id='black' class='black' onclick='CchungjaBlack(this)'>블랙하기</button></li></ul></li></div>"+text11.value);
            		appendDIV("<i class='fa fa-github-alt fa-fw'></i><div class='dropdown1'><li><strong class='primary-font' style='color:blue'>"+"${loginUser.nickName} : "+"</strong><ul><li><button id='singo' class='singo122' onclick='singo(this);'>신고하기</button></li><li><button id='black' class='black' onclick='CchungjaBlack(this)'>블랙하기</button></li></ul></li></div>"+text11.value);
            		text11.value ='';
            		BJblack();
            	}
            };
            
            function appendDIV(event) {
           		var chatContainer = document.querySelector('div.panel-body ul.chat');
           		var nickName = document.getElementById("nickName").value+":";
           		
           		var chatli = document.createElement('li');
           		chatli.setAttribute("id","chatli");
           		chatli.setAttribute("class","left clearfix");
           		chatli.setAttribute("style","width:220px");
           		var chat_span = document.createElement('span');
           		chat_span.setAttribute("class","chat-img pull-left");
           		var chat_body = document.createElement('div');
           		/* chat_body.setAttribute("style","align:left"); */
           		chat_body.setAttribute('id', 'chat-body');
           		chat_body.setAttribute('class', 'chat-body clearfix');
           		var chat_header = document.createElement('div');
           		/* chat_header.setAttribute("style","align:left"); */
           		chat_header.setAttribute("class", "header");
           		chat_header.setAttribute("id", "chat-header");
        		var chat_small = document.createElement('small');
        		chat_small.setAttribute('class', "text-muted");
        		chat_small.setAttribute('id', 'chat_box');
        		/* chat_small.setAttribute("style","text-indent:5px;"); */
        		chatContainer.append(chatli);
        		chatli.append(chat_span);
        		chatli.append(chat_body);
        		
        		chat_body.append(chat_header);
        		chat_header.append(chat_small);
        		
             	var div = document.createElement('div');
             	div.setAttribute("style","align:left");
                div.innerHTML = event.data || event;
                chat_small.append(div);
              div.tabIndex = 0;
              //div.focus();
              BJblack();
                document.getElementById('btn-input').focus();
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
            
            document.getElementById('broadcast-id').value=roomid+"${loginUser.mId}";
           
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
               /*  disableInputButtons(); */
            }
   </script>
   <script>
   $("#open-or-join-cam").click(function(){
	      var roomid = document.getElementById('broadcast-id').value;
	      var mid = document.getElementById('mid').value;
	      var bjJCode = document.getElementById('bjJCode').value;
	     /* $("#open-or-join-cam").disabled = true; */
	     $('#open-or-join-cam').attr('disabled', true);
	      $.ajax({
	         url:"startBrod.lb",
	         type:"POST",
	         data:{
	            roomid:roomid,
	            mid:mid,
	            bjJCode:bjJCode
	         },
	         success:function(data){
	            console.log("성공");
	         }
	      });
	      $('#stop-broadcast').attr('disabled', false);
	   })
    /* function singo(){
       location.href="${contextPath}"
    } */
   $(function(){
	    console.log("href: "+$(location).attr('href'));
	    //현재 url전체
	    var href1 = $(location).attr('href');
	    //url 나눈거
	    var href2 = href1.split('#');
	    //실질적으로 필요한 url
	    var href3 = '';
	    var bjJcode = $("#bjJCode").val();
	    /* var BJmId = "${bjJ.jcode}"; */
	    if(href2.length!=1){
	    href3 = href2[1];
	    $.ajax({
	    	url:'JDBCInfo.lb',
	    	type:'post',
	    	data:{
	    		href3:href3,
	    	},
	    	success:function(data){
	    		var loginUserMid = "${loginUser.mId}";	
	    		$("#bjId1").val(data.bj.mid);
	    		$("#title1").text(data.bj.bsTitle);
	    		$("#nick1").text(data.bj.nickname);
	    		$("#content1").text(data.bj.bsContent);
	    		$("#viewers").text(data.bj.v_viewers+" 명");
	    		var bool = "${loginUser.mId}" == data.bj.mid;
	    		console.log(bool+"투루펄스");
	    		if(loginUserMid === data.bj.mid){
	    			$("#open-or-join-cam").css({"display":"inline","margin-top":"15px"});
		    		$("#open-or-join").css({"display":"inline","margin-top":"15px"});
		    		$("#stop-broadcast").css({"display":"inline","margin-top":"15px"});
	    		}
	    		console.log(data.fanlist.length);
	    		console.log(data.fanlist);
	    		console.log(data.fanlist[0].mId);
	    		for(var i =0; i < data.fanlist.length; i++){
	    			var fan = data.fanlist[i].mId;
		    		$("#fan").append(fan+", ");
	    		}
	    	}
	    });
	    }else{
	     href3 = document.getElementById('mid').value; 
	     var jCode = $("#bjJCode").val();
	    	$.ajax({
		    	url:'JDBCInfo2.lb',
		    	type:'post',
		    	data:{
		    		href3:href3,
		    		"jCode":jCode
		    	},
		    	success:function(data){
					var loginUserMid = "${loginUser.mId}";	    		
		    		$("#title1").text(data.bj.bsTitle);
		    		$("#nick1").text(data.bj.nickname);
		    		$("#content1").text(data.bj.bsContent);
		    		$("#bjId1").val(data.bj.mid);
		    		$("#viewers").text(data.bj.v_viewers+" 명");
		    		var bool = "${loginUser.mId}" == data.bj.mid;
		    		console.log(bool+"투루펄스");
		    		if(loginUserMid === data.bj.mid){
		    			$("#open-or-join-cam").css({"display":"inline","margin-top":"15px"});
			    		$("#open-or-join").css({"display":"inline","margin-top":"15px"});
			    		$("#stop-broadcast").css({"display":"inline","margin-top":"15px"});
		    		}
		    		console.log(data.fanlist.length);
		    		console.log(data.fanlist);
		    		console.log(data.fanlist[0].mId);
		    		for(var i =0; i < data.fanlist.length; i++){
		    			var fan = data.fanlist[i].mId;
			    		$("#fan").append(fan+", ");
		    		}
		    	}
		    });
	    }
	    
	});
   
   
   
   function peach(){
	   var userId = document.getElementById('mid').value;
	   var peachNum = document.getElementById("peachNum").value;
	   var bjId = document.getElementById("bjId").value;
	   var userPeach = $("#peachNumber").val();
	   var num =userPeach-peachNum;
	   console.log(userPeach+"내꺼");
	   console.log(peachNum+"줄거");
	   console.log(num);
	   if(userPeach < peachNum){
		   alert("피치갯수가 모자랍니다");
	   }else if(peachNum == "0"){
		   alert("0 개는 후원할 수 없습니다.");
	   }else{
		
	   $.ajax({
	         url:"peach.lb",
	         type:"POST",
	         data:{
	           "userId":userId,
	           "peachNum":peachNum,
	           "bjId":bjId
	         },
	         
	         success:function(data){
	        	 $(".close").click();
	        	 var text111 = "";
	             var userid = document.getElementById("myId");
	             var bjnickName = $("#nick1").text();
	             $("#bjId").text(bjnickName);
	             $("#bjId").val(bjnickName);
	             text111 = "<i class='fa fa-github-alt fa-fw'></i><strong class='primary-font'>"+"${loginUser.nickName}"+"</strong>"+"<div style='position:relative; width:240px; height:127px;'><img src='resources/images/peach.png' style='position:absolute'/><b style='position:absolute; top:43px; left:105px; font-size:30px'>"+peachNum+"</b></div>";
	             connection.send(text111);
	             appendDIV(text111);
	             $("#peachNumber").val(num);
	             $("#peachNum").value="";
	             
	             
	            var fans = $("#fan").text();
	            var fan = fans.split(", ");
	            var bool = 1;
	            
	            for(var i in fan){
					console.log("fan[i]"+fan[i]);
					console.log(fans);
	            	if(fan[i] == userId){
					bool=2;	
	            	break;
	            	}
	            }if(bool == 1){
		            $("#fan").append(userId+", ");
	            }
	         }
	         
	   	});
	   }
   }
   function singogo(){
	   var singoja = $('#singoja').val();
	   var singoMem = $("#singoMem").val();
	   var singoContent = $("#singoContent").val();
	   console.log("1 : "+singoja);
	   console.log("1 : "+singoMem);
	   console.log("1 : "+singoContent);
	  
	   $.ajax({
		   url:"textsingo.lb",
		   type:"POST",
		   data:{
			   "singoja":singoja,
			   "singoMem":singoMem,
			   "singoContent":singoContent
		   },
		   success:function(data){
			   $(".close").click();
			   alert("신고하기 완료");
		   }
	   });
	   var sock = new SockJS("<c:url value="/echo"/>");

       sock.onopen = sendMessage;
       var userId = "${loginUser.mId}/"

       function sendMessage(){
          sock.send(userId);
          close();
       }
       function close(){
          sock.close();
          sock = null;
       }
   };
   </script>
   	 
	<script>
		function singo(value){
			$(".singo1").modal();
			var text = $(value).parent("li").parent("ul").parent("li").children("strong").text();
			var text1 = $(value).parent("li").parent("ul").parent("li").parent("div").parent("div").text();
			console.log(this);
			var text3 = text.replace(':','');
			var text2 = text1.replace('신고하기블랙하기','');
			console.log("이거다1"+text);
			console.log("이거다2"+text2);
			$(".singoContent").val(text2);
			$(".singoMem").val(text3);
		}; 
		function BJblack(){
			var userId = "${loginUser.mId}";
			var bjId = $("#bjId1").val();
			console.log("으익"+userId);
			console.log("으익"+bjId);
			console.log(userId === bjId);
			console.log(userId == bjId);
			if(userId === bjId){
				$(".black").css({"display":"inline" , "background":"white" , "color":"black" , "border":"none" , "position":"absolute" , "height":"20px" , "font-size":"0.6em" , "cursor":"pointer" , "transition":"800ms ease all","outline":"none"});
			}
		}
		function CchungjaBlack(value){
			var text1 = $(value).parent("li").parent("ul").parent("li").parent("div").parent("div").text();
			console.log("시부레 : "+text1);
			var str = text1.split(" : ");
			/* console.log(str[0]+"3");
			console.log(str[1]+"3"); */
			var adminbj = $(".bjId1").val();
			$(".blackCChungja").modal();
			$(".adminbj").val(adminbj);
			$(".blackMember").val(str[0]);
		};
		function BlackC(){
			var adminbj = $(".adminbj").val();
			var blackMember = $(".blackMember").val();
			$.ajax({
				 url:"bjBlackMember.lb",
				 type:"POST",
				 data:{
					"adminbj":adminbj,
					"blackMember":blackMember
				 },
				 success:function(data){
					$(".close").click();
					alert("블랙하기 완료");
					for(var i = 0; i< data.bmArr.length; i++){
						$("#blackMemberList").text($("#blackMemberList").text()+", "+data.bmArr[i].bjMember);
						console.log("마리아 : " + data.bmArr[i].bjMember);		
					}
				 }
			});	
		};
		$("#BJSinggo").click(function(){
			location.href="${contextPath}/helpreport.hp";
		});
		$("#gudock").click(function(){
			var BJ_mCode = $("#bjId1").val();
			var reder_mCode = "${loginUser.mId}";
			
			var tt = document.getElementById("gudock").innerHTML;
			console.log($("#gudock").text());
			console.log(tt);
			/* $("#gudock").text("구독취소하기"); */
			var before = '<i align="center" class="fa fa-thumbs-o-up"></i>&nbsp;&nbsp;구독하기';
			var after = '<i align="center" class="fa fa-thumbs-o-up"></i>구독취소하기';
			$.ajax({
				url:"gudockins.lb",
				type:"POST",
				data:{
					"BJ_mCode":BJ_mCode,
					"reder_mCode":reder_mCode
				},
				success:function(data){
					if( tt == before){
						document.getElementById("gudock").innerHTML = after; 
					}else{
						document.getElementById("gudock").innerHTML = before;
					}
				}
			});
			console.log("1"+BJ_mCode);
			console.log("2"+reder_mCode);
		});
		
		
		function viewerCount(value){
			var bjId9 = $("#bjId1").val();
			var viewers = value;
			$.ajax({
				url:"insertViewers.lb",
				type:"POST",
				data:{
					"bjId9":bjId9,
					"viewers":viewers
				},
				success:function(data){
					$("#viewers").text(value +" 명");
				}
			});
		}
	</script>
</div>
</body>
</html>