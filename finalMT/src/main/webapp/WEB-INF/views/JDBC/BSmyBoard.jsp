<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
	.BSContainer{ width:100%;height:1500px;}
	.icon{width:850px;height:80px;margin-left:160px;}
	.BSframe{border:1px solid black;margin-left:auto;margin-right:auto;
		border-radius:10px;width:1200px;height:1200px;}
	.showBSname{width:1200px;height:150px;background: rgba(235, 104, 100, 0.5);border-radius:5px 5px 0px 0px;}	
	.profileImg{width:80px;height:80px;margin-left:100px;}
	.BStitle{position:relative;left:100px;bottom:60px;}
	.BStext{color:white;}
	#BStexta{text-decoration:none;color:white;}
	.memberInfo{width:1000px;height:650px;border-radius:0px 0px 5px 5px;}
	.myInfo{margin-left:20px;margin-top:10px;width:200px;height:200px;border:1px solid #b3b3b3;}
	.idnickname{margin-left:15px; }
	.introduction{border-radius:5px; width:170px; border:1px solid lightgray;margin-left:15px;height:60px;}
	.bottomBox{margin-left:20px;
		width:200px;
		height:200px;
		border:1px solid #b3b3b3;
		cursor:pointer;}
	.bottomBox td{border-bottom:1px dotted lightgray;}
	.bottom{color:black; text-decoration:none; margin-left:15px;}
	.showRightPart{position:relative; width:940px; height:800px; 
	left:240px;bottom:640px;}
	
	/* 글쓰기 테이블 */
	.writeTable{
		margin-left:30px;
		width:750px;
	}
	.writeTable th{
		width:100px;
		height:30px;
		text-align:center;
	}
	.writeTable tr{
		height:35px;
	}
	.equal{
		width:20px;
	}
	/* 이미지 올리기 */
	.inputImg{
		margin-left:30px;
		border:1px solid lightgray;
	}/*  */
	.okay{
		width:160px;
		height:30px;
		background:rgba(235, 104, 100, 0.5);
		border:none;
		color:white;
	}
	
	
	
	
	
	table {
		border-top:1px solid #F08080;
		border-bottom:1px solid #F08080;
		padding-left: 3%;
	}
	
	#listArea {
		width:80%;
		font-size: 14px;
		margin-top: 3%;
	}
	
	#listArea th {
		text-align: center;
		border-bottom:1px solid #F08080;
		height: 35px;
	}
	
	#listArea tr {
		height: 35px;
		text-: 3%;
	}

	
	
	
	
	
	
	
	
</style>
<title>내 게시판</title>
<!-- ckeditor -->
<script src="<%= request.getContextPath()%>/resources/ckeditor/ckeditor.js">
</script>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>
<div class="BSContainer">
<jsp:include page="../common/menubar.jsp" /> 
<div class="BSframe">
<div class="showBSname">
<br>
<!-- 회원 이미지 넣기 -->
<div class="profileImg">
<img alt="회원 이미지" src="<%= request.getContextPath() %>/resources/images/logo.png"style="width:80px; height:80px;">
<div class="BStitle">
<c:if test="${!empty jdbcInfo.jdbc_name }">
<label class="BStext"><a id="BStexta"href="#">${jdbcInfo.jdbc_name }</a></label><br>
</c:if>
<c:if test="${empty jdbcInfo.jdbc_name }">
<label class="BStext"><a id="BStexta"href="#">모두의TV</a></label><br>
</c:if>
<label class="BStext">${loginUser.nickName }</label><br>
</div>
</div>
</div>
<!-- 회원정보관리  -->
<div class="memberInfo">
<!-- 좌측 회원 정보,자기소개등 보기 -->
<div class="myInfo">
<br>
<label class="idnickname"><b>${loginUser.mId }</b></label><br>
<span class="idnickname">${loginUser.nickName }</span>
<span class="glyphicon glyphicon-cog" style="float:right;"><a style="text-decoration:none; color:black; cursor:pointer;" id="showManage" href="showBSmanage.JDBC"><b>관리</b></a></span><br>
<c:if test="${!empty jdbcInfo.jdbc_name }">
<input class="introduction" type="text" value="${jdbcInfo.jdbc_introduce}" readonly>
</c:if>
<c:if test="${empty jdbcInfo.jdbc_name }">
<input class="introduction" type="text" value="자기소개가 없습니다." readonly>
</c:if>
<br><br> <br>  
<label style="margin-left:15px;">방송국 방문 : 0명</label>
</div>
<br>
<button style="margin-left:20px;border:1px solid #ff6699;width:200px; background:white;height:40px;" onclick="location.href='JDBCwrite.JDBC'">글쓰기</button><br/><br/>
<button style="margin-left:20px;border:1px solid #ff6699;width:200px; background:white;height:40px;" onclick="location.href='bangsonggo.JDBC'">방송하러가기</button>
<br><br>
<table class="bottomBox">
	<tr>
		<td>
			<p><a class="bottom">즐겨찾기 BJ</a></p>
		</td>
	</tr>
	<tr>
		<td>
			<p><a class="bottom" href="BSmyBoard.board?mId=${ loginUser.mId }">일반 게시판</a></p>
			<p><a class="bottom" href="showGuestBookList.JDBC">방명록</a></p>
		</td>
	</tr>
	<tr>
		<td>
			<p><a class="bottom">수익관리</a></p>
		</td>
	</tr>
