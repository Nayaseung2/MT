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
.modalTable, .modalTable td, .modalTable input{
	width: 100%;
}

.modalTable input{
	margin: 0px auto 20px auto; 
	font-size: 18px;
	font-weight: bold;
}

.modal-dialog{
	width: 70%;
	
}

.modalTable textarea{
	width: 100%;
	height: 200px;
	resize: none;
}
.modal-content label{
	float: inherit;
}

.modal-left{
	width: 69%;
	display: inline-block;
	vertical-align: top;
}

.modal-right {
	width: 30%;
	display: inline-block;
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
                    <h1 class="page-header" style="font-weight: bold;">신고 내역</h1>
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
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example" style="text-align: center;">
                                <thead>
                                    <tr>
                                        <th>신고자</th>
                                        <th>신고 대상</th>
										<th>방송 여부</th>
										<th>신고 내용</th>
										<th>누적 신고 수</th>
                                        <th>신고 날짜</th>
                                        <th align="center">자세히 보기</th>
                                    </tr>
                                </thead>
                                <tbody>
                                  <c:forEach var="i" items="${ map.list }">
                                  	<tr>
                                  		<td><c:out value="${ i.reporter }"/></td>
                                  		<td><c:out value="${ i.target }"/></td>
                                  		<td><c:out value="${ i.videoYN }"/></td>
                                  		<td><c:out value="${ i.content }"/></td>
                                  		<td><c:out value="${ i.reportSum }"/></td>
                                  		<td><c:out value="${ i.reportDate }"/></td>
                                  		<td width="5%" align="center"><button class="btn btn-default detail">자세히 보기</button></td>
                                  		<td style="display: none"><c:out value="${ i.screen }"/></td>
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
    <!-- .modal -->
    <div class="modal fade" id="layerpop" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <!-- header -->
	      <div class="modal-header">
	        <!-- 닫기(x) 버튼 -->
	        <button type="button" class="close" data-dismiss="modal">×</button>
	        <!-- header title -->
	        <h4 class="modal-title" align="center">상세보기</h4>
	      </div>
	      <!-- body -->
	      <div class="modal-body">
				<div class="modal-left">
					<img style="width: 100%; height: 100%;" src="" class="screen"/>
				</div>
				<div class="modal-right">
					<table class="modalTable">
				      	<tr>
				      		<td><label>신고 날짜</label><input type="text" class="date" readonly/></td>
				      		<td style="display: none;" class="code"></td>
				      	</tr>
				      	<tr>
				      		<td><label>신고자</label><input type="text" class="writer" readonly/></td>
				      	</tr>
				      	<tr>
				      		<td style="width: 49%;"><label>신고 대상</label><input type="text" class="title" readonly/></td>
				      	</tr>
				      	<tr>
				      		<td><label>내용</label><textarea class="content" readonly></textarea></td>
				      	</tr>
				      </table>
				</div>
	      </div>
	      <!-- Footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default answer" onclick="go();">이동하기</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- /.modal -->
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
		
		pageChange("", type);
	}
	
	function pageChange(value, type){
		var page = Number($("#page").text());
		var url = type;		
		var userId = $("#search").val();
		
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
  				data:{"newCurrentPage":page, "userId": userId},
  				success:function(data){
	  				var list = data.map.dlist;
	  				var pi = data.map.pi;
	  				$(".values").html("");
	  				
	  				for(var i = 0; i < list.length; i++){
		  				$(".values").append("<tr><td>"+list[i].mId+"</td><td>"+list[i].mName+"</td><td>"+list[i].amount+"</td><td>"+list[i].account+"</td><td>"+list[i].wdDate+"</td></tr>");
	  				}
	  				
	  				$("#page").text(page);
	  				$("#maxPage").attr("value", pi.maxPage);
	  				
	  				if(userId != ""){
	  					$("#all").remove();
	  					$("#pagingArea").append("<button onclick='location.reload()' id='all'>전체보기</button>");
	  				}
  				},
  				error:function(data){
  					console.log("에러!");
  				}
  			});
			return false;
		}
	}
	
	$(document).on("click", ".detail", function(){
		var writer = $(this).parent().parent().children().eq(0).text();
		var title = $(this).parent().parent().children().eq(1).text();
		var content = $(this).parent().parent().children().eq(3).text();
		var date = $(this).parent().parent().children().eq(5).text();
		var screen = "/mt/resources/uploadFiles/" + $(this).parent().parent().children().last().text();
		
		
	    $('div.modal').modal();
		
		$(".writer").val(writer);
		$(".title").val(title);
		$(".date").val(date);
		$(".content").text(content);
		$(".screen").attr("src", screen);
		
	});
	
	function go(){
		var target = $(".title").text();
		$.ajax({
			url: "urlSearch.ad",
			type: "get",
			data: {"target": target},
			success: function(data){
				if(data.string === "N"){
					location.href="memberMg.ad";
				}else {
					location.href=data.string;
				}
				
			},
			error: function(data) {
				
				
			}
		});
		//window.open("http://www.naver.net", "네이버새창", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
		
	}
    </script>
</body>
</html>
