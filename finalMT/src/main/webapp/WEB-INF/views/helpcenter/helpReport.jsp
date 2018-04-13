<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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



.fileRegiBtn label {

	width: 12%;
	display: inline-block; 
	padding: .5em .75em; 
	color: #ffffff; 
	font-size: 14px; 
	line-height: normal; 
	vertical-align: middle; 
	background-color: #FC7D01; 
	cursor: pointer; 
	border: 1px solid #ebebeb; 
	border-bottom-color: #e2e2e2; 
	border-radius: .25em;
}

.fileRegiBtn input[type="file"]{

	display: inline-block;
	width: 1px; 
	height: 1px; 
	padding: 0; 
	margin: -1px; 
	overflow: hidden; 
	clip:rect(0,0,0,0); 
	border: 0;
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
					<img src="${ contextPath }/resources/images/help/report.png"/>
				</div>
				<br/>
				<div class="qInput">
					<br/>	
					<br/>
					<br/>
					<form action="helpreportpost.hp" method="post">
						<table class="rTable" align="center">
							<tr>
								<td class="tableList">작성자</td>
								<td colspan="3"><input type="text" id="mId" name="mId" size="18px" value="${ loginUser.mId }" style="height:50px;
										border:3px solid hsl(0, 100%, 90%);" readonly/></td>
							</tr>
							<tr>
								<td><div style="height: 30px;"></div></td>
							</tr>
							<tr>
								<td class="tableList">제목</td>
								<td colspan="3"><input type="text" id="rTitle" name="rTitle" size="52px" style="height:50px;
										border:3px solid hsl(0, 100%, 90%);"/></td>
							</tr>	
							<tr>
								<td><div style="height: 30px;"></div></td>
							</tr>
							<tr>
								<td class="tableList">신고<br/>내용</td>
								<td colspan="3">
									<textarea id="rContent" name="rContent" rows="10" style="width:73%; resize: none;
											border:3px solid hsl(0, 100%, 90%);"></textarea>
								</td>
							</tr>
							<tr>
								<td class="tableList">스크<br/>린샷</td>
								<td colspan="3">
									<div class="fileRegiBtn">
										<input id="fileName" class="form-control" value="오른쪽의 버튼을 눌러 첨부파일을 등록하세요" disabled="disabled" 
													style="width:60%; display: inline; text-align:center;">
										<input type="file" id="myFileUp">
										<label for="myFileUp">파일등록하기</label>
									</div>
								</td>
							</tr>
							<tr>
								<td class="tableList">미리<br/>보기</td>
								<td colspan="3">
									<div class="selectCover" style="padding-left: 0;">
									 	<img id="cover" src="${ contextPath }/resources/images/help/no_img.png" style="width: 660px; height: 371px;"/>
									</div>
								</td>
							</tr>
						</table>
						<script>
							
							function readURL(input) {

						        if (input.files && input.files[0]) {
						        	
									if(!input.files[0].type.match("image.*")){
										
										alert("스크린샷 첨부는 이미지 확장자만 가능합니다.");
										return;
										
									} else {

								        var reader = new FileReader();
								        reader.onload = function (e) {
		
							                $('#cover').attr('src', e.target.result);        //cover src로 붙여지고
							                $('#fileName').val(input.files[0].name);    //파일선택 form으로 파일명이 들어온다
							            }
								        
								        reader.readAsDataURL(input.files[0]);
									}
						        }
						    }
	
							$("#myFileUp").change(function(){

						        readURL(this);
						    });
						
						</script>
						<br/>
						<br/>
						<div class="qBtn">
							<button type="submit" class="btn btn-danger" style="font-size:20px;" onclick="submit();">등록하기</button>&nbsp;&nbsp;
							<button type="reset" class="btn btn-danger" style="font-size:20px;">취소하기</button>	
						</div>
					</form>
					<br/>
				<br/>	
			</div>		
					
			<script>
			
				function submit(){
					
					alert("[ 모두의 TV 알림 ] \n사실에 의거하지않은 신고자는 불이익을 받을 수 있습니다.");
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
	<jsp:include page="../common/footer.jsp"/>
	

</body>
</html>