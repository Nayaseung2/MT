<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>회원가입</title>
<style>
.JoinOuter{
	width:100%;
	height:900px;
}
.header{
	width:800px;
	height:67px;
	margin-left:auto;
	margin-right:auto;
	border-bottom:2px solid rgba(235, 104, 100, 0.5);
}
.body{
	margin-left:auto;
	margin-right:auto;
	width:700px;
	height:650px;
}
.joinTable{
	width:600px;
	height:400px;
	border-top:1px solid #e6e6e6;
	border-bottom:1px solid #e6e6e6;
	font-size:15px;
}
.joinTable th{
	
	text-align:center;
	background:#f2f2f2;
}
.joinTable td{
	padding-left:10px;
}
.joinTable select{
	width:80px;
}
.next{
width:200px;
		height:30px;
		font-size:20px;
		background:rgba(235, 104, 100, 0.5);
		border:none;
		color:white;
		margin-left:250px;
		border-radius:5px;
}
.certi{
	border:none;
	color:white;
	background:rgba(235, 104, 100, 0.5);
}
#bankname{
	height:25px;
}

/* 이메일 인증을 위한 form */
.certiEmailContainer{
	width:300px;
	height:160px;
	background:white;
	border:1px solid black;
	position:relative;
	float:right;
	right:400px;
	bottom:300px;
}
.inputCertiEmail{
	width:220px;
	height:130px;
	margin-left:auto;
	margin-right:auto;
}
#inputCertiNum{
	height:20px;
}

</style>
</head>
<body>
<div class="JoinOuter">
<br>
<div class="header">
<a href="index.jsp"><img src="<%= request.getContextPath() %>/resources/images/logo.png" style="width:200px;"></a>
&nbsp;<label style="font-size:20px;"><b>회원가입</b></label>
</div>
<div class="body">
<br><br>
<label style="font-size:15px;">실시간 개인방송 모두의 TV에 오신걸 환영합니다.</label>
<br><br>
<h2 style="color:rgba(235, 104, 100, 0.5);">2. 일반회원 기본 정보 입력</h2>
<form method="post" action="joinMember.me">
<table  class="joinTable">
	<tr>
		<th>*이름</th>
		<td><input type="text" name="mName"></td>
	</tr>
	<tr>
		<th>*아이디</th>
		<td><input type="text" name="mId" id="mId">
			<input type="button" value="중복확인" id="overlapCheck">
		</td>
		
	</tr>
	<tr>
		<th>*비밀번호</th>
		<td><input type="password" name="mPwd"><p style="font-size:9px;">영문/숫자/특수문자 조합으로 10~15자, 대소문자 구분</p></td>
	</tr>
	<tr>
		<th>비밀번호 확인 </th>
		<td><input type="password" name="userPwd2"></td>
	</tr>
	<tr>
		<th>닉네임</th>
		<td><input type="text" name="nickName"></td>
	</tr>
	<tr>
		<th>생년월일</th>
		<td><input type="text" placeholder="예)941220" name="birthDay" id="birthDay"></td>
	</tr>
	<tr>
		<th>이메일 </th>
		<td>
			<input type="email" name="email" id="email">	
			<label class="certi" id="certiEmail">이메일 인증</label>	
		</td>
	</tr>
	<tr>
		<th>이메일 수신동의 </th>
		<td>
			<input type="radio" name="agree" id="agree">
			<label for="agree">동의</label>		
		</td>
	</tr>
	<tr>
		<th>예금주</th>
		<td><input name="AccountHolder" type="text" size="10" id="accountHolder"></td>
	</tr>
	<tr>
		<th>계좌번호</th>
		<td><select class="select" name="account1" id="bankname">
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
      <input id="bankaddr" name="account2" class="input01" type="text" size="20" maxlength="1000">
		<label class="certi" onclick="gettoken();">계좌인증 </label>
	 </td>
	</tr>
	
</table>
<br><br>

<button  type="submit" class="next">가입하기</button>
</form>
</div>
<div class="certiEmailContainer">
	<br>
	<div class="inputCertiEmail">
	<label style="font-size:18px;">인증번호</label><br>
	<input type="text" id="inputCertiNum" size="20"><br><br>
	<button id="certiEmailBtn" style="width:100px; height:30px;background:rgba(235, 104, 100, 0.5); color:white; border:none;">인증하기</button>
	</div>
</div>
</div>
<script>
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
      if(bankUserName==data.account_holder_name){
        alert("개인 정보 조회 인증되었습니다.");
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
	$(function(){
		/* 이메일 인증 */		
		$(".certiEmailContainer").hide();
		$("#certiEmail").click(function(){
			$(".certiEmailContainer").show();
			var email=$("#email").val();
			$.ajax({
				url:"certiEmail.me",
				data:{email:email},
				type:"post",
				success:function(data){
					$("#certiEmailBtn").click(function(){
					var inputCertiNum=$("#inputCertiNum").val();
						if(data==inputCertiNum){
							alert("이메일 인증 되었습니다.");
						}else{
							alert("이메일 인증 실패하였습니다. \n다시 입력해주세요");
						}
						$(".certiEmailContainer").hide();
					});
				},
				error:function(){
					alert("실패");
				}
			}); 
		});
		
		/* ID 중복확인  */
		$("#overlapCheck").click(function(){
			var mId= $("#mId").val();
			$.ajax({
				url:"overlapCheck.me",
				type:"post",
				data:{mId:mId},
				success:function(data){
					alert(data);
				},
				error:function(){
					console.log("중복확인 실패");
				}
			});
		});
	});
</script>
</body>
</html>