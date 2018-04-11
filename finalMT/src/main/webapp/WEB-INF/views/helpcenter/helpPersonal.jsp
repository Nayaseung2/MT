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

.qTable {
	width: 70%;
	font-size: 20px;
}

.qTable td {
	width: 100px;
}

.qTable tr {
	margin-bottom: 2%;
}

.tableList {
	padding-left: 2%;
}

.qInput {
	background: rgba(255, 99, 71, 0.05);
}

.qBtn {
	padding-left: 35%;
}

label {
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 18px;
	padding-right: 2%;
}

/* input[type="text"] {
	border-radius: 20px;
} */

input[type="radio"] {
	display: none;
	width: 50px;
	height: 50px;
	font-size: 20px;
}

input[type="radio"]+label:hover {
	cursor: pointer;
}

input[type="radio"]+label {
	font-weight: 400;
	font-size: 14px;
}

input[type="radio"]+label span {
	display: inline-block;
	width: 18px;
	height: 18px;
	margin: -2px 10px 0 0;
	vertical-align: middle;
	cursor: pointer;
	-moz-border-radius: 50%;
	border-radius: 50%;
	border: 3px solid #ffffff;
}

input[type="radio"]+label span {
	background-color: darkgray;
}

input[type="radio"]:checked+label {
	color: #F08080;
	font-weight: 700;
}

input[type="radio"]:checked+label span {
	background-color: hsl(0, 100%, 75%);
	border: 2px solid #ffffff;
	box-shadow: 2px 2px 2px rgba(0, 0, 0, .1);
}

input[type="radio"]+label span, input[type="radio"]:checked+label span {
	-webkit-transition: background-color 0.24s linear;
	-o-transition: background-color 0.24s linear;
	-moz-transition: background-color 0.24s linear;
	transition: background-color 0.24s linear;
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

		<div class="rightNav">
					
			<h1 style="font-family: 'Hanna', sans-serif;">1:1 문의하기</h1>		
			<div style="float:right;">
				<img src="${ contextPath }/resources/images/help/ask.png" width="80%"/>
			</div>
			<br/>
			<div class="qInput">
			<br/><br/><br/>
			<h3 style="font-family: 'Hanna', sans-serif; margin-left: 5%;">1:1문의 이렇게 사용해 주세요.</h3>	
			<br/>
			<h4 style="font-family: 'Hanna', sans-serif; margin-left: 10%;">
				* 고객님께서 궁금하신 사항을 FAQ에서 찾지 못하셨을 경우 1:1 문의를 이용해주세요.<br/>
				* 1:1 문의에 등록된 내용은 본인만 확인 할 수 있습니다.<br/>
				* 문의하신 내용에 대한 답변은 myPage에서 확인하실 수 있습니다.<br/>
				* 임시점검 시간 및 휴무 시에는 답변이 늦어질 수 있으니 양해 부탁 드립니다.
			</h4>
			
			<br/>	
			
				<br/>
				<br/>
				<table class="qTable" align="center">
				
					<tr>
						<!-- <td class="tableList"><i class="fa fa-check-circle fa-2x"></i></td>	  -->
						<td colspan="3" style="height: 70px;">
							<input type="radio" name="qRadio" id="qRadio1" value="qRadio1" checked="checked">
								<label for="qRadio1" style="font-size: 20px;"> <span></span>	계정관련 </label>
							<input type="radio" name="qRadio" id="qRadio2" value="qRadio2">
								<label for="qRadio2" style="font-size: 20px;"> <span></span> 방송/시청관련 </label>
							<input type="radio" name="qRadio" id="qRadio3" value="qRadio3">
								<label for="qRadio3" style="font-size: 20px;"> <span></span> 피치관련 </label>
							<input type="radio" name="qRadio" id="qRadio4" value="qRadio4">
								<label for="qRadio4" style="font-size: 20px;"> <span></span> 결제관련 </label>
							<input type="radio" name="qRadio" id="qRadio5" value="qRadio5">
								<label for="qRadio5" style="font-size: 20px;"> <span></span> 기 타 </label>
						</td>
					</tr>
					<tr>
						<td><div style="height: 30px;"></div></td>
					</tr>
					<tr>
						<td class="tableList">작성자</td>
						<td colspan="3"><input type="text" id="qName" size="18px" value="${ loginUser.mId }" style="height:50px;
								border:3px solid hsl(0, 100%, 90%);" readonly/></td>
					</tr>
					<tr>
						<td><div style="height: 30px;"></div></td>
					</tr>
					<tr>
						<td class="tableList">제목</td>
						<td colspan="3"><input type="text" id="qTitle" size="52px" style="height:50px;
								border:3px solid hsl(0, 100%, 90%);"/></td>
					</tr>	
					<tr>
						<td><div style="height: 30px;"></div></td>
					</tr>
					<tr>
						<td class="tableList">내용</td>
						<td colspan="3"><textarea id="qContent" rows="10" style="width:70%; resize: none;
									border:3px solid hsl(0, 100%, 90%); /* border-radius: 20px; */"></textarea></td>
					</tr>
				
				</table>
				<br/>
				<br/>
				<div class="qBtn">
					<button type="submit" class="btn btn-danger" style="font-size:20px;" onclick="submit();">등록하기</button>&nbsp;&nbsp;
					<button type="reset" class="btn btn-danger" style="font-size:20px;">취소하기</button>	
				</div>
				<br/>
				<br/>	
			</div>		
					
			<script>
			
				function submit(){
					
					location.href="${ contextPath }/helpanswer.hp";
				}
			
			</script>

		</div>

	</div>
	<!-- 위에 배너 빼고 전체 div 끝 -->
	<br/>
	<br/>

	 <jsp:include page="../common/footer.jsp"/>

</body>
</html>