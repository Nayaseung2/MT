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
	
	<!-- 비디오 슬라이드 -->
<div class="wide-video-section themeix-ptb bg-semi-white">
        <div class="container">
            <div class="row">
               <div class="col-sm-12">
                 <div class="themeix-section-h">
                      <span class="heading-icon"><i class="fa fa-book"></i></span>
                       <h3>기타</h3> 
                       
                  </div>
               </div>   
            </div>
            <div class="row000">
             <c:forEach var="list" items="${map.list}">
            
                <div class="col-sm-6 col-md-3 themeix-half">
                    <div class="single-video">
                        <div class="video-img">
                                <a href="https://${ip}:8443/mt/testLiveBj.lb#${list.v_href}">
								<img class="lazy" alt="Video" src="${contextPath }/resources/bsTitleImages/${list.f_rename}" style="display: inline; width:260px; height:180px;">
								 <noscript>
									&lt;img src="${contextPath }/resources/images/thumbnails/6.jpg" alt="video" /&gt;
								</noscript>
								</a>
                            <span class="video-duration">${list.starttime}</span>
                        </div>
                        <div class="video-content">
                            <h4><a href="https://${ip}:8443/mt/testLiveBj.lb#${list.v_href}" class="video-title">${list.bsTitle}</a></h4>
                            <div class="video-counter">
                                <div class="video-viewers">
                                    <span class="fa fa-eye view-icon"></span>
                                    <span>${list.v_viewers}</span>
                                </div>
                                <div class="video-feedback">
                                    <div class="video-like-counter">
                                        <span class="fa fa-thumbs-o-up like-icon"></span>
                                        <span>${list.like}</span>
                                    </div>
                                    <div class="video-like-counter">
                                         <span><i class="fa fa-github-alt fa-fw"></i></span>
                                        <span>${list.nickname}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            
            </c:forEach>
                
            </div>
        </div>
        <div id="pagingArea" align="center">
		        <ul class="pagination pageul">
		           <li class="page-item"><a class="page-link" onclick="return pageChange($('.active').children().text(),'minus')">이전</a></li>
		               <c:forEach var="p" begin="${map.pi.startPage}" end="${map.pi.endPage == 0? 1 : map.pi.endPage }">
		                  <c:if test="${p eq map.pi.currentPage }">
		                     <li class="page-item active" id="cu${ p }"><a class="page-link" id="page" onclick="return onclickPage($(this).text())">${ p }</a></li>
		                  </c:if>
		                  <c:if test="${p ne map.pi.currentPage }">
		                     <li class="page-item" id="cu${ p }"><a class="page-link" id="page" onclick="return onclickPage($(this).text())">${ p }</a></li>
		                  </c:if>
		               </c:forEach>
		           <li class="page-item"><a class="page-link" onclick="return pageChange($('.active').children().text(),'plus')">다음</a></li>
		        </ul>
		     </div>
    </div>
      <%--   </div>
    </div>
    
    <!-- 비디오 슬라이드 -->
	
	 <div class="video-carousel-area themeix-ptb bg-semi-white">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="themeix-section-h">
                        <span class="heading-icon"><i class="fa fa-bolt"></i></span>
                        <h3>애니</h3>
                    </div>
                    <div class="video-carousel">
                    
                    <c:forEach begin="1" end="10" step="1">
                    
                        <div class="single-video">
                            <div class="video-img">
                                <a href="single-video.html">
								<img class="lazy" data-src="${contextPath }/resources/images/thumbnails/1.jpg" alt="Video" />
								 <noscript>
									<img src="${contextPath }/resources/images/thumbnails/1.jpg" alt="video" />
								</noscript>
								</a>
                                <span class="video-duration">8.17</span>
                            </div>
                            <div class="video-content">
                                <h4><a href="single-video.html" class="video-title">Greek-Style Pasta Bake (Pasticcio) - English Video</a></h4>
                                <div class="video-counter">
                                    <div class="video-viewers">
                                        <span class="fa fa-eye view-icon"></span>
                                        <span>881,021</span>
                                    </div>
                                    <div class="video-feedback">
                                        <div class="video-like-counter">
                                            <span class="fa fa-thumbs-o-up like-icon"></span>
                                            <span>120</span>
                                        </div>
                                        <div class="video-like-counter">
                                            <span class="fa fa-thumbs-o-down dislike-icon"></span>
                                            <span>2140</span>
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
    
    <!-- 비디오 슬라이드 -->
	
	 <div class="video-carousel-area themeix-ptb bg-semi-white">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="themeix-section-h">
                        <span class="heading-icon"><i class="fa fa-bolt"></i></span>
                        <h3>지상파/케이블</h3>
                    </div>
                    <div class="video-carousel">
                    
                    <c:forEach begin="1" end="10" step="1">
                    
                        <div class="single-video">
                            <div class="video-img">
                                <a href="single-video.html">
								<img class="lazy" data-src="${contextPath }/resources/images/thumbnails/1.jpg" alt="Video" />
								 <noscript>
									<img src="${contextPath }/resources/images/thumbnails/1.jpg" alt="video" />
								</noscript>
								</a>
                                <span class="video-duration">8.17</span>
                            </div>
                            <div class="video-content">
                                <h4><a href="single-video.html" class="video-title">Greek-Style Pasta Bake (Pasticcio) - English Video</a></h4>
                                <div class="video-counter">
                                    <div class="video-viewers">
                                        <span class="fa fa-eye view-icon"></span>
                                        <span>881,021</span>
                                    </div>
                                    <div class="video-feedback">
                                        <div class="video-like-counter">
                                            <span class="fa fa-thumbs-o-up like-icon"></span>
                                            <span>120</span>
                                        </div>
                                        <div class="video-like-counter">
                                            <span class="fa fa-thumbs-o-down dislike-icon"></span>
                                            <span>2140</span>
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
    
    <!-- 비디오 슬라이드 -->
	
	 <div class="video-carousel-area themeix-ptb bg-semi-white">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="themeix-section-h">
                        <span class="heading-icon"><i class="fa fa-bolt"></i></span>
                        <h3>성인</h3>
                    </div>
                    <div class="video-carousel">
                    
                    <c:forEach begin="1" end="10" step="1">
                    
                        <div class="single-video">
                            <div class="video-img">
                                <a href="single-video.html">
								<img class="lazy" data-src="${contextPath }/resources/images/thumbnails/1.jpg" alt="Video" />
								 <noscript>
									<img src="${contextPath }/resources/images/thumbnails/1.jpg" alt="video" />
								</noscript>
								</a>
                                <span class="video-duration">8.17</span>
                            </div>
                            <div class="video-content">
                                <h4><a href="single-video.html" class="video-title">Greek-Style Pasta Bake (Pasticcio) - English Video</a></h4>
                                <div class="video-counter">
                                    <div class="video-viewers">
                                        <span class="fa fa-eye view-icon"></span>
                                        <span>881,021</span>
                                    </div>
                                    <div class="video-feedback">
                                        <div class="video-like-counter">
                                            <span class="fa fa-thumbs-o-up like-icon"></span>
                                            <span>120</span>
                                        </div>
                                        <div class="video-like-counter">
                                            <span class="fa fa-thumbs-o-down dislike-icon"></span>
                                            <span>2140</span>
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
    </div> --%>
	
	
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
	function onclickPage(value){
		var url = "etc.cg"; 
		$.ajax({
   			url: url,
   			type: "get",
   			data:{"newCurrentPage":value},
   			success:function(data){
	       		var list = data.map.list;
	       		var pi = data.map.pi;
				$(".row000").html("");
				for(var i = 0; i < list.length; i++){
					$(".row000").append("<div class='col-sm-6 col-md-3 themeix-half'><div class='single-video'><div class='video-img'><a href='https://${ip}:8443/mt/testLiveBj.lb#"+list[i].v_href+"'><img class='lazy' alt='Video' src='${contextPath }/resources/bsTitleImages/"+list[i].f_rename+"' style='display: inline; width:260px; height:180px;'><noscript>&lt;img src='${contextPath }/resources/images/thumbnails/6.jpg' alt='video' /&gt;</noscript></a><span class='video-duration'>"+ list[i].starttime +"'</span></div><div class='video-content'><h4><a href='https://${ip}:8443/mt/testLiveBj.lb#"+ list[i].v_href +"' class='video-title'>"+ list[i].bsTitle +"</a></h4><div class='video-counter'><div class='video-viewers'><span class='fa fa-eye view-icon'></span><span>"+ list[i].v_viewers +"</span></div><div class='video-feedback'><div class='video-like-counter'><span class='fa fa-thumbs-o-up like-icon'></span><span>"+ list[i].like +"</span></div><div class='video-like-counter'><span><i class='fa fa-github-alt fa-fw'></i></span><span>"+list[i].nickname+"</span></div></div></div></div></div></div>");
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
    
     function pageChange(pagenum, value){
        var page = Number(pagenum);
        var url = "etc.cg";         
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
                data:{"newCurrentPage":page},
                success:function(data){
                	var list = data.map.list;
    	       		var pi = data.map.pi;
    				$(".row000").html("");
    	      		for(var i = 0; i < list.length; i++){
    	      			$(".row000").append("<div class='col-sm-6 col-md-3 themeix-half'><div class='single-video'><div class='video-img'><a href='https://${ip}:8443/mt/testLiveBj.lb#"+list[i].v_href+"'><img class='lazy' alt='Video' src='${contextPath }/resources/bsTitleImages/"+list[i].f_rename+"' style='display: inline; width:260px; height:180px;'><noscript>&lt;img src='${contextPath }/resources/images/thumbnails/6.jpg' alt='video' /&gt;</noscript></a><span class='video-duration'>"+ list[i].starttime +"'</span></div><div class='video-content'><h4><a href='https://${ip}:8443/mt/testLiveBj.lb#"+ list[i].v_href +"' class='video-title'>"+ list[i].bsTitle +"</a></h4><div class='video-counter'><div class='video-viewers'><span class='fa fa-eye view-icon'></span><span>"+ list[i].v_viewers +"</span></div><div class='video-feedback'><div class='video-like-counter'><span class='fa fa-thumbs-o-up like-icon'></span><span>"+ list[i].like +"</span></div><div class='video-like-counter'><span><i class='fa fa-github-alt fa-fw'></i></span><span>"+list[i].nickname+"</span></div></div></div></div></div></div>");
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
        }
  		
	</script>

</body>
</html>