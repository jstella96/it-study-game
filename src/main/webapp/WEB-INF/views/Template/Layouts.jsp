<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- jQuery  -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- googleFont -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">

<title>IT 3종 공부 게임</title>
<style>
body{
font-family: 'Noto Sans KR', sans-serif;
}
h1{
	font-family: 'Noto Sans KR', sans-serif;
}a{
cursor: pointer;
}
.img-circle{
	border : 5px solid #99CCFF ; background: white; width: 100%;
}.projTitle{
	margin-top: 2vh;
} .studyGameHome{
	height: 100%;
	margin-top: 2vh;
	height: 85vh;
	margin-bottom: 2vh;
	text-align: center;
}.studyGame-menu{
	background: linear-gradient(to bottom, #9966FF, #99CCFF);
	height: 100%;
}.studyGame-main{
	background-color: rgba(245,245,245,0.9);
	height: 100%;
	text-align: center;
}.studyGame-main-content{
	 background-color: white; 
	height:90%;  border-radius: 20px;
	border:5px solid rgb(230,230,230);
	text-align: center;
	width: 94%;
	margin: 3% 3%;
}.studyGame-menu .menu_ul{
    list-style: none;
    padding-left: 0px;
    text-align: center;
}.studyGame-menu .menu_ul a{
    width:80%; position:absolute; left:20%;
    border-radius: 40px 0 0 40px;
    background-color: #9999FF;
    font-size: 15px;color:#444444;
    font-family: 'Noto Sans KR', sans-serif;
}.studyGame-menu .menu_ul a:hover{
    color:white;background-color: #99B5FF;
}.studyGame-menu .profile{
	margin-top: 8%;
}.studyGame-menu .profile .nickname{
	background-color: white;
	width: 100% ;height:4% ; border-radius: 15px ;
	font-size:18px; color: black;
	margin-top: 5%;text-align: center;
	font-family: 'Noto Sans KR', sans-serif;
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
  	<!-- 실제 게임 판 -->
  	<div class="col-xs-10 col-xs-offset-1 studyGameHome">
  		<!-- 왼쪽 사이드 -->
  		<div class="col-xs-2 studyGame-menu">
  			<tiles:insertAttribute name="leftside"/>
  		</div>
	    <!--오른쪽 본 게임 -->
	    <div class="col-xs-10 studyGame-main">
	    	<!--오른쪽 본 게임Content _테두리 내부-->
		    	<div class="studyGame-main-content">
		    	
					<tiles:insertAttribute name="body"/>
					
		    	</div><!--/studyGame-main_content _ 오른쪽 테두리 내부 -->
	    	</div>
	    </div><!-- /studyGame-main 오른쪽 본게임 -->
    </div><!-- /study Game 실제 게임판 -->
  </div><!-- /row -->
</div><!-- /container-fluid -->

</body>
</html>
