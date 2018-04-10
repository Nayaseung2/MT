<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
.JoinOuter{
	width:100%;
	height:1500px;
}
.arrow_b{
	color:black;
}
.header{
	width:800px;
	height:67px;
	margin-left:auto;
	margin-right:auto;
/* 	border-bottom:2px solid #ff99cc; */
	border-bottom:2px solid rgba(235, 104, 100, 0.5);
}
.yackgwan{
margin-left:auto;
	margin-right:auto;
	width:700px;
	height:1000px;
}
.agreeBtn{
width:200px;
		height:30px;
		font-size:20px;
		background:rgba(235, 104, 100, 0.5);
		border:none;
		color:white;
		margin-left:250px;
		border-radius:5px;
}
</style>
<title>회원가입 약관동의</title>
</head>
<body>
<div class="JoinOuter">
<br>
<div class="header">
<a href="index.jsp"><img src="<%= request.getContextPath() %>/resources/images/logo.png" style="width:200px;"></a>
&nbsp;<label style="font-size:20px;"><b>회원가입</b></label>
</div>
<br>
<div class="yackgwan">
<div id="divStep3">
<h2 style="color:rgba(235, 104, 100, 0.5);">1. 이용약관 동의</h2>
				<!--이용약관-->
				<div class="tit_area">
					<h3>이용약관<span>(필수)</span></h3>
					<a href="http://www.afreecatv.com/policy/policy1.html" target="_blank" class="arrow_b" >이용약관 전문보기</a>
				</div>
				<div class="scrollbox">
					<iframe frameborder="0" height="100%" width="100%" src="https://www.afreecatv.com/policy/policy1_member.html" name="ifmain"></iframe>
				</div>
				<p class="input_agree">
					<input type="checkbox" class="check" name="agree_chk" id="agree_chk1"><label for="agree_chk1">이용약관에 동의합니다.</label>
				</p>
				<!--//이용약관-->

				<!--개인정보 수집 및 이용 동의-->
				<div class="tit_area">
					<h3>개인정보 수집 및 이용 <span>(필수)</span></h3>
					<a href="http://www.afreecatv.com/policy/policy2.html" target="_blank" class="arrow_b">개인정보 수집 및 이용안내 전문보기</a>
				</div>
				<div class="scrollbox">
					<iframe frameborder="0" height="100%" width="100%" src="https://www.afreecatv.com/policy/policy2_member.html" name="ifmain"></iframe>
				</div>
				<p class="input_agree">
					<span class="txt_info" style="color: #666666;">* 개인정보 수집 및 이용 동의를 거부할 수 있으나 거부시에는 회원가입이 불가합니다.</span><br>
					<input type="checkbox" class="check" name="agree_chk" id="agree_policy1"><label for="agree_policy1">개인정보 수집 및 이용에 동의 합니다.</label>
				</p>
				<!--//개인정보 수집 및 이용 동의-->

				<!--개인정보 취급 위탁-->
				<div class="tit_area">
					<h3>개인정보 처리 위탁<span>(필수)</span></h3>				
				</div>
				<div class="scrollbox">
					<iframe frameborder="0" height="100%" width="100%" src="https://www.afreecatv.com/policy/policy2_member2.html" name="ifmain"></iframe>
				</div>
				<p class="input_agree">
					<span class="txt_info_g">* 개인정보 처리 위탁 동의를 거부할 수 있으나 거부시에는 회원가입이 불가합니다.</span><br>
					<input type="checkbox" class="check" name="agree_chk" id="agree_policy2"><label for="agree_policy2">개인정보 처리 위탁에 동의 합니다.</label>
				</p>
				<!--//개인정보 취급 위탁-->

				<!--개인정보 제3자 제공에 대한 동의-->
				<div class="tit_area">
					<h3>개인정보 제3자 제공<span class="nck">(선택)</span></h3>					
				</div>
				<div class="scrollbox">
					<iframe frameborder="0" height="100%" width="100%" src="https://www.afreecatv.com/policy/policy2_member3.html" name="ifmain"></iframe>
				</div>
				<p class="input_agree">
					<span class="txt_info">* 개인정보 제3자 제공 동의를 거부하더라도 회원가입이 가능합니다.</span><br>
					<input type="checkbox" class="check" name="agree_chk" id="agree_policy3"><label for="agree_policy3">개인정보 제3자 제공에 동의 합니다.</label>
				</p>
				<!--//개인정보 제3자 제공에 대한 동의-->		
				<div class="btn_area">
					<button class="agreeBtn">동의</button>
				</div>
				<!--//110902-->

			</div>
</div>
</div>
<script type="text/javascript">
	$(function(){
	    $(".agreeBtn").click(function(){    
	        if($("#agree_chk1").is(":checked") == false){
                alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
                return;
            }else if($("#agree_policy1").is(":checked") == false){
                alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
                return;
            }else if($("#agree_policy2").is(":checked") == false){
                alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
                return;
            }else if($("#agree_policy3").is(":checked") == false){
                alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
                return;
            }else{
                location.href="showJoinPage2.me";
            } 
                /* location.href="showJoinPage2.me" */
		});
	});
</script>
</body>
</html>