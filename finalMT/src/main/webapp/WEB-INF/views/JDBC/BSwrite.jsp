<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
	.BSContainer{ width:100%;height:1500px;}
	.icon{width:850px;height:80px;margin-left:160px;}
	.BSframe{border:1px solid black;margin-left:auto;margin-right:auto;
		border-radius:10px;width:1200px;height:1200px;}
	.showBSname{width:1200px;height:150px;background: rgba(235, 104, 100, 0.5);border-radius:5px 5px 0px 0px;}	
	.profileImg{width:100px;height:80px;margin-left:70px; padding-top: auto; padding-bottom: auto;}
	.BStitle{position:relative;left:100px;bottom:60px;width: 250px; padding-left:40%;}
	.BStext{ padding-left: 10px; }
	#BStexta{text-decoration:none;color:white;}
	.memberInfo{width:1000px;height:650px;border-radius:0px 0px 5px 5px;}
	.myInfo{margin-left:20px;margin-top:10px;width:200px;height:200px;border:1px solid #b3b3b3;}
	.idnickname{margin-left:15px; }
	.introduction{border-radius:5px; width:170px; border:1px solid lightgray;margin-left:15px;height:60px;}
	.bottomBox{margin-left:20px;
		width:200px;
		height:200px;
		border:1px solid #b3b3b3;
		cursor:pointer;}
	.bottomBox td{border-bottom:1px dotted lightgray;}
	.bottom{color:black; text-decoration:none; margin-left:15px;}
	.showRightPart{position:relative; width:940px; height:800px; 
	left:240px;bottom:640px;}
	
	/* 글쓰기 테이블 */
	.writeTable{
		margin-left:30px;
		width:750px;
	}
	.writeTable th{
		width:100px;
		height:30px;
		text-align:center;
	}
	.writeTable tr{
		height:35px;
	}
	.writeTable td {
		height: 40px;
	}
	
	.equal{
		width:20px;
	}
	/* 이미지 올리기 */
	.inputImg{
		margin-left:30px;
		border:1px solid lightgray;
	}/*  */
	.okay{
		width:100px;
		height:30px;
		background:rgba(235, 104, 100, 0.5);
		border:none;
		color:white;
	}
	
	.sideBtn {
		 margin-left: 20px;
		 border: 2px solid rgba(235, 104, 100, 0.5);
		 width: 200px; 
		 background: white;
		 height: 40px;"
	}
	
	.showRightPart {
		background-color: #fff9f9;
	}
	
	.fileRegiBtn {
		padding-left: 10%;
	}
	
	.fileRegiBtn label {
		height:32px;
		width: 20%;
		text-align: center;
		display: inline-block; 
		padding: .5em .75em; 
		color: #ffffff; 
		background-color: rgba(235, 104, 100, 0.5); 
		cursor: pointer; 
		border:none;
	}
	
	.fileRegiBtn input[type="file"] {
	
		display: inline-block;
		width: 1px; 
		height: 1px; 
		padding: 0; 
		margin: -1px; 
		overflow: hidden; 
		clip:rect(0,0,0,0); 
		border: 0;
	}
	
	.hrLine {
		width:400px;
		padding-right: 50%;
		border: 1px solid rgba(235, 104, 100, 0.5);
	}
	
</style>
<title>글쓰기</title>
<!-- ckeditor -->
<script src="<%= request.getContextPath()%>/resources/ckeditor/ckeditor.js">
</script>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>
<div class="BSContainer">
<jsp:include page="../common/menubar.jsp" /> 
<br/>
<br/>
<div class="BSframe">
<div class="showBSname">
<br>
<!-- 회원 이미지 넣기 -->
<div class="profileImg">
<c:if test="${!empty jdbcLogoFile }">
<img alt="회원 이미지" src="<%= request.getContextPath() %>/resources/jdbcStationFileLogo/${jdbcLogoFile.f_rename}"style="width:100px; height:80px;">
</c:if>
<c:if test="${empty jdbcLogoFile }">
<img alt="회원 이미지" src="${ contextPath }/resources/images/logo_JDBC.png"style="width:100px; height:80px;">
</c:if>
<div class="BStitle">
<c:if test="${!empty jdbcInfo.jdbc_name }">
<label class="BStext" style="font-size: 25px;"><a id="BStexta"href="${ contextPath }/myBroadcastStation.JDBC">${jdbcInfo.jdbc_name }</a></label><br>
</c:if>
<c:if test="${empty jdbcInfo.jdbc_name }">
<label class="BStext" style="font-size: 25px;"><a id="BStexta"href="${ contextPath }/myBroadcastStation.JDBC">모두의 TV</a></label><br>
</c:if>
<label class="BStext" style="font-size: 16px; color: white;">${loginUser.nickName}님의 방송국입니다!</label><br>
</div>
</div>
</div>
<!-- 회원정보관리  -->
<div class="memberInfo">
<!-- 좌측 회원 정보,자기소개등 보기 -->
<div class="myInfo">
<br>
<label class="idnickname"><b>${loginUser.mId }</b></label><br>
<span class="idnickname">${loginUser.nickName }</span>
<span class="glyphicon glyphicon-cog" style="float:right; padding-right:5%;"><a style="text-decoration:none; color:black;" id="showManage" href="showBSmanage.JDBC"><b>관리</b></a></span><br>
<br/>
<c:if test="${empty jdbcInfo.jdbc_introduce }">
<input class="introduction" type="text" value="자기소개가 없습니다." style="padding-left: 3%;" readonly>
</c:if>
<c:if test="${!empty jdbcInfo.jdbc_introduce }">
<input class="introduction" type="text" value="${jdbcInfo.jdbc_introduce }" readonly>
</c:if>
<br><br>
<label style="margin-left:15px;">방송국 방문 : 0명</label>
</div>
<br>
<button class="sideBtn" onclick="location.href='JDBCwrite.JDBC'">글쓰기</button><br><br>
<button class="sideBtn" onclick="location.href='bangsonggo.JDBC'">방송하러가기</button>
<br><br>
<table class="bottomBox">
	<tr>
		<td>
			<p><a class="bottom">구독중인 BJ</a></p>
		</td>
	</tr>
	<tr> 	
		<td>
			<p><a class="bottom" href="BSmyBoard.board?mId=${ loginUser.mId }">내 게시판</a></p>
			<p><a class="bottom" href="showGuestBookList.JDBC">방명록</a></p>
		</td>
	</tr>
	<tr>
		<td>
			<p><a class="bottom">수익관리</a></p>
		</td>
	</tr>
</table>
</div>
<!-- 오른쪽 부분 -->
<div class="showRightPart">
<br/><br/>
<div align="center">
	<label style="font-size:20px;">글쓰기</label>
</div>
<br/>
<hr class="hrLine"/>
<br/>
<form method="post" action="insertBoard.board" encType="multipart/form-data">
	<table class="writeTable" >
		<tr>
			<th>제목</th>
			<td><input type="text" name="b_title" id="b_title" size="90" style="height: 33px; border:1px solid lightgray;"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3" style="height:330px;">
				<textarea name="b_content" id="b_content" class="ckeditor" rows="30" cols="50">
				</textarea>
			</td>
		</tr>
	</table>
	
	<!-- <div style="padding-left: 100px;">
		<input type="file" class="inputImg" name="Boardfile" id="Boardfile">
	</div> -->
	
	<div class="fileRegiBtn">
		<input id="fileName" class="form-control"  value="오른쪽 버튼을 눌러주세요" disabled="disabled" 
					style="width:53%; display: inline; text-align:center; margin-left: 5%;">
		<input type="file" size="52" name="Boardfile" id="bsImg" style="margin-left:10px;">
		<label for="bsImg">파일등록하기</label>
	</div>
	<br>
	<br/>
	<div align="center">
		<button type="submit"class="okay">확인</button>
		<input type="hidden" name="bwriter" value="${loginUser.mId }"/>
	</div>
</form>
</div>

<script>

/* 스크린샷 첨부 */

	function readURL(input) {
	
	    if (input.files && input.files[0]) {
	    	
			if(!input.files[0].type.match("image.*")){
				
				alert("파일은 이미지 확장자만 가능합니다.");
				return;
				
			} else {
	
		        var reader = new FileReader();
		        reader.onload = function (e) {
	
	                $('#fileName').val(input.files[0].name);    //파일선택 form으로 파일명이 들어온다
	            }
		        
		        reader.readAsDataURL(input.files[0]);
			}
	    }
	}
	
	$("#bsImg").change(function(){
	
	    readURL(this);
	});


</script>



</div>
</div>

</body>
</html>