<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>모두의 TV</title>
<!-- sdf -->
<style>

@import url(//fonts.googleapis.com/earlyaccess/hanna.css);

.outer {
	width: 95%;
	margin-top: 2%;
	margin-left: 2%;
	margin-right: 2%;
	font-family: 'Hanna', sans-serif;
}

.sidebar {
	display: inline-block;
	float: left;
}

.rightNav {
	display: inline-block;
	margin-left: 2%;
	width: 80%;
}

.sideBtn {
	width: 300px;
	height: 100px;
	margin-bottom: 2%;
	border-right: 3px solid hsl(0, 0%, 94%);
	border-bottom: 3px solid hsl(0, 100%, 90%);
	border-left: 0px solid white;
	border-top: 0px solid white;
	background-color: rgba(255, 255, 255, 0.5);
	font-size: 20px;
	text-align: left;
	padding-left: 15%;
}

.sideBtn:hover {
	border: 3px solid hsl(0, 100%, 75%);
	border-radius: 30px;
}

table {
	border-top:5px solid #F08080;
	border-bottom:5px solid #F08080;
	padding-left: 3%;
}

#listArea {
	width:80%;
	font-size: 20px;
	margin-top: 3%;
}

#listArea th {
	text-align: center;
	border-bottom:2px solid #F08080;
	height: 65px;
}

#listArea tr {
	height: 60px;
	text-: 3%;
}


</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link href="${ contextPath }/resources/css/fontawesome.min.css">

