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

<script src="https://code.highcharts.com/highcharts.js"></script>

<style>
	th, td {
		text-align: center;
	}
	.gType:hover, .mType:hover {
		cursor: pointer;    	
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
                    <h1 class="page-header" style="font-weight: bold;">회원 정보 조회</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
           <div class="row">
				<div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-qq fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><fmt:formatNumber value="${ todayTotal }" groupingUsed="true"/>명</div>
                                    <div>오늘 접속자 수</div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <span class="pull-left"></span>
                            <span class="pull-right">^^</span>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-plus-circle fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><fmt:formatNumber value="${ newUserCount }" groupingUsed="true"/>명</div>
                                    <div>신규회원</div>
                                </div>
                            </div>
                        </div>
                        <a class="mType" onclick="typeChange('searchNewUser.ad');">
                            <div class="panel-footer">
                                <span class="pull-left">자세히</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-qq fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><c:out value="${ list.TOTAL }명"/></div>
                                    <div>총 회원</div>
                                </div>
                            </div>
                        </div>
                        <a class="mType" onclick="location.reload()">
                            <div class="panel-footer">
                                <span class="pull-left">자세히</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-desktop fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right"> 
                                    <div class="huge"><c:out value="${ list.BJ }명"/></div>
                                    <div>방송중인 BJ</div>
                                </div>
                            </div>
                        </div>
                        <a class="mType" onclick="typeChange('searchBJ.ad');">
                            <div class="panel-footer">
                                <span class="pull-left">자세히</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
			</div>
            
	   		<div class="panel panel-default" style="margin-top: 30px;">
               <div class="panel-heading">
                   <i class="fa fa-bar-chart-o fa-fw"></i>
                   <div class="pull-right">
                       <div class="btn-group">
                           <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                               <span class="caret"></span>
                           </button>
                           <ul class="dropdown-menu pull-right" role="menu" >
                               <li value="time">
                               		<a class="gType" onclick="graphChange('Time')">시간별</a>
                               </li>
                               <li>
                               		<a class="gType" onclick="graphChange('Day')">일별</a>
                               </li>
                               <li>
                              	 	<a class="gType" onclick="graphChange('Month')">월별</a>
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
	        <div class="row">
		        <div class="col-lg-12">
	                    <div class="panel panel-default">
	                        <div class="panel-heading type" id="memberMg.ad"><span class="title">회원 정보</span>
	                        	<div class="input-group custom-search-form" style="width: 30%; float: right;" >
	                                <input type="text" class="form-control" placeholder="Search..." id="search">
	                                <span class="input-group-btn">
		                                <button class="btn btn-default" type="button" onclick="search();">
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
	                                        <th>방송 번호</th>
	                                        <th>보유 피치</th>
	                                        <th>이메일</th>
	                                        <th>계좌인증</th>
	                                        <th>가입일</th>
	                                        <th>구독자 수</th>
	                                        <th>비고</th>
	                                    </tr>
	                                </thead>
	                                <tbody class="values">
	                                  <c:forEach var="m" items="${ mlist }">
	                                  	<tr>
	                                  		<td><c:out value="${ m.mId }"/></td>
	                                  		<td><c:out value="${ m.mName }"/></td>
	                                  		<td><c:out value="${ m.mcode }"/></td>
	                                  		<td><fmt:formatNumber value="${ m.peach}" groupingUsed="true"/>개</td>
	                                  		<td><c:out value="${ m.email }"/></td>
	                                  		<td><c:out value="${ m.a_status }"/></td>
	                                  		<td><c:out value="${ m.joinDate }"/></td>
	                                  		<td><fmt:formatNumber value='${ m.readerCount}' groupingUsed='true'/>명</td>
	                                  		<td><button class="stop btn btn-info">정지</button></td>
	                                  	</tr>
	                                  </c:forEach>
	                                </tbody>
	                            </table>
	                            <!-- /.table-responsive -->
	                            <!-- pageing -->
                               <div id="pagingArea" align="center">
		                           <ul class="pagination pageul">
		                              <li class="page-item"><a class="page-link" onclick="return pageChange($('.active').children().text(),'minus', $('.type').attr('id'))">이전</a></li>
		                              <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
		                                 <c:if test="${p eq pi.currentPage }">
		                                    <li class="page-item active" id="cu${ p }"><a class="page-link" id="page" onclick="return onclickPage($(this).text(), $('.type').attr('id'))">${ p }</a></li>
		                                 </c:if>
		                                 <c:if test="${p ne pi.currentPage }">
		                                    <li class="page-item" id="cu${ p }"><a class="page-link" id="page" onclick="return onclickPage($(this).text(), $('.type').attr('id'))">${ p }</a></li>
		                                 </c:if>
		                              
		                              </c:forEach>
		                              <li class="page-item"><a class="page-link" onclick="return pageChange($('.active').children().text(),'plus', $('.type').attr('id'))">다음</a></li>
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
    <input type="hidden" value="${ pi.maxPage }" id="maxPage"/>
    </c:if>
    <c:if test="${ loginUser.mId ne 'admin' || loginUser == null}">
		<c:redirect url="index.jsp"/>
    </c:if>
    <!-- /#wrapper -->
  	<script>
	function onclickPage(value, type){
		var url = type;         
		$.ajax({
   			url: url,
   			type: "get",
   			data:{"newCurrentPage":value},
   			success:function(data){
	   
	       		var list = data.list.mlist;
	       		var pi = data.list.pi;
				$("tbody").html("");

				for(var i = 0; i < list.length; i++){
	            	$("tbody").append("<tr><td>"+list[i].mId+"</td><td>"+list[i].mName+"</td><td>"+list[i].mcode+"</td><td>"+addComma(list[i].peach)+"개</td><td>"+list[i].email+"</td><td>"+list[i].a_status+"</td><td>"+list[i].joinDate+"</td><td>"+addComma(list[i].readerCount)+"명</td><td><button class='stop btn btn-info'>정지</button></td></tr>");
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
    
     
     
     function pageChange(pagenum, value, type){
        var page = Number(pagenum);
        var url = type;         
        console.log(page)
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
                data:{"newCurrentPage":page},
                success:function(data){
                	
                	var list = data.list.mlist;
    	       		var pi = data.list.pi;
    				$("tbody").html("");
    	      		for(var i = 0; i < list.length; i++){
    	      			$("tbody").append("<tr><td>"+list[i].mId+"</td><td>"+list[i].mName+"</td><td>"+list[i].mcode+"</td><td>"+addComma(list[i].peach)+"개</td><td>"+list[i].email+"</td><td>"+list[i].a_status+"</td><td>"+list[i].joinDate+"</td><td>"+addComma(list[i].readerCount)+"명</td><td><button class='stop btn btn-info'>정지</button></td></tr>");
    	      		}
    	      		
    	      		$(".pageul").children().removeClass('active');
    	      		$("#cu"+page).addClass('active');
    	      		$("#maxPage").attr("value", pi.maxPage);
                },
                error:function(data){
                   console.log("에러!");
                }
             });
              return false;
           }
        }
  		
  		function typeChange(type){
  			$(".type").attr("id", type);
  			
  			pageChange("1", "", type);
  		}
  		
  		function search(){
  			var userId = $("#search").val();
  			
  			$.ajax({
  				url: "searchMember.ad",
  				type: "get",
  				data: {"userId": userId},
  				success: function(data){
  					var m = data.m;
  					
  					if(m != null){
	  					$("tbody").html("");
	  					$("#pagingArea").html("");
	  					
	  					$("tbody").append("<tr><td>"+m.mId+"</td><td>"+m.mName+"</td><td>"+m.mcode+"</td><td>"+addComma(m.peach)+"개</td><td>"+m.email+"</td><td>"+m.a_status+"</td><td>"+m.joinDate+"</td><td>"+addComma(m.readerCount)+"명</td><td><button class='stop btn btn-info'>정지</button></td></tr>");
	  					$("#pagingArea").append("<br/><button class='btn btn-default' onclick='location.reload()' id='all'>전체보기</button>");
  					}else {
  						alert("해당 유저의 정보가 없습니다.\n아이디를 확인해주세요.");
    	       			$("#search").focus();
  					}
  				}
  			});
  			
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
  		
  		$(function(){
			var times = ${times};
  			var chart = $("#chart").highcharts({
  				chart: {type: 'line'},
  				title: {text: 'Time'},
  				xAxis: {categories: [00, 01, 02, 03, 04, 05, 06, 07, 08, 09, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]},
  				yAxis: {title: 't'},
  				series: [{name: '인원수', data: times}]
  			});
  		});
  		
  		
  		function addComma(num) {
  		  var regexp = /\B(?=(\d{3})+(?!\d))/g;
  		   return num.toString().replace(regexp, ',');
  		}
  		
  		
  		$(document).on("click", ".stop", function(){
  			var con = confirm("해당 사용자를 블랙리스트에 등록하시겠습니까?");

  			if(con == true){
	  			var td = $(this).parent();
	  			var userId = $(this).parent().parent().children().first().text();
	  			
	  			$.ajax({
	  				url: "stopUser.ad",
	  				type: "get",
	  				data: {"userId":userId},
	  				success: function(data){
						td.html("");
	  					td.append("처리완료");
	  				
	  				},
	  				error: function(data){
	  					
	  				}
	  			});
  			}
  		});
  		
  	</script>


</body>
</html>
