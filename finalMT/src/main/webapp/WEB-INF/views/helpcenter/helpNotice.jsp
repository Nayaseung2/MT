<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- sdf -->
<style>

@import url(//fonts.googleapis.com/earlyaccess/hanna.css);

.outer {
	width: 95%;
	margin-top: 2%;
	margin-left: 2%;
	margin-right: 2%;
	font-family: 'Hanna', sans-serif;
}

.sidebar {
	display: inline-block;
	float: left;
}

.rightNav {
	display: inline-block;
	margin-left: 2%;
	width: 80%;
}

.sideBtn {
	width: 300px;
	height: 100px;
	margin-bottom: 2%;
	border-right: 3px solid hsl(0, 0%, 94%);
	border-bottom: 3px solid hsl(0, 100%, 90%);
	border-left: 0px solid white;
	border-top: 0px solid white;
	background-color: rgba(255, 255, 255, 0.5);
	font-size: 20px;
	text-align: left;
	padding-left: 15%;
}

.sideBtn:hover {
	border: 3px solid hsl(0, 100%, 75%);
	border-radius: 30px;
}

table {
	border-top:2px solid #F08080;
	border-bottom:2px solid #F08080;
	padding-left: 3%;
}

#listArea {
	width:80%;
	font-size: 20px;
	margin-top: 3%;
}

#listArea th {
	text-align: center;
	border-bottom:2px solid #F08080;
	height: 65px;
}

#listArea tr {
	height: 60px;
	text-: 3%;
}





</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link href="${ contextPath }/resources/css/fontawesome.min.css">

</head>
<body>

	<jsp:include page="../common/menubar.jsp" /> 

	<br />
	<br />

	<!-- 위에 배너 시작 -->
	<div class="page-banner-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="page-banner">
						<div class="page-title" style="font-family: 'Hanna', sans-serif;">
							<h1>Customer Service</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 위에 배너 끝 -->

	<!-- 위에 배너 빼고 전체 div 시작 -->
	<div class="outer">

		<div class="sidebar">
			<button class="sideBtn" onclick="personal();"><i class="fa fa-edit fa-2x"></i>&nbsp;&nbsp; 1:1 문의</button>
			<br />
			<button class="sideBtn" onclick="helpMain();"><i class="fa fa-search fa-2x"></i>&nbsp;&nbsp; 자주묻는 질문</button>
			<br />
			<button class="sideBtn" onclick="notice();"><i class="fa fa-bullhorn fa-2x"></i>&nbsp;&nbsp; 공지사항</button>
			<br />
			<button class="sideBtn" onclick="report();"><i class="fa fa-frown-o fa-2x"></i>&nbsp;&nbsp; 신고하기</button>
		</div>
		
		<c:if test="${ empty loginUser }">
			<script>
				
				function personal(){
					
					alert("로그인이 필요한 서비스입니다.");
				}
				
				function helpMain(){
					
					location.href="${ contextPath }/helpmain.hp";				
				}
			
				function notice(){
					
					location.href="${ contextPath }/helpnotice.hp";	
				}
				
				function report(){
					
					alert("로그인이 필요한 서비스입니다.");
				}
				
			</script>
		</c:if> 
		
		<c:if test="${ !empty loginUser }">
			<script>
				
				function personal(){
					
					location.href="${ contextPath }/helppersonal.hp";
				}
				
				function helpMain(){
					
					location.href="${ contextPath }/helpmain.hp";				
				}
			
				function notice(){
					
					location.href="${ contextPath }/helpnotice.hp";	
				}
				
				function report(){
					
					location.href="${ contextPath }/helpreport.hp"
				}
				
			</script>
		</c:if>

		<div class="rightNav">
					
			<h1 style="font-family: 'Hanna', sans-serif;">공지사항</h1>		
			<br/>
				<div class="tableArea">
					<table align="center" id="listArea">
						<!-- table header -->
						<tr>
							<th>글번호</th>
							<th>글제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>
						<tr>
							<td align="center">4</td>
							<td style="padding-left: 3%;">[안내] 모두의 TV 개인정보처리방침 개정안내</td>
							<td align="center">모두의 TV</td>
							<td align="center">297</td>
							<td align="center">2018.04.02</td>
						</tr>
						<tr>
							<td align="center">3</td>
							<td style="padding-left: 3%;">[안내] 장애인 비난/비하/멸시 방송 모니터링 강화</td>
							<td align="center">모두의 TV</td>
							<td align="center">165</td>
							<td align="center">2018.04.02</td>
						</tr>
						<tr>
							<td align="center">2</td>
							<td style="padding-left: 3%;">[안내] 3월 5주차 TV조선/ 채널A 방송 송출 불가 프로그램</td>
							<td align="center">모두의 TV</td>
							<td align="center">243</td>
							<td align="center">2018.04.02</td>
						</tr>
						<tr>
							<td align="center">1</td>
							<td style="padding-left: 3%;">[안내] 모두의 TV가 서비스를 시작합니다!</td>
							<td align="center">모두의 TV</td>
							<td align="center">122</td>
							<td align="center">2018.04.02</td>
						</tr>
					</table>
				</div>
				<br/>
			</div>
			<script>
			
				$(function(){
					
					$("#listArea td").mouseenter(function(){
							//tr의 css를 변경
						$(this).parent().css({"background":"#F08080", "cursor":"pointer", "color":"white"});
							
					}).mouseout(function(){
						
						$(this).parent().css({"background":"white", "color":"black"});
						
					});
				});
				
				$(function(){
					
					$("#listArea td").click(function(){
						
						location.href="${ contextPath }/helpnoticedetail.hp";
					});
				});
				
			</script> 
		</div>

	</div>
	<!-- 위에 배너 빼고 전체 div 끝 -->

	<br />
	<br />
	<br />
	<br />
	<br />
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>