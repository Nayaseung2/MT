<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="${contextPath }/resources/css/left/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="${contextPath }/resources/css/left/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${contextPath }/resources/css/left/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="${contextPath }/resources/css/left/morris.css" rel="stylesheet">
</head>
<body>
	<div class="navbar-default sidebar" role="navigation" style="margin-top: 0px;">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li><a href="${contextPath }/bjPayMain.bjp"><i class="fa fa-home"></i>&nbsp;&nbsp;&nbsp;&nbsp;수익관리 메인</a></li>
				<li><a href="${contextPath }/loginUser.bjp"><i class="fa fa-users"></i>&nbsp;&nbsp;&nbsp;&nbsp;접속자 수 관리 </a></li>
				<li><a href="${contextPath }/GoodUser.bjp"><i class="fa fa-thumbs-up"></i>&nbsp;&nbsp;&nbsp;&nbsp;추천 수 관리</a></li>
				<li><a href="${contextPath }/ProfitBj.bjp?mcode=${loginUser.mcode}"><i class="fa fa-bar-chart-o"></i>&nbsp;&nbsp;&nbsp;&nbsp;수익 그래프</a></li>
				<li><a href="${contextPath }/BlackList.bjp"><i class="fa fa-times"></i>&nbsp;&nbsp;&nbsp;&nbsp;블랙 회원 관리</a></li>
				<li><a href="${contextPath }/MyFan.bjp?mcode=${loginUser.mcode}"><i class="fa fa-heart"></i>&nbsp;&nbsp;&nbsp;&nbsp;내 팬 관리</a></li>
				<li><a href="${contextPath }/WithdrawList.bjp?mcode=${loginUser.mcode}"><i class="fa fa-won"></i>&nbsp;&nbsp;&nbsp;&nbsp;출금 신청 내역</a></li>
				<li><a href="${contextPath }/SeeUser.bjp"><i class="fa fa-gears"></i>&nbsp;&nbsp;&nbsp;&nbsp;시청자 관리 </a></li>
				<li><a href="${contextPath }/LiveTime.bjp"><i class="fa fa-power-off"></i>&nbsp;&nbsp;&nbsp;&nbsp;방송 시간 관리</a></li>
				<li><a href="${contextPath }/WithdrawForm.bjp?mcode=${loginUser.mcode}"><i class="fa fa-sign-in"></i>&nbsp;&nbsp;&nbsp;&nbsp;출금 신청하기</a></li>
				<li><a href="${contextPath }/Account.bjp"><i class="fa fa-sign-in"></i>&nbsp;&nbsp;&nbsp;&nbsp;계좌 인증 하기</a></li>
				<li><a href="${contextPath }/broadcasting.JDBC"><i class="fa fa-youtube-play"></i>&nbsp;&nbsp;&nbsp;&nbsp;내 방송국 가기</a></li>


			</ul>
		</div>
	</div>

</body>
</html>