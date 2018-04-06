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
    <link href="/test/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/test/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/test/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="/test/resources/vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/test/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
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
                            <a href="admin.jsp"><i class="fa fa-home fa-fw"></i> HOME</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 회원 관리<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="flot.html">일반 회원</a>
                                </li>
                                <li>
                                    <a href="morris.html">BJ</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="tables.html"><i class="fa fa-table fa-fw"></i> 수익 관리</a>
                        </li>
                        <li>
                            <a href="tables.html"><i class="fa fa-table fa-fw"></i> 출금 관리<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">출금 신청</a>
                                </li>
                                <li>
                                    <a href="#">출금 완료</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="forms.html"><i class="fa fa-edit fa-fw"></i> 신고 관리</a>
                        </li>
                       	<li>
                            <a href="forms.html"><i class="fa fa-edit fa-fw"></i> 문의 내역</a>
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
                    <h1 class="page-header"> Withdrawal Control</h1>
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
                                    <div>오늘의 출금 신청</div>
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
                                    <div class="huge">5건</div>
                                    <div>완료된 출금 신청</div>
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
            
            
            <div class="row">
		   		<div class="panel panel-default" style="margin-top: 30px;">
	               <div class="panel-heading">
	                   <i class="fa fa-bar-chart-o fa-fw"></i> 출금건수
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
	                              	 	<a href="#">주별</a>
	                               </li>
	                               <li>
	                              	 	<a href="#">월별</a>
	                               </li>
	                               <li>
	                               		<a href="#">년별</a>
	                               </li>
	                           </ul>
	                       </div>
	                   </div>
	               </div>
	               <!-- /.panel-heading -->
	               <div class="panel-body">
	                   <div id="morris-area-chart"></div>
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
	                                    <th>신청 액</th>
	                                    <th>계좌 번호</th>
	                                    <th>신청 날짜</th>
	                                    <th>수수료</th>
	                                    <th>실 지급액</th>
	                                </tr>
	                            </thead>
								<tbody>
									<c:forEach var="i" begin="0" end="20">
	                                  	<tr>
	                                  		<td>${ i }</td>
	                                  		<td>${ i }</td>
	                                  		<td>${ i }</td>
	                                  		<td>${ i }</td>
	                                  		<td>N</td>
	                                  		<td>${ i }</td>
	                                  		<td>${ i }</td>
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
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="/test/resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/test/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/test/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="/test/resources/vendor/raphael/raphael.min.js"></script>
    <script src="/test/resources/vendor/morrisjs/morris.min.js"></script>
    <script src="/test/resources/data/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/test/resources/dist/js/sb-admin-2.js"></script>

</body>
</html>
