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
		border:1px solid #b3b3b3;}
	.bottomBox td{border-bottom:1px dotted lightgray;}
	.bottom{color:black; text-decoration:none; margin-left:15px; cursor:pointer;}
	.showRightPart{position:relative; width:940px; height:500px; 
	left:240px;bottom:620px;}
	.favoriteBJ{width:920px;height:170px; margin-left:10px;}
</style>
<title>나의 방송국</title>
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
<img alt="회원 이미지" src="<%= request.getContextPath() %>/resources/images/img.jpg"style="width:80px; height:80px;">
<div class="BStitle">
<label class="BStext"><a id="BStexta"href="#">모두의 TV</a></label><br>
<label class="BStext">모두의 TV</label><br>
</div>
</div>
</div>
<!-- 회원정보관리  -->
<div class="memberInfo">
<!-- 좌측 회원 정보,자기소개등 보기 -->
<div class="myInfo">
<br>
<label class="idnickname"><b>아이디</b></label><br>
<span class="idnickname">닉네임</span>
<span class="glyphicon glyphicon-cog" style="float:right;"><a style="text-decoration:none; color:black;" id="showManage" href="BSmanage.me"><b>관리</b></a></span><br>
<input class="introduction" type="text" value="자기소개가 없습니다." readonly>
<br><br> <br>  
<label style="margin-left:15px;">방송국 방문 : 0명</label>
</div>
<br>
<button style="margin-left:20px;border:1px solid #ff6699;width:200px; background:white;height:40px;" onclick="location.href='BSwrite.me'">글쓰기</button>
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
			<p><a class="bottom">방명록</a></p>
		</td>
	</tr>
	<tr>
		<td>
			<p><a class="bottom">수익관리</a></p>
		</td>
	</tr>
</table>
</div>
<!-- 즐겨찾기 보여주기 부분 -->
<div class="showRightPart">
<div class="favoriteBJ">
<label style="font-size:20px;">즐겨찾기 BJ</label>
<p style="float:right;"><a style="text-decoration:none;color:black;">더보기</a></p>
<br><br><br>
<label style="margin-left:200px;">즐겨찾기가 없습니다.</label>
</div>
</div>
</div>
</div>
</body>
</html>