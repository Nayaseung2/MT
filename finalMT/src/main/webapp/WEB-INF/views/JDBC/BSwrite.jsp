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
	.profileImg{width:80px;height:80px;margin-left:100px;}
	.BStitle{position:relative;left:100px;bottom:60px;}
	.BStext{color:white;}
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
		float:right;
		margin-right:500px;
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
<div class="icon">
<a href="index.jsp"><img src="<%=request.getContextPath() %>/resources/images/logo.png" style="width:200px;"></a>
</div>
<div class="BSframe">
<div class="showBSname">
<br>
<!-- 회원 이미지 넣기 -->
<div class="profileImg">
<img alt="회원 이미지" src="<%= request.getContextPath() %>/resources/images/logo.png"style="width:80px; height:80px;">
<div class="BStitle">
<c:if test="${!empty jdbcInfo.jdbc_name }">
<label class="BStext"><a id="BStexta"href="#">${jdbcInfo.jdbc_name }</a></label><br>
</c:if>
<c:if test="${empty jdbcInfo.jdbc_name }">
<label class="BStext"><a id="BStexta"href="#">모두의TV</a></label><br>
</c:if>
<label class="BStext">${loginUser.nickName }</label><br>
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
<span class="glyphicon glyphicon-cog" style="float:right;"><a style="text-decoration:none; color:black; cursor:pointer;" id="showManage" href="showBSmanage.JDBC"><b>관리</b></a></span><br>
<c:if test="${!empty jdbcInfo.jdbc_name }">
<input class="introduction" type="text" value="${jdbcInfo.jdbc_introduce}" readonly>
</c:if>
<c:if test="${empty jdbcInfo.jdbc_name }">
<input class="introduction" type="text" value="자기소개가 없습니다." readonly>
</c:if>
<br><br> <br>  
<label style="margin-left:15px;">방송국 방문 : 0명</label>
</div>
<br>
<button style="margin-left:20px;border:1px solid #ff6699;width:200px; background:white;height:40px;" onclick="location.href='JDBCwrite.JDBC'">글쓰기</button>
<button style="margin-left:20px;border:1px solid #ff6699;width:200px; background:white;height:40px;" onclick="location.href='bangsonggo.JDBC'">방송하러가기</button>
<br><br>
<table class="bottomBox">
	<tr>
		<td>
			<p><a class="bottom">즐겨찾기 BJ</a></p>
		</td>
	</tr>
	<tr>
		<td>
			<p><a class="bottom">일반 게시판</a></p>
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
<h4 style="margin-left:30px;">글쓰기</h4>
<form method="post" action="insertBoard.board" encType="multipart/form-data">
	<table class="writeTable" >
		<tr>
			<th><span class="glyphicon glyphicon-asterisk"></span>게시판</th>
			<td class="equal"><b>:</b></td>
			<td>
				&nbsp;
				<input type="radio" id="board" name="b_type" value="normalBoard">
				<label for="board">게시판 공지</label>
				<input type="radio" id="BSboard" name="b_type" value="JDBCBoard">
				<label for="BSboard">방송국 게시판 공지</label>
			</td>
		</tr>
		<tr>
			<th><span class="glyphicon glyphicon-asterisk"></span>제목</th>
			<td class="equal"><b>:</b></td>
			<td><input type="text" name="b_title" size="70" style="border:1px solid lightgray;"></td>
		</tr>
		<tr>
			<th><span class="glyphicon glyphicon-asterisk"></span>내용</th>
			<td class="equal"><b>:</b></td>
			<td></td>
		</tr>
		<tr>
			<td colspan="3" style="height:330px;">
				<textarea name="b_content" class="ckeditor" rows="30" cols="50">
				</textarea>
			</td>
		</tr>
	</table>
	<input type="file" class="inputImg" name="Boardfile">
	<br>
		<button type="submit"class="okay">확인</button>
		<input type="hidden" name="bwriter" value="${loginUser.mId }"/>
</form>
</div>
</div>
</div>

</body>
</html>