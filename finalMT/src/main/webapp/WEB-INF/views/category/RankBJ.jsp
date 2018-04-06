<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="../common/leftnev.jsp"/>
	<div class="container">
	<br>
	<br>
	<br>
	
		<div class="col-md-offset-1 col-md-3 col-sm-4"
			style="margin-left: 0px;">

			<!-- 베스트 BJ 폼 시작 -->

			<div class="right-sidebar">

				<!-- 아이콘 + 폼 title 시작 -->

				<div class="themeix-section-h">
					<span class="heading-icon"><i class="fa fa-html5"></i></span>
					<h3>Top 5 먹방BJ</h3>
				</div>

				<!-- 아이콘 + 폼 title 끝 -->
				<c:forEach begin="1" end="5" step="1">


					<div class="single-contributor">
						<div class="contributor-img">

							<!-- BJ 사진 -->
							<a href="#"><img src="${contextPath }/resources/images/bjSemple/bj1.jpg" alt="team"></a>
						</div>

						<!-- BJ 이름 + 설명 -->
						<div class="contributor-content">
							<h4>
								<a href="#" class="heading-link">철구형2@</a>
							</h4>
							<p>구독자 200000</p>
							<p>2001.03.22</p>
						</div>
					</div>

				</c:forEach>
				<!-- BJ 한명 폼 시작 -->




			</div>

		</div>
		
				<div class="col-md-offset-1 col-md-3 col-sm-4"
			style="margin-left: 0px;">

			<!-- 베스트 BJ 폼 시작 -->

			<div class="right-sidebar">

				<!-- 아이콘 + 폼 title 시작 -->

				<div class="themeix-section-h">
					<span class="heading-icon"><i class="fa fa-html5"></i></span>
					<h3>Top 5 게임BJ</h3>
				</div>

				<!-- 아이콘 + 폼 title 끝 -->
				<c:forEach begin="1" end="5" step="1">


					<div class="single-contributor">
						<div class="contributor-img">

							<!-- BJ 사진 -->
							<a href="#"><img src="${contextPath }/resources/images/bjSemple/bj2.jpg" alt="team"></a>
						</div>

						<!-- BJ 이름 + 설명 -->
						<div class="contributor-content">
							<h4>
								<a href="#" class="heading-link">킴성태</a>
							</h4>
							<p>구독자440000</p>
							<p>2003.12.23</p>
						</div>
					</div>

				</c:forEach>
				<!-- BJ 한명 폼 시작 -->




			</div>

		</div>
				<div class="col-md-offset-1 col-md-3 col-sm-4"
			style="margin-left: 0px;">

			<!-- 베스트 BJ 폼 시작 -->

			<div class="right-sidebar">

				<!-- 아이콘 + 폼 title 시작 -->

				<div class="themeix-section-h">
					<span class="heading-icon"><i class="fa fa-html5"></i></span>
					<h3>Top 5 토크BJ</h3>
				</div>

				<!-- 아이콘 + 폼 title 끝 -->
				<c:forEach begin="1" end="5" step="1">


					<div class="single-contributor">
						<div class="contributor-img">

							<!-- BJ 사진 -->
							<a href="#"><img src="${contextPath }/resources/images/bjSemple/bj3.jpg" alt="team"></a>
						</div>

						<!-- BJ 이름 + 설명 -->
						<div class="contributor-content">
							<h4>
								<a href="#" class="heading-link">뜨뜨뜨뜨</a>
							</h4>
							<p>구독자 107777</p>
							<p>2015.11.12</p>
						</div>
					</div>

				</c:forEach>
				<!-- BJ 한명 폼 시작 -->




			</div>

		</div>
				<div class="col-md-offset-1 col-md-3 col-sm-4"
			style="margin-left: 0px;">

			<!-- 베스트 BJ 폼 시작 -->

			<div class="right-sidebar">

				<!-- 아이콘 + 폼 title 시작 -->

				<div class="themeix-section-h">
					<span class="heading-icon"><i class="fa fa-html5"></i></span>
					<h3>Top 5 스포츠BJ</h3>
				</div>

				<!-- 아이콘 + 폼 title 끝 -->
				<c:forEach begin="1" end="5" step="1">


					<div class="single-contributor">
						<div class="contributor-img">

							<!-- BJ 사진 -->
							<a href="#"><img src="${contextPath }/resources/images/bjSemple/bj4.jpg" alt="team"></a>
						</div>

						<!-- BJ 이름 + 설명 -->
						<div class="contributor-content">
							<h4>
								<a href="#" class="heading-link">벤쯔</a>
							</h4>
							<p>구독자1000222</p>
							<p>2013.01.03</p>
						</div>
					</div>

				</c:forEach>
				<!-- BJ 한명 폼 시작 -->




			</div>

		</div>
		


	</div>


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