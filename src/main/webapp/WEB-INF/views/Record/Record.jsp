<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
#typingBox{
	width: 80%;
	height: 35vh;
	margin-left: 10%;
	margin-top: 10px;
	margin-bottom: 10px;
}.quizs-table tr td{
 	font-size: 1.5vh;
 	cursor: pointer;
}.quizs-table tr:nth-child(1){
 	border-bottom: 4px solid #c3c3c3;
}.quizs-table tr:nth-child(1) th{
 	border-top: none;
}
.quizs-table a{
 	color:#650c1e;
}
</style>
<div class="studyGame-main-content">
<!-- Chart.js -->

	<div id="typingBox">
	<canvas id="lineChart"></canvas>
	
	</div>

	<div id="wrongAnswers" >
		<h4>오답 노트</h4>
			<table class='table table-hover quizs-table'>
			<tr  style="height: 3vh;" ><td class="col-xs-2">카테고리</td><td class="col-xs-2">틀린 횟수</td><td>문제</td></tr>
				<c:forEach var="item" items="${wrongQuizList}"> 
				 <tr class='quiz' data-info='${item.interview_quiz_info}' data-no='${item.interview_quiz_no}'><td>${item.category_name}</td><td>${item.count}</td><td >${item.interview_quiz}</td></tr>
			    </c:forEach>
			</table>
	
			<div class="col-md-12 text-center"><button class="btn btn-info">이전</button>&nbsp&nbsp<button class="btn btn-info">다음</button></div>
			
	</div>
</div>

<!-- 모달 -->
<div class="modal fade" id="infoModal" data-backdrop="false" >
    <div class="modal-dialog modal-lg" >
        <div class="modal-content">
            <div class="modal-header">
               	 <h6>오답노트</h6>
            </div>
            <div class="modal-body">
            	<p id="modalQuizInfo"></p>		
			</div>
            <div class="modal-footer">
           		<form action="<c:url value='/record/quiz/delete'/>" method="get">
           			<input type="hidden" id='modal-quizNo' name='quizNo' value="">
				 	<button type="submit"  class="btn btn-default">delete</button>
				 	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</form>
				

            </div>
        </div>
    </div>
</div><!-- 모달 -->

<script src="<c:url value="/resources/js/Chart.min.js"/>"></script>
<script>

$('.quiz').click(function(){
	$('#modalQuizInfo').html($(this).data('info'))
	$('#modal-quizNo').val($(this).data('no'));
	
	$('#infoModal').modal()
});


if ($('#lineChart').length){	
	 
	//var arrDate =["2015-15-25","2015-15-55","2015-15-25"];
	//var arrTyping =[355,281,400];
	
	var arrTyping =[];
	var arrDate =[];
	
	<c:if test="${!empty avgTypingSpeedList}">
	 	<c:forEach var="item" items="${avgTypingSpeedList}"> 
	 	console.log("???");
	 	arrTyping.push(${item.avg_typing_speed});
	 	arrDate.push("${item.typing_date}");
	    </c:forEach>
 	</c:if>

	  var ctx = document.getElementById("lineChart");
	  var lineChart = new Chart(ctx, {
		type: 'line',
		data: {
		  labels: arrDate,
		  datasets: [{
			label: "평균 타이핑 속도",
			backgroundColor: "rgba(153, 204, 255, 0.31)",
			borderColor: "rgba(153, 204, 255, 0.7)",
			pointBorderColor: "rgba(153, 170, 255, 0.7)",
			pointBackgroundColor: "rgba(153, 170, 255, 0.7)",
			pointHoverBackgroundColor: "#fff",
			pointHoverBorderColor: "rgba(200,200,200,1)",
			pointBorderWidth: 1,
			data: arrTyping
		  }]
		},
		options: {
		
			maintainAspectRatio: false
		}
	});
}//if()

</script>