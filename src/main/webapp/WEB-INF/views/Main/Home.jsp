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
	}
	.projTitle{
		margin-top: 2vh;
	}        
	.studyGameHome{
		margin-top: 2vh;
		height: 85vh;
		background: linear-gradient(to bottom, #9966FF, #99CCFF);
		text-align: center;
	}.studyGameHome-content{
		margin-top:10%; background-color: white; 
		height:50%;  border-radius: 20px;
		text-align: center;
	}.studyGame-main-title{
		color:#99CCFF;
		margin-bottom: 4vh;
		margin-top: 4vh
	}
</style> 
</head>
<body>
	<div class="container-fluid">
	  <div class="row">
	  	<div class="col-sm-10 col-sm-offset-1 projTitle">
	  		<h1>IT STUDY GAME</h1>
	  	</div>
	  </div>
	  <div class="row">
	  	<!-- 메인 판-->
	  	<div class="col-sm-10 col-sm-offset-1 studyGameHome">
	  		 <div class="col-sm-6 col-sm-offset-3 studyGameHome-content">
	  		 	<!-- 여기에 내용 넣기 -->
	  		 	<div class="col-sm-8 col-sm-offset-2">
			    	<h2 class="studyGame-main-title">로그인</h2>
				    <form class="form-horizontal">
					  <div class="form-group">
					    <label for="inputEmail3" class="col-sm-2 control-label">아이디</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="inputEmail3" >
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="inputPassword3" class="col-sm-2  control-label">비밀번호</label>
					    <div class="col-sm-10">
					      <input type="password" class="form-control" id="inputPassword3">
					    </div>
					  </div>
					  <div class="form-group">
					    <div class="col-sm-10 col-sm-offset-1">
					      <button type="submit" class="btn btn-default col-sm-5">로그인</button>
					      <a type="submit" class="btn btn-default col-sm-5 col-sm-offset-2">간편가입</a>
					    </div>
					  </div>
					</form>	
			    </div>
		    	<!-- /여기에 내용 넣기 -->	
		    </div><!-- /studyGameHome-content 오른쪽 본게임 -->
	    </div><!-- /studyGameHome 메인 판- -->
	  </div><!-- /row -->
	</div><!-- /container-fluid -->
</body>
</html>
