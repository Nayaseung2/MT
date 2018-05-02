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
                        	
                            <div class="form-group">
								<label for="disabledSelect">회원 아이디</label> 
								<input class="form-control" id="mId" name="mid" type="text" value="${loginUser.mId}" disabled>
								<input id="mcode" name="mcode" type="hidden" value="${loginUser.mcode}">
							</div>
							<div class="form-group">
								<label for="disabledSelect">예금주명</label> 
								<input class="form-control" id="accountHolder" type="text" placeholder="예금주 명을 입력하세요.">
							</div>
							<div class="form-group">
								<label for="disabledSelect">생년월일</label> 
								<input class="form-control" id="birthDay" type="text" placeholder="ex)950125">
							</div>
							<div class="form-group">
								<label for="disabledSelect">계좌 번호</label> 
								<select class="form-control select" name="account1" id="bankname">
                                    <option value="0">선택</option>
						            <option value="003">기업은행</option>
						            <option value="004">국민은행</option>
						            <option value="020">우리은행</option>
						            <option value="088">신한은행</option>
						            <option value="081">KEB하나은행</option>
						            <option value="012">농0협은행</option>
						            <option value="007">수협</option>
						            <option value="048">신협</option>
						            <option value="034">광주은행</option>
						            <option value="032">부산은행</option>
						            <option value="031">대구은행</option>
						            <option value="071">우체국</option>
                                 </select>
							<input class="form-control input01" id="bankaddr" name="account2" type="text" placeholder="계좌번호를 입력하세요" >	
							
							</div>
							
							<div class="form-group" align="center">
                        	<button onclick="gettoken();" class="btn btn-default">계좌 변경</button>
                        	<button onclick="accountReset();" class="btn btn-default">변경 취소</button>
                        	</div>
                        	
                        </div>
				

                    </div>
                </div>
                <div class="col-lg-3"></div>
				
			</div>
		</div>
	</div>
	<script type="text/javascript">
	var token = '';
	function gettoken(){
	   $.ajax({
	      url: "https://testapi.open-platform.or.kr/oauth/2.0/token",
	      type: 'post',
	      contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
	      data: {
	    	  'client_id': "l7xx0ea168ac313d421a99a4c06328f6c7d0",
	          'client_secret': "7da334b9a69a4c52b26ea8320c7e10e6",
	          'grant_type': 'client_credentials',
	          'scope': 'oob'

	      },
	      success:function(data){
	      insert_action(data.access_token) 
	         
	      }
	   })
	   
	   console.log(new Date());
	   

	 }

	 function insert_action(token){
		 console.log("여긴오니?");
	   var obj = new Object();
	   	console.log($("#bankname").val());
		console.log($("#bankaddr").val());

	      obj.bank_code_std = $("#bankname").val();
	      obj.account_num = $("#bankaddr").val();
	      obj.account_holder_info =$("#birthDay").val();
	      obj.tran_dtime = '20180501101921';
	      
	      var jsonData = JSON.stringify(obj);
	  
	 var request = $.ajax({
	    url:"https://testapi.open-platform.or.kr/inquiry/real_name",
	    type:"post",
	    contentType: 'application/json; charset=UTF-8',
	    dataType:"json",
	    
	    headers: {
	       'Authorization': ('Bearer ' + token)
	       
	    },
	     data:jsonData 
	 });
	    request.done(function(data){
	    	console.log(data.account_holder_name);
	    	var bankUserName=$('#accountHolder').val();
	        var account_yn="";
	        var bank_name = data.bank_name
	        var account_num = data.account_num
	        var account = bank_name + " " +account_num
	      if(bankUserName==data.account_holder_name){
	        var mcode= "${loginUser.mcode}";
	        console.log(account);
	        console.log(mcode);
	        
	         $.ajax({
	          url:"/mt/updateAccount.bjp",
	           type:"get",
	           contentType: 'application/json; charset=UTF-8',
	           dataType:"json",
	           data:{mcode:mcode, account:account},
	           success:function(data){
	        	   console.log("응??");
	              alert("계좌 정보 조회 인증되었습니다. 계좌번호를 변경합니다.");
	              location.href="bjPayMain.bjp?mcode="+mcode
	              
	           },
	           error:function(data){
	        	   alert("계좌 정보 조회 실패되었습니다. 관리자에게 문의해 주세요.");
	              console.log("실패됬");
	              location.href="helppersonal.hp"
	           }
	        });  
	      }else{
	         account_yn='N';
	         alert("실명이 아닙니다.");
	      }
	      
	      console.log(data);
	   
	    });
	    request.fail(function(jqXHR, textStatus){ // 에러 발생
	    	  alert("개인 정보 조회 오류 발생 정확한 정보를 입력하세요.");
	    	 });

	} 
		
		function accountReset(){
			$("#Withdrawinsert").reset();
		}
	
	
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