<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="/mt/resources/css/left/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/mt/resources/css/left/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/mt/resources/css/left/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="/mt/resources/css/left/morris.css" rel="stylesheet">
</head>
<body>
	<div class="navbar-default sidebar" role="navigation" style="margin-top: 0px;">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li class="sidebar-search">
					<div class="input-group custom-search-form">
						<input type="text" class="form-control" placeholder="Search...">
						<span class="input-group-btn">
							<button class="btn btn-default" type="button">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div> <!-- /input-group -->
				</li>
					<c:if test="${!empty loginUser}">
						<li><a href="${contextPath }/good.cg?mId=${loginUser.mId}"><i class="fa fa-star"></i>&nbsp;&nbsp;&nbsp;&nbsp;즐겨찾기</a></li>
					</c:if>
					<c:if test="${empty loginUser}">
						<li><a href="${contextPath }/showLoginPage.me"><i class="fa fa-star"></i>&nbsp;&nbsp;&nbsp;&nbsp;즐겨찾기</a></li>
					</c:if>
				<li><a href="${contextPath }/bestBJ.cg"><i class="fa fa-thumbs-o-up"></i>&nbsp;&nbsp;&nbsp;&nbsp;베스트 BJ</a></li>
				<li><a href="${contextPath }/rankBJ.cg"><i class="fa fa-tags"></i>&nbsp;&nbsp;&nbsp;&nbsp;별별랭킹</a></li>
				<li><a href="${contextPath }/game.cg"><i class="fa fa-gamepad"></i>&nbsp;&nbsp;&nbsp;&nbsp;게임</a></li>
				<li><a href="${contextPath }/talk.cg"><i class="fa fa-video-camera"></i>&nbsp;&nbsp;&nbsp;&nbsp;토크/캠방</a></li>
				<li><a href="${contextPath }/eat.cg"><i class="fa fa-cutlery"></i>&nbsp;&nbsp;&nbsp;&nbsp;먹방</a></li>
				<li><a href="${contextPath }/sport.cg"><i class="fa fa-dribbble"></i>&nbsp;&nbsp;&nbsp;&nbsp;스포츠</a></li>
				<li><a href="${contextPath }/music.cg"><i class="fa fa-headphones"></i>&nbsp;&nbsp;&nbsp;&nbsp;음악</a></li>
				<li><a href="${contextPath }/etc.cg"><i class="fa fa-sitemap"></i>&nbsp;&nbsp;&nbsp;&nbsp;기타</a></li>
				


			</ul>
		</div>
	</div>
</body>

</html>