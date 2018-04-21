<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>

<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Bootstrap Admin Theme</title>

<!-- Bootstrap Core CSS -->
<link href="/mt/resources/admin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="/mt/resources/admin/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="/mt/resources/admin/dist/css/sb-admin-2.css" rel="stylesheet">
<!-- Morris Charts CSS -->
<link href="/mt/resources/admin/vendor/morrisjs/morris.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="/mt/resources/admin/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">


<!-- jQuery -->
<script src="/mt/resources/admin/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/mt/resources/admin/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="/mt/resources/admin/vendor/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="/mt/resources/admin/dist/js/sb-admin-2.js"></script>

<script src="http://code.highcharts.com/highcharts.js"></script>
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html"><img src="resources/images/logo.png" style="height: 35px; width: 200px;"/></a>
            </div>
            <!-- /.navbar-header -->

           
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu" style="margin-top: 50px;">
                        <li>
                            <a href="adminMain.ad"><i class="fa fa-home fa-fw"></i> HOME</a>
                        </li>
                        <li>
                        	<a href="#"><i class="fa fa-table fa-fw"></i> 회원 관리<span class="fa arrow"></span></a>
                        	<ul class="nav nav-second-level">
                                <li>
		                            <a href="memberMg.ad"><i class="fa fa-bar-chart-o fa-fw"></i> 일반 회원 관리</a>
                                </li>
                                <li>
                                    <a href="memberMg.ad"><i class="fa fa-bar-chart-o fa-fw"></i> 블랙리스트 관리</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="revenueMg.ad"><i class="fa fa-table fa-fw"></i> 수익 관리</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-table fa-fw"></i> 출금 관리<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="withdrawal.ad">출금 신청</a>
                                </li>
                                <li>
                                    <a href="deposit.ad">출금 완료</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="reportMg.ad"><i class="fa fa-edit fa-fw"></i> 신고 관리</a>
                        </li>
                       	<li>
                            <a href="contactMg.ad"><i class="fa fa-edit fa-fw"></i> 문의 내역</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
		<div id="page-wrapper" style="margin-top: 63px;">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"> Contact Management</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
             <div class="row">
				 <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-lightbulb-o fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">15건</div>
                                    <div>오늘</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-lightbulb-o fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">15건</div>
                                    <div>이번주</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-lightbulb-o fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">15건</div>
                                    <div>이번달</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                 <a href="#">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <img src="resources/images/plusBtn.png" style="height: 75px;"/>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">추가하기</div>
                                    <div></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </a>
                
            </div>
            <div class="row" style="margin-top: 30px;">
				<div class="searchArea" align="center">
					<table>
						<tr>
							<td>
								<select style="height: 30px;" name="searchSelect">
									<option>---------</option>
									<option value="userId">아이디</option>
									<option value="userName">이름</option>
									<option value="date">날짜</option>
								</select>
							</td>
							<td>
								&nbsp;&nbsp;
							</td>
							<td>
								<div class="input-group custom-search-form" style="width: 100%; float: right;" >
	                                <input type="text" class="form-control" placeholder="Search...">
	                                <span class="input-group-btn">
		                                <button class="btn btn-default" type="button">
		                                    <i class="fa fa-search"></i>
		                                </button>
	                            	</span>
	                            </div>
							</td>
						</tr>
					</table>
				</div>
            </div>
            <div class="row" style="margin-top: 30px;">
            	<div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">회원 정보</div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example" style="text-align: center;">
                                <thead>
                                    <tr>
                                        <th>아이디</th>
                                        <th>분류</th>
                                        <th>문의 내용</th>
                                        <th>문의 날짜</th>
                                        <th align="center">자세히 보기</th>
                                    </tr>
                                </thead>
                                <tbody>
                                  <c:forEach var="i" begin="0" end="20">
                                  	<tr>
                                  		<td>${ i }</td>
                                  		<td>${ i }</td>
                                  		<td>${ i }</td>
                                  		<td>${ i }</td>
                                  		<td width="5%" align="center"><button class="btn btn-default detail">자세히 보기</button></td>
                                  	</tr>
                                  	<tr class="detailboard">
                                  		<td colspan="4">
                                  			<ul>
                                  				<li><c:out value="제목: "/> </li>
                                  				<li>내용</li>
                                  				<li>dasfkjsjfhaulhfueqwhfiashuids</li>
                                  			</ul>
                                  		</td>
                                  		<td style="width: 10%; vertical-align: middle;" align="center">
                                  			<button class="btn btn-info response">답변하기</button>
                                  		</td>
                                  	</tr>
                                  </c:forEach>
                                </tbody>
                            </table>
                            
                            <script>
                            	$(function(){
                            		$(".detailboard").hide();
	                            	$(document).on("click", ".detail", function(){
	                            		$(this).parents().parents().next().toggle();
	                            	});
	                            	$(".response").click(function(){
	                            		alert("안녕");
	                            	});
	                            });
                            </script>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
            </div>
	        
        </div>
        
        
    </div>
    <!-- /#wrapper -->
</body>
</html>
