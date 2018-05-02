<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="bjPayleftnev.jsp"/>


	<div class="wrapper">
		<div id="page-wrapper" style="padding-top: 50px;">
			<div class="row">
				<!-- 테이블 -->
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading type" id="BlackList.bjp">블랙회원 리스트</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover" id="tableid">
										<thead>
											<tr>
												<th>NO</th>
												<th>시청자 ID</th>
												<th>시청자 닉네임</th>
												<th>블랙신청일</th>
												<th>블랙여부</th>
												<th>블랙신청 횟수</th>
												<th>블랙 취소</th>
											</tr>
										</thead>
										<tbody>
										<c:set var="i" value="0"/>
										<c:forEach items="${list2}" var="list2" varStatus="i">
											<tr>
												<td>${i.count}</td>
												<td>${list2.live_mcode }</td>
												<td>${list2.live_nic}</td>
												<td>${list2.black_date}</td>
												<c:if test="${list2.black_status == 'Y'}">
													<td>블랙중</td>
												</c:if>
												<c:if test="${list2.black_status == 'N'}">
													<td>블랙취소</td>
												</c:if>
												<td>${list2.black_count}</td>
												<c:if test="${list2.black_status == 'Y'}">
												<td><input type="button" class="checkBtn" value="취소"  /></td>
												</c:if>
												<c:if test="${list2.black_status == 'N'}">
													<td></td>
												</c:if>
											</tr>
										
										</c:forEach>
											
										</tbody>
									</table>
								</div>
								<!-- /.table-responsive -->
								<!-- pageing -->
	                            <div id="pagingArea" align="center">
									<ul class="pagination pageul">
										<li class="page-item"><a class="page-link" onclick="return pageChange($('.active').children().text(),'minus', $('.type').attr('id'))">이전</a></li>
										<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
											<c:if test="${p eq pi.currentPage }">
												<li class="page-item active" id="cu${p }"><a class="page-link" id="page" onclick="return onclickPage($(this).text(), $('.type').attr('id'))">${p}</a></li>
											</c:if>
											<c:if test="${p ne pi.currentPage }">
												<li class="page-item" id="cu${p }"><a class="page-link" id="page" onclick="return onclickPage($(this).text(), $('.type').attr('id'))">${p}</a></li>
											</c:if>
										
										</c:forEach>
										<li class="page-item"><a class="page-link" onclick="return pageChange($('.active').children().text(),'plus', $('.type').attr('id'))">다음</a></li>
									</ul>

								</div>
							</div>
							<!-- /.panel-body -->
						</div>
					</div>
			
			
			
			
			</div>
		</div>
	</div>
	<input type="hidden" value="${ loginUser.mcode }" id="mcode"/>
	<input type="hidden" value="${ pi.maxPage }" id="maxPage"/>
	<script type="text/javascript">

	$(document).on('click', '.checkBtn', function(){
		
		var str = ""
		var checkBtn = $(this);
		
		var tr = checkBtn.parent().parent();
		var td = tr.children();
		
		var mId = td.eq(1).text();
		

		$.ajax({
				url: "blackcancel.bjp",
				type: "get",
				data:{"mId": mId},
				success:function(data){
					if(data.result>0){
						 td.eq(4).text("블랙취소");
						 td.eq(6).empty();
						 
					}else{
						alert("블랙신청 에러");
					}
				},
				error:function(data){
					console.log("에러!");
				}
			});		
		
		
		

	});
	
	
	function onclickPage(value, type){
		var mcode = $("#mcode").val()
		var url = type;			
		console.log($("#cu"+value).children().text())
		console.log(value)
  			$.ajax({
  				url: url,
  				type: "get",
  				data:{"newCurrentPage":value, "mcode": mcode},
  				success:function(data){
  					var list = data.list.list2;
  					var pi = data.list.pi;
  					$("tbody").html("");
  					
  					for(var i = 0; i < list.length; i++){
								
	  					if(list[i].black_status == 'Y'){
	  						$("tbody").append("<tr><td>"+i+"</td><td>"+list[i].live_mcode+"</td><td>"+list[i].live_nic+"</td><td>"+list[i].black_date+"</td><td>"+"블랙중"+"</td><td>"+list[i].black_count+"</td><td><input type='button' value='취소' class='checkBtn' /></td></tr>");
	  					}else if(list[i].black_status == 'N'){
	  						$("tbody").append("<tr><td>"+i+"</td><td>"+list[i].live_mcode+"</td><td>"+list[i].live_nic+"</td><td>"+list[i].black_date+"</td><td>"+"블랙취소"+"</td><td>"+list[i].black_count+"</td><td></td></tr>");
	  					}
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
		
	
	
	function pageChange(pagenum,value, type){
		var page = Number(pagenum);
		var mcode = $("#mcode").val()
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
  				data:{"newCurrentPage":page, "mcode": mcode},
  				success:function(data){
  					var list = data.list.list2;
  					var pi = data.list.pi;
  					$("tbody").html("");
  					
  					for(var i = 0; i < list.length; i++){
  						
  						if(list[i].black_status == 'Y'){
	  						$("tbody").append("<tr><td>"+i+"</td><td>"+list[i].live_mcode+"</td><td>"+list[i].live_nic+"</td><td>"+list[i].black_date+"</td><td>"+"블랙중"+"</td><td>"+list[i].black_count+"</td><td><input type='button' value='취소' class='checkBtn' /></td></tr>");
	  					}else if(list[i].black_status == 'N'){
	  						$("tbody").append("<tr><td>"+i+"</td><td>"+list[i].live_mcode+"</td><td>"+list[i].live_nic+"</td><td>"+list[i].black_date+"</td><td>"+"블랙취소"+"</td><td>"+list[i].black_count+"</td><td></td></tr>");
	  					}
  					}
  					$(".pageul").children().removeClass('active');
  					$("#cu"+page).addClass('active');
  					//$("#tableid").children().children().children().children("input").removeClass('active');
  					//$("#tableid").children().children().children().children("input").addClass('checkBtn')
  					$("#maxPage").attr("value", pi.maxPage)
  				},
  				error:function(data){
  					console.log("에러!");
  				}
  			});
				return false;
			}
		}
	
	</script>


	<jsp:include page="../common/footer.jsp"/>
    
	
	 <!-- jQuery -->
    <script src="/mt/resources/js/jquery-1.12.4.min.js"></script>

    <!-- jQuery Easing -->
    <script src="/mt/resources/js/jquery.easing.js"></script>

    <!-- Bootstrap JS -->
    <script src="/mt/resources/js/bootstrap.min.js"></script>

    <!-- pgwSlideshow JS -->
    <script src="/mt/resources/js/pgwslideshow.min.js"></script>

    <!-- Slider JS -->
    <script src="/mt/resources/js/pgwslider.min.js"></script>

    <!-- Owl Carousel JS -->
    <script src="/mt/resources/js/owl.carousel.min.js"></script>

    <!-- YTPlayes JS -->
    <script src="/mt/resources/js/jquery.mb.YTPlayer.min.js"></script>

    <!-- Mega Menu JS -->
    <script src="/mt/resources/js/megamenu.js"></script>    
	
	<!-- lazyload JS -->
    <script src="/mt/resources/js/jquery.lazyload.js"></script>

    <!-- Google Map -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDnh74UN6BKgq9U5fMNGhdZOSpmM_QnZqs"></script>

    <!-- Main JS -->
    <script src="/mt/resources/js/main.js"></script>

</body>
</html>