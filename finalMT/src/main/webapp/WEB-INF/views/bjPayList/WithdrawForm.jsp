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
	<div class="wrapper">
		<div id="page-wrapper" style="padding-top: 50px;">
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-comments fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">${loginUser.peach}</div>
									<div>출금 가능 peach</div>
								</div>
							</div>
						</div>
						
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tasks fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">${loginUser.peach * 70}</div>
                                    <div>출금 가능 금액</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tasks fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">${loginUser.peach}</div>
                                    <div>출금 한 peach</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tasks fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">${loginUser.peach * 70}</div>
                                    <div>출금 한 금액</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

			</div>

			<div class="row" >
			<div class="col-lg-3"></div>
			<div class="col-lg-6">
                    <div class="panel panel-warning">
                        <div class="panel-heading">출금 신청</div>
                        <div class="panel-body">
                        	<form action="">
                            <div class="form-group">
								<label for="disabledSelect">회원 아이디</label> 
								<input class="form-control" id="disabledInput" type="text" value="${loginUser.mId}" disabled>
								<input id="disabledInput" type="hidden" value="${loginUser.mcode}">
							</div>
							<div class="form-group">
								<label for="disabledSelect">회원 이름</label> 
								<input class="form-control" id="disabledInput" type="text" value="${loginUser.mName}" disabled>
							</div>
							<div class="form-group">
								<label for="disabledSelect">계좌 번호</label> 
								<input class="form-control" id="disabledInput" type="text" value="${loginUser.account}" disabled>
							</div>
							<button type="button" class="btn btn-outline btn-primary btn-lg btn-block">계좌번호 변경하기</button>
							<br><br>
							
							<div class="form-group">
								<label for="disabledSelect">출금 신청 peach 수량</label> 
								<input class="form-control" id="disabledInput" type="number" value="500" step="10"  min="500" max="${loginUser.peach }">
								<p>보유 peach가 500개 이상 이어야만 환전신청이 가능 합니다. peach 1개 당 70원으로 환전됩니다.</p>							
							</div>
							<div class="form-group" align="center">
								<div class="checkbox">
									<label> <input type="checkbox" value="">출금 신청을 할 경우 3일 ~ 5일정도 소요됩니다.</label>
								</div>
							</div>
							<div class="form-group" align="center">
                        	<button type="submit" class="btn btn-default">출금 신청</button>
                        	<button type="reset" class="btn btn-default">출금 취소</button>
                        	</div>
                        	</form>
                        </div>

                    </div>
                </div>
                <div class="col-lg-3"></div>
				
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