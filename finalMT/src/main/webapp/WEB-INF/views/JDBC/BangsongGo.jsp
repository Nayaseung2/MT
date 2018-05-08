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
	.showRightPart{position:relative; width:940px; height:500px; 
	left:240px;bottom:620px;}
	.favoriteBJ{width:920px;height:170px; margin-left:10px;}
	
	.favoriteBJ, form {
		background-color: #fff9f9;
	}
	
	.insertBSTable {
		border-top: 3px solid rgba(235, 104, 100, 0.5);
		border-bottom: 3px solid rgba(235, 104, 100, 0.5);
	}
	
	.insertBSTable th {
		width: 150px;
		text-align: center;
		border-right: 1px solid rgba(235, 104, 100, 0.5);
	}
	
	.insertBSTable td {
		padding-left: 5%;
	}
	
	.insertBSTable tr {
		height: 65px;
	}
	
	.imgUl li {
		padding-left: 5%;
	} 
	
	.check {
		width:160px;
		height:30px;
		background:rgba(235, 104, 100, 0.5);
		border:none;
		color:white;
	}
	
	.fileRegiBtn label {
		height:30px;
		width: 25%;
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
	
	.form-control {
		width: 400px;
	
	}
	
	.sideBtn {
		 margin-left: 20px;
		 border: 2px solid rgba(235, 104, 100, 0.5);
		 width: 200px; 
		 background: white;
		 height: 40px;"
	}
	

	
	
</style>
<title>나의 방송국</title>
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
<label class="BStext" style="font-size: 25px;"><a id="BStexta"href="${ contextPath }/bjJDBC.JDBC?mid=${jdbcInfo.mid}">${jdbcInfo.jdbc_name }</a></label><br>
</c:if>
<c:if test="${empty jdbcInfo.jdbc_name }">
<label class="BStext" style="font-size: 25px;"><a id="BStexta"href="${ contextPath }/myBroadcastStation.JDBC">모두의 TV</a></label><br>
</c:if>
<label class="BStext" style="font-size: 16px; color: white;">${jdbcInfo.mid}님의 방송국입니다!</label><br>
</div>
</div>
</div>
<!-- 회원정보관리  -->
<div class="memberInfo">
<!-- 좌측 회원 정보,자기소개등 보기 -->
<div class="myInfo">
<br>
<label class="idnickname"><b>${jdbcInfo.mid }</b></label><br>
<span class="idnickname">${jdbcInfo.jdbc_name }</span>
<c:if test="${ loginUser.mId eq jdbcInfo.mid }">
	<span class="glyphicon glyphicon-cog" style="float:right; padding-right:5%;">
		<a style="text-decoration:none; color:black;" id="showManage" href="showBSmanage.JDBC"><b>관리</b></a>
	</span><br>
</c:if>
<c:if test="${ loginUser.mId ne jdbcInfo.mid }">
	<br/>
</c:if>
<br/>
<c:if test="${empty jdbcInfo.jdbc_introduce }">
<input class="introduction" type="text" value="자기소개가 없습니다." style="padding-left: 3%;" readonly>
</c:if>
<c:if test="${!empty jdbcInfo.jdbc_introduce }">
<input class="introduction" type="text" value="${jdbcInfo.jdbc_introduce }" readonly>
</c:if>
<br><br>
</div>
<c:if test="${ loginUser.mId eq jdbcInfo.mid }">
<br>
	<button class="sideBtn" onclick="location.href='JDBCwrite.JDBC'">글쓰기</button><br><br>
	<button class="sideBtn" onclick="location.href='bangsonggo.JDBC'">방송하러가기</button>
<br>
</c:if>
<br/>
<table class="bottomBox">
	<tr>
		<td>
			<p><a class="bottom" href="${ contextPath }/bjJDBC.JDBC?mid=${jdbcInfo.mid}">구독중인 BJ</a></p>
		</td>
	</tr>
	<tr> 	
		<td>
			<p><a class="bottom" href="BSmyBoard.board?mId=${ jdbcInfo.mid }">게시판</a></p>
			<p><a class="bottom" href="guestBookList.board?mId=${ jdbcInfo.mid }">방명록</a></p>
		</td>
	</tr>
	<c:if test="${ loginUser.mId eq jdbcInfo.mid }">
		<tr>
			<td>
				<p><a class="bottom" href="bjPayMain.bjp?mcode=${loginUser.mcode}">수익관리</a></p>
			</td>
		</tr>
	</c:if>
</table>
</div>
<!-- 즐겨찾기 보여주기 부분 -->
<div class="showRightPart">
<div class="favoriteBJ" align="center">
<br/><br/>
<label style="font-size:20px;">방송하기</label>
<br><br><br>
<form action="insertBSCotent.lb" method="post"  encType="multipart/form-data">

	<table class="insertBSTable" >
		<tr>
			<th>카테고리</th>
			<td>&nbsp;&nbsp;
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
			<th>제 목</th>
			<td colspan="6"><input type="text" size="50" id="bsTitle" name="bsTitle" style="margin-left:10px;" class="form-control">
			<p style="margin-left:10px;">*방송제목을 작성해주세요</p>
		</tr>
		<tr>
			<th>내 용</th>
			<td colspan="6"><input type="text" size="50" id="bsContent" name="bsContent" style="margin-left:10px;" class="form-control">
			<p style="margin-left:10px;">*방송을 소개할 수 있는 내용을 작성해주세요</p> 
		</tr>
		<tr>
			<th>메인이미지</th>
			<td colspan="6">
				<!-- <input type="file" size="50" name="bsImg" id="bsImg" style="margin-left:10px;">
				<label for="bsImg">파일 선택하기</label> -->
				<br/>
				<div class="fileRegiBtn">
					<input id="fileName" class="form-control" value="오른쪽 버튼을 눌러주세요" disabled="disabled" 
								style="width:60%; display: inline; text-align:center; margin-left: 5%;">
					<input type="file" size="50" name="bsImg" id="bsImg" style="margin-left:10px;">
					<label for="bsImg">파일등록하기</label>
				</div>
				<br/>
				<ul class="imgUl">
					<li>최적의 로고 이미지 사이즈는 74x61px 입니다.</li>
					<li>최대 200KB 크기의 그림파일 (JPG, GIF, PNG)를 올릴 수 있습니다.</li>
					<li>변경하신 로고는 최대 1분 이내에 서비스에 반영됩니다.</li>
				</ul>
				<br/>
			</td>
		</tr>
		<tr>
			<th>미리보기</th>
			<td colspan="6">
				<div class="selectCover" style="padding-left: 0;">
				 	<img id="cover" src="${ contextPath }/resources/images/help/no_img.png" style="width: 500px; height: 282px;"/>
				</div>
				<br/>
			</td>
		</tr>
	</table>
	<br/>
	<br/>
	<script>
	
		/* 스크린샷 첨부 */
		
		function readURL(input) {
	
	        if (input.files && input.files[0]) {
	        	
				if(!input.files[0].type.match("image.*")){
					
					alert("방송 로고는 이미지 확장자만 가능합니다.");
					return;
					
				} else {
	
			        var reader = new FileReader();
			        reader.onload = function (e) {
	
		                $('#cover').attr('src', e.target.result);        //cover src로 붙여지고
		                $('#fileName').val(input.files[0].name);    //파일선택 form으로 파일명이 들어온다
		            }
			        
			        reader.readAsDataURL(input.files[0]);
				}
	        } else {
	        	
	        	alert("방송 썸네일 사진을 등록해주세요.");
	        	location.reload();
	        }
	    }
	
		$("#bsImg").change(function(){
	
	        readURL(this);
	    });

		</script>
	
	<button type="submit" class="check"><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;&nbsp;확 인</button>
	<input type="hidden" value="${loginUser.mId}" name="mid" >
	<br/>
	<br/>
	<br/>
	</form>
</div>

	<script>
		
		$(function(){
			
			$(".check").click(function(){
				
				var bsTitle = $("#bsTitle").val;
				var bsContent = $("#bsContent").val();
				
				if(bsTitle == "" || bsContent == ""){
					alert("방송 제목 또는 내용을 입력해주세요.");
					location.reload();
				}
			});
		});	
	
	</script>
	
</div>
</div>
</div>
</body>
</html>