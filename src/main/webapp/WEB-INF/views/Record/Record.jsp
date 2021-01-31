<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
#typingBox{
	width: 80%;
	height: 40vh;
	margin-left: 10%;
	margin-top: 10px;
}.quizs-table tr td{
 	font-size: 15px;
 	cursor: pointer;
}.quizs-table tr:nth-child(1){
 	border-bottom: 4px solid #c3c3c3;
 	font-size: 30px;
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
		<h3>틀린문제</h3>
			<table class='table table-hover quizs-table'>
			<tr><td class="col-xs-2">카테고리</td><td class="col-xs-2">틀린 횟수</td><td>문제</td></tr>
			<tr><td>기본문제</td><td>5</td><td class='quiz'>문제</td></tr>
			<tr><td>기본문제</td><td>4</td><td class='quiz'>문제</td></tr>
			</table>
			
	</div>
</div>

<script src="<c:url value="/resources/js/Chart.min.js"/>"></script>
<script>
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