</table>
</div>
<!-- 오른쪽 부분 -->
<div class="showRightPart">
<br/>
<br/>

			<h4 align="center">내 게시판</h4>		
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
						<c:forEach var="item" items="${ hmap.mbList }">
							<tr>
								<td style="padding-left: 3%;"><c:out value="${ item.b_title }"/></td>
								<td style="padding-left: 3%;" colspan="3"><c:out value="${ item.b_content }"/></td>
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
</div>
	<input type="hidden" value="${ loginUser.mId }" id="mId" name="mId">
   <input type="hidden" value="${ hmap.pi.maxPage }" id="maxPage"/>
  	<script>
  	
 	 	function onclickPage(value){
 	 		
	        console.log($("#cu"+value).children().text())
	        console.log(value)
	             
	             $.ajax({
	                url: "BSmyBoard.board",
	                type: "get",
	  				data:{"newCurrentPage":value},
	                success:function(data){
	                	
	                	var list = data.hmap.mbList;
	  					var pi = data.hmap.pi;
	  					console.log(list);
	  					console.log(pi);
	                   
	                   $("#listArea").html("");
	                   
	                   $("#listArea").append("<tr><th>제목</th><th>내용<th></th>작성일</th></tr>");
	                   
	                   for(var i = 0; i < list.length; i++){
	                      
	                	   $("#listArea").append("<tr><td style='padding-left: 3%;'>" + list[i].b_title
									 + "</td><td align='center'>" + list[i].b_content 
									 + "</td><td align='center'>" + list[i].b_create_date 
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
	  				url: "BSmyBoard.board",
	  				type: "get",
	  				data:{"newCurrentPage":page},
	  				success:function(data){

	  					var list = data.hmap.mbList;
	  					var pi = data.hmap.pi;
	  					console.log(list);
	  					console.log(pi);
	  					
	  					$("#listArea").html("");
	  					
	  					$("#listArea").append("<tr><th>제목</th><th>내용<th></th>작성일</th></tr>");
		                   
		                   for(var i = 0; i < list.length; i++){
		                      
		                	   $("#listArea").append("<tr><td style='padding-left: 3%;'>" + list[i].b_title
										 + "</td><td align='center'>" + list[i].b_content 
										 + "</td><td align='center'>" + list[i].b_create_date 
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
  		
  		
  		$(function(){
			
			$("#listArea td").mouseenter(function(){
					//tr의 css를 변경
				$(this).parent().css({"background":"rgba(235, 104, 100, 0.1)", "cursor":"pointer"});
					
			}).mouseout(function(){
				
				$(this).parent().css({"background":"white", "color":"black"});
				
			}).click(function(){
				
				var b_code = $(this).parent().children(":last").children().val();
				console.log(b_code);
				//location.href="${ contextPath }/helpnoticedetail.hp?b_code=" + b_code;
			});
		});
  		
  		
  		
	</script> 
</body>
</html>