<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>모두의 TV</title>
<!-- sdf -->
<style>

@import url(//fonts.googleapis.com/earlyaccess/hanna.css); 
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
@import url(//fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);

.outer {
	width: 95%;
	margin-top: 2%;
	margin-left: 2%;
	margin-right: 2%;
	/* font-family: 'Hanna', sans-serif; */
	 font-family: 'Noto Sans KR', sans-serif;
}

ul.tabs {
   /*  margin: 0;
    padding: 0;
    float: left; */
    list-style: none;
    height: 32px;
    font-size:20px;
    align: center;
    margin-left: auto;
    maring-right: auto;
    font-family: 'Noto Sans KR', sans-serif;
}
ul.tabs li {
    float: left;
    text-align:center;
    cursor: pointer;
    width:200px;
    height: 50px;
    line-height: 31px;
    border-left: none;
    font-weight: bold;
    background: #fafafa;
    overflow: hidden;
    position: relative;
    padding-top: 1%;
}
ul.tabs li.active {
    background: #FFFFFF;
    border-bottom: 2px solid orange;
}
.tab_container {
    border: 0px solid #eee;
    border-top: none;
    clear: both;
    float: left;
    width: 90%;
    background: #FFFFFF;
    padding-top: 10%;
    padding-bottom: 10%;
}
.tab_content {
    padding: 5px;
    font-size: 20px;
    display: none;
    width: 100%;
}
.tab_container .tab_content ul {
    width:100%;
    margin:0px;
    padding:0px;
}
.tab_container .tab_content ul li {
    padding:5px;
    list-style:none
}
;
 #container {
    margin-top: 5%;
    margin-bottom: 15%;
    font-size: 18px;
}

.menuArea {
	width: 700px;
	align: center;
	margin-bottom: 30%;
}

.joinTable{
	width:580px;
	height:400px;
	border-top:1px solid #e6e6e6;
	border-bottom:1px solid #e6e6e6;
	font-size:18px;
}
.joinTable th{
	width: 130px;
	text-align:center;
	background:#f2f2f2;
}
.joinTable td{
	padding-left:5%;
}

.checkBtn label {
	width: 30%;
	display: inline-block; 
	padding: .5em .75em; 
	color: #ffffff; 
	font-size: 16px; 
	line-height: normal; 
	vertical-align: middle; 
	background-color: #FC7D01; 
	cursor: pointer; 
	border: 1px solid #ebebeb; 
	border-bottom-color: #e2e2e2; 
	border-radius: .25em;
	text-align: center;
}

.checkBtn input[type="button"] {
	display: inline-block;
	width: 1px; 
	height: 1px; 
	padding: 0; 
	margin: -1px; 
	overflow: hidden; 
	clip:rect(0,0,0,0); 
	border: 0;
}

#nickName, #email {
	border: 1px solid rgb(180, 180, 180);
	border-radius: 7px;
	font-size: 18px;
	height: 35px;
	text-align: center;
	
}

#nickName:hover, #email:hover {
	border: 2px solid orange;

}


</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link href="${ contextPath }/resources/css/fontawesome.min.css">

