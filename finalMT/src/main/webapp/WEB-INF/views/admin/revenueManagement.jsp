<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<script src="https://code.highcharts.com/highcharts.js"></script>

<style>
	th, td {
		text-align: center;
	}
	#all {
		margin-top: 10px;
	}
</style>

</head>

<body>
	<c:if test="${ loginUser.mId eq 'admin' }">
	<jsp:include page="chatting.jsp"/>
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
                <a class="navbar-brand" href="index.jsp"><img src="resources/images/logo.png" style="height: 35px; width: 200px;"/></a>
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
                        <li>
                      		<a href="memberMg.ad"><i class="fa fa-bar-chart-o fa-fw"></i> 일반 회원 관리</a>
                        </li>
                        <li>
                            <a href="blackUsers.ad"><i class="fa fa-bar-chart-o fa-fw"></i> 블랙리스트 관리</a>
                        </li>
                        <li>
                        <li>
                            <a href="revenueMg.ad"><i class="fa fa-table fa-fw"></i> 수익 관리</a>
                        </li>
                        <li>
                            <a href="withdrawal.ad"><i class="fa fa-bar-chart-o fa-fw"></i> 출금 신청</a>
                        </li>
                        <li>
                            <a href="deposit.ad"><i class="fa fa-bar-chart-o fa-fw"></i> 출금 완료</a>
                        </li>
                        <li>
                            <a href="reportMg.ad"><i class="fa fa-edit fa-fw"></i> 들어온 신고</a>
                        </li>
                        <li>
                            <a href="sReport.ad"><i class="fa fa-edit fa-fw"></i> 신고 내역</a>
                        </li>
                       	<li>
                            <a href="contactMg.ad"><i class="fa fa-edit fa-fw"></i> 들어온 문의</a>
                        </li>
                        <li>
                            <a href="successContact.ad"><i class="fa fa-edit fa-fw"></i> 문의 내역</a>
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
                    <h1 class="page-header" style="font-weight: bold;">수익 관리</h1>
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
                                    <div class="huge"><fmt:formatNumber value="${ map.day }" groupingUsed="true"/>원</div>
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
                                    <div class="huge"><fmt:formatNumber value="${ map.month }" groupingUsed="true"/>원</div>
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
                                    <div class="huge"><fmt:formatNumber value="${ map.total }" groupingUsed="true"/>원</div>
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
                               		<a class="gType" onclick="graphChange('reTime')">시간별</a>
                               </li>
                               <li>
                               		<a class="gType" onclick="graphChange('reDay')">일별</a>
                               </li>
                               <li>
                              	 	<a class="gType" onclick="graphChange('reMonth')">월별</a>
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
                        <div class="panel-heading type" id="revenueMg.ad">회원 정보
                        	<div class="input-group custom-search-form" style="width: 30%; float: right;" >
                                <input type="text" class="form-control" placeholder="Search..." id="search" value="">
                                <span class="input-group-btn">
	                                <button class="btn btn-default" type="button" onclick="typeChange('searchRevenue.ad');">
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
                                <c:forEach var="m" items="${ map.rlist }">
                               		<tr>
                               			<td><c:out value="${ m.mId }"/></td>
                               			<td><c:out value="${ m.mName }"/></td>
                               			<td><c:out value="${ m.peach_code }"/></td>
                               			<td><c:out value="카드"/></td>
                               			<td><c:out value="${ m.p_date }"/></td>
                                 	</tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <!-- /.table-responsive -->
                             <div id="pagingArea" align="center">
	                           <ul class="pagination pageul">
	                              <li class="page-item"><a class="page-link back" onclick="return pageChange($('.active').children().text(),'minus', $('.type').attr('id'))">이전</a></li>
	                              <c:forEach var="p" begin="${ map.pi.startPage }" end="${ map.pi.endPage }">
	                                 <c:if test="${p eq map.pi.currentPage }">
	                                    <li class="page-item active" id="cu${ p }"><a class="page-link" id="page" onclick="return onclickPage($(this).text(), $('.type').attr('id'))">${p}</a></li>
	                                 </c:if>
	                                 <c:if test="${p ne map.pi.currentPage }">
	                                    <li class="page-item" id="cu${ p }"><a class="page-link" id="page" onclick="return onclickPage($(this).text(), $('.type').attr('id'))">${p}</a></li>
	                                 </c:if>
	                              
	                              </c:forEach>
	                              <li class="page-item"><a class="page-link next" onclick="return pageChange($('.active').children().text(),'plus', $('.type').attr('id'))">다음</a></li>
	                           </ul>
	                        </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
	        
	        </div>
        </div>
        
    </div>
    <input type="hidden" value="${ map.pi.maxPage }" id="maxPage"/>
    </c:if>
    <c:if test="${ loginUser.mId ne 'admin' || loginUser == null}">
		<c:redirect url="index.jsp"/>
    </c:if>
    <!-- /#wrapper -->
    <script>
    	$(function(){
			var money = ${map.tlist};
			var chart = $("#chart").highcharts({
				chart: {type: 'line'},
				title: {text: '시간별'},
				xAxis: {categories: [00, 01, 02, 03, 04, 05, 06, 07, 08, 09, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]},
				yAxis: {title: 't'},
				series: [
					{name: '금액', data: money}]
			});
		});
    	
    	function onclickPage(value, type){
    		var url = type;        
    		var userId = $("#search").val();
    		$.ajax({
       			url: url,
       			type: "get",
       			data:{"newCurrentPage":value, "userId":userId},
       			success:function(data){
    	   
    	       		var list = data.map.rlist;
    	       		var pi = data.map.pi;
    				$("tbody").html("");
    	       
    	      		for(var i = 0; i < list.length; i++){
    	      			$("tbody").append("<tr><td>"+list[i].mId+"</td><td>"+list[i].mName+"</td><td>"+list[i].peach_code+"</td><td>카드</td><td>"+list[i].p_date+"</td></tr>");
    	      		}
    	      		
    	      		$(".pageul").children().removeClass('active');
    	      		$("#cu"+value).addClass('active');
    	      		$("#maxPage").attr("value", pi.maxPage);
       			},
       			error:function(data){
          			console.log("에러!");
       			}
    		});
     		return false;
    	}
    	
    	function typeChange(type){
  			$(".type").attr("id", type);
  			
  			pageChange("1", "", type);
  		}
    	
    	function pageChange(pagenum, value, type){
            var page = Number(pagenum);
            var url = type;  
            var userId = $("#search").val();
            
            console.log("url: "+url);
            console.log("page: " + page);
            console.log("userId: " + userId);
            if(page >= 1 && page <= $("#maxPage").val()){
                 if(value === 'plus'){
                    if(page == $("#maxPage").val()){
                       return;
                    }
                    page += 1;
                 }else if(value === 'minus'){
                    if(page === 1){
                       return;
                    }
                    page -= 1;
                 }
                 
                 $.ajax({
                    url: url,
                    type: "get",
                    data:{"newCurrentPage":page, "userId":userId},
                    success:function(data){
                    	
                    	var list = data.map.rlist;
        	       		var pi = data.map.pi;
        	       		console.log(pi.currentPage);
        	       		console.log(list);
        				$("tbody").html("");
        	       
        	      		for(var i = 0; i < list.length; i++){
        	      			$("tbody").append("<tr><td>"+list[i].mId+"</td><td>"+list[i].mName+"</td><td>"+list[i].peach_code+"</td><td>카드</td><td>"+list[i].p_date+"</td></tr>");
        	      		}
        	      		
						$(".pageul").html("");
        	      		$(".pageul").append("<li class='page-item'><a class='page-link back'>이전</a></li>");
        	      		for(var i = pi.startPage; i <= pi.endPage; i++){
        	      			if(i == pi.currentPage){
        	      				$(".pageul").append("<li class='page-item active' id='cu" + i + "'><a class='page-link' id='page'>" + i + "</a></li>");
        	      			}else {
        	      				$(".pageul").append("<li class='page-item' id='cu" + i + "'><a class='page-link' id='page'>" + i + "</a></li>");
        	      			}
        	      		}
        	      		$(".pageul").append("<li class='page-item'><a class='page-link next'>다음</a></li>");

        	      		$(".page-item").attr("onclick", "return onclickPage($(this).text(), $('.type').attr('id'))");
        	      		$(".back").attr("onclick", "return pageChange($('.active').children().text(),'minus', $('.type').attr('id'))");
        	      		$(".next").attr("onclick", "return pageChange($('.active').children().text(),'plus', $('.type').attr('id'))");
        	      		$("#maxPage").attr("value", pi.maxPage);
        	      		
        	      		if(userId != ""){
    	  					$("#all").remove();
    	  					$(".pageul").append("<br/><button class='btn btn-default' onclick='location.reload()' id='all'>전체보기</button>");
    	  				}
                    },
                    error:function(data){
                       console.log("에러!");
                    }
                 });
                  return false;
               }
            }
    	
  		function graphChange(type){
  			var newData = new Array();
  			var total = new Array();
  			
  			$.ajax({
  				url: "changeGraph.ad",
  				type: "get",
  				async: false,
  				data: {"type": type},
  				success: function(data){
  					
  					$.each(data.list, function(index, item){
  						newData.push(Number(item));
						total.push(index+1);	
  				    });	
  				},
  				error: function(){
  					console.log("error!");
  				}
  			});
			
  			$("#chart").html("");
  			$("#chart").highcharts({
  				chart: {type: 'line'},
  				title: {text: type},
  				xAxis: {categories: total},
  				yAxis: {title: 't'},
  				series: [{name: '인원수', data: newData}]
  			});
  		}
    </script>
    
</body>
</html>
