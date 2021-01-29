<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.reporterImg{
	width: 27%;
	height:27vh;
	position: absolute;
	bottom: 5vh;
	left: 100px;
}.speechBubble:after{
	top: 100%;
	left: 30%;
	border: solid transparent;
	content: "";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
}.speechBubble:after {
	border-color: #fff;
	border-top-color: #638ff3;
	border-width: 25px;
	margin-left: -30px;
}.speechBubble{
	position:absolute;
	background: #638ff3;
    color: #fff;
    padding: 13px;
    border-radius: 2rem;
   	top: 10vh;
	right: 20%;
	height: 20vh;
	width: 60%;
    font-size: 11pt;}
</style>
<!--    box-shadow: 2px 2px 3px #d1d1d1-->
<div class="studyGame-main-content" style="position:relative;">

<img class="reporterImg" src="<c:url value='/resources/images/etc/repoter3.png'/>"/>


<div class="speechBubble" >
  버튼을 눌러 채팅을 시작해 보세요!sadasd 캐릭터 말고 물음 표도  
</div>
<button>
정답확인 누르면 옆에 이미지 내용바뀌면서
</button>
<img style = "position:absolute; bottom: 5vh; right: 200px; width: 100px" src="<c:url value='/resources/images/etc/quiz-o.png'/>"/>
<img  style = "position:absolute; bottom: 5vh; right:90px;width: 100px" src="<c:url value='/resources/images/etc/quiz-x.png'/>"/>

</div>