</head>
<body>

	<jsp:include page="../common/menubar.jsp" /> 

	<br />
	<br />

		<div class="outer" align="center">
			<div class="menuArea">
				<div id="container">
				    <ul class="tabs">
				        <li class="active" rel="tab1">내 정보</li>
				        <li rel="tab2">보안설정</li>
				        <li rel="tab3">회원탈퇴</li>
				    </ul>
				    <div class="tab_container">
				    	<!-- #tab1 -->
				        <div id="tab1" class="tab_content">
				            
				            <table  class="joinTable">
								<tr>
									<th>아이디</th>
									<td>
										<input type="text" class="form-control" id="mId" value="${ loginUser.mId }" 
											style="font-size:18px; width:150px; text-align:center;" readonly>
									</td>
								</tr>
								<tr>
									<th>이 름</th>
									<td>
										<input type="text" class="form-control" name="mName" value="${ loginUser.mName }" 
											style="font-size:18px; width:150px; text-align:center;" readonly>
									</td>
								</tr>
								<tr>
									<th>닉네임</th>
									<td>
										<div class="checkBtn">
											<input type="text" id="nickName" name="nickName" value="${ loginUser.nickName }"
												style="font-size:18px; width:200px;">
											<input type="hidden" value="${ loginUser.nickName }" id="orgNick">
											<input type="button" id="nickCheck" name="nickCheck">
												<label for="nickCheck">닉네임 변경</label>
										</div>
									</td>
								</tr>
								<tr>
									<th>이메일 </th>
									<td>
										<div class="checkBtn">
											<input type="email" id="email" name="email" value="${ loginUser.email }"
												style="font-size:18px; width:250px;">
											<input type="button" id="emailCheck" name="emailCheck">
												<label for="emailCheck">이메일 변경</label>
											<input type="hidden" value="${ loginUser.email }" id="orgEmail">
										</div>
									</td>
								</tr>
								<tr>
									<th>가입일</th>
									<td>
										<input type="text" class="form-control" name="joinDate" value="${ loginUser.joinDate }" 
											style="font-size:18px; width:200px;" readonly>
									</td>
								</tr>
				            </table>
				        </div>
				        <!-- #tab2 -->
				        <div id="tab2" class="tab_content">
				        	<h4 align="left">현재 비밀번호를 입력하세요.</h4>
							<input type="password" class="form-control" id="inputPwd">
							<h4 align="left">새로운 비밀번호를 입력하세요.</h4>
							<input type="password" class="form-control" id="newPwd1">
							<h4 align="left">새로운 비밀번호를 한 번 더 입력하세요.</h4>
							<input type="password" class="form-control" id="newPwd2">
							<input type="hidden" id="mPwd" name="mPwd" value="${ loginUser.mPwd }">
							<br/>
							<br/><br/>
							<div class="checkBtn">
								<input type="button" id="changePwd" name="changePwd">
								<label for="changePwd">확 인</label>
							</div>
							<br/><br/>
						</div>
				        <!-- #tab3 -->
				        <div id="tab3" class="tab_content">
							<img src="${ contextPath }/resources/images/myPage/user.png"/>
							<h2>정말 탈퇴하시겠습니까?</h2>
							<h4>탈퇴 시 현재 보유하고 있는 피치 또한 삭제되며,<br/>한 달간 같은 아이디로 가입하실 수 없습니다.</h4>
							<br/><br/>
							<div class="checkBtn">
								<input type="button" id="withdraw" name="withdraw">
								<br/>
								<label for="withdraw">탈퇴하기</label>
							</div>
						</div>
				    </div>
				    <!-- .tab_container -->
				</div>
					<!-- #container -->
			</div>
		</div>
		
		<div class="certiEmailContainer">
			<br>
			<div class="inputCertiEmail">
			<label style="font-size:18px;">인증번호</label><br>
			<input type="text" id="inputCertiNum" size="20"><br><br>
			<button id="certiEmailBtn" style="width:100px; height:30px;background:rgba(235, 104, 100, 0.5); color:white; border:none;">인증하기</button>
			</div>
		</div>

		<script>
		
			$(function () {
	
			    $(".tab_content").hide();
			    $(".tab_content:first").show();
	
			    $("ul.tabs li").click(function () {
			        $("ul.tabs li").removeClass("active").css("color", "#333");
			        //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
			        $(this).addClass("active").css("color", "darkred");
			        $(".tab_content").hide()
			        var activeTab = $(this).attr("rel");
			        $("#" + activeTab).fadeIn()
			    });
			    
			    
			    /* page 1 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */
			    
			    /* 닉네임 중복확인 후 변경 */
			    $(document).on("click", "#nickCheck", function(){
			    	var nickName = $("#nickName").val();
			    	var mId = $("#mId").val();
			    	
			    	if($("#nickName").val() === ""){
			    		
			    		alert("변경하실 닉네임을 입력해주세요.");
			    		location.reload();
			    		
			    	} else if($("#nickName").val() === $("#orgNick").val()){
			    		
			    		alert("현재와 같은 닉네임입니다.");
			    		location.reload();
			    		
			    	} else {
						$.ajax({
							url:"overlapCheck.mp",
							type:"post",
							data:{"nickName": nickName, 
									"mId": mId},
							success:function(data){
								
								if(data.string === "success"){
									
									alert("닉네임이 변경됐습니다.");
									location.href="changeNick.mp?mId=" + mId + "&nickName=" + nickName;
									
								} else if(data.string === "false"){
									
									alert("중복되는 닉네임이 존재합니다.");
									location.reload();
								}
							},
							error:function(){
							}
						});
			    	}
			    });
			    
			    
			    /* 이메일 변경을 위한 인증 */
			    $(".certiEmailContainer").hide();
			    
				$("#emailCheck").click(function(){
					
					var orgEmail = $("#orgEmail").val();
					var email = $("#email").val();
					
					if(orgEmail === email){
						
						alert("현재와 같은 이메일입니다.");
						location.reload();
						
					} else {
						
						$(".certiEmailContainer").show();
						
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
					}
				});
			    
			    
				/* page 2 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */
				
			    /* 비밀번호 확인 후 변경 - 1.현재비번확인 / 2.새로운비밀번호 일치확인 */
			    
				$("#changePwd").click(function(){
					
					var mId = $("#mId").val();
					
					var mPwd = $("#mPwd").val(); // 진짜 비번
					var inputPwd = $("#inputPwd").val(); // 입력한 비번
					
					var newPwd1 = $("#newPwd1").val(); // 새로운 비번
					var newPwd2 = $("#newPwd2").val(); // 새로운 비번 확인
					
					/* 빈 칸이 있을 때 */
					if(inputPwd === "" || newPwd1 === "" || newPwd2 === ""){
						
						alert("빈칸을 확인해주세요.");
						return inputPwd.focus();
					
					/* 빈 칸이 없을 때 */
					} else {
						
						console.log(mPwd);
						console.log(inputPwd);
						$.ajax({
							url: "pwdCheck.mp",
							type: "post",
							data: {"mPwd": mPwd,
									"inputPwd": inputPwd,
										"mId": mId},
							success: function(data){
								
								console.log(data.string);
								
								/* 현재 비번이 일치할 때 */
								if(data.string === "success"){
									 
									 /* 새로운 비번이 다를 때 */
										if(newPwd1 != newPwd2){
										
											alert("새로운 비밀번호가 일치하지 않습니다..");
											newPwd1.focus();
											
										/* 새로운 비번이 일치할 때 */
										} else {
											
											/* .....최종 업데이트...... */
											console.log(nickName);
											alert("비밀번호가 변경됐습니다.");
											location.href="changePwd.mp?mId=" + mId + "&newPwd1=" + newPwd1;
										}
									
								/* 현재 비번이 다를 때 */
								} else {
									
									alert("현재 비밀번호가 일치하지 않습니다.");
									location.reload();
								} 	
							},
							error: function(data){
							}
						});
					}
				});
			    
				
				/* page 3 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */
			    
			    /* 탈퇴 */
			    $("#withdraw").click(function(){
			    	
			    	var mId = $("#mId").val();
			    	
			    	$.ajax({
						url:"withdraw.mp",
						type:"post",
						data:{"mId": mId},
						success:function(data){

							console.log(data.string);
							
							if(data.string === "success"){
								
								console.log(mId);
								alert("탈퇴되었습니다.");
								location.href="${ contextPath }/index.jsp";
								
							} else {
								
								alert("error");
								location.reload();
							}
						},
						error:function(){
						}
					});
			    	
			    	
			    	
			    	
			    	
			    	
			    });
			    
			    
			    
			    
			    
			    
			    
			    
			    
			});
		
			
			
		</script>		


	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
    <jsp:include page="../common/footer.jsp"/>

</body>
</html>