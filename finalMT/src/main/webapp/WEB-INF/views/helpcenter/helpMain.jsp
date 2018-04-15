<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>모두의 TV</title>
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

.searchArea {
	background-color: rgb(255, 233, 228);
	height: 140px;
}

.form-group {
	margin-top: 2%;
	margin-left: 1%;
	margin-bottom: 5%;
}

#search {
	display: inline-block;
	float: left;
	margin-right: 1%;
	margin-top: 1%; height : 60px;
	font-size: 30px;
	height: 60px;
}

#searchBtn {
	display: inline-block;
	float: left;
	margin-right: 1%;
	margin-top: 1%; height : 60px;
	font-size: 30px;
	height: 60px;
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

.css3-tab input[type='radio'] {
	display: none;
}

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
		
			<h1 style="font-family: 'Hanna', sans-serif;">자주묻는 질문</h1>		
			<br/>

			<div class="searchArea">
				<div class="form-group">
					<input type="text" class="form-control" id="search" name="word" style="width: 88%;">
					<button onclick="goSearch();" type="button" class="btn btn-danger" id="searchBtn">Search</button>
					<br clear="both"/> 
					<br/> 
					<b style="font-size: 18px; color: rgb(135, 0, 0); font-family: 'Nanum Gothic', sans-serif;">
						Best 키워드 _ 피치 / 방송국 / 방송 / 신고 
					</b>
				</div>
				<br/>
			</div>
			<br/>
			
			<script>
			
				function goSearch(){
					
					if($("#search").val() === ''){
						
						alert("검색어를 입력해주세요!");
						location.reload();
						
					}else {
						
						location.href="${ contextPath }/helpsearch.hp?word=" + $("#search").val(); 
					}
				}
				
			</script>
	
			<!-- Pure CSS Menu -->
			<div class='css3-tab'>
				<input type='radio' name='a' class="qnaType" id='tabOne' tabindex="1" value="qna1" checked>
				<input type='radio' name='a' class="qnaType" id='tabTwo' tabindex="2" value="qna2"> 
				<input type='radio' name='a' class="qnaType" id='tabThree' tabindex="3" value="qna3"> 
				<input type='radio' name='a' class="qnaType" id='tabFour' tabindex="4" value="qna4"> 
				<input type='radio' name='a' class="qnaType" id='tabFive' tabindex="5" value="qna5">

				<div class="css3-tab-nav" style="font-family: 'Nanum Gothic', sans-serif;">
					<label for='tabOne' style="font-size: 18px;">계정관련</label> 
					<label for='tabTwo' style="font-size: 18px;">방송/시청관련</label> 
					<label for='tabThree' style="font-size: 18px;">피치관련</label> 
					<label for='tabFour' style="font-size: 18px;">결제관련</label> 
					<label for='tabFive' style="font-size: 18px;">기 &nbsp; 타</label>
				</div>
				

				<div class='css3-tab-content tab-one'>
					<!-- start slipsum code -->
					<h1 style="font-family: 'Hanna', sans-serif;">계정관련 QnA</h1>
					<hr/>
					<table class="QnAtable">
						<c:forEach var="item" items="${ list }" begin="0" end="10" step="1">
							<tr class="answer_">
								<td style="width:7%; background: #F08080; color:white; text-align:center; font-size:40px;">Q</td>
								<td style="padding-left:3%;"><b><c:out value="${ item.b_title }"/></b></td>
							</tr>
							<tr class="answer">
								<td colspan="2" class="answerArea"><c:out value="${ item.b_content }"/></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				
				<script>
					
				 $(".qnaType").click(function(){
					 	
					 var b_type = $(this).val();
					 
					 $.ajax({
			            url : "helpmain.hp",
			            type : "GET",
			            data : {"b_type": b_type},
			            success : function(data){
			            	
			            	console.log(data);
			            	
							// 덮어씌어지지않게 ' '으로  초기화
							$(".QnAtable").html('');
			            	
			            	 var results = data.list;
			                 var str = " ";
			                 $.each(results, function(i){
			                	 
			                	 str += "<tr class='answer_'>";
			                	 str += "<td style='width:7%; background: #F08080; color:white; text-align:center; font-size:40px;'>Q</td>";
			                     str += "<td style='padding-left:3%;'><b>" + results[i].b_title + "</b></td></tr>";
			                     str += "<tr class='answer'><td colspan='2' class='answerArea'>" + results[i].b_content + "</td></tr>";
			                });
			                $(".QnAtable").append(str); 
			                
			                $(".answer").hide();
			            },
			            error : function(data){
			                alert("error");
			            }
				     });
				 });
			
				$(".answer").hide();
				
				$(document).on("click", ".answer_", function(){
					$(this).next().toggle();
				});
				
				</script>

				<div class='css3-tab-content tab-two'>
					<!-- start slipsum code -->
					<h1 style="font-family: 'Hanna', sans-serif;">방송/시청관련 QnA</h1>
					<hr/>
					<table class="QnAtable"></table>
				</div>
				
				<script>
				
					$(".answer").hide();
					
					$(document).on("click", ".answer_", function(){
						$(this).next().toggle();
					});
				
				</script>

				<div class='css3-tab-content tab-three'>
					<!-- start slipsum code -->
					<h1 style="font-family: 'Hanna', sans-serif;">피치관련 QnA</h1>
					<hr/>
					<table class="QnAtable"></table> 
				</div>
				
				<script>
				
					$(".answer").hide();
					
					$(document).on("click", ".answer_", function(){
						$(this).next().toggle();
					});
				
				</script>

				<div class='css3-tab-content tab-four'>
					<!-- start slipsum code -->
					<h1 style="font-family: 'Hanna', sans-serif;">결제관련 QnA</h1>
					<hr/>
					<table class="QnAtable"></table> 
				</div>
				
				<script>
				
					$(".answer").hide();
					
					$(document).on("click", ".answer_", function(){
						$(this).next().toggle();
					});
				
				</script>

				<div class='css3-tab-content tab-five'>
					<!-- start slipsum code -->
					<h1 style="font-family: 'Hanna', sans-serif;">기 타 QnA</h1>
					<hr/>
					<table class="QnAtable"></table> 
				</div>
				
				<script>
				
					$(".answer").hide();
					
					$(document).on("click", ".answer_", function(){
						$(this).next().toggle();
					});
				
				</script>
			</div>
		</div>
	</div>
	<!-- 위에 배너 빼고 전체 div 끝 -->
	
    <jsp:include page="../common/footer.jsp"/>

</body>
</html>