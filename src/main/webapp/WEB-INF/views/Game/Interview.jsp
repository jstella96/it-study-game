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
    font-size: 17px;
    padding-top:25px;
}.answerBtn img:hover{
	background-color: #f5f5f5;
}.answerBtn:hover{
	color: #f5f5f5;
}
</style>
<!--    box-shadow: 2px 2px 3px #d1d1d1-->
<div class="studyGame-main-content" style="position:relative;">

<img class="reporterImg" src="<c:url value='/resources/images/etc/repoter3.png'/>"/>


<div class="speechBubble" >
  <p>1.문제를 보며 대답을 생각해보세요.<br> 
  	2.정답확인을 누르면 정답을 확인 할 수있습니다.<br>
  	3.정답을 자체평가하여 o,x에 체크해 주세요 <br><br>
  	<button class="btn btn-default interviewStartBtn">시작하기</button>
  </p> 
</div>

<button class="btn btn-info answerBtn" style="display:none;font-size:17px;position:absolute;bottom: 5vh;right: 100px; width:200px; height:100px; border:0px;background-color: #ff6161 ">
 정답확인
</button>
	<div class="answerBtn" style="display:none">
		<img style = "cursor:pointer ;position:absolute; bottom: 5vh; right: 200px; width: 100px" src="<c:url value='/resources/images/etc/quiz-o.png'/>"/>
		<img style = "cursor:pointer ;position:absolute; bottom: 5vh; right:90px; width: 100px" src="<c:url value='/resources/images/etc/quiz-x.png'/>"/>
	</div>
</div>


<script>
   //0]시작 버튼 누르면, 게임 스타트.
	$(".interviewStartBtn").click(function(){
		$('.answerBtn:eq(0)').show();
		interviewChange();
		
	})
	//0]정답확인 누르면 O/X 버튼 전환 반대도 가능 
    $(".answerBtn").click(function(){
    	
		if($('.answerBtn:eq(0)').css('display')=='none'){
			$('.answerBtn:eq(0)').show(700);
			$('.answerBtn:eq(1)').hide(300);
		}else{//클릭한 제목의 내용이 보인다면
			$('.answerBtn:eq(1)').show(1000);
			$('.answerBtn:eq(0)').hide(500);
		}
	});
    
	//1]게임 정보 받아오기
	var arr = new Array();
   	var arrInfo = new Array();
   	var arrNo = new Array();
   	 <c:forEach var="item" items="${quizList}">
	    arr.push("${item.quiz}");
	    arrInfo.push("${item.info}");
	    arrNo.push("${item.quizNo}");
	    //console.log("${item.quiz}");
	    console.log("${item}")
     </c:forEach>
     
     function interviewChange(){
    	 var option = "<p data-no='"+arrNo[0]+"'>"+arr[0]+"</p>"
    	 $(".speechBubble").html(option);
     }
 
</script>