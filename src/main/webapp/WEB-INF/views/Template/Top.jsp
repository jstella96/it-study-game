<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>

a :hover{
    color:white;background-color: #99B5FF;
}
.projTitle{
	margin-top: 2vh;
}        
.studyGame{
	height: 100%;
	margin-top: 2vh;
	height: 85vh;
}.studyGame-menu{
	background: linear-gradient(to bottom, #9966FF, #99CCFF);
	height: 100%;
}.studyGame-main{
	background-color: rgba(245,245,245,0.9);
	height: 100%;
	text-align: center;
}.studyGame-main-content{
	margin-top:4%; background-color: white; 
	height:90%;  border-radius: 20px;
	border:5px solid rgb(230,230,230);
	text-align: center;
}.studyGame-menu .menu_ul{
    list-style: none;
    padding-left: 0px;
    text-align: center;
}.studyGame-menu .menu_ul a{
    width:80%; position:absolute; left:20%;
    border-radius: 40px 0 0 40px;
    background-color: #9999FF;
    font-size: 1em;color:#444444;
}.studyGame-menu .profile{
	margin-top: 8%;
}.studyGame-menu .profile .img-circle{
	border : 5px solid #99CCFF ; background: white; width: 100%;
}.studyGame-menu .profile .nickname{
	background-color: white;
	width: 100% ;height:4% ; border-radius: 15px ;
	font-size: 1.7em; color: black;
	margin-top: 5%;text-align: center;
}
</style> 


<div class="container-fluid">
  <div class="row">
  	<div class="col-xs-10 col-xs-offset-1 projTitle">
  		<h1>IT STUDY GAME</h1>
  	</div>
  </div>
  <div class="row">
  	<!-- 실제 게임 판 -->
  	<div class="col-xs-10 col-xs-offset-1 studyGame">
  		<!-- 왼쪽 사이드 -->
	    <div class="col-xs-2 studyGame-menu">
	    	<div class="col-xs-12 profile">
				<img src= "<c:url value="/resources/images/character/character1.png"/>" class="img-circle">
				<div class="col-xs-12 nickname">
					김길동
				</div>
			</div>
	   		<!-- 왼쪽 메뉴 부분 -->
	    	<ul class="menu_ul">
	    		<li>
	    			<a href="<c:url value="/GameRoom/LongWordGame.do"/>" class="btn"  style="top:38%">
    				<span class="glyphicon glyphicon-education"></span>긴글연습</a>
    			</li>
    			<li >
	    			<a href="<c:url value="/GameRoom/LongWordGame.do"/>" class="btn" style="top:48%;">
    				<span class="glyphicon glyphicon-education"></span>짧은글연습</a>
    			</li>
    			<li >
	    			<a href="<c:url value="/GameRoom/LongWordGame.do"/>" class="btn" style="top:58%">
    				<span class="glyphicon glyphicon-education"></span>개념완성</a>
    			</li>
    			<li>
	    			<a href="<c:url value="/GameRoom/LongWordGame.do"/>" class="btn" style="top:68%">
    				<span class="glyphicon glyphicon-education"></span>성적확인</a>
    			</li>
    			<li>
	    			<a href="<c:url value="/GameRoom/LongWordGame.do"/>" class="btn" style="top:78%">
    				<span class="glyphicon glyphicon-education"></span>문제추가</a>
    			</li>
    			<li>
	    			<a href="<c:url value="/GameRoom/LongWordGame.do"/>" class="btn" style="top:88%">
    				<span class="glyphicon glyphicon-education"></span>마이페이지</a>
    			</li>
	    	</ul>
	    	<!-- / 왼쪽 메뉴 부분 -->
	    </div>
	    <!-- /왼쪽 사이드 -->
	    <!--오른쪽 본 게임 -->
	    <div class="col-xs-10 studyGame-main">
	    	<!--오른쪽 본 게임Content _테두리 내부-->
	    	<div class="col-xs-10 col-xs-offset-1 studyGame-main-content">
		    	<!-- 여기에 내용 넣기 -->
		    	<form action="<c:url value="/GameRoom/QuizInsert.do"/>" method = "post">
				
						<br/>
				       	 <h4>문제</h4><input type="text" name="quiz" size="100" /><br/><br/>
				    	 <h4>설명</h4><textarea  rows="7" cols="60" name="info" size="500"></textarea> 
				    	 <br/>
				    	 <select name="gamecode">
								
								<option value="1">긴글게임</option>
								<option value="2">짧은글게임</option>
								<option value="3">도전 면접</option>
						
						</select>
						 	 <select name="category">
								<option value="기초용어">기초용어</option>
								<option value="자바">자바</option>
								<option value="오라클">오라클</option>
								<option value="CSSL">CSSL</option>
								<option value="JSP">JSP</option>
						</select>	
				       	
				       	<br/><br/>
				       	<input type = "submit" value="문제 추가"><span>${check}</span>
				</form>
				
				<!-- /여기에 내용 넣기 -->
	    	</div><!--/studyGame-main_content _ 오른쪽 테두리 내부 -->
	    </div><!-- /studyGame-main 오른쪽 본게임 -->
    </div><!-- /study Game 실제 게임판 -->
  </div><!-- /row -->
</div><!-- /container-fluid -->


</body>
</html>