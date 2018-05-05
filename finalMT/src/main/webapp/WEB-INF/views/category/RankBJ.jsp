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
				<c:forEach var="item" items="${list1}">


					<div class="single-contributor">
						<div class="contributor-img">

							<!-- BJ 사진 -->
							<a href="bjJDBC.JDBC?mid=${item.mid}"><img class="lazy" alt="Video" src="${contextPath }/resources/bsTitleImages/${item.f_rename}" style="display: inline;"></a>
						</div>

						<!-- BJ 이름 + 설명 -->
						<div class="contributor-content">
							<h4>
								<a href="bjJDBC.JDBC?mid=${item.mid}" class="heading-link">${item.nickname}</a>
							</h4>
							<p>${item.v_viewers}</p>
							<p>${item.bsTitle}</p>
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
				<c:forEach var="item" items="${list2}">


					<div class="single-contributor">
						<div class="contributor-img">

							<!-- BJ 사진 -->
							<a href="bjJDBC.JDBC?mid=${item.mid}"><img class="lazy" alt="Video" src="${contextPath }/resources/bsTitleImages/${item.f_rename}" style="display: inline;"></a>
						</div>

						<!-- BJ 이름 + 설명 -->
						<div class="contributor-content">
							<h4>
								<a href="bjJDBC.JDBC?mid=${item.mid}" class="heading-link">${item.nickname}</a>
							</h4>
							<p>${item.v_viewers}</p>
							<p>${item.bsTitle}</p>
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
				<c:forEach var="item" items="${list3}">


					<div class="single-contributor">
						<div class="contributor-img">

							<!-- BJ 사진 -->
							<a href="bjJDBC.JDBC?mid=${item.mid}"><img class="lazy" alt="Video" src="${contextPath }/resources/bsTitleImages/${item.f_rename}" style="display: inline;"></a>
						</div>

						<!-- BJ 이름 + 설명 -->
						<div class="contributor-content">
							<h4>
								<a href="bjJDBC.JDBC?mid=${item.mid}" class="heading-link">${item.nickname}</a>
							</h4>
							<p>${item.v_viewers}</p>
							<p>${item.bsTitle}</p>
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
				<c:forEach var="item" items="${list4}">


					<div class="single-contributor">
						<div class="contributor-img">

							<a href="bjJDBC.JDBC?mid=${item.mid}"><img class="lazy" alt="Video" src="${contextPath }/resources/bsTitleImages/${item.f_rename}" style="display: inline;"></a>
						</div>

						<!-- BJ 이름 + 설명 -->
						<div class="contributor-content">
							<h4>
								<a href="bjJDBC.JDBC?mid=${item.mid}" class="heading-link">${item.nickname}</a>
							</h4>
							<p>${item.v_viewers}</p>
							<p>${item.bsTitle}</p>
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