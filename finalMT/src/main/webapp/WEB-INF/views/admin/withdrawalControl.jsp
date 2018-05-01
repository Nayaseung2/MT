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

<style>
th, td {
	text-align: center;	
}
.arBtn {
	width: 3.5%;
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
                    <h1 class="page-header" style="font-weight: bold;">출금 신청</h1>
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
                                    <div class="huge"><fmt:formatNumber value="${ map.wCount.TODAY }" groupingUsed="true"/>건</div>
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
                                    <div class="huge"><fmt:formatNumber value="${ map.wCount.SUCCESS }" groupingUsed="true"/>건</div>
                                    <div>완료된 출금 신청</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
			</div>
            
            <div class="row">
		        <div class="col-lg-12">
	                <div class="panel panel-default">
	                    <div class="panel-heading type" id="withdrawal.ad" >회원 정보
	                    	<div class="input-group custom-search-form" style="width: 30%; float: right;" >
	                            <input type="text" class="form-control" placeholder="Search..." id="search" value="">
	                            <span class="input-group-btn">
	                             <button class="btn btn-default" type="button" onclick="typeChange('searchWithdrawal.ad')">
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
	                                    <th>승인</th>
	                                    <th>거절</th>
	                                </tr>
	                            </thead>
								<tbody>
									<c:forEach var="w" items="${ map.wlist }">
	                                  	<tr>
	                                  		<td>${ w.mId }</td>
	                                  		<td>${ w.mName }</td>
	                                  		<td>${ w.amount }</td>
	                                  		<td>${ w.account }</td>
	                                  		<td>${ w.wdDate }</td>
	                                  		<td class='arBtn'><button class='approval btn btn-info'>승인</button></td>
	                                  		<td class='arBtn'><button class='refusal btn btn-danger'>거절</button></td>
	                                  		<td style='display: none;'>${ w.wdCode }</td>
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
    <!-- /#wrapper -->
	<input type="hidden" value="${ map.pi.maxPage }" id="maxPage"/>
	</c:if>
    <c:if test="${ loginUser.mId ne 'admin' || loginUser == null}">
		<c:redirect url="index.jsp"/>
    </c:if>
	<script>
	function typeChange(type){
		$(".type").attr("id", type);
		
		pageChange("1", "", type);
	}
	
	function onclickPage(value, type){
		
		var url = type;        
		$.ajax({
   			url: url,
   			type: "get",
   			data:{"newCurrentPage":value},
   			success:function(data){
	   
	       		var list = data.map.wlist;
	       		var pi = data.map.pi;
				$("tbody").html("");
	       
	      		for(var i = 0; i < list.length; i++){
	      			$("tbody").append("<tr><td>"+list[i].mId+"</td><td>"+list[i].mName+"</td><td>"+list[i].amount+"</td><td>"+list[i].account+"</td><td>"+list[i].wdDate+"</td><td class='arBtn'><button class='approval btn btn-info'>승인</button></td><td class='arBtn'><button class='refusal btn btn-danger'>거절</button></td><td style='display: none;'>"+ list[i].wdDate +"</td></tr>");
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
                	
                	var list = data.map.wlist;
    	       		var pi = data.map.pi;
    	       		console.log(pi.currentPage);
    	       		console.log(list);
    	       		
    	       		
    				$("tbody").html("");
    	       
    	      		for(var i = 0; i < list.length; i++){
    	      			$("tbody").append("<tr><td>"+list[i].mId+"</td><td>"+list[i].mName+"</td><td>"+list[i].amount+"</td><td>"+list[i].account+"</td><td>"+list[i].wdDate+"</td><td class='arBtn'><button class='approval btn btn-info'>승인</button></td><td class='arBtn'><button class='refusal btn btn-danger'>거절</button></td><td style='display: none;'>"+ list[i].wdDate +"</td></tr>");
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
	  					$(".pageul").append("<br/><br/><button class='btn btn-info' onclick='location.reload()' id='all'>전체보기</button>");
	  				}
                },
                error:function(data){
                   console.log("에러!");
                }
             });
              return false;
           }
        }
	
	$(".approval").on("click", function(){
		var wdCode = $(this).parent().parent().children().last().text();
		
		var approval = $(this).parent();
		var refusal = $(this).parent().next();
		
		var con = confirm("승인하시겠습니까?"); 
		if(con == true){
			$.ajax({
				url: "approval.ad", 
				type: "get",
				data: {"wdCode": wdCode},
				success: function(data){
					approval.html("승인완료");
	  				refusal.html("승인완료");
				},
				error: function(data){
					console.log("에러");
				}
			});
		}else {
			
		}
		
	});
	
	$(".refusal").on("click", function(){
		var wdCode = $(this).parent().parent().children().last().text();
		
		var approval = $(this).parent().prev();
		var refusal = $(this).parent();
		
		var con = confirm("거절하시겠습니까?"); 
		if(con){
			$.ajax({
				url: "approval.ad", 
				type: "get",
				data: {"wdCode": wdCode},
				success: function(data){
					approval.html("거절완료");
	  				refusal.html("거절완료");
				},
				error: function(data){
					console.log("에러");
				}
			});
		}else {
			
		}
		
	});
	
	
    </script>
</body>
</html>

