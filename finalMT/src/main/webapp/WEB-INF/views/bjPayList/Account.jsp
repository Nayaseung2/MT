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
	
	<!-- 로그인 User가 0일때 -->
<c:if test="${ empty loginUser }">
	<script type="text/javascript">
		$(function(){
			alert("로그인 세션이 만료되었습니다. 다시로그인 해주세요.");
			location.href="${ contextPath }/showLoginPage.me";
		});
	</script>
</c:if>	
<c:if test="${ !empty loginUser }">

	<div class="wrapper">
		<div id="page-wrapper" style="padding-top: 50px;">
			<div class="row" >
			<div class="col-lg-3"></div>
			<div class="col-lg-6">
                    <div class="panel panel-warning">
                        <div class="panel-heading">계좌 번호 변경</div>
                        <div class="panel-body">
                        	<form action="" method="post" id="Withdrawinsert">
                            <div class="form-group">
								<label for="disabledSelect">회원 아이디</label> 
								<input class="form-control" id="mId" name="mid" type="text" value="${loginUser.mId}" disabled>
								<input id="mcode" name="mcode" type="hidden" value="${loginUser.mcode}">
							</div>
							<div class="form-group">
								<label for="disabledSelect">회원 이름</label> 
								<input class="form-control" id="mName" type="text" value="${loginUser.mName}" disabled>
							</div>
							<div class="form-group">
								<label for="disabledSelect">계좌 번호</label> 
								<input class="form-control" id="account1" name="account1" type="text" value="${loginUser.account}">
								<input id="account" name="account" type="hidden" value="${loginUser.account}">
							</div>
							<button type="button" onclick="accountSet();" class="btn btn-outline btn-primary btn-lg btn-block">계좌번호 변경하기</button>
							<br><br>
							
							<div class="form-group">
								<label for="disabledSelect">출금 신청 peach 수량</label> 
								<input class="form-control" id="peach" name="peach" type="number" value="500" step="10"  min="500" max="${loginUser.peach }">
								<p>보유 peach가 500개 이상 이어야만 환전신청이 가능 합니다. peach 1개 당 70원으로 환전됩니다.</p>							
							</div>
							<div class="form-group" align="center">
								<div class="checkbox">
									<label>출금 신청을 할 경우 3일 ~ 5일정도 소요됩니다.</label>
								</div>
							</div>
							<div class="form-group" align="center">
                        	<button onclick="AccountAPI();" class="btn btn-default">출금 신청</button>
                        	<button onclick="accountReset();" class="btn btn-default">출금 취소</button>
                        	</div>
                        	</form>
                        </div>
				<button onclick="AccountAPI();" class="btn btn-default">출금 신청</button>

                    </div>
                </div>
                <div class="col-lg-3"></div>
				
			</div>
		</div>
	</div>
	<script type="text/javascript">
		
		function AccountAPI(){

  			$.ajax({
  				url: "https://openapi.open-platform.or.kr/inquiry/real_name",
  				type: "post",
  				data:
  				{
  				  "bank_code_std": "fc9c75f3ddce4d0c9bfa2b8f5a0e954b",
  				  "account_num": "1122334455",
  				  "account_holder_info": "8801011",
  				  "tran_dtime": "20160824150711"
  				},
  				success:function(data){
  					console.log(data)
  					console.log("성공")
  				},
  				error:function(data){
  					console.log("에러!");
  				}
  			});
		}
		function accountSuccess(){
			$("#Withdrawinsert").submit();	
		}
		function accountReset(){
			$("#Withdrawinsert").reset();
		}
	
	
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