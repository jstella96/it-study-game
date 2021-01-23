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
			    	<h1 class="studyGame-main-title">로그인</h1>
				    <form class="form-horizontal" action="<c:url value="/login"/>" method="post"  autocomplete="off">
					  <div class="form-group">
					    <label for="inputEmail3" class="col-md-2 control-label">아이디</label>
					    <div class="col-md-10">
					      <input type="text" class="form-control" id="id" name="id" >
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="inputPassword3" class="col-md-2  control-label">비밀번호</label>
					    <div class="col-md-10">
					      <input type="password" class="form-control" id="password" name="password">
					    </div>
					  </div>
					  <span style="color:red">${error}</span>
					  <div class="form-group">
					    <div class="col-md-10 col-md-offset-1 loginBtns">
					      <button type="submit" id="loginBtn" class="btn btn-default col-md-5">로그인</button>
					      <a href="<c:url value="/sign"/>" id="signBtn" class="btn btn-default col-md-5 col-md-offset-2">간편가입</a>
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
//로그인 에러 
var error = '${error}';

//프론트 유효성 체크
$("#loginBtn").click(function(){
	if($("#id").val().length < 1){
		
		alert("아이디를 입력해 주세요");
		return false;
		
	}else if($("#password").val().length < 1){
		
		alert("비밀번호를 를 입력해 주세요");
		return false;
		
	}else{
		console.log("유효성 체크완료.이상없음");
	} 
	
});
</script>
</body>
</html>
