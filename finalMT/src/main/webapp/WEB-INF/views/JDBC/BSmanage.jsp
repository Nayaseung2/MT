<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방송국 개인 정보 관리</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.BSContainer {
	width: 100%;
	height: 1500px;
}

.icon {
	width: 850px;
	height: 80px;
	margin-left: 160px;
}

.BSframe {
	border: 1px solid black;
	margin-left: auto;
	margin-right: auto;
	border-radius: 10px;
	width: 1200px;
	height: 1200px;
}

.showBSname {
	width: 1200px;
	height: 150px;
	background: rgba(235, 104, 100, 0.5);
	border-radius: 5px 5px 0px 0px;
}

.profileImg {
	width: 80px;
	height: 80px;
	margin-left: 100px;
}

.BStitle {
	position: relative;
	left: 100px;
	bottom: 60px;
}

.BStext {
	color: white;
}

#BStexta {
	text-decoration: none;
	color: white;
}

.memberInfo {
	width: 1000px;
	height: 650px;
	border-radius: 0px 0px 5px 5px;
}

.myInfo {
	margin-left: 20px;
	margin-top: 10px;
	width: 200px;
	height: 200px;
	border: 1px solid #b3b3b3;
}

.idnickname {
	margin-left: 15px;
}

.introduction {
	border-radius: 5px;
	width: 170px;
	border: 1px solid lightgray;
	margin-left: 15px;
	height: 60px;
}

.bottomBox {
	margin-left: 20px;
	width: 200px;
	height: 200px;
	border: 1px solid #b3b3b3;
	cursor: pointer;
}

.bottomBox td {
	border-bottom: 1px dotted lightgray;
}

.bottom {
	color: black;
	text-decoration: none;
	margin-left: 15px;
}

.showRightPart {
	position: relative;
	width: 940px;
	height: 800px;
	left: 240px;
	bottom: 640px;
}

/* 관리 테이블 */
.insertBSTable{
	width:800px;
	height:480px;
}
.insertBSTable th{
	text-align:center;
	padding-bottom:45px;	
}
.check{
	background:white;
	border:1px solid black;
	float:right;
	margin-right:250px;
}
</style>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application" />
	<div class="BSContainer">
		<div class="icon">
			<a href="index.jsp"><img
				src="<%=request.getContextPath()%>/resources/images/logo.png"
				style="width: 200px;"></a>
		</div>
		<div class="BSframe">
			<div class="showBSname">
				<br>
				<!-- 회원 이미지 넣기 -->
				<div class="profileImg">
					<img alt="회원 이미지"
						src="<%=request.getContextPath()%>/resources/images/logo.png"
						style="width: 80px; height: 80px;">
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
					<span class="glyphicon glyphicon-cog" style="float: right;"><a style="text-decoration: none; color: black; cursor: pointer;"id="showManage" href="showBSmanage.JDBC"><b>관리</b></a></span><br> 
					<c:if test="${empty jdbcInfo.jdbc_introduce }">
					<input class="introduction" type="text" value="자기소개가 없습니다." readonly>
					</c:if>
					<c:if test="${!empty jdbcInfo.jdbc_introduce }">
					<input class="introduction" type="text" value="${jdbcInfo.jdbc_introduce }" readonly>
					</c:if> 
					<br><br><br> 
					<label style="margin-left: 15px;">방송국 방문 : 0명</label>
				</div>
				<br>
				<button
					style="margin-left: 20px; border: 1px solid #ff6699; width: 200px; background: white; height: 40px;"
					onclick="location.href='JDBCwrite.JDBC'">글쓰기</button>
				<br>
				<br>
				<table class="bottomBox">
					<tr>
						<td>
							<p>
								<a class="bottom">즐겨찾기 BJ</a>
							</p>
						</td>
					</tr>
					<tr>
						<td>
							<p>
								<a class="bottom">일반 게시판</a>
							</p>
							<p>
								<a class="bottom">방명록</a>
							</p>
						</td>
					</tr>
					<tr>
						<td>
							<p>
								<a class="bottom">수익관리</a>
							</p>
						</td>
					</tr>
				</table>
			</div>
			<!-- 오른쪽 부분 -->
			<div class="showRightPart">
				<h4>
					<span class="glyphicon glyphicon-option-vertical"></span>&nbsp;방송국
					기본정보
				</h4>
				<hr>
				<form action="insertJDBCstation.JDBC" method="post"  encType="multipart/form-data">
					<table class="insertBSTable" >
						<tr>
							<th>방송국 이름</th>
							<td><input type="text" size="30" name="jdbc_name" style="margin-left:10px;"><br>
								<p style="margin-left:10px;">*방송국과 방송 화면에 보이는 이름입니다.(최대 한글 6자 영문 12자)<p></td>
						</tr>
						<tr>
							<th>방송국 소개</th>
							<td><input type="text" size="50" name="jdbc_introduce" style="margin-left:10px;">
								<p style="margin-left:10px;">*방송국 웹페이지 상단에 들어가는 소개입니다.</p> 
								<p style="margin-left:10px;">*방송국을 설명할 수 있는 문구를 넣으실 수 있습니다.(최대 한글 32자 영문 64자)</p></td>
						</tr>
						<tr>
							<th>방송국 로고</th>
							<td><input type="file" size="50" name="jdbcLogo" style="margin-left:10px;">
								<ul>
									<li>최적의 로고 이미지 사이즈는 74x61px 입니다.</li>
									<li>최대 200KB크기의 그림파일 (JPG,GIF,PNG)를 올릴 수 있습니다.</li>
									<li>변경하신 로고는 최대 1분 이내에 서비스에 반영됩니다.</li>
								</ul></td>
						</tr>
						<tr>
							<th>관심 분야</th>
							<td>
								<div style="width: 400px; height: 70px; margin-left:20px;">
									<input type="checkbox" name="jdbc_interest" id="game" value="게임"> 
									<label for='game'>게임</label> &nbsp;
									<input type="checkbox" name="jdbc_interest" id="talking" value="토크"> 
									<label for='talking'>토크</label>&nbsp; 
									<input type="checkbox" name="jdbc_interest" id="eating" value="먹방"> 
									<label for='eating'>먹방</label>&nbsp; 
									<input type="checkbox" name="jdbc_interest" id="sports" value="스포츠"> 
									<label for='sports'>스포츠</label>&nbsp; 
									<input type="checkbox" name="jdbc_interest" id="music" value="음악"> 
									<label for='music'>음악</label> &nbsp;
									<input type="checkbox" name="jdbc_interest" id="stock" value="주식"> 
									<label for='stock'>주식</label> &nbsp;
									<input type="checkbox" name="jdbc_interest" id="pet" value="펫"> 
									<label for='pet'>펫</label> &nbsp;&nbsp;
									<input type="checkbox" name="jdbc_interest" id="hobby" value="취미"> 
									<label for='hobby'>취미</label> &nbsp;
									<input type="checkbox" name="jdbc_interest" id="study" value="학습"> 
									<label for='study'>학습</label> &nbsp;
								</div>
							</td>
						</tr>
					</table>
					<button type="submit" class="check"><span class="glyphicon glyphicon-ok"></span>확인</button>
					<input type="hidden" value="${loginUser.mId }" name="mid" >
				</form>
			</div>
		</div>
	</div>
</body>
</html>