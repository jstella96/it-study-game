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
    font-size: 2vh;
    padding-top:3vh;
}.answerBtn img:hover{
	background-color: #f5f5f5;
}.answerBtn:hover{
	color: #ffffff;
}#quizBox-info{
	display: none;
}.scoreBox{
	position:absolute;
	top:8px;
	right: 10px;
	font-size: 30px;
	color:#444444;
	display:none;
}
</style>
<!--    box-shadow: 2px 2px 3px #d1d1d1-->
<div class="studyGame-main-content" style="position:relative;">

<div class="scoreBox">
	정답 : <span data-score="0" class="scoreBox-o">0</span>&nbsp&nbsp
	오답 : <span data-score="0" class="scoreBox-x">0</span>&nbsp&nbsp
</div>

<img class="reporterImg" src="<c:url value='/resources/images/etc/repoter3.png'/>"/>


<div class="speechBubble" >
  <p>1.문제를 보며 대답을 생각해보세요.<br> 
  	2.정답확인을 누르면 정답을 확인 할 수있습니다.<br>
  	3.정답을 자체평가하여 o,x에 체크해 주세요 <br>
  	<button class="btn btn-default interviewStartBtn" style="height: 4vh; font-size: 1.5vh;margin-top: 2vh">시작하기</button>
  </p> 
</div>

<button class="btn btn-info answerBtn" style="display:none;font-size:17px;position:absolute;bottom: 5vh;right: 100px; width:200px; height:100px; border:0px;background-color: #ff6161 ">
 정답확인
</button>
	<div class="answerBtn" style="display:none">
		<img class="answer-btn" data-answer='o' style = "cursor:pointer ;position:absolute; bottom: 5vh; right: 200px; width: 100px" src="<c:url value='/resources/images/etc/quiz-o.png'/>"/>
		<img class="answer-btn" data-answer='x' style = "cursor:pointer ;position:absolute; bottom: 5vh; right:90px; width: 100px" src="<c:url value='/resources/images/etc/quiz-x.png'/>"/>
	</div>
</div>


<script>

   //0]시작 버튼 누르면, 게임 스타트후에 버튼 사라짐 
	$(".interviewStartBtn").click(function(){
		$('.answerBtn:eq(0)').show();
		$('.scoreBox').show();
		
		interviewQuizChange(0);
	})

	//0]정답확인 누르면 O/X 버튼 전환 반대도 가능 
    $(".answerBtn").click(function(){
    	//ox 버튼 보일때 나중
		if($('.answerBtn:eq(0)').css('display')=='none'){
			
			$('.answerBtn:eq(0)').show(200);
			$('.answerBtn:eq(1)').hide(0);
			var index =  $('.quizBox').data('index')+1
			//20개 되면 게임 끝
			if ( (index)  == arr.length){
				$('.answerBtn').hide();
				 $(".speechBubble").html("끝입니다.");
				//여기에 게임끝 로직 
			}else{
			console.log(index);
			interviewQuizChange(index);
			}
		}else{//정답확인 버튼 보일때 이게 먼저
			$('.answerBtn:eq(1)').show(500);
			$('.answerBtn:eq(0)').hide(0);
			var index =  $('.quizBox').data('index')
			interviewInfoChange(index);
			console.log(index);
		}
	});
	
	//0]o,x 버튼 따라서 처리해주기
	var wrongAnswers = [];
	$('.answer-btn').click(function(){
		//console.log("total : " + $('.scoreBox-o').data('score') + $('.scoreBox-o').data('score'))
		// if( $('.scoreBox-o').data('score')+$('.scoreBox-o').data('score') != $('.quizBox').data('index') ){
		//	 
		//	 return;
		// }
		
		var answer = $(this).data('answer')
		if(answer == 'o'){
			var  nowScore = $('.scoreBox-o').data('score')
			var newScore = nowScore+1
			$('.scoreBox-o').data('score',newScore)
			$('.scoreBox-o').html(newScore)
			
			console.log("index"+$('.quizBox').data('index'))

		}else{
			//오답 처리 오답은 기록 
			var nowScore =$('.scoreBox-x').data('score')
			var newScore = nowScore+1
			$('.scoreBox-x').data('score',newScore)
			$('.scoreBox-x').html(newScore)
			
			console.log("no"+$('.quizBox').data('no'))
			console.log("index"+$('.quizBox').data('index'))
			wrongAnswers.push($('.quizBox').data('no'));
			console.log(wrongAnswers)
		}
	});
	

	//1]게임 정보 받아오기
	var arr = new Array();
   	var arrInfo = new Array();
   	var arrNo = new Array();
   	var nowIndex = 0;
   	 <c:forEach var="item" items="${quizList}">
	    arr.push("${item.quiz}");
	    arrInfo.push("${item.info}");
	    arrNo.push("${item.quizNo}");
	    //console.log("${item.quiz}");
	    console.log("${item}")
     </c:forEach>
     
     function interviewQuizChange(index){
    	 var option = "<p class='quizBox' data-index='"+index+"'  data-no='"+arrNo[index]+"'>"+arr[index]+"</p>"
    	 $(".speechBubble").html(option);
     }
     
     function interviewInfoChange(index){
    	 var option ="<p class='quizBox' data-index='"+index+"'  data-no='"+arrNo[index]+"'>"+arrInfo[index]+"</p>"
    	 $(".speechBubble").html(option);
     }
 
 
     
	$(".answerBtn:eq(0)").click(function(){
		
	

		$(document).on('click','.quiz',function(){

			$('.quizBox').data('no')
		
		
			
		}) 
			

		
	});
	
	
     
</script>