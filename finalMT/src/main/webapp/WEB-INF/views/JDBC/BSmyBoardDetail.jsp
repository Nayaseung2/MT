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
	.BSContainer{ width:100%;height:1700px;}
	.icon{width:850px;height:80px;margin-left:160px;}
	.BSframe{border:1px solid black;margin-left:auto;margin-right:auto;
		border-radius:10px;width:1200px;height:1450px;}
	.showBSname{width:1200px;height:150px;background: rgba(235, 104, 100, 0.5);border-radius:5px 5px 0px 0px;}	
	.profileImg{width:100px;height:80px;margin-left:70px; padding-top: auto; padding-bottom: auto;}
	.BStitle{position:relative;left:100px;bottom:60px;width: 250px; padding-left:40%;}
	.BStext{ padding-left: 10px; }
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
	.showRightPart{position:relative; width:940px;  height: 1250px;
	left:240px;bottom:640px;background-color: rgba(255, 245, 244, 0.7);}
	
	.equal{
		width:20px;
	}
	/* 이미지 올리기 */
	.inputImg{
		margin-left:30px;
		border:1px solid lightgray;
	}/*  */
	.okay{
		width:80px;
		height:30px;
		background:rgba(235, 104, 100, 0.5);
		border:none;
		color:white;
	}
	
	.okay2{
		width:100px;
		height:30px;
		background:rgba(235, 104, 100, 0.9);
		border:none;
		color:white;
	}
	
	
	table {
		border-top:2px solid #F08080;
		border-bottom:2px solid #F08080;
		padding-left: 3%;
	}
	
	#listArea {
		width:80%;
		height:400px;
		font-size: 16px;
		margin-top: 3%;
		text-align: center;
	}
	
	#listArea tr {
		height: 50px;
		border-bottom:1px solid #F08080;
	}

	#listArea td {
		width: 100px;
	}
	
	.tdClass {
		border-right:1px solid #F08080;
	}
	
	
	.sideBtn {
		 margin-left: 20px;
		 border: 2px solid rgba(235, 104, 100, 0.5);
		 width: 200px; 
		 background: white;
		 height: 40px;"
	}
	
	.rTable {
		border-bottom: 2px solid #F08080;
		text-align: center;
	}
	
	.rTable th {
		text-align: center;
		border-top: 2px solid #F08080;
		border-bottom: 2px solid #F08080;
		height: 40px;
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
<br/>
<br/>
<div class="BSframe">
<div class="showBSname">
<br>
<!-- 회원 이미지 넣기 -->
<div class="profileImg">
<c:if test="${!empty jdbcLogoFile }">
<img alt="회원 이미지" src="<%= request.getContextPath() %>/resources/jdbcStationFileLogo/${jdbcLogoFile.f_rename}"style="width:100px; height:80px;">
</c:if>
<c:if test="${empty jdbcLogoFile }">
<img alt="회원 이미지" src="${ contextPath }/resources/images/logo_JDBC.png"style="width:100px; height:80px;">
</c:if>
<div class="BStitle">
<c:if test="${!empty jdbcInfo.jdbc_name }">
<label class="BStext" style="font-size: 25px;"><a id="BStexta"href="${ contextPath }/bjJDBC.JDBC?mid=${jdbcInfo.mid}">${jdbcInfo.jdbc_name }</a></label><br>
</c:if>
<c:if test="${empty jdbcInfo.jdbc_name }">
<label class="BStext" style="font-size: 25px;"><a id="BStexta"href="${ contextPath }/myBroadcastStation.JDBC">모두의 TV</a></label><br>
</c:if>
<label class="BStext" style="font-size: 16px; color: white;">${jdbcInfo.mid}님의 방송국입니다!</label><br>
</div>
</div>
</div>
<!-- 회원정보관리  -->
<div class="memberInfo">
<!-- 좌측 회원 정보,자기소개등 보기 -->
<div class="myInfo">
<br>
<label class="idnickname"><b>${jdbcInfo.mid }</b></label><br>
<span class="idnickname">${jdbcInfo.jdbc_name }</span>
<c:if test="${ loginUser.mId eq jdbcInfo.mid }">
	<span class="glyphicon glyphicon-cog" style="float:right; padding-right:5%;">
		<a style="text-decoration:none; color:black;" id="showManage" href="showBSmanage.JDBC"><b>관리</b></a>
	</span><br>
</c:if>
<c:if test="${ loginUser.mId ne jdbcInfo.mid }">
	<br/>
</c:if>
<br/>
<c:if test="${empty jdbcInfo.jdbc_introduce }">
<input class="introduction" type="text" value="자기소개가 없습니다." style="padding-left: 3%;" readonly>
</c:if>
<c:if test="${!empty jdbcInfo.jdbc_introduce }">
<input class="introduction" type="text" value="${jdbcInfo.jdbc_introduce }" readonly>
</c:if>
<br><br>
</div>
<c:if test="${ loginUser.mId eq jdbcInfo.mid }">
<br>
	<button class="sideBtn" onclick="location.href='JDBCwrite.JDBC'">글쓰기</button><br><br>
	<button class="sideBtn" onclick="location.href='bangsonggo.JDBC'">방송하러가기</button>
<br>
</c:if>
<br/>
<table class="bottomBox">
	<tr>
		<td>
			<p><a class="bottom">구독중인 BJ</a></p>
		</td>
	</tr>
	<tr> 	
		<td>
			<p><a class="bottom" href="BSmyBoard.board?mId=${ jdbcInfo.mid }">게시판</a></p>
			<p><a class="bottom" href="guestBookList.board?mId=${ jdbcInfo.mid }">방명록</a></p>
		</td>
	</tr>
	<c:if test="${ loginUser.mId eq jdbcInfo.mid }">
		<tr>
			<td>
				<p><a class="bottom">수익관리</a></p>
			</td>
		</tr>
	</c:if>
</table>
</div>

<!-- 오른쪽 부분 -->
<div class="showRightPart">
<br/>
<br/>

	<h3 align="center"><b>" ${ jdbcInfo.mid } "님의 게시판 입니다.</b></h3>		
	<br/>
		<div class="tableArea">
			<table align="center" id="listArea">
				<!-- table header -->
				<tr>
					<td class="tdClass"><b>제 목</b></td>
					<td colspan="5"><c:out value="${ hmap.mbListDetail.b_title }" /></td>
				</tr>
				<tr>
					<td class="tdClass" rowspan="5"><b>내 용</b></td>
					<td rowspan="5" colspan="5">
						<br/><br/>
						${ hmap.mbListDetail.b_content }
						<br/><br/>
						<img src="${ contextPath }/resources/BoardFile/${ hmap.mbListDetailP.f_rename }" style="padding-left: 5%; max-height:180px; max-width:300px" />
						<br/><br/><br/>
					</td>
				</tr>
				<tfoot>
				<tr>
					<td class="tdClass"><b>댓글 쓰기</b></td>
					<td colspan="5">
						<br>
						<textarea id="replyContent" cols="65%" rows="2" placeholder="댓글을 입력하세요." style="resize:none;"></textarea>
						<button class="okay"style="float:right; height:48px;" onclick="reply();">댓글쓰기</button>
						<br><br>
					</td>
				</tr>
				</tfoot>
			</table>
			<br/><br/>
			
			<div style="display: block;">
				<c:if test="${ loginUser.mId eq jdbcInfo.mid }">
					<div align="right" style="padding-right: 70px;">
						<button type="button" class="okay" onclick="modifyBtn();">수정하기</button>
						<button type="button" class="okay" onclick="deleteBtn();">삭제하기</button>
					</div>
				</c:if>
		</div>
			<input type="hidden" id="bwriter" name="bwriter" value="${hmap.mbListDetail.bwriter}">
			<input type="hidden" id="bCode" name="b_code" value="${hmap.mbListDetail.b_code}">
			<br>
			<br/>
			<h4 style="margin-left:92px;"><b>댓글</b></h4>
			<div id="reply" style=" width:780px; height:200px; margin-left:92px;">
			 	<table style=" width:780px; height:200px;" align="center" class="rTable">
			 		<thead>
			 		<tr class="first">
			 			<th colspan="5" text-align="center">작성자</th>
			 			<th colspan="20" text-align="center">내용</th>
			 			<th colspan="5" text-align="center">작성일</th>
			 		</tr>
			 		</thead>
			 		<tbody class="tbody">
			 		<c:forEach var="list" items="${hmap.list}">
						<tr>
							<td colspan="5" text-align="center">
								<div text-align="center">${list.r_writer}</div>
							</td>
							<td colspan="20" text-align="center">	
								<div text-align="center">${list.r_content}</div>
							</td>
							<td colspan="5" text-align="center">
								<div text-align="center">${list.r_create_date}</div>
							</td>
						</tr>	 	
			 		</c:forEach>
			 		</tbody>
			 	</table>
			 	<br/><br/><br/>
			<div id="pagingArea" align="center">
		        <ul class="pagination pageul">
		           <li class="page-item"><a class="page-link" onclick="return pageChange($('.active').children().text(),'minus')">이전</a></li>
		               <c:forEach var="p" begin="${ hmap.pi.startPage}" end="${hmap.pi.endPage == 0? 1 : hmap.pi.endPage }">
		                  <c:if test="${p eq hmap.pi.currentPage }">
		                     <li class="page-item active" id="cu${ p }"><a class="page-link" id="page" onclick="return onclickPage($(this).text())">${ p }</a></li>
		                  </c:if>
		                  <c:if test="${p ne hmap.pi.currentPage }">
		                     <li class="page-item" id="cu${ p }"><a class="page-link" id="page" onclick="return onclickPage($(this).text())">${ p }</a></li>
		                  </c:if>
		               </c:forEach>
		           <li class="page-item"><a class="page-link" onclick="return pageChange($('.active').children().text(),'plus')">다음</a></li>
		        </ul>
		     </div>
			</div>
		
		</div>
		<br/>
		<br/>
		<br/><br/><br/><br/><br/><br/><br/>
		<div align="center">
			<button type="button" class="okay2" onclick="listBtn();">목록으로</button>
		</div>
		<input type="hidden" id="maxPage" value="${ hmap.pi.maxPage }"/>
		<script>
		
			function modifyBtn(){
				
				var b_code = $("#bCode").val();
				var bwriter = $("#bwriter").val();
				console.log(b_code);
				console.log(bwriter);
				location.href="${ contextPath }/BSmodify.board?b_code=" + b_code + "&bwriter=" + bwriter;
			}
			
			function deleteBtn(){
				
				var b_code = "${ hmap.mbListDetail.b_code }";
				location.href="${ contextPath }/BSmyBoardDelete.board?b_code=" + b_code;
			}
			
			function listBtn(){
				
				var mId = "${ jdbcInfo.mid }";
				location.href="${ contextPath }/BSmyBoard.board?mId=" + mId;
			}
			
			
			function onclickPage(value){
				var url = "replyPage.board";
				var b_code = $("#bCode").val();
				
				$.ajax({
		   			url: url,
		   			type: "get",
		   			data:{"newCurrentPage":value, "b_code":b_code },
		   			success:function(data){
			       		var list = data.map.list;
			       		var pi = data.map.pi;
						$(".tbody").html("");
						console.log(list);
						console.log(pi);
						for(var i = 0; i < list.length; i++){
							$(".tbody").append('<tr><td colspan="5" text-align="center"><div text-align="center">'+list[i].r_writer+'</div></td><td colspan="20" text-align="center"><div text-align="center">'+list[i].r_content+'</div></td><td colspan="5" text-align="center"><div text-align="center">'+list[i].r_create_date+'</div></td></tr>');
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
			 };
			function pageChange(pagenum, value){
		        var page = Number(pagenum);
		        var url = "replyPage.board";       
		        var b_code = $("#bCode").val();
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
		                data:{"newCurrentPage":page, "b_code":b_code},
		                success:function(data){
		                	var list = data.map.list;
		    	       		var pi = data.map.pi;
		    				$(".tbody").html("");
		    	      		for(var i = 0; i < list.length; i++){
		    	      			$(".tbody").append('<tr><td colspan="5" text-align="center"><div text-align="center">'+list[i].r_writer+'</div></td><td colspan="20" text-align="center"><div text-align="center">'+list[i].r_content+'</div></td><td colspan="5" text-align="center"><div text-align="center">'+list[i].r_create_date+'</div></td></tr>');
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
		        };
			function reply(){
				var replyContent = $("#replyContent").val();
				console.log(replyContent);
				var writer = "${loginUser.mId}";
				var boardno = "${ hmap.mbListDetail.b_code }";
				$.ajax({
					url:"insertReply.board",
					type:"post",
					data:{
						"replyContent":replyContent,
						"writer":writer,
						"boardno":boardno
					},
					success:function(data){
						$("#replyContent").val("");
						
						$(".tbody").children().last().remove();
						$(".tbody").prepend('<tr><td colspan="5" text-align="center"><div text-align="center">'+writer+'</div></td><td colspan="20" text-align="center"><div text-align="center">'+replyContent+'</div></td><td colspan="5" text-align="center"><div text-align="center">'+data.date+'</div></td></tr>');
						
					}
				});
			};
		</script>

</div>
</div>
</div>
</body>
</html>