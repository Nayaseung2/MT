<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="/mt/resources/css/left/bootstrap.min.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="/mt/resources/css/left/metisMenu.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="/mt/resources/css/left/sb-admin-2.css" rel="stylesheet">
<!-- Morris Charts CSS -->
<link href="/mt/resources/css/left/morris.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 아임포트 결제  -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>


<title>모두의 TV 피치결제 </title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
<c:if test="${!empty loginUser }">

	<div class="container" style="margin-top: 5%;">
		<div class="row">
			<div class="col-md-12">
				<div align="left" style="width: 50%; height: 30%;">
					&nbsp;&nbsp;&nbsp;
					<img src="${contextPath }/resources/images/pay/peach.png" style="width: 20%">&nbsp;&nbsp;&nbsp;
					<label style="font-size: 200%;">&nbsp;&nbsp;&nbsp;보유 피치 수 : ${loginUser.peach}개</label>
				</div>
				<br><br>
				<table style="text-align: center;">
					<tr  style="padding: 3%">
						<td style="width: 15%; padding: 1%;"><img src="${contextPath }/resources/images/pay/peach.png" ></td>
						<td><h3>피치 10개</h3><h3>1,100원</h3></td>
						<td><button onclick="pay(1100, 10);" class="w3-btn w3-white w3-border w3-border-blue w3-round-large">구매하기</button></td>
						<td style="width: 15%; padding: 1%;"><img src="${contextPath }/resources/images/pay/peach2.png"></td>
						<td><h3>피치 30개</h3><h3>3,300원</h3></td>
						<td><button onclick="pay(3300, 30);" class="w3-btn w3-white w3-border w3-border-blue w3-round-large">구매하기</button></td>
					</tr>
					<tr>
						<td style="height: 15%; width: 15%;"></td><td></td><td></td><td></td><td></td><td></td>
					</tr>
					<tr style="padding: 3%">
						<td style="width: 15%; padding: 1%;"><img src="${contextPath }/resources/images/pay/peach3.png" ></td>
						<td><h3>피치 100개</h3><h3>11,000원</h3></td>
						<td><button onclick="pay(11000, 100);" class="w3-btn w3-white w3-border w3-border-blue w3-round-large">구매하기</button></td>
						<td style="width: 15%; padding: 1%;"><img src="${contextPath }/resources/images/pay/peach4.png"></td>
						<td><h3>피치 500개</h3><h3>55,000원</h3></td>
						<td><button onclick="pay(55000, 500);" class="w3-btn w3-white w3-border w3-border-blue w3-round-large">구매하기</button></td>
					</tr>
				
				</table>
				
				
			
			
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	var IMP = window.IMP; // 생략가능
	IMP.init('imp48663522'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	
	function pay(peach, payname){
		
	IMP.request_pay({
	    pg : 'html5_inicis', //ActiveX 결제창은 inicis를 사용
	    pay_method : 'card', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
	    merchant_uid : 'merchant_' + new Date().getTime(), //상점에서 관리하시는 고유 주문번호를 전달
	    name : '피치 결제 '+payname+' 개',
	    amount : peach,
	    buyer_email : 'sosoccdd22@gmail.com',
	    buyer_name : '서은별',
	    buyer_tel : '010-1234-5678', //누락되면 이니시스 결제창에서 오류
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456'
	}, function(rsp) {
	    if ( rsp.success ) {
	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	    	$.ajax({
	    		url : "paysuccess.pay",
				type : "post",
				async: false,
				data:{
					mcode : ${loginUser.mcode},
					pay_code : rsp.merchant_uid,
					price : peach,
					peach_code : payname
				},success:function(data){
					console.log("gogogogogogogo");
					location.reload();
				}
				
	    	}).done(function(data) {
	    		console.log("erorr");
	    		/* //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	    		if ( everythings_fine ) {
	    			
	    			var msg = '결제가 완료되었습니다.';
	    			msg += '\n고유ID : ' + rsp.imp_uid;
	    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	    			msg += '\n결제 금액 : ' + rsp.paid_amount;
	    			msg += '카드 승인번호 : ' + rsp.apply_num;
	    			
	    			alert(msg);
	    		} else {
	    			//[3] 아직 제대로 결제가 되지 않았습니다.
	    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	    		} */
	    	});
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	        
	        alert(msg);
	    }
	});
	}
	
	
	</script>
	<div class="container" style="margin-top: 5%;">
		<div class="row">
			<div class="col-md-12">
	<div class="panel panel-default">
                        <div class="panel-heading"> 피치란?</div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <ul class="timeline">
                                <li>
                                    <div class="timeline-badge"><i class="fa fa-check"></i>
                                    </div>
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">BJ 팬클럽 가입!</h4>
                                            <p><small class="text-muted">피치를 선물하면,선물한 BJ의 팬클럽에 가입됩니다. <br>
                                            	팬클럽은 팬클럽 공개 게시판을 이용할 수 있고, 팬클럽만을 위한 특별한 글자색으로 채팅이 돋보입니다.</small>
                                            </p>
                                        </div>
                                    </div>
                                </li>
                                <li class="timeline-inverted">
                                    <div class="timeline-badge warning"><i class="fa fa-credit-card"></i>
                                    </div>
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">BJ에게 도움!</h4>
                                        </div>
                                        <div class="timeline-body">
                                            <p>선물받은 BJ는 모인 별풍선을 현금으로 환전하여 실제 수익으로 돌려 받게 됩니다.</p>
                                        </div>
                                    </div>
                                </li>
                           </ul>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    </div>
                    </div>
                    </div>

<br><br><br>
</c:if>
<c:if test="${empty loginUser }">
		<script type="text/javascript">
			$(function(){
				alert("test");
				document.location.href="/mt/index.jsp";
			});
		</script>
</c:if>

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