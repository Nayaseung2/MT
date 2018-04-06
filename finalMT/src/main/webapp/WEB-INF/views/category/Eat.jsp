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
	
	<!--     전체 무한스크롤 구현 필요 -->
    <div class="wide-video-section themeix-ptb bg-semi-white">
        <div class="container">
            <div class="row">
               <div class="col-sm-12">
                 <div class="themeix-section-h">
                      <span class="heading-icon"><i class="fa fa-book"></i></span>
                       <h3>먹방</h3> 
                       
                  </div>
               </div>   
            </div>
            <div class="row">
            <c:forEach begin="1" end="30" step="1" >
            
                <div class="col-sm-6 col-md-3 themeix-half">
                    <div class="single-video">
                        <div class="video-img">
                                <a href="single-video.html">
								<img class="lazy" alt="Video" src="${contextPath }/resources/images/thumbnails/6.jpg" style="display: inline;">
								 <noscript>
									&lt;img src="${contextPath }/resources/images/thumbnails/6.jpg" alt="video" /&gt;
								</noscript>
								</a>
                            <span class="video-duration">5.28</span>
                        </div>
                        <div class="video-content">
                            <h4><a href="single-video.html" class="video-title">Buffalo Chicken Potato Skins</a></h4>
                            <div class="video-counter">
                                <div class="video-viewers">
                                    <span class="fa fa-eye view-icon"></span>
                                    <span>241,021</span>
                                </div>
                                <div class="video-feedback">
                                    <div class="video-like-counter">
                                        <span class="fa fa-thumbs-o-up like-icon"></span>
                                        <span>2140</span>
                                    </div>
                                    <div class="video-like-counter">
                                         <span class="fa fa-thumbs-o-down dislike-icon"></span>
                                        <span>2140</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            
            </c:forEach>
                

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