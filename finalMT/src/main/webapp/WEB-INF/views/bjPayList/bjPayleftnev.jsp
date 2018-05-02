<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<li><a href="bjPayMain.bjp?mcode=${loginUser.mcode}"><i class="fa fa-home"></i>&nbsp;&nbsp;&nbsp;&nbsp;수익관리 메인</a></li>
				<li><a href="LiveTime.bjp?mcode=${loginUser.mcode}"><i class="fa fa-power-off"></i>&nbsp;&nbsp;&nbsp;&nbsp;방송 관리(접,시간)</a></li>
				<li><a href="ProfitBj.bjp?mcode=${loginUser.mcode}"><i class="fa fa-bar-chart-o"></i>&nbsp;&nbsp;&nbsp;&nbsp;수익 그래프</a></li>
				<li><a href="BlackList.bjp?mcode=${loginUser.mcode}"><i class="fa fa-times"></i>&nbsp;&nbsp;&nbsp;&nbsp;블랙 회원 관리</a></li>
				<li><a href="MyFan.bjp?mcode=${loginUser.mcode}"><i class="fa fa-heart"></i>&nbsp;&nbsp;&nbsp;&nbsp;내 팬 관리</a></li>
				<li><a href="WithdrawList.bjp?mcode=${loginUser.mcode}"><i class="fa fa-won"></i>&nbsp;&nbsp;&nbsp;&nbsp;출금 신청 내역</a></li>
				<li><a href="WithdrawForm.bjp?mcode=${loginUser.mcode}"><i class="fa fa-sign-in"></i>&nbsp;&nbsp;&nbsp;&nbsp;출금 신청하기</a></li>
				<li><a href="Account.bjp"><i class="fa fa-sign-in"></i>&nbsp;&nbsp;&nbsp;&nbsp;계좌 인증 하기</a></li>
				<li><a href="bringJDBC.JDBC?mId=${loginUser.mId }" target="blank"><i class="fa fa-youtube-play"></i>&nbsp;&nbsp;&nbsp;&nbsp;내 방송국 가기</a></li>


			</ul>
		</div>
	</div>

</body>
</html>