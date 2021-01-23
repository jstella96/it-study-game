<%@ page session="true" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- jQuery  -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- bootstrap -->
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- googleFont -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
<title>IT Study Game</title>
<style>
	body{
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 18px;
	}
	.projTitle{
		margin-top: 2vh;
		
	}        
	.studyGameHome{
		margin-top: 2vh;
		height: 85vh;
		background: linear-gradient(to bottom, #9966FF, #99CCFF);
		text-align: center;
		margin-bottom: 2vh;
	}.studyGameHome-content{
		margin-top:15%; background-color: white; 
		 border-radius: 20px;
		text-align: center;
	}.studyGame-main-title{
		color:#99CCFF;
		margin-bottom: 4vh;
		margin-top: 4vh
	}.loginBtns{
		margin-top: 2vh;
		margin-bottom: 4vh;
	}.btn:hover{
		background-color: #99CCFF;
	}.duplicateCheckBtn{
		font-size: 15px;
		font-weight: lighter;
		color: #99CCFF;
		cursor: pointer;
	}
</style> 
</head>
<body>
	<div class="container-fluid">
	  <div class="row">
	  	<div class="col-xs-10 col-xs-offset-1 projTitle">
	  		<h1>IT STUDY GAME</h1>
	  	</div>
	  </div>
	  <div class="row">
	  	<!-- 메인 판-->
	  	<div class="col-xs-10 col-xs-offset-1 studyGameHome">
	  		 <div class="col-md-8 col-md-offset-2 studyGameHome-content">
	  		 	<!-- 여기에 내용 넣기 -->
	  		 	<div class="col-md-10 col-md-offset-1">
			    	<h1 class="studyGame-main-title">회원가입</h1>
				    <form class="form-horizontal" action="<c:url value="/sign"/>" method="post" autocomplete="off">
				     <div class="form-group">
					    <label for="inputEmail3" class="col-md-2 control-label">닉네임</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control" id="nickname"  name="nickname" placeholder="2-20자 입력해주세요" >
					   </div>
					   <a class="col-md-2 duplicateCheckBtn" id="nicknameDuplicateCheckBtn">중복체크</a>
					  </div>
					  <div class="form-group">
					    <label for="inputEmail3" class="col-md-2 control-label">아이디</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control" id="id" name="id" placeholder="4-20자 입력해주세요">
					   </div>
					   <a class="col-md-2 duplicateCheckBtn" id="idDuplicateCheckBtn">중복체크</a>
					  </div>
					  <div class="form-group">
					    <label for="inputPassword3" class="col-md-2  control-label">비밀번호</label>
					    <div class="col-md-8">
					      <input type="password" class="form-control" id="password" name="password" placeholder="4-20자 입력해주세요">
					    </div>
					  </div>
					  <div class="form-group">
					    <div class="col-md-10 col-md-offset-1 loginBtns">
					      <a href="<c:url value="/login"/>"  id="loginBtn" class="btn btn-default col-md-5 ">이전으로</a>
					      <button type="submit" id="signBtn" class="btn btn-default col-md-5 col-md-offset-2">가입신청</button>
					     </div>
					  </div>
					</form>	
			    </div>
		    	<!-- /여기에 내용 넣기 -->	
		    </div><!-- /studyGameHome-content 오른쪽 본게임 -->
	    </div><!-- /studyGameHome 메인 판- -->
	  </div><!-- /row -->
	</div><!-- /container-fluid -->
<script>
//중복체크 후 true,false를 통해 체크여부 확인하고, 
//중복체크 통과시 Result 값에 체크한 결과 값을 담아둔다.
//중복체크 후 해당 값이 변화됐을시 회원가입 실패.
var nicknameDuplicateCheck = false;
var nicknameResult = "";
var idDuplicateCheck = false;
var idResult = "";

//프론트 유효성 체크
$("#signBtn").click(function(){
	if(!($("#nickname").val().length >= 2 &&  $("#nickname").val().length <= 100)){
		alert("닉네임은 2-10자 사이로 입력해 주세요");
		return false;
		
	}else if(!($("#id").val().length >= 4 &&  $("#id").val().length <= 20)){
	
		alert("아이디는 4-20자 사이로 입력해 주세요");
		return false;
		
	}else if(!($("#password").val().length >= 4 &&  $("#password").val().length <= 20)){
	
		alert("비밀번호는 4-20자 사이로 입력해 주세요");
		return false;
		
	}else if(!nicknameDuplicateCheck || $("#nickname").val() != nicknameResult){
		
		alert("닉네임 중복체크를 해주세요");
		return false;

	}else if(!idDuplicateCheck || $("#id").val() != idResult){
		
		alert("아이디 중복체크를 해주세요");
		return false;
		
	}else{
		
		console.log("유효성 체크완료.이상없음");
	}  
	
})
//닉네임 중복체크
$("#nicknameDuplicateCheckBtn").click(function(){
	
	nickNameDuplicateCheckAjax();
	
})
//아이디 중복체크	
$("#idDuplicateCheckBtn").click(function(){

	idDuplicateCheckAjax();
})


function  idDuplicateCheckAjax(){
	
	$.ajax({
		url:"<c:url value="/sign/ajax"/>",//요청할 서버의 URL주소
		type:'get',//데이타 전송방식(디폴트는 get방식) 
		dataType:'text',//서버로 부터 응답 받을 데이타의 형식 설정
		data: "id="+$("#id").val(),
		success:function(data){//서버로부터 정상적인 응답을 받았을때 호출되는 콜백함수
			var result = (data =='available' ? true : false);
			if(result){
				alert("이 아이디는 사용할 수 있습니다.");
				idDuplicateCheck = true;
				idResult = $("#id").val();
			}else{
				alert("이 아이디는 사용할 수 없습니다.");
				idDuplicateCheck = false;
			}
		},
		error:function(error){//서버로부터 비정상적인 응답을 받았을때 호출되는 콜백함수
			console.log("ajaxError")
			alert("이 아이디는 사용할 수 없습니다.");
			idDuplicateCheck = false;
		}
			
	});
	
}

function  nickNameDuplicateCheckAjax(){
	
	$.ajax({
		url:"<c:url value="/sign/ajax"/>",//요청할 서버의 URL주소
		type:'get',//데이타 전송방식(디폴트는 get방식) 
		dataType:'text',//서버로 부터 응답 받을 데이타의 형식 설정
		data: "nickname="+$("#nickname").val(),
		success:function(data){//서버로부터 정상적인 응답을 받았을때 호출되는 콜백함수
			var result = (data =='available' ? true : false);
			if(result){
				alert("이 닉네임은 사용할 수 있습니다.");
				nicknameDuplicateCheck = true;
				nicknameResult = $("#nickname").val();
			}else{
				alert("이 닉네임은 사용할 수 없습니다.");
				nicknameDuplicateCheck = false;
			}
		},
		error:function(error){//서버로부터 비정상적인 응답을 받았을때 호출되는 콜백함수
			console.log("ajaxError")
			alert("이 닉네임은 사용할 수 없습니다.");
			nicknameDuplicateCheck = false;
		}
			
	});
	
}

</script>
</body>
</html>
