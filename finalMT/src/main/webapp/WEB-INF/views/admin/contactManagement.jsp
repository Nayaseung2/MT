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

<style>
	.modalTable, .modalTable td, .modalTable input{
		width: 100%;
	}
	
	.modalTable input{
		margin: 0px auto 20px auto; 
		font-size: 18px;
		font-weight: bold;
	}
	
	.modalTable textarea{
		width: 100%;
		height: 200px;
		resize: none;
	}
	.modal-content label{
		float: inherit;
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
                        	<a href="#"><i class="fa fa-table fa-fw"></i> 회원 관리<span class="fa arrow"></span></a>
                        	<ul class="nav nav-second-level">
                                <li>
		                            <a href="memberMg.ad"><i class="fa fa-bar-chart-o fa-fw"></i> 일반 회원 관리</a>
                                </li>
                                <li>
                                    <a href="blackUsers.ad"><i class="fa fa-bar-chart-o fa-fw"></i> 블랙리스트 관리</a>
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
                    <h1 class="page-header" style="font-weight: bold;">문의 내역</h1>
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
                                    <div class="huge account"><c:out value="${ map.count[0] }건"/></div>
                                    <div>계정관련</div>
                                </div>
                            </div>
                        </div>
                        <a onclick="contactTypeChange('contactTypeChange.ad', '계정')">
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
                                    <i class="fa fa-lightbulb-o fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge watch"><c:out value="${ map.count[1] }건"/></div>
                                    <div>방송시청관련</div>
                                </div>
                            </div>
                        </div>
                        <a onclick="contactTypeChange('contactTypeChange.ad', '방송시청')">
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
                                    <i class="fa fa-lightbulb-o fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge peach"><c:out value="${ map.count[2] }건"/></div>
                                    <div>피치관련</div>
                                </div>
                            </div>
                        </div>
                        <a onclick="contactTypeChange('contactTypeChange.ad', '피치')">
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
                                    <i class="fa fa-lightbulb-o fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge payment"><c:out value="${ map.count[3] }건"/></div>
                                    <div>결제관련</div>
                                </div>
                            </div>
                        </div>
                        <a onclick="contactTypeChange('contactTypeChange.ad', '결제')">
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
                                    <i class="fa fa-lightbulb-o fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge others"><c:out value="${ map.count[4] }건"/></div>
                                    <div>기타</div>
                                </div>
                            </div>
                        </div>
                        <a onclick="contactTypeChange('contactTypeChange.ad', '기타')">
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
                                    <i class="fa fa-lightbulb-o fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge total"><c:out value="${ map.count[5] }건"/></div>
                                    <div>전체 문의</div>
                                </div>
                            </div>
                        </div>
                        <a onclick="location.reload()">
                            <div class="panel-footer">
                                <span class="pull-left">자세히</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 30px;">
				<div class="searchArea" align="center">
					<table>
						<tr>
							<td>
								<div class="input-group custom-search-form" style="width: 100%; float: right;" >
	                                <input type="text" class="form-control" placeholder="Search..." id="search">
	                                <span class="input-group-btn">
		                                <button class="btn btn-default" type="button" onclick="typeChange('searchContact.ad')">
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
                                        <th>문의 제목</th>
                                        <th>문의 내용</th>
                                        <th>문의 날짜</th>
                                        <th align="center">자세히 보기</th>
                                    </tr>
                                </thead>
                                <tbody class="values">
                                  <c:forEach var="c" items="${ map.clist }">
                                  	<tr>
                                  		<td><c:out value="${ c.bWriter }"/></td>
                                  		<td><c:out value="${ c.bType }"/></td>
                                  		<td><c:out value="${ c.bTitle }"/></td>
                                  		<td style="width: 20px; overflow: hidden; text-overflow; ellipsis;"><c:out value="${ c.bContent }"/></td>
                                  		<td><c:out value="${ c.bCreateDate }"/></td>
                                  		<td width="5%" align="center" class="detailTd"><button class="btn btn-default detail">자세히 보기</button></td>
                                  		<td style="display:none;" id="${ c.bCode }"><c:out value="${ c.bCode }"/></td>
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
		      <table class="modalTable">
		      	<tr>
		      		<td><label>분류</label><input type="text" class="ptype" readonly/></td>
		      		<td style="display: none;" class="code"></td>
		      	</tr>
		      	<tr>
		      		<td><label>날짜</label><input type="text" class="date" readonly/></td>
		      	</tr>
		      	<tr>
		      		<td><label>작성자</label><input type="text" class="writer" readonly/></td>
		      	</tr>
		      	<tr>
		      		<td><label>제목</label><input type="text" class="title" readonly/></td>
		      	</tr>
		      	<tr>
		      		<td><label>내용</label><textarea class="content" readonly></textarea></td>
		      	</tr>
		      </table>
	      </div>
	      <!-- Footer -->
	      <div class="modal-footer">
	      	<label style="float: left;">답변내용</label>
	      	<textarea style="width: 100%; height: 200px; resize: none;" class="personalAnswer"></textarea>
	      
	      
	        <button type="button" class="btn btn-default answer" onclick="answer($('.code').val(), $('.personalAnswer').val())">답변하기</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- /.modal -->
	<input type="hidden" value="${ map.pi.maxPage }" id="maxPage"/>
    <input type="hidden" class="type" id="contactTypeChange.ad"/>
    </c:if>
    <c:if test="${ loginUser.mId ne 'admin' || loginUser != null}">
		<c:redirect url="index.jsp"/>
    </c:if>
    <script>
   	
   	$(document).on("click", ".detail", function(){
		var writer = $(this).parent().parent().children().eq(0).text();
		var ptype = $(this).parent().parent().children().eq(1).text();
		var title = $(this).parent().parent().children().eq(2).text();
		var content = $(this).parent().parent().children().eq(3).text();
		var date = $(this).parent().parent().children().eq(4).text();
		var code = $(this).parent().parent().children().last().text();
		
	    $('div.modal').modal();
		
		$(".ptype").val(ptype);
		$(".code").val(code);
		$(".date").val(date);
		$(".writer").val(writer);
		$(".title").val(title);
		$(".content").text(content);
		
	});
   	
   	function answer(code, text){
   		var con = confirm("이 문구 그대로 답변하시겠습니까?"); 
   		
   		if(con == true){
	   		$.ajax({
	   			url: "addAnswer.ad",
	   			type: "post",
	   			data: {"code": code, "content": text},
	   			success: function(data){
	   				
	   			},
	   			error: function(data){
	   				console.log("에러");
	   			}
	   		});
	   		
			$(".personalAnswer").val("");
			
			$(".close").click();
			
			$("#"+code).prev().html("처리완료");
			
   		
   		}else {
   			$(".personalAnswer").focus();
   		}
   	}
   	
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
	   
	       		var list = data.map.clist;
	       		var pi = data.map.pi;
				$("tbody").html("");
	       
	      		for(var i = 0; i < list.length; i++){
	      			$(".values").append("<tr><td>"+list[i].bWriter+"</td><td>"+list[i].bType+"</td><td>"+list[i].bTitle+"</td><td>"+list[i].bContent+"</td><td>"+list[i].bCreateDate+"</td><td class='detailTd'><button class='btn btn-default detail'>자세히 보기</button></td></tr>");
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
                	var list = data.map.clist;
    	       		var pi = data.map.pi;
    	       		console.log(pi.currentPage);
    	       		console.log(list);
    	       		
    	       		
    				$(".values").html("");
    	       
    	      		for(var i = 0; i < list.length; i++){
    	      			$(".values").append("<tr><td>"+list[i].bWriter+"</td><td>"+list[i].bType+"</td><td>"+list[i].bTitle+"</td><td>"+list[i].bContent+"</td><td>"+list[i].bCreateDate+"</td><td class='detailTd'><button class='btn btn-default detail'>자세히 보기</button></td></tr>");
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
	function contactTypeChange(url, type){
        $.ajax({
	    	url: url,
	        type: "get",
	        data:{"newCurrentPage":"1", "type":type},
	        success:function(data){
		       	var list = data.map.clist;
		   		var pi = data.map.pi;
       		
				$(".values").html("");
	       
	      		for(var i = 0; i < list.length; i++){
	      			$(".values").append("<tr><td>"+list[i].bWriter+"</td><td>"+list[i].bType+"</td><td>"+list[i].bTitle+"</td><td>"+list[i].bContent+"</td><td>"+list[i].bCreateDate+"</td><td class='detailTd'><button class='btn btn-default detail'>자세히 보기</button></td></tr>");
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
	}
   	</script>
</body>
</html>
