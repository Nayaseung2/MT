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


<style>
tr, th {
	text-align: center;
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
                    <h1 class="page-header" style="font-weight: bold;">출금 완료 내역</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <div class="row" style="margin-top: 30px;">
				<div class="searchArea" align="center">
					<table>
						<tr>
							<td>
								<div class="input-group custom-search-form" style="width: 100%; float: right;" >
	                                <input type="text" class="form-control" placeholder="Search..." id="search">
	                                <span class="input-group-btn">
		                                <button class="btn btn-default" type="button" onclick="typeChange('searchDeposit.ad')">
		                                    <i class="fa fa-search"></i>
		                                </button>
	                            	</span>
	                            </div>
							</td>
						</tr>
					</table>
				</div>
            </div>
			<div class="row" style="margin-top: 40px;">
		        <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">회원 정보</div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>아이디</th>
                                        <th>이름</th>
                                        <th>신청 액</th>
                                        <th>계좌 번호</th>
                                        <th>처리 날짜</th>
                                    </tr>
                                </thead>
                                <tbody class="values">
                                  <c:forEach var="d" items="${ map.dlist }">
                                  	<tr>
                                  		<td><c:out value="${ d.mId }"/></td>
                                  		<td><c:out value="${ d.mName }"/></td>
                                  		<td><c:out value="${ d.amount }"/></td>
                                  		<td><c:out value="${ d.account }"/></td>
                                  		<td><c:out value="${ d.wdDate }"/></td>
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
    <input type="hidden" class="type" id="deposit.ad"/>
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
		console.log(url);
		$.ajax({
   			url: url,
   			type: "get",
   			data:{"newCurrentPage":value},
   			success:function(data){
	   
	       		var list = data.map.dlist;
	       		var pi = data.map.pi;
				$(".values").html("");
	       
	      		for(var i = 0; i < list.length; i++){
	      			$(".values").append("<tr><td>"+list[i].mId+"</td><td>"+list[i].mName+"</td><td>"+list[i].amount+"</td><td>"+list[i].account+"</td><td>"+list[i].wdDate+"</td></tr>");
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
                	var list = data.map.dlist;
    	       		var pi = data.map.pi;
    	       		console.log(pi.currentPage);
    	       		console.log(list);
    	       		
    	       		
    				$(".values").html("");
    	       
    	      		for(var i = 0; i < list.length; i++){
    	      			$(".values").append("<tr><td>"+list[i].mId+"</td><td>"+list[i].mName+"</td><td>"+list[i].amount+"</td><td>"+list[i].account+"</td><td>"+list[i].wdDate+"</td></tr>");
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
	  					$(".pageul").append("<br/><button onclick='location.reload()' id='all'>전체보기</button>");
	  				}
                },
                error:function(data){
                   console.log("에러!");
                }
             });
              return false;
           }
        }
    </script>
</body>
</html>
