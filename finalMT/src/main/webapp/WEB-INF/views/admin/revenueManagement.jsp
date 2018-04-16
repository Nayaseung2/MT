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

<title>수익 관리</title>

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
                            <a href="memberMg.ad"><i class="fa fa-bar-chart-o fa-fw"></i> 회원 관리</a>
                        </li>
                        <li>
                            <a href="revenueMg.ad"><i class="fa fa-table fa-fw"></i> 수익 관리</a>
                        </li>
                        <li>
                            <a href="tables.html"><i class="fa fa-table fa-fw"></i> 출금 관리<span class="fa arrow"></span></a>
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
                    <h1 class="page-header"> Revenue Management</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
           <div class="row">
				 <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-won fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">528,600</div>
                                    <div>오늘의 수입</div>
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
                                    <i class="fa fa-won fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">905,101,000</div>
                                    <div>이번주 수입</div>
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
                                    <i class="fa fa-won fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">1,999,999,999</div>
                                    <div>이번달 수입</div>
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
                                    <i class="fa fa-won fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">1,999,999,999</div>
                                    <div>총 수입</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
			</div>
            
            
            <div class="row">
	   		<div class="panel panel-default" style="margin-top: 30px;">
               <div class="panel-heading">
                   <i class="fa fa-bar-chart-o fa-fw"></i> 시간대별 수입
                   <div class="pull-right">
                       <div class="btn-group">
                           <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                               <span class="caret"></span>
                           </button>
                           <ul class="dropdown-menu pull-right" role="menu" >
                               <li value="time">
                               		<a href="#">시간별</a>
                               </li>
                               <li>
                               		<a href="#">일별</a>
                               </li>
                               <li>
                              	 	<a href="#">월별</a>
                               </li>
                           </ul>
                       </div>
                   </div>
               </div>
               <!-- /.panel-heading -->
               <div class="panel-body">
                   <div id="chart" style="width: 100%; height: 400px;"></div>
               </div>
               <!-- /.panel-body -->
	        </div>
	        <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">회원 정보
                        	<div class="input-group custom-search-form" style="width: 30%; float: right;" >
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
	                                <button class="btn btn-default" type="button">
	                                    <i class="fa fa-search"></i>
	                                </button>
                            	</span>
                            </div>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>아이디</th>
                                        <th>이름</th>
                                        <th>구입 상품</th>
                                        <th>결제 수단</th>
                                        <th>구입 날짜</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="m" items="${ mlist }">
                               		<tr>
                               		
                               		
                                 	</tr>
                                </c:forEach>
                                </tbody>
                            </table>
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
    <script>
    	$(function(){
			var times = ${times};
			var chart = $("#chart").highcharts({
				chart: {type: 'line'},
				title: {text: '시간별'},
				xAxis: {categories: [00, 01, 02, 03, 04, 05, 06, 07, 08, 09, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]},
				yAxis: {title: 't'},
				series: [
					{name: '인원수', data: times}]
			});
		});
    
    </script>
    
</body>
</html>
