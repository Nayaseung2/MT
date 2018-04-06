<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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

.rTable {
	width: 70%;
	font-size: 20px;
	margin-left: 10%;
}

.rTable td {
	width: 100px;
}

.rTable tr {
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



/* =========== */



.form-group {
    display: inline-block;
    margin-bottom: 0;
    vertical-align: middle;
    width: 120%;
}

.form-control {
    display: inline-block;
    width: 100%;
    height: 30px;
    font-size: 12px;
    line-height: 1.42857;
    color: rgb(85, 85, 85);
    background-color: #fff; /* rgb(255, 255, 255); */
    background-image: none;
    box-shadow: rgba(0, 0, 0, 0.0745098) 0 1px 1px inset;
    padding: 6px 9px;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(204, 204, 204);
    border-image: initial;
    border-radius: 2px;
    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.form-control[readonly], fieldset[disabled] .form-control {
    background-color: rgb(238, 238, 238);
    opacity: 1;
}

.form_file .file_load {
    display: inline-block;
    position: relative;
    width: 65px;
    height: 31px;
    cursor: pointer;
}

.form_file .file_load [type="file"] {
    display: inline-block;
    position: absolute;
    width: inherit;
    height: inherit;
    z-index: 1;
    opacity: 0;
}

.form_file .file_load label {
	display: inline-block;
    position: relative;
    z-index: 5;
    cursor: pointer;
}

.btn-default {
    display: inline-block;
    margin-bottom: 0;
    font-weight: normal;
    text-align: center;
    vertical-align: middle;
    touch-action: manipulation;
    cursor: pointer;
    background-image: none;
    white-space: nowrap;
    font-size: 12px;
    user-select: none;
    border-width: 1px;
    border-style: solid;
    background-color: rgb(255, 255, 255);
    border-color: rgb(204, 204, 204);
    border-image: initial;
    padding: 6px 9px;
    border-radius: 2px;
    color: rgb(51, 51, 51);
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
					
			<h1 style="font-family: 'Hanna', sans-serif;">신고하기</h1>		
				<div style="float:right;">
					<img src="${ contextPath }/resources/images/report.png"/>
				</div>
				<br/>
				<div class="qInput">
				<!-- <br/><br/><br/>
				<h3 style="font-family: 'Hanna', sans-serif; margin-left: 5%;">1:1문의 이렇게 사용해 주세요.</h3>	
				<br/>
				<h4 style="font-family: 'Hanna', sans-serif; margin-left: 10%;">
					* 고객님께서 궁금하신 사항을 FAQ에서 찾지 못하셨을 경우 1:1 문의를 이용해주세요.<br/>
					* 1:1 문의에 등록된 내용은 본인만 확인 할 수 있습니다.<br/>
					* 문의하신 내용에 대한 답변은 myPage에서 확인하실 수 있습니다.<br/>
					* 임시점검 시간 및 휴무 시에는 답변이 늦어질 수 있으니 양해 부탁 드립니다.
				</h4> -->
			
			<br/>	
			
				<br/>
				<br/>
				<table class="rTable" align="center">
				
					<tr>
						<td class="tableList">작성자</td>
						<td colspan="3"><input type="text" id="qName" size="10px" value=" 숭덩이" style="height:50px;
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
						<td class="tableList">신고<br/>내용</td>
						<td colspan="3">
							<textarea id="qContent" rows="10" style="width:73%; resize: none;
									border:3px solid hsl(0, 100%, 90%);"></textarea>
						</td>
					</tr>
					<tr>
						<td class="tableList">스크<br/>린샷</td>
						<td colspan="3">
							<div class="form-group form_file">
							  <input class="form-control form_point_color01" type="text" title="첨부된 파일명" readonly style="width: 40%;">
							  <span class="file_load">
						        <input type="file" id="find_file01"><label class="btn-default" for="find_file01">찾아보기</label>
							  </span>
							</div>
						</td>
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

	<br />
	<br />
	<br />
	<br />
	<br />

</body>
</html>