</head>
<body>

	<jsp:include page="../common/menubar.jsp" /> 

	<br />
	<br />

	<!-- 위에 배너 시작 -->
	<div class="page-banner-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="page-banner">
						<div class="page-title" style="font-family: 'Hanna', sans-serif;">
							<h1>Customer Service</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 위에 배너 끝 -->

	<!-- 위에 배너 빼고 전체 div 시작 -->
	<div class="outer">

		<div class="sidebar">
			<button class="sideBtn" onclick="personal();"><i class="fa fa-edit fa-2x"></i>&nbsp;&nbsp; 1:1 문의</button>
			<br />
			<button class="sideBtn" onclick="helpMain();"><i class="fa fa-search fa-2x"></i>&nbsp;&nbsp; 자주묻는 질문</button>
			<br />
			<button class="sideBtn" onclick="notice();"><i class="fa fa-bullhorn fa-2x"></i>&nbsp;&nbsp; 공지사항</button>
			<br />
			<button class="sideBtn" onclick="report();"><i class="fa fa-frown-o fa-2x"></i>&nbsp;&nbsp; 신고하기</button>
		</div>
		
		<c:if test="${ empty loginUser }">
			<script>
				
				function personal(){
					
					alert("로그인이 필요한 서비스입니다.");
				}
				
				function helpMain(){
					
					location.href="${ contextPath }/helpmain.hp";				
				}
			
				function notice(){
					
					location.href="${ contextPath }/helpnotice.hp";	
				}
				
				function report(){
					
					alert("로그인이 필요한 서비스입니다.");
				}
				
			</script>
		</c:if> 
		
		<c:if test="${ !empty loginUser }">
			<script>
				
				function personal(){
					
					location.href="${ contextPath }/helppersonal.hp";
				}
				
				function helpMain(){
					
					location.href="${ contextPath }/helpmain.hp";				
				}
			
				function notice(){
					
					location.href="${ contextPath }/helpnotice.hp";	
				}
				
				function report(){
					
					location.href="${ contextPath }/helpreport.hp"
				}
				
			</script>
		</c:if>

		<div class="rightNav">
					
			<h1 style="font-family: 'Hanna', sans-serif;">공지사항</h1>		
			<br/>
				<div class="tableArea">
					<table align="center" id="listArea">
						<!-- table header -->
						<tr>
							<th>글제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>
						<c:forEach var="item" items="${ hmap.nList }">
							<tr>
								<td style="padding-left: 3%;"><c:out value="${ item.b_title }"/></td>
								<td align="center"><c:out value="${ item.bwriter }"/></td>
								<td align="center"><c:out value="${ item.b_count }"/></td>
								<td align="center"><c:out value="${ item.b_update_date }"/></td>
								<td><input type="hidden" value="${ item.b_code }" id="b_code" name="b_code"></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<br/>
				<br/>
				<div id="pagingArea" align="center">
				
					<ul class="pagination pageul">
				
					<!-- <button class="btn btn-danger" style="font-size:16px;" onclick="return pageChange('minus')"> 이전 </button>&nbsp;&nbsp; -->
					<li class="page-item"><a class="page-link" onclick="return pageChange('minus')">이전</a></li>
					
						
						<!-- 가운데 나오는 페이지 숫자들 -->
					<c:forEach var="p" begin="${ hmap.pi.startPage }" end="${ hmap.pi.endPage }">
						
						<c:if test="${ p eq hmap.pi.currentPage }">
							<%-- <font color="red" size="4" id="page"><b>${ p }</b></font> --%>
							
							<li class="page-item active" id="cu${ p }">
								<a class="page-link" id="page" onclick="return onclickPage($(this).text())">${ p }</a>
							</li>
							
						</c:if>
						<c:if test="${ p ne hmap.pi.currentPage }">
							<%-- <font color="lightgray" size="4"><b>${ p }</b></font> --%>
							
							 <li class="page-item" id="cu${ p }">
							 	<a class="page-link" id="page" onclick="return onclickPage($(this).text())">${ p }</a>
							 </li>
							
						</c:if> 
						
					</c:forEach> 
					
					<!-- &nbsp;&nbsp; <button class="btn btn-danger" style="font-size:16px;" onclick="return pageChange('plus')"> 다음 </button> -->
					<li class="page-item"><a class="page-link" onclick="return pageChange('plus')">다음</a></li>
					
					</ul>
				</div>
			</div>
			
    <input type="hidden" value="${ hmap.pi.maxPage }" id="maxPage"/>
  	<script>
  	
  	
  	
  	
 	 	function onclickPage(value){
 	 		
	        console.log($("#cu"+value).children().text())
	        console.log(value)
	             
	             $.ajax({
	                url: "helpnotice.hp",
	                type: "get",
	  				data:{"newCurrentPage":value},
	                success:function(data){
	                	
	                	var list = data.hmap.nList;
	  					var pi = data.hmap.pi;
	  					console.log(list);
	  					console.log(pi);
	                   
	                   $("#listArea").html("");
	                   
	                   $("#listArea").append("<tr><th>글제목</th><th>작성자</th><th>조회수</th><th>작성일</th></tr>");
	                   
	                   for(var i = 0; i < list.length; i++){
	                      
	                	   $("#listArea").append("<tr><td style='padding-left: 3%;'>" + list[i].b_title
									 + "</td><td align='center'>" + list[i].bwriter
									 + "</td><td align='center'>" + list[i].b_count
									 + "</td><td align='center'>" + list[i].b_update_date 
									 + "</td><td><input type='hidden' value='" + list[i].b_code + "' id='b_code' name='b_code'>"
									 + "</td></tr>");
	                   }
	                   
	                   $(function(){
	  						
	  						$("#listArea td").mouseenter(function(){
	  								//tr의 css를 변경
	  							$(this).parent().css({"background":"#F08080", "cursor":"pointer", "color":"white"});
	  								
	  						}).mouseout(function(){
	  							
	  							$(this).parent().css({"background":"white", "color":"black"});
	  							
	  						}).click(function(){
	  							
	  							var b_code = $(this).parent().children(":last").children().val();
	  							location.href="${ contextPath }/helpnoticedetail.hp?b_code=" + b_code;
	  						});
	  					});
	                   
	                   
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
	        

  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  		function pageChange(value){
  			
  			var page = Number($("#page").text());
  			
			if(page >= 1 && page <= $("#maxPage").val()){
				
	  			if(value === 'plus'){
	  				
	  				if(page == $("#maxPage").val()){
	  					return;
	  				}
	  				
	  				page += 1;
	  				
	  			}else if(value === 'minus'){
	  				
	  				/* if(page === 1){
	  					
	  					return;
	  				} */
	  				
	  				page -= 1;
	  			}
	  			
	  			$.ajax({
	  				url: "helpnotice.hp",
	  				type: "get",
	  				data:{"newCurrentPage":page},
	  				success:function(data){

	  					var list = data.hmap.nList;
	  					var pi = data.hmap.pi;
	  					console.log(list);
	  					console.log(pi);
	  					
	  					$("#listArea").html("");
	  					
	  					$("#listArea").append("<tr><th>글제목</th><th>작성자</th><th>조회수</th><th>작성일</th></tr>");
	  					
	  					for(var i = 0; i < list.length; i++){
		  					$("#listArea").append("<tr><td style='padding-left: 3%;'>" + list[i].b_title
		  										 + "</td><td align='center'>" + list[i].bwriter
		  										 + "</td><td align='center'>" + list[i].b_count
		  										 + "</td><td align='center'>" + list[i].b_update_date 
		  										 + "</td><td><input type='hidden' value='" + list[i].b_code + "' id='b_code' name='b_code'>"
		  										 + "</td></tr>");
	  					}
	  					
	  					$(function(){
	  						
	  						$("#listArea td").mouseenter(function(){
	  								//tr의 css를 변경
	  							$(this).parent().css({"background":"#F08080", "cursor":"pointer", "color":"white"});
	  								
	  						}).mouseout(function(){
	  							
	  							$(this).parent().css({"background":"white", "color":"black"});
	  							
	  						}).click(function(){
	  							
	  							var b_code = $(this).parent().children(":last").children().val();
	  							location.href="${ contextPath }/helpnoticedetail.hp?b_code=" + b_code;
	  						});
	  					});
	  					
	  					/* $("#page").text(page);
	  					$("#maxPage").attr("value", pi.maxPage); */
	  					
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
			
				$(function(){
					
					$("#listArea td").mouseenter(function(){
							//tr의 css를 변경
						$(this).parent().css({"background":"#F08080", "cursor":"pointer", "color":"white"});
							
					}).mouseout(function(){
						
						$(this).parent().css({"background":"white", "color":"black"});
						
					}).click(function(){
						
						var b_code = $(this).parent().children(":last").children().val();
						location.href="${ contextPath }/helpnoticedetail.hp?b_code=" + b_code;
					});
				});
				
			</script> 
		</div>
	<!-- 위에 배너 빼고 전체 div 끝 -->

	<br />
	<br />
	<br />
	<br />
	<br />
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>