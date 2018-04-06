<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	height:800px;
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
<form method="post" action="<%= request.getContextPath() %>/showLoginPage.me">
<table  class="joinTable">
	<tr>
		<th>*이름</th>
		<td><input type="text" name="userName"></td>
	</tr>
	<tr>
		<th>*아이디</th>
		<td><input type="text" name="userId"></td>
	</tr>
	<tr>
		<th>*비밀번호</th>
		<td><input type="password" name="userPwd"><p style="font-size:9px;">영문/숫자/특수문자 조합으로 10~15자, 대소문자 구분</p></td>
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
		<td><input type="text" placeholder="예)941220" name="birthDay"></td>
	</tr>
	<tr>
		<th>이메일 </th>
		<td>
			<input type="email" name="email">	
			<label class="certi">이메일 인증</label>	
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
		<td><input name="AccountHolder" type="text" size="10"></td>
	</tr>
	<tr>
		<th>계좌번호</th>
		<td><select class="select" name="bankname" id="bankname">
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
                        <input id="bankaddr" name="bankaddr" class="input01" type="text" value="" size="20" maxlength="1000">
                  		<label class="certi">계좌인증 </label>
                 		 </td>
	</tr>
	
</table>
<br><br>

<button  type="submit" class="next">가입하기</button>
</form>
</div>
</div>
</body>
</html>