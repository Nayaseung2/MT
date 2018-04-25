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
<c:if test="${!empty jdbcLogoFile }">
<img alt="회원 이미지" src="<%= request.getContextPath() %>/resources/jdbcStationFileLogo/${jdbcLogoFile.f_rename}"style="width:80px; height:80px;">
</c:if>
<c:if test="${empty jdbcLogoFile }">
<img alt="회원 이미지" src="<%= request.getContextPath() %>/resources/images/logo.png"style="width:80px; height:80px;">
</c:if>
<div class="BStitle">
<c:if test="${!empty jdbcInfo.jdbc_name }">
<label class="BStext"><a id="BStexta"href="#">${jdbcInfo.jdbc_name }</a></label><br>
</c:if>
<c:if test="${empty jdbcInfo.jdbc_name }">
<label class="BStext"><a id="BStexta"href="#">모두의TV</a></label><br>
</c:if>
<label class="BStext">${loginUser.nickName}</label><br>
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
<span class="glyphicon glyphicon-cog" style="float:right;"><a style="text-decoration:none; color:black;" id="showManage" href="showBSmanage.JDBC"><b>관리</b></a></span><br>
<c:if test="${empty jdbcInfo.jdbc_introduce }">
<input class="introduction" type="text" value="자기소개가 없습니다." readonly>
</c:if>
<c:if test="${!empty jdbcInfo.jdbc_introduce }">
<input class="introduction" type="text" value="${jdbcInfo.jdbc_introduce }" readonly>
</c:if>
<br><br> <br>  
<label style="margin-left:15px;">방송국 방문 : 0명</label>
</div>
<br>
<button style="margin-left:20px;border:1px solid #ff6699;width:200px; background:white;height:40px;" onclick="location.href='JDBCwrite.JDBC'">글쓰기</button><br><br>
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
<!-- 즐겨찾기 보여주기 부분 -->
<div class="showRightPart">
<div class="favoriteBJ">
<label style="font-size:20px; align:center;">방송내용</label>
<br><br><br>
<form action="insertBSCotent.lb" method="post"  encType="multipart/form-data">

	<table class="insertBSTable" >
		<tr>
			<th>방송카테고리</th>
			<td>&nbsp;
				<select name='cate' style='height:25px'> 
					<option value='게임'>게임</option>
					<option value='토크/캠방'>토크/캠방</option>
					<option value='먹방'>먹방</option>
					<option value='스포츠'>스포츠</option>
					<option value='음악'>음악</option>
					<option value='기타'>기타</option>
				</select>
				<p style="margin-left:10px;"> </p>
			</td>
			
		</tr>
		
		<tr>
			<th>방송제목</th>
			<td><input type="text" size="50" name="bsTitle" style="margin-left:10px;"><br>
			<p style="margin-left:10px;">*방송제목을 작성해주세요</p>
		</tr>
		<tr>
			<th>방송내용</th>
			<td><input type="text" size="50" name="bsContent" style="margin-left:10px;">
			<p style="margin-left:10px;">*방송을 소개할 수 있는 내용을 작성해주세요</p> 
		</tr>
		<tr>
			<th>방송메인이미지</th>
			<td><input type="file" size="50" name="bsImg" style="margin-left:10px;">
				<ul>
					<li>최적의 로고 이미지 사이즈는 74x61px 입니다.</li>
					<li>최대 200KB크기의 그림파일 (JPG,GIF,PNG)를 올릴 수 있습니다.</li>
					<li>변경하신 로고는 최대 1분 이내에 서비스에 반영됩니다.</li>
				</ul>
			</td>
		</tr>
	</table>
	<button type="submit" class="check"><span class="glyphicon glyphicon-ok"></span>확인</button>
	<input type="hidden" value="${loginUser.mId}" name="mid" >
	</form>
</div>
</div>
</div>
</div>
</body>
</html>