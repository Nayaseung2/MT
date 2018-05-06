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
<script src="https://code.highcharts.com/js/highcharts.js"></script>
<script src="https://code.highcharts.com/js/modules/exporting.js"></script>
<style type="text/css">

#container {
	height: 400px;
	max-width: 800px;
	margin: 0 auto;
}
#container2 {
	height: 400px;
	max-width: 800px;
	margin: 0 auto;
}


</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="bjPayleftnev.jsp"/>

	<div class="wrapper">
		<div id="page-wrapper" style="padding-top: 50px;">
			<div class="row">
				<div class="col-lg-6">
					<div class="panel panel-default">
						<div class="panel-heading">방송시간관리
							<button class="btn btn-outline btn-info" id="plain">세로</button>
							<button class="btn btn-outline btn-info" id="inverted">가로</button>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="container"	style="min-width: 310px; height: 400px; margin: 0 auto"></div>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<div class="col-lg-6">
					<div class="panel panel-default">
						<div class="panel-heading">시청자 관리
						<button class="btn btn-outline btn-info" id="plain2">세로</button>
						<button class="btn btn-outline btn-info" id="inverted2">가로</button>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="container2" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	var allLiveTime = ${allLiveTime};
	var TodayLiveTime = ${TodayLiveTime};
	var LiveTimeYday = ${LiveTimeYday};
	
	

var chart = Highcharts.chart('container', {

    title: {
        text: '방송시간관리'
    },

    xAxis: {
        categories: ['누적방송시간', '오늘의 방송시간', '전날 방송시간']
    },
    tooltip: {
       pointFormat: '{point.y: f}시간'
   },

    series: [{
        type: 'column',
        colorByPoint: true,
        data: [allLiveTime, TodayLiveTime, LiveTimeYday],
        showInLegend: false
    }]

});


$('#plain').click(function () {
    chart.update({
        chart: {
            inverted: false,
            polar: false
        },
       
    });
});

$('#inverted').click(function () {
    chart.update({
        chart: {
            inverted: true,
            polar: false
        },
       
    });
});
var TodaySeeUser = ${TodaySeeUser};
var allSeeUser = ${allSeeUser};
var SeeUserY = ${SeeUserY};
var chart2 = Highcharts.chart('container2', {

    title: {
        text: '시청자 관리'
    },
    tooltip: {
        pointFormat: '{point.y: f}명'
    },

    xAxis: {
        categories: ['누적 시청자수', '오늘의 시청자수', '전날 시청자수']
    },

    series: [{
        type: 'column',
        colorByPoint: true,
        data: [allSeeUser, TodaySeeUser, SeeUserY],
        showInLegend: false
    }]

});


$('#plain2').click(function () {
    chart2.update({
        chart: {
            inverted: false,
            polar: false
        },
       
    });
});

$('#inverted2').click(function () {
    chart2.update({
        chart: {
            inverted: true,
            polar: false
        },
      

    });
});
	
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