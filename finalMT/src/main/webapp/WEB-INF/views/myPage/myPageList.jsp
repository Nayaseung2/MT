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




/* =============== */

#dialog-background {
    display: none;
    position: fixed;
    top: 0; left: 0;
    width: 100%; height: 100%;
    background: rgba(0,0,0,.3);
    z-index: 10;
}

#my-dialog {
    display: none;
    position: fixed;
    left: calc( 50% - 330px ); top: calc( 50% - 200px );
    width: 650px; height: 250px; 
    background: #fff;
    z-index: 11;
    padding: 10px;
}

#anArea {
	font-size: 20px; 
	font-family: 'Hanna', sans-serif;
	height: 180px;
	text-align: center;
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

	<!-- 위에 배너 빼고 전체 div 시작 -->
	<div class="outer">

			<h1 style="font-family: 'Hanna', sans-serif;" align="center">내 문의 내역</h1>		
			<br/>
				<div class="tableArea">
					<table align="center" id="listArea">
						<!-- table header -->
						<tr>
							<th>제목</th>
							<th colspan="3">내용</th>
							<th>작성일</th>
							<th></th>
						</tr>
						<c:forEach var="item" items="${ hmap.pList }">
							<tr>
								<td style="padding-left: 3%;"><c:out value="${ item.b_title }"/></td>
								<td style="padding-left: 3%;" colspan="3"><c:out value="${ item.b_content }"/></td>
								<td align="center"><c:out value="${ item.b_update_date }"/></td>
								<td><button id="btn-open-dialog" class="btn btn-danger">답변보기</button></td>
								<td><input type="hidden" value="${ item.bwriter }" id="mId" name="mId"></td>
								<td><input type="hidden" value="${ item.b_code }" id="b_code" name="b_code"></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				
				<!-- 답변 창 -->  
				<div id="my-dialog">
				
					<pre id="anArea">
						<c:out value="${ hmap.paList[0].r_content }"/>
					</pre>

					<div align="center">
				    	<button class="btn btn-danger" id="btn-close-dialog">창 닫기</button>
					</div>
				</div>
				
				<div id="dialog-background"></div>
				
				
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
	                url: "myPageList.mp",
	                type: "get",
	  				data:{"newCurrentPage":value},
	                success:function(data){
	                	
	                	var list = data.hmap.pList;
	  					var pi = data.hmap.pi;
	  					console.log(list);
	  					console.log(pi);
	                   
	                   $("#listArea").html("");
	                   
	                   $("#listArea").append("<tr><th>제목</th><th>내용<th></th>작성일</th></tr>");
	                   
	                   for(var i = 0; i < list.length; i++){
	                      
	                	   $("#listArea").append("<tr><td style='padding-left: 3%;'>" + list[i].b_title
									 + "</td><td align='center'>" + list[i].b_content 
									 + "</td><td align='center'>" + list[i].b_create_date 
									 + "</td><td align='center'><button class='btn btn-danger' id='btn-open-dialog'>답변보기</button>"
									 + "</td><td><input type='hidden' value='" + list[i].bwriter + "' id='mId' name='mId'>"
									 + "</td><td><input type='hidden' value='" + list[i].b_code + "' id='b_code' name='b_code'>"
									 + "</td></tr>");
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
	  				url: "myPageList.mp",
	  				type: "get",
	  				data:{"newCurrentPage":page},
	  				success:function(data){

	  					var list = data.hmap.pList;
	  					var pi = data.hmap.pi;
	  					console.log(list);
	  					console.log(pi);
	  					
	  					$("#listArea").html("");
	  					
	  					$("#listArea").append("<tr><th>제목</th><th>내용<th></th>작성일</th></tr>");
		                   
		                   for(var i = 0; i < list.length; i++){
		                      
		                	   $("#listArea").append("<tr><td style='padding-left: 3%;'>" + list[i].b_title
										 + "</td><td align='center'>" + list[i].b_content 
										 + "</td><td align='center'>" + list[i].b_create_date 
										 + "</td><td align='center'><button class='btn btn-danger' id='btn-open-dialog'>답변보기</button>"
										 + "</td><td><input type='hidden' value='" + list[i].bwriter + "' id='mId' name='mId'>"
										 + "</td><td><input type='hidden' value='" + list[i].b_code + "' id='b_code' name='b_code'>"
										 + "</td></tr>");
		                   }
	  					
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
			
  		
  		
  		/* 답변 창 */
  		
  		$(function(){
  			
  			$("#btn-open-dialog,#dialog-background,#btn-close-dialog").click(function () {
  				
  				$("#my-dialog,#dialog-background").toggle();
  			});
  			
  			$("#listArea td").click(function(){
  				
				var b_code = $(this).parent().children(":last").children().val();
				console.log(b_code);
				
				$.ajax({
					url: "myPageListAnswer.mp",
					type: "get",
					data: {"b_code": b_code},
					success: function(data){
						if(data.hmap.paList[0] != null){
							$("#anArea").text("\n" + data.hmap.paList[0].r_content);
						}else {
							$("#anArea").text("\n 죄송합니다.\n 아직 등록 된 답변이 없습니다.");
						}
					}
				});
  			});
  		});
			</script> 
	<!-- 위에 배너 빼고 전체 div 끝 -->

	<br />
	<br />
	<br />
	<br />
	<br />
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>