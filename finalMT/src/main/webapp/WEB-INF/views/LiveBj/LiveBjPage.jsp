<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>

</head>
<body>

	<jsp:include page="../common/menubar.jsp"/>

	<div class="slider-area ptb-40">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div style="height: 500px; border: 1px solid black;" align="center" >
					<br><br><br>
						<i align="center" class="fa fa-thumbs-o-up fa-5x"></i>
						<h1 align="center">방송 화면 입니다. </h1>
						<h1 align="center">화면조정중입니다. </h1>
					</div>
					<div align="right">
					 	<button class="w3-btn w3-white w3-border w3-border-blue w3-round-large"><i align="center" class="fa fa-apple"></i>&nbsp;&nbsp;피치</button>
						<button class="w3-btn w3-white w3-border w3-border-blue w3-round-large"><i align="center" class="fa fa-apple"></i>&nbsp;&nbsp;피치</button>
						<button class="w3-btn w3-white w3-border w3-border-blue w3-round-large"><i align="center" class="fa fa-thumbs-o-up"></i>&nbsp;&nbsp;구독하기</button>
						<button class="w3-btn w3-white w3-border w3-border-blue w3-round-large"><i align="center" class="fa fa-warning"></i>&nbsp;&nbsp;신고하기</button>
						<button class="w3-btn w3-white w3-border w3-border-blue w3-round-large"><i align="center" class="fa fa-send-o"></i>&nbsp;&nbsp;공유하기</button>
						<button class="w3-btn w3-white w3-border w3-border-blue w3-round-large"><i align="center" class="fa fa-heart"></i></button>
					</div>
				</div>
			
			
				<div class="col-md-3" >
					<div class="chat-panel panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-comments fa-fw"></i> 실시간 채팅
						
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body" style="height: 460px; overflow: overlay;">
							<ul class="chat">
							<!-- 채팅 1명 시작 -->
								<li class="left clearfix">
								<span class="chat-img pull-left"></span>
									<div class="chat-body clearfix">
										<div class="header">
										<i class="fa fa-github-alt fa-fw"></i> 
											<strong class="primary-font">오늘만 산다</strong> 
											<small class="pull-right text-muted"> 
											</small>
										</div>
										<p>안녕하세요 오늘도 화이팅입니다.</p>
									</div>
								</li>
								<!-- 1명 끝 -->
								<!-- 채팅 1명 시작 -->
								<li class="left clearfix">
								<span class="chat-img pull-left"></span>
									<div class="chat-body clearfix">
										<div class="header">
										<i class="fa fa-github-alt fa-fw"></i> 
											<strong class="primary-font">오능도 산다</strong> 
											<small class="pull-right text-muted"> 
											</small>
										</div>
										<p>응응 인정각</p>
									</div>
								</li>
								<!-- 1명 끝 -->
								<!-- 채팅 1명 시작 -->
								<li class="left clearfix">
								<span class="chat-img pull-left"></span>
									<div class="chat-body clearfix">
										<div class="header">
										<i class="fa fa-github-alt fa-fw"></i> 
											<strong class="primary-font">아프리카 청춘이다</strong> 
											<small class="pull-right text-muted"> 
											</small>
										</div>
										<p>안녕하세요 모두의 티비 관리자 입니다.</p>
									</div>
								</li>
								<!-- 1명 끝 -->
								<c:forEach begin="1" end="15" step="1">
								
								<!-- 채팅 1명 시작 -->
								<li class="left clearfix">
								<span class="chat-img pull-left"></span>
									<div class="chat-body clearfix">
										<div class="header">
										<i class="fa fa-github-alt fa-fw"></i> 
											<strong class="primary-font">아프리카 청춘이다</strong> 
											<small class="pull-right text-muted"> 
											</small>
										</div>
										<p>오늘도 즐방 하세요~~!</p>
									</div>
								</li>
								<!-- 1명 끝 -->
								
								</c:forEach>
								
							</ul>
						</div>
						<!-- /.panel-body -->
						<div class="panel-footer">
							<div class="input-group">
								<input id="btn-input" type="text" class="form-control input-sm"
									placeholder="채팅을 입력하세요..."> <span
									class="input-group-btn">
									<button class="btn btn-warning btn-sm" id="btn-chat">
										전송</button>
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
							<td><h3>BJ 감우성</h3></td>
						</tr>
						<tr>
							<td><h5>#배틀그라운두&nbsp;&nbsp;#감우성&nbsp;&nbsp;#못생김주의&nbsp;&nbsp;#남캠</h5></td>
						</tr>
					
					</table>
			
				
					<hr>
				</div>
			</div>
		</div> 

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

</body>
</html>