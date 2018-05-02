<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>  
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/mt/resources/css/bootstrap.min.css">

    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="/mt/resources/css/font-awesome.min.css">

    <!-- Slider CSS -->
    <link rel="stylesheet" href="/mt/resources/css/pgwslider.min.css">

    <!-- Owl Carousel CSS -->
    <link rel="stylesheet" href="/mt/resources/css/owl.carousel.css">

    <!-- pgwSlideshow CSS -->
    <link rel="stylesheet" href="/mt/resources/css/pgwslideshow.min.css">

    <!-- Megamenu CSS -->
    <link rel="stylesheet" href="/mt/resources/css/megamenu.css">

    <!-- Main CSS -->
    <link rel="stylesheet" href="/mt/resources/css/style.css">

    <!-- Responsive CSS -->
    <link rel="stylesheet" href="/mt/resources/css/responsive.css">

    <!-- Demo Panel Style -->
    <link rel="stylesheet" href="/mt/resources/css/demo-panels.css">
    
    
</head>
<body>

<header>
<!-- value 값 변경
0 = 로그인 하지 않았을떄
1 = 회원로그인
2 = 관리자 로그인 -->
<c:set var="test" value="0"/>
        <!-- Navigation area starts -->
        <div class="main-menu">
            <!-- Start Navigation -->
            <nav class="header-section pin-style">
                <div class="container">
                    <div class="mod-menu">
                        <div class="row">
                            <div class="col-sm-3">
                                <a href="index.jsp" title="logo" class="logo"><img src="${contextPath }/resources/images/logo.png" alt="logo" style="width: 184px; height: 50;"></a>
                            </div>
                            
                            <div class="col-sm-9 nopadding">
                            
                                <div class="main-nav rightnav">
                                
                                    <ul class="nav navbar-nav top-nav">
                                        <li class="visible-xs menu-icon">
                                            <a href="#" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#menu" aria-expanded="false"><i class="fa fa-bars"></i></a>
                                        </li>
                                    </ul>
                                    
                                    
                                    <div id="menu" class="header-menu">
                                        <ul class="nav navbar-nav">
                                            <li><a href="index.jsp">Home</a><span class="arrow"></span></li>
                                            <li><a href="${ contextPath }/helpmain.hp">고객센터</a> <span class="arrow"></span></li>
                                            <%-- <c:if test="${test eq 0}"> --%>
                                            <c:if test="${empty loginUser }">
                                            <li><a href="${contextPath }/showLoginPage.me">로그인</a> <span class="arrow"></span></li>
                                            <li><a href="${contextPath }/showJoinPage1.me">회원가입</a> <span class="arrow"></span></li>
                                            </c:if>

			                                 <%-- <c:if test="${test eq 1}"> --%>
			                                 <c:choose>
			                                 	<c:when test="${!empty loginUser && loginUser.mId eq 'admin'}">
			                                 		<li><a href="adminMain.ad">관리자페이지</a> <span class="arrow"></span></li>
				                                    <li><a href="#">신고내역</a> <span class="arrow"></span></li>
				                                    <li><a href="#">문의내역</a> <span class="arrow"></span></li>
				                                    <li><a href="logout.me">Logout</a> <span class="arrow"></span></li>
			                                 	</c:when>
			                                 	<c:when test="${!empty loginUser }">
				                                 	<li><a href="${contextPath }/payform.pay?mcode=${loginUser.mcode}">피치결제</a> <span class="arrow"></span></li>
				                                   	<li><a href="bringJDBC.JDBC?mId=${loginUser.mId }" target="blank">방송국가기</a> <span class="arrow"></span></li>
				                                    <li><a href="bjPayMain.bjp?mcode=${loginUser.mcode}">내수익관리</a> <span class="arrow"></span></li>
				                                    <li><a href="${ contextPath }/myPageEntry.mp">myPage</a> <span class="arrow"></span></li>
				                                    <li><a href="logout.me">Logout</a> <span class="arrow"></span></li>
			                                 	</c:when>
			                                 </c:choose>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </nav>
            <!-- end navigation -->
        </div>
        <!-- Navigation area ends -->
    </header>

</body>
</html>