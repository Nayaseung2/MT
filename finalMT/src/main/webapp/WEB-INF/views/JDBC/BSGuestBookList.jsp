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
		border:1px solid #b3b3b3;}
	.bottomBox td{border-bottom:1px dotted lightgray;}
	.bottom{color:black; text-decoration:none; margin-left:15px; cursor:pointer;}
	.showRightPart{position:relative; width:940px; height:800px; 
	left:240px;bottom:620px;}
	.favoriteBJ{width:920px;height:170px; margin-left:10px;}
	/* 방명록 리스트 */
	.showGuestBookList{width:860px; height:800px;
	margin-left:auto; margin-right:auto; 
	}
	
	.gListTable {
		margin-top: 3%;
		margin-left: 100px;
		width: 80%;
		font-size: 16px;
		
	
	
	}
	
	.gListTable th {
		background-color: rgba(255, 99, 71, 0.1);
		width: 400px;
		height: 40px;
		text-align: center;
		border-bottom: 2px solid lightgray;
		
	}
	
	.gListTable td {
		background-color: hsla(0, 0%, 94%, 0.3);
		width: 400px;
		height: 200px;
		text-align: center;
	
	}
	
	#gHome {
		border: 0px solid white;
		background-color: rgba(255, 99, 71, 0);
	}
	
	.sideBtn {
		 margin-left: 20px;
		 border: 2px solid rgba(235, 104, 100, 0.5);
		 width: 200px; 
		 background: white;
		 height: 40px;"
	}
	
</style>
<title>방송국 방명록 목록</title>
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
<!-- 즐겨찾기 보여주기 부분 -->
<div class="showRightPart">
<div class="showGuestBookList">
<br/>
<label style="font-size:16px; width:930px; height: 40px; border-bottom:2px solid rgba(235, 104, 100, 0.5);">&nbsp;&nbsp;<span class="glyphicon glyphicon-list-alt"></span>&nbsp;방명록</label>
<div class="GuestBookListTableDiv">
<table class="gListTable">
	
	<tr>
		<th>${ loginUser.mId }&nbsp;&nbsp;&nbsp;&nbsp;
			<button id="gHome"><img src="${ contextPath }/resources/images/house.png" width="25px"/></button>
		</th>
		<th>(${ loginUser.joinDate })</th>
	</tr>
	<tr>
		<td colspan="2">방명록 내용 / 방명록 내용 / 방명록 내용 / 방명록 내용 / 방명록 내용 / 방명록 내용</td>
	</tr>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</table>
</div>
</div>
</div>
</div>
</div>
</body>
</html>