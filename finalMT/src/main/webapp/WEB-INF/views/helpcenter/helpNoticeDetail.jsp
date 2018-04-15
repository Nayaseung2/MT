<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>모두의 TV</title>
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

#listArea td {
	height: 400px;
	background: rgba(255, 99, 71, 0.05);
	
}

.conArea {
	font-family: 'Hanna', sans-serif;
	font-size: 20px;
	text-align: center;
	background: white;
	border: 0px solid white;
	background: rgba(255, 99, 71, 0);
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
							<th colspan="3"><c:out value="${ nListDetail[0].b_title }"/></th>
							<th><c:out value="${ nListDetail[0].b_update_date }"/></th>
						</tr>
						<tr>
							<td colspan="4" rowspan="10">
								<pre class="conArea"><c:out value="${ nListDetail[0].b_content }"/></pre>
							</td>
						</tr>
					</table>
				</div>
				<br/>
				<br/>
				<br/>
				<br/>
				<div align="center">
					<button type="button" class="btn btn-danger" style="font-size:20px;" onclick="goList();">목록으로 돌아가기</button>
				</div>
				<script>
				
					function goList(){
						
						location.href="${ contextPath }/helpnotice.hp";	
					}
				
				</script>
				<br/>
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