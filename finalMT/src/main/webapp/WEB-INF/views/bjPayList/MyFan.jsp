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
	
	
	<c:if test="${ empty list2 }">
		<script type="text/javascript">
			alert("팬이 없습니다. 방송을 시작하세요!!");
			location.href="${contextPath }/bjPayMain.bjp";
		</script>
	
	</c:if>
	<c:if test="${!empty list2 }">
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>

	

	<div class="wrapper" >
		<div id="page-wrapper" style="padding-top: 50px;">
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">이달의 구독자 리스트 </div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				
				<!-- 테이블 -->
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading type" id="MyFan.bjp">내팬 리스트</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th>NO</th>
												<th>구독자 ID</th>
												<th>구독자 닉네임</th>
												<th>구독날짜</th>
											</tr>
										</thead>
										<tbody>
										<c:set var="i" value="0"/>
										<c:forEach items="${list2}" var="list2" varStatus="i">
											<tr>
												<td>${i.count}</td>
												<td>${list2.reader_mid }</td>
												<td>${list2.reader_nic}</td>
												<td>${list2.read_date }</td>
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
  						$("tbody").append("<tr><td>"+i+"</td><td>"+list[i].reader_mid+"</td><td>"+list[i].reader_nic+"</td><td>"+list[i].read_date+"</td></tr>");
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
  						$("tbody").append("<tr><td>"+i+"</td><td>"+list[i].reader_mid+"</td><td>"+list[i].reader_nic+"</td><td>"+list[i].read_date+"</td></tr>");
  						$("button").addClass('blackBtn');
  					}
  					$(".pageul").children().removeClass('active');
  					$("#cu"+page).addClass('active');
  					$("#maxPage").attr("value", pi.maxPage)
  				},
  				error:function(data){
  					console.log("에러!");
  				}
  			});
				return false;
			}
		}
	
	
	
	
	
	Highcharts.chart('container', {
	    chart: {
	        type: 'spline'
	    },
	    title: {
	        text: '이달의 구독자 수'
	    },
	    xAxis: {
	        type: 'datetime',
	        dateTimeLabelFormats: { // don't display the dummy year
	            month: '%e. %b',
	            year: '%b'
	        },
	        title: {
	            text: 'Date'
	        }
	    },
	    yAxis: {
	        title: {
	            text: '출금금액'
	        },
	        min: 0
	    },
	    tooltip: {
	        headerFormat: '<b>{series.name}</b><br>',
	        pointFormat: '{point.x:%e. %b}: {point.y: f}원'
	    },

	    plotOptions: {
	        spline: {
	            marker: {
	                enabled: true
	            }
	        }
	    },

	    colors: ['#6CF', '#39F', '#06C', '#036', '#000'],
	    // Define the data points. All series have a dummy year
	    // of 1970/71 in order to be compared on the same x axis. Note
	    // that in JavaScript, months start at 0 for January, 1 for February etc.
	    series: [{
	        name: "이달의 구독자 수",
	        data: [
	        	<c:forEach items="${dayList}" var="dayList">
	        		[Date.UTC(${fn:split(dayList.read_date,"-")[0]},${fn:split(dayList.read_date,"-")[1]-1},${fn:split(dayList.read_date,"-")[2]}), ${dayList.reader_num}],
	    		</c:forEach>
	        	
	           
	        ]
	    }]
	});
	
	
	$(".blackBtn").click(function(){
		var BlackBtn = $(this);
		var tr = BlackBtn.parent().parent();
		var td = tr.children();
		var mid = td.eq(1).text();
		console.log(mid);
		
	})
	
	
	</script>
	
	</c:if>
	
	
	
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