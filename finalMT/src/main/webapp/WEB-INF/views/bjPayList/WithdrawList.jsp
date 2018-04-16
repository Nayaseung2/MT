<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<c:if test="${ empty list }">
		<script type="text/javascript">
			alert("출금 이력이 없습니다.");
			location.href="${contextPath }/bjPayMain.bjp";
		</script>
	
	</c:if>
	<c:if test="${!empty list }">
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>

	

	<div class="wrapper" >
		<div id="page-wrapper" style="padding-top: 50px;">
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">시간대 별 접속자 수 </div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
			</div>
		</div>

	</div>
	<script type="text/javascript">
	Highcharts.chart('container', {
	    chart: {
	        type: 'spline'
	    },
	    title: {
	        text: 'Snow depth at Vikjafjellet, Norway'
	    },
	    subtitle: {
	        text: 'Irregular time data in Highcharts JS'
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
	            text: 'Snow depth (m)'
	        },
	        min: 0
	    },
	    tooltip: {
	        headerFormat: '<b>{series.name}</b><br>',
	        pointFormat: '{point.x:%e. %b}: {point.y:.2f} m'
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
	        name: "이달의 출금 내역",
	        data: [
	            [Date.UTC(${list[0].wd_date.getYear()+1900},${list[0].wd_date.getMonth()+1},${list[0].wd_date.getDay()+1}), ${list[0].price}],
	            [Date.UTC(${list[1].wd_date.getYear()+1900},${list[1].wd_date.getMonth()+1},${list[1].wd_date.getDay()+1}), ${list[1].price}],
	            [Date.UTC(${list[2].wd_date.getYear()+1900},${list[2].wd_date.getMonth()+1},${list[2].wd_date.getDay()+1}), ${list[2].price}],
	            [Date.UTC(${list[3].wd_date.getYear()+1900},${list[3].wd_date.getMonth()+1},${list[3].wd_date.getDay()+1}), ${list[3].price}],
	            [Date.UTC(${list[4].wd_date.getYear()+1900},${list[4].wd_date.getMonth()+1},${list[4].wd_date.getDay()+1}), ${list[4].price}],
	            [Date.UTC(${list[5].wd_date.getYear()+1900},${list[5].wd_date.getMonth()+1},${list[5].wd_date.getDay()+1}), ${list[5].price}],
	            [Date.UTC(${list[6].wd_date.getYear()+1900},${list[6].wd_date.getMonth()+1},${list[6].wd_date.getDay()+1}), ${list[6].price}],
	            [Date.UTC(${list[7].wd_date.getYear()+1900},${list[7].wd_date.getMonth()+1},${list[7].wd_date.getDay()+1}), ${list[7].price}],
	            [Date.UTC(${list[8].wd_date.getYear()+1900},${list[8].wd_date.getMonth()+1},${list[8].wd_date.getDay()+1}), ${list[8].price}],
	            [Date.UTC(${list[9].wd_date.getYear()+1900},${list[9].wd_date.getMonth()+1},${list[9].wd_date.getDay()+1}), ${list[9].price}],
	            [Date.UTC(${list[10].wd_date.getYear()+1900},${list[10].wd_date.getMonth()+1},${list[10].wd_date.getDay()+1}), ${list[10].price}],
	            [Date.UTC(${list[11].wd_date.getYear()+1900},${list[11].wd_date.getMonth()+1},${list[11].wd_date.getDay()+1}), ${list[11].price}]
	           
	        ]
	    }]
	});
	</script>
	
	</c:if>
	
	
	
	<jsp:include page="../common/footer.jsp"/>
    
	
	 <!-- jQuery -->
    <script src="${contextPath }/resources/js/jquery-1.12.4.min.js"></script>

    <!-- jQuery Easing -->
    <script src="${contextPath }/resources/js/jquery.easing.js"></script>

    <!-- Bootstrap JS -->
    <script src="${contextPath }/resources/js/bootstrap.min.js"></script>

    <!-- pgwSlideshow JS -->
    <script src="${contextPath }/resources/js/pgwslideshow.min.js"></script>

    <!-- Slider JS -->
    <script src="${contextPath }/resources/js/pgwslider.min.js"></script>

    <!-- Owl Carousel JS -->
    <script src="${contextPath }/resources/js/owl.carousel.min.js"></script>

    <!-- YTPlayes JS -->
    <script src="${contextPath }/resources/js/jquery.mb.YTPlayer.min.js"></script>

    <!-- Mega Menu JS -->
    <script src="${contextPath }/resources/js/megamenu.js"></script>    
	
	<!-- lazyload JS -->
    <script src="${contextPath }/resources/js/jquery.lazyload.js"></script>

    <!-- Google Map -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDnh74UN6BKgq9U5fMNGhdZOSpmM_QnZqs"></script>

    <!-- Main JS -->
    <script src="${contextPath }/resources/js/main.js"></script>
	
</body>
</html>