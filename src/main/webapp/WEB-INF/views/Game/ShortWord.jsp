<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style> 

fieldset{
    width: 100%;
    height: 49vh;
    line-height: 40px;
    padding-left: 3%;
    margin-top: 10px;
    margin-bottom: 30px;

}fieldset div{
    text-align: center;
    border-radius: 10px 10px ;
	font-weight :border;
	font-size :20px;
    float:left;
    height: 9%;     
}.one{
    width:19%;
    background: linear-gradient(to right,#FFFF77, #FFFF44 );
    margin:2px;
	border:#FFF 2px solid;
	font-size: 22px;  
}.two{
    width:29%;
    background: linear-gradient(to right, #FF99CC, #FF9999);
    margin:2px;
    border:#FFF 2px solid;
    font-size: 22px;
}.shortwordGame-main-content{
	background-color: white; 
	border-radius: 20px;
	border:5px solid rgb(230,230,230);
	text-align: center;
	width: 94%;
	margin: 3% 3%;
	padding-bottom: 15px; height: 64vh;
}#infoBox{
	background-color: white; 
	border-radius: 20px;
	border:5px solid rgb(230,230,230);
	text-align: center;
	width: 94%;
	margin: 0 3%;
}.shortWordScore{
	width: 100px; height: 30px;
	line-height: 30px; font-size: 30px
}
</style>

<!-- 메인 내용  -->
<div class="row">
	<div class="shortwordGame-main-content col-xs-12">
	
		<fieldset name="main">
			<c:forEach begin="0" end="4" var="i" >
				<div name="container" class ="one" id="${0+i*8}" >${list[0+i*8].QUIZ}</div>
				<div name="container" class ="two" id="${1+i*8}" >${list[1+i*8].QUIZ}</div>
				<div name="container" class ="one" id="${2+i*8}" >${list[2+i*8].QUIZ}</div>
				<div name="container" class ="two" id="${3+i*8}" >${list[3+i*8].QUIZ}</div>
				<div name="container" class ="two" id="${4+i*8}" >${list[4+i*8].QUIZ}</div>
				<div name="container" class ="one" id="${5+i*8}" >${list[5+i*8].QUIZ}</div>
				<div name="container" class ="two" id="${6+i*8}" >${list[6+i*8].QUIZ}</div>
				<div name="container" class ="one" id="${7+i*8}" >${list[7+i*8].QUIZ}</div>
			</c:forEach>
		</fieldset>
	 
	<div class="col-xs-12 main-bottom">				
	    <table class="col-xs-4" >
			<tr><th>
			<span id="nowTimes" class="shortWordScore" >time 3:00</span>
			</th></tr>
			<tr>
			<th><span id='score' class="shortWordScore" >score 0점</span></th></tr>
		</table>
		<div class="col-xs-4 col-xs-offset-1">
		     <br>
			 <input  id='enter' onkeyup="enterkey();" type="text"  value="" style="height: 40px" size=40/>
		</div>
	</div>	
  </div>
 </div>
 <div class="row">			
	<div id="infoBox" class="col-xs-12">  	
 		 <div  style="height :10vh; ;position: relative; ">
				<span id='infoicon' style = " position:absolute;  left:15px; top:15px; font-weight: 30px " class="glyphicon glyphicon-search" aria-hidden="true"></span>	
		<span id="infoDiv" style = "font-size :1.3em;"></span>
	 </div>
	 </div>
 </div>		
				
			
			
				
	

<!-- Footer -->

<!-- Footer/ -->
<script>

$('#infoicon').click(function(){
	
	if($('#infoDiv').css('display')=='none'){
		$('#infoDiv').show(100);//해당 제목의 내용 보이기
	}
	else{//클릭한 제목의 내용이 보인다면
		$('#infoDiv').hide(100);
	}
});

 var arrinfo = new Array();
	<c:forEach var="item" items="${list}">
 arrinfo.push("${item.INFO}");
 </c:forEach>



		 var score=0;
		 var container = document.getElementsByName('container');
		 function enterkey() {
			 var enter = document.getElementById('enter');
			 	if(enter.value.length >= 2){
			 		for(i=0;i < container.length;i++){
			 			 if(container[i].innerHTML.substring(0,enter.value.length) == enter.value.substring(0,enter.value.length) && !(container[i].style.display=='none')){
			 				container[i].style.border = "#F00 3px solid";
			 			 } else{
				 				container[i].style.border = "#FFF 3px solid"; 	
			 				
			 		}
			 	  }
	            }else{
	            	for(i=0;i < container.length;i++){
			 			 	container[i].style.border = "#FFF 3px solid";
			 		}
	            } 
		
	            
	            
			 if (window.event.keyCode == 13) {
				 var enter = document.getElementById('enter');
		            for(i=0;i < container.length;i++){
		            	if(container[i].innerHTML == enter.value && !(container[i].style.display=='none')){
		            		enter.value ='';
		                    container[i].style.display='none';
		                    console.log(container[i].getAttribute('id'));
		                    document.getElementById('infoDiv').innerHTML = arrinfo[container[i].getAttribute('id')];
		                    score++;
		                    document.getElementById('score').innerHTML ='score '+score+'점';

		              	}
		            
		        	} 
		       
		   	 }  
		 }
		 
		 
			
		
		//realTimer();
		let real = setInterval(realTimer, 1000);	
		var startTime = new Date();
		function realTimer() {
			var Time = new Date();
				if(Math.round((Time-startTime) / 1000) > 0){
				document.getElementById("nowTimes").innerHTML ='time '+ Math.floor((180- Math.round((Time-startTime)/1000)) / 60) +':' + (180 - Math.round((Time-startTime) / 1000)) % 60  ;
				}
				if(Math.round((Time-startTime)/1000) > 180){
				document.getElementById('score').innerHTML = "최종 점수 : "+ score+'점';
					for(i=0;i < container.length;i++){
		 			 	container[i].style.display='none';
		 			}
				clearTimeout(real);	
				document.getElementById("nowTimes").innerHTML  = "time 0:00";

			}
		
		}
		
		document.getElementsByName('main')[0].addEventListener("click",function(){
			alert("오른쪽 키는 사용이 불가능 합니다.");
		});
			 
			 
		 </script>




</body>
</html>