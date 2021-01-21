<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>짧은글연습</title>
<!-- Top -->
<jsp:include page="/WEB-INF/views/Template/Top.jsp"/>
<!-- Top -->
<style> 
       table tr th{
            text-align : center;
            padding : 10px
         }	
        	
        	
        fieldset{
            width: 100%;
            height: 500px;
            line-height: 40px;
        }fieldset div{
            text-align: center;
            border-radius: 10px 10px ;
        	font-weight :border;
        	font-size :20px;
            float:left;
            height: 8%;     
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
 
        }
        a{
        color:#444444;
        }
        a:link{
        color:#444444;
        }
        a:visited{
        color:#444444;
        } 
        
      
  </style>
	
</head>

<body>

<!-- 메인 내용  -->

<div style="padding-top: 5% ;padding-bottom: 5%"  class = "col-10 col-md-offset-1" >
	 <div class="col-10 col-md-offset-1 center">
        <h2 class="section-title">&nbsp&nbsp&nbsp짧은글연습</h2>
      </div>
     
		
		<table class="table col-10 col-md-offset-1  text-center" style= "width : 90%  ; height: 100% ;background-color: rgba(245,245,245,0.9) ;margin-top: -50px">
		
			 <tr>
				<th rowspan ="2" style="width: 15% ; background: linear-gradient(to bottom, #9966FF, #99CCFF); position:relative; ">
					<div style="padding-top: 8% ; padding-bottom :7%;">
					<img style=" border : 5px solid #99CCFF ; background: white; width: 88%;" src= "<c:url value="/resources/images/character/character1.png"/>" class="img-circle">
					</div>
					<div class="col-xs-8"  style=" background-color: white; width: 100% ;height:4% ; border-radius: 15px ;font-size: 1.7em; color: black;" >
					김길동
					</div>
					<a href='<c:url value="/GameRoom/LongWordGame.kosmo"/>' class="btn" style=" width:80% ; position:absolute;left:20%; top:40%; border-radius: 20px  0  0 20px; background-color: #9999FF;">
    				<span class="glyphicon glyphicon-education"  ></span>긴글연습
    				</a>
    				<a href='<c:url value="/GameRoom/ShotWordGame.kosmo"/>' class="btn" style=" color:white; width:80% ; position:absolute;left:20%; top:50%; border-radius: 20px  0  0 20px; background-color: #99B5FF;">
    				<span class="glyphicon glyphicon-education"  ></span>짧은글연습
    				</a>
    				<a href="#" class="btn" style=" width:80% ; position:absolute;left:20%; top:60%; border-radius: 20px  0  0 20px; background-color: #9999FF;">
    				<span class="glyphicon glyphicon-education"  ></span>개발중
    				</a>
    				<a href="#" class="btn" style=" width:80% ; position:absolute;left:20%; top:70%; border-radius: 20px  0  0 20px; background-color: #9999FF;">
    				<span class="glyphicon glyphicon-education"  ></span>순위보기
    				</a>
    				<a href="<c:url value="/GameRoom/QuizPlus.do"/>" class="btn" style=" width:80% ; position:absolute;left:20%; top:80%; border-radius: 20px  0  0 20px; background-color: #9999FF;">
    				<span class="glyphicon glyphicon-education"  ></span>문제추가
    				</a>
					
						
					
					
				</th>
				<th style="border-top : none;">
		  		  
				<div style="padding: 65px;  margin:65px;  background-color: white; width: 90% ;height: 60% ;border:5px solid rgb(230,230,230); border-radius: 20px">  
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
						
				    <table class="col-3 " style= "width : 20%  ; height: 10% ">
						<tr><th style= "border-top : none;"><span class="col-4" id="nowTimes" style="font-size:30px">time 3:00</span></th></tr>
						<tr><th style= "border-top : none;"><span class="col-4" id='score' style="width: 100px; height: 30px;line-height: 30px; font-size: 30px">score 0점</span></th></tr>
					</table>
						 <input class="col-3" id='enter' onkeyup="enterkey();" type="text"  value="" style="height: 30px" width="50px" />
        					
				  </div>
 		 			
				</th>
			 </tr>
					
		</table>
	
 		  <div  style=" margin: -10px 20px 65px 65px; padding: -10px 20px 65px 65px;background-color: white; width: 90% ;height: 5% ;border:5px solid rgb(230,230,230); border-radius: 20px">  
				<div  style=" margin: 30px; padding:  30px ;position: relative; ">
				<span id='infoicon' style = " position:absolute;  left:7px; top:5px; font-weight: 30px " class="glyphicon glyphicon-search" aria-hidden="true"></span>	
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