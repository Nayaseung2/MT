<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<jsp:include page="bjPayleftnev.jsp"/>
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

	    title: {
	        text: '시간대별 접속자 수'
	    },

	    xAxis: {
	        tickInterval: 1
	    },

	    yAxis: {
	        type: 'logarithmic',
	        minorTickInterval: 0.1
	    },

	    tooltip: {
	        headerFormat: '<b>{series.name}</b><br />',
	        pointFormat: 'x = {point.x}, y = {point.y}'
	    },

	    series: [{
	        data: [1, 2, 4, 8, 16, 32, 64, 128, 256, 512],
	        pointStart: 1
	    }]
	});
	</script>
	
	
	
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