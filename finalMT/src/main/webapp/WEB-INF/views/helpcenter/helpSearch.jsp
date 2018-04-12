<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <!-- sdf sdf-->
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

.form-group {
	margin-top: 2%;
	margin-left: 1%;
	margin-bottom: 5%;
}

.nav-pills {
	font-size: 30px;
	width: 1000px;
}

.nav-link {
	margin-right: 2%;
}

/* ===== */
.css3-tab {
	list-style: none;
	margin: 0 auto 40px;
	padding: 38px 0 0 0;
	position: relative;
	width: 100%;
	display: inline-block;
	float: left;
}

/* .css3-tab input[type='radio'] {
	display: none;
} */

.css3-tab .css3-tab-nav {
	display: table;
	table-layout: fixed;
	width: 100%;
}

.css3-tab .css3-tab-nav label {
	display: table-cell;
	background-color: rgb(255, 233, 228);
	color: rgb(135, 0, 0);
	padding: 15px;
	text-align: center;
	transition: all .3s ease 0s;
}

.css3-tab .css3-tab-nav label:hover {
	cursor: pointer;
	background: #F08080;
	color: #666666;
	transition: all .3s ease 0s;
}

@media ( max-width : 692px) {
	.css3-tab .css3-tab-nav {
		display: block;
		margin: 0 0 20px;
	}
	.css3-tab .css3-tab-nav label {
		display: block;
		box-sizing: border-box;
		width: 100%;
		padding: 20px;
	}
}

.css3-tab .css3-tab-content {
	overflow: hidden;
	padding: 25px;
	display: none;
	background: #FFF;
	clear: left;
	box-sizing: border-box;
}

.css3-tab input[id='tabOne']:checked ~ .css3-tab-nav label[for='tabOne']
	{
	background: #F08080;
	color: white;
	cursor: default;
}

.css3-tab input[id='tabOne']:checked ~ div.tab-one {
	display: block;
	border-top: solid 3px red;
}

.css3-tab input[id='tabTwo']:checked ~ .css3-tab-nav label[for='tabTwo']
	{
	background: #F08080;
	color: white;
	cursor: default;
}

.css3-tab input[id='tabTwo']:checked ~ div.tab-two {
	display: block;
	border-top: solid 3px red;
}

.css3-tab input[id='tabThree']:checked ~ .css3-tab-nav label[for='tabThree']
	{
	background: #F08080;
	color: white;
	cursor: default;
}

.css3-tab input[id='tabThree']:checked ~ div.tab-three {
	display: block;
	border-top: solid 3px red;
}

.css3-tab input[id='tabFour']:checked ~ .css3-tab-nav label[for='tabFour']
	{
	background: #F08080;
	color: white;
	cursor: default;
}

.css3-tab input[id='tabFour']:checked ~ div.tab-four {
	display: block;
	border-top: solid 3px red;
}

.css3-tab input[id='tabFive']:checked ~ .css3-tab-nav label[for='tabFive']
	{
	background: #F08080;
	color: white;
	cursor: default;
}

.css3-tab input[id='tabFive']:checked ~ div.tab-five {
	display: block;
	border-top: solid 3px red;
}

outer {
	background: #e4e4e4;
}

.keyword {
	display: block;
}

.QnAtable {
	font-size: 20px;
	width: 100%;
	height: 70px;
}

.QnAtable tr {
	border: 1px solid lightgray;
	cursor: pointer;
}

.QnAtable tr:hover{
	background: #FFF8DC;
}

.answerArea {
	padding-left: 10%;
	height: 100px;
}

.serArea {
	margin-top: 6%;
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
		
			<h1 style="font-family: 'Hanna', sans-serif;">검색 결과</h1>		
			<div class='css3-tab'>
			
					<c:if test="${ !empty sList }">
						<table class="QnAtable">
							<c:forEach var="item" items="${ sList }" begin="0" end="10" step="1">
								<tr class="answer_">
									<td style="width:7%; background: #F08080; color:white; text-align:center; font-size:40px;">Q</td>
									<td style="padding-left:3%;"><b><c:out value="${ item.b_title }"/></b></td>
								</tr>
								<tr class="answer">
									<td colspan="2" class="answerArea"><c:out value="${ item.b_content }"/></td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
					
					<c:if test="${ empty sList }">
					
						<div align="center" class="serArea">
							<img src="${ contextPath }/resources/images/help/file.png"/>
							<br/><br/>
							<h2>검색결과가 없습니다!<br/>다른 키워드로 검색해주세요.</h2>
						</div>
						
					</c:if>
					
				<script>
				
					$(".answer").hide();
					
					$(document).on("click", ".answer_", function(){
						$(this).next().toggle();
					});
				
				</script>	
			</div>
		</div>
		<br/>
		<br/>
		<br/>
		<br/>
		
	</div>
	<!-- 위에 배너 빼고 전체 div 끝 -->
	
    <jsp:include page="../common/footer.jsp"/>

</body>
</html>