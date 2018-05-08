<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>모두의 TV</title>
<style>
/*  body{
 overflow-y:scroll;
 } */
 .video-carousel{
 height:250px;
 }
 .wide-video-section{
 height:500px;
 }
</style>

</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="../common/leftnev.jsp"/>


	<!-- 비디오 슬라이드 -->
	
	 <div class="video-carousel-area themeix-ptb bg-semi-white">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="themeix-section-h">
                        <span class="heading-icon"><i class="fa fa-bolt"></i></span>
                        <h3>오늘의 BJ</h3>
                    </div>
                    <div class="video-carousel">
                    
                    <c:forEach var="item" items="${list1}">
                    
                        <div class="single-video">
                            <div class="video-img">
                                <a href="https://${ip}:8443/mt/testLiveBj.lb#${item.v_href}">
								<img class="lazy" data-src="${contextPath }/resources/bsTitleImages/${item.f_rename}" alt="Video" style="width:260px; height:180px;"/>
								 <noscript>
									<img src="${contextPath }/resources/images/thumbnails/1.jpg" alt="video" />
								</noscript>
								</a>
                                <span class="video-duration">${item.starttime}</span>
                            </div>
                            <div class="video-content">
                                <h4><a href="https://${ip}:8443/mt/testLiveBj.lb#${item.v_href}" class="video-title">${item.bsTitle}</a></h4>
                                <div class="video-counter">
                                    <div class="video-viewers">
                                        <span class="fa fa-eye view-icon"></span>
                                        <span>${item.v_viewers}</span>
                                    </div>
                                    <div class="video-feedback">
                                        <div class="video-like-counter">
                                            <span class="fa fa-thumbs-o-up like-icon"></span>
                                            <span>${item.like}</span>
                                        </div>
                                        <div class="video-like-counter">
                                         <span><i class="fa fa-github-alt fa-fw"></i></span>
                                        <span>${item.nickname}</span>
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    
                    </c:forEach>

                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
<!--     전체 무한스크롤 구현 필요 -->
    <div class="wide-video-section themeix-ptb bg-semi-white">
        <div class="container">
            <div class="row">
               <div class="col-sm-12">
                 <div class="themeix-section-h">
                      <span class="heading-icon"><i class="fa fa-book"></i></span>
                       <h3>전체</h3> 
                       
                  </div>
               </div>   
            </div>
            <div class="row000">

            <c:forEach var="item" items="${list}">
            
                <div class="col-sm-6 col-md-3 themeix-half"  style="height:285px; width:271.97px;">
                    <div class="single-video">
                        <div class="video-img">
                                <a href="https://${ip}:8443/mt/testLiveBj.lb#${item.v_href}">
								<img class="lazy" alt="Video" src="${contextPath }/resources/bsTitleImages/${item.f_rename}" style="display: inline; width:260px; height:180px;">
								 <noscript>
									&lt;img src="${contextPath }/resources/images/thumbnails/6.jpg" alt="video" /&gt;
								</noscript>
								</a>
                            <span class="video-duration">${item.starttime}</span>
                        </div>
                        <div class="video-content">
                            <%-- <h4><a href="WatchView.lb?nick=${item.nickname}&content=${item.bsContent}&title=${item.bsTitle}&href=${item.v_href}" class="video-title">${item.bsTitle}</a></h4> --%>
                            <h4><a href="https://${ip}:8443/mt/testLiveBj.lb#${item.v_href}" class="video-title">${item.bsTitle}</a></h4>
                            <div class="video-counter">
                                <div class="video-viewers">
                                    <span class="fa fa-eye view-icon"></span>
                                    <span>${item.v_viewers}</span>
                                </div>
                                <div class="video-feedback">
                                    <div class="video-like-counter">
                                        <span class="fa fa-thumbs-o-up like-icon"></span>
                                        <span>${item.like}</span>
                                    </div>
                                    <div class="video-like-counter">
                                         <span><i class="fa fa-github-alt fa-fw"></i></span>
                                        <span>${item.nickname}</span>
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
    <input type="hidden" id="scrollNum" value='1'/>
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
	
	<script>
		$(document).ready(function(){
			$(window).scroll(function(){
				var scrollHeight = $(window).scrollTop()+$(window).height();
				//var documentHeight =$(window).height();
				var documentHeight =$(document).height();
				var num = $("#scrollNum").val();
				var num1 = Number(num);
				
				if(scrollHeight >= (documentHeight)){
				console.log("뭐냐"+ num1);
					$.ajax({
						url:"scroll.lb",
						type:"POST",
						data:{
							"num":num1
						},success:function(data){
							var list = data.list;
							console.log("list.size"+ list.length);
							if(list.length == 0){
								console.log("잉");
								
							}else{
								console.log("잉");
								var num2 = num1 + 1;
								console.log("보이"+num2);
								$("#scrollNum").val(num2);
								console.log($("#scrollNum").val());
								for(var i=0;  i < list.length ;i++){
									$(".row000").append("<div class='col-sm-6 col-md-3 themeix-half' style='height:285px; width:271.97px;'><div class='single-video'><div class='video-img'><a href='https://${ip}:8443/mt/testLiveBj.lb#"+list[i].v_href+"'><img class='lazy' alt='Video' src='${contextPath }/resources/bsTitleImages/"+list[i].f_rename+"' style='display: inline; width:260px; height:180px;'><noscript>&lt;img src='${contextPath }/resources/images/thumbnails/6.jpg' alt='video' /&gt;</noscript></a><span class='video-duration'>"+ list[i].starttime +"'</span></div><div class='video-content'><h4><a href='https://${ip}:8443/mt/testLiveBj.lb#"+ list[i].v_href +"' class='video-title'>"+ list[i].bsTitle +"</a></h4><div class='video-counter'><div class='video-viewers'><span class='fa fa-eye view-icon'></span><span>"+ list[i].v_viewers +"</span></div><div class='video-feedback'><div class='video-like-counter'><span class='fa fa-thumbs-o-up like-icon'></span><span>"+ list[i].like +"</span></div><div class='video-like-counter'><span><i class='fa fa-github-alt fa-fw'></i></span><span>"+list[i].nickname+"</span></div></div></div></div></div></div>");
								}
							}
						}
					});
				}
			});
		});
	</script>
	
</body>
</html>