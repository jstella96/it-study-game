<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
canvas{
   background : gray;
   display:block;
   margin : 0 auto;
 	}
table tr th{
   text-align : center;
   padding : 10px
  }
 a{
 color:white;
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
<!-- 메인 내용 -->
<div style="padding-top: 5% ;padding-bottom: 5%"  class = "col-10 col-md-offset-1" >
	 <div class="col-10 col-md-offset-1 center">
        <h2 class="section-title">&nbsp&nbsp&nbsp긴글연습</h2>
      </div>
     
		
		<table class="table col-10 col-sm-offset-1  text-center" style= "width : 90%  ; height: 100% ;background-color: rgba(245,245,245,0.9) ;margin-top: -50px">
		
			 <tr  >
				<th rowspan ="2" style="width: 15% ; background: linear-gradient(to bottom, #9966FF, #99CCFF); position:relative; ">
					<div style="padding-top: 8% ; padding-bottom :7%;">
					<img style=" border : 5px solid #99CCFF ; background: white; width: 88%;" src= "<c:url value="/resources/images/character/character1.png"/>" class="img-circle">
					</div>
					<div class="col-xs-8"  style="background-color: white; width: 100% ;height:4% ; border-radius: 15px ;font-size: 1.7em; color: black;" >
					김길동
					</div>
					<a href="<c:url value="/GameRoom/LongWordGame.do"/>" class="btn" style="  color:white; width:80% ; position:absolute;left:20%; top:40%; border-radius: 20px  0  0 20px; background-color: #99B5FF ;">
    				<span class="glyphicon glyphicon-education" ></span>긴글연습
    				</a>
    				<a href="<c:url value="/GameRoom/ShotWordGame.do"/>" class="btn" style=" width:80% ; position:absolute;left:20%; top:50%; border-radius: 20px  0  0 20px; background-color: #9999FF ;">
    				<span class="glyphicon glyphicon-education"  ></span>짧은글연습
    				</a>
    				<a href="#" class="btn" style=" width:80% ; position:absolute;left:20%; top:60%; border-radius: 20px  0  0 20px; background-color: #9999FF ;">
    				<span class="glyphicon glyphicon-education"  ></span>개발중
    				</a>
    				<a href="#" class="btn" style=" width:80% ; position:absolute;left:20%; top:70%; border-radius: 20px  0  0 20px; background-color: #9999FF ;">
    				<span class="glyphicon glyphicon-education"  ></span>순위보기
    				</a>
    				<a href="<c:url value="/GameRoom/QuizPlus.do"/>" class="btn" style=" width:80% ; position:absolute;left:20%; top:80%; border-radius: 20px  0  0 20px; background-color: #9999FF; ">
    				<span class="glyphicon glyphicon-education" ></span>문제추가
    				</a>
					
						
					
					
				</th>
				<th style="border-top : none;">
		  		  
				<div style="padding: 65px;  margin:65px;  background-color: white; width: 90% ;height: 60% ;border:5px solid rgb(230,230,230); border-radius: 20px">  
						<table class="col-12 text-center" style= " margin-top : -30px;">
						<tr>
			                <th>진행도<span class = "sp">0</span></th>
			                <th>현재타수<span class = "sp">0</span></th>
			                <th>최고타수<span class = "sp">0</span></th>
			                <th>목표타수<span class = "sp">0</span></th>
			                <th>정확도<span class = "sp">0</span></th>
			            </tr>
			            <tr >
			            	
			                <th>
			                    <canvas id="my1" width="200" height="15"></canvas>
			                </th>
			                <th>
			                    <canvas id="my2" width="200" height="15"></canvas>
			                </th>
			                <th>
			                    <canvas id="my3" width="200" height="15"></canvas>
			                    
			                </th>
			                 <th>
			                    <canvas id="my5" width="200" height="15"></canvas>
			                </th>
			                <th>
			                    <canvas id="my4" width="200" height="15"></canvas>
			                </th>
			            </tr>
			        </table>
					
			   
			
			
			        
			     <div class="col-12 text-center" name="containerMain"  style = "padding :10px; margin:10px; border-radius: 20px; color: white;  background: linear-gradient(to right, #9966FF, #99AAFF); font-weight: bolder;font-size:xx-large ;">${list[0].QUIZ}</div>
				
			    <div class="col-12 text-center" id='bottomground' style="padding :10px; margin:10px;border-radius: 15px; background-color: rgb(200, 200, 200); ">
					<input id='enter' onkeyup='enterkey();' type="text" value="" style="height: 30px; font-size : xx-large;" />
				</div>
				
			 
			    <div class="col-12 text-center" style="margin-top: 30px" >
			    
				    <div name="containerNext"  style="font-size : x-large;">${list[1].QUIZ}</div><br/>
					<div name="containerNext"  style="font-size : x-large;">${list[2].QUIZ}</div><br/>
					<div name="containerNext"  style="font-size : x-large;">${list[3].QUIZ}</div><br/>
					
			    </div>
				

				  </div>		  		 	
					
				<div  style=" margin: -10px 20px 65px 65px; padding: -10px 20px 65px 65px;background-color: white; width: 90% ;height: 20% ;border:5px solid rgb(230,230,230); border-radius: 20px">  
				<div  style=" margin: 30px; padding:  30px ;position: relative; ">
				<span id='infoicon' style = " position:absolute;  left:7px; top:5px; font-weight: 30px " class="glyphicon glyphicon-search" aria-hidden="true"></span>	
				<span id="infoDiv" style = "font-size :1.3em;"> ${list[0].INFO} </span>
				 </div>
				</div>		
					
						
				</th>
			 </tr>
					
		</table>
	
 </div>
 
<script>
	
	var count =0;
   	var errcount =0;
   	var	total=0;
	var errcountImsi =0;
   	var	totalImsi=0;
 
   	 var arr = new Array();
   	 var arrinfo = new Array();
   	<c:forEach var="item" items="${list}">
    arr.push("${item.QUIZ}");
    arrinfo.push("${item.INFO}");
    </c:forEach>
 
    $('#infoicon').click(function(){
    	
		if($('#infoDiv').css('display')=='none'){
			$('#infoDiv').show(100);//해당 제목의 내용 보이기
		}
		else{//클릭한 제목의 내용이 보인다면
			$('#infoDiv').hide(100);
		}
	});
    
    		
         var testword =  arr[0];
         var testwordinfo =  arrinfo[0];
         var wordNum =0;
         
         function enterkey(){
        	count++;
        	if (count>0 && window.event.keyCode == 8) {
        		count--;
				}
            var cheak ="";
            var enter = document.getElementById('enter');
			 if (enter.value.length > testword.length || ((enter.value.length == testword.length) && window.event.keyCode == 13) ) {
				 total +=totalImsi;
				 errcount +=errcountImsi;
				 testword = arr[wordNum+1];
				 testwordinfo =arrinfo[wordNum+1];
				 
				document.getElementsByName('containerMain')[0].innerHTML = testword;
				document.getElementById('infoDiv').innerHTML = testwordinfo;
				
                enter.value ="";
                //널일때 빈 공백 나오게 에러.
                document.getElementsByName('containerNext')[0].innerHTML = arr[wordNum+2] == null?"":arr[wordNum+2];
                document.getElementsByName('containerNext')[1].innerHTML = arr[wordNum+3] == null?"":arr[wordNum+3];
                document.getElementsByName('containerNext')[2].innerHTML = arr[wordNum+4] == null?"":arr[wordNum+4];
                wordNum++
                
                
             }
             else{
            	 totalImsi = 0;
            	 errcountImsi = 0;
                var length = enter.value.length;
                var i;
               
                for(i =0 ; i < length ;i++){
                    if(testword.charAt(i) == enter.value.charAt(i) ){
                        cheak += '<span style="color: rgb(190, 190, 190);" >' + testword.charAt(i)  + '</span>';
                        totalImsi++;
                    }else{
                        cheak += '<span  style="color: red;" >' + testword.charAt(i) + '</span>'
                        totalImsi++;
                        errcountImsi++;
                    }

             }
             cheak += testword.substring(i);
          	 document.getElementsByName('containerMain')[0].innerHTML = cheak;
            } 
		}  
		

      
      
      var canvas1 = document.getElementById("my1");
	  var ctx1 = canvas1.getContext("2d");
	  var canvas2 = document.getElementById("my2");
	  var ctx2 = canvas2.getContext("2d");
	  var canvas3 = document.getElementById("my3");
	  var ctx3 = canvas3.getContext("2d");
	  var canvas4 = document.getElementById("my4");
	  var ctx4 = canvas4.getContext("2d");
	  var canvas5 = document.getElementById("my5");
	  var ctx5 = canvas5.getContext("2d");
         
	  function drawBa1() {
	     
	      var Progress = 100*(wordNum)/${list.size()};
	      document.getElementsByClassName("sp")[0].innerHTML = Progress+"%";
	      ctx1.beginPath();
	      ctx1.rect(0, 0, 2 * Progress, canvas1.height);
	      ctx1.fillStyle = "#3300FF";
	      ctx1.fill();
	      ctx1.closePath();
	     	
	  }
	  
	  var startTime = new Date();
	 
	  var max = 0;			
	  function drawBa2() {
		  var Progress=0;
		  if(count>0){
		  	var Time = new Date(); 
	      	Progress =Math.ceil(count/(Time-startTime)*1000*60);
	      	if((Time-startTime)*1000 > 3 && max < Progress){
	      		max = Progress;
	      	}
		  }
		  
		  
	      document.getElementsByClassName("sp")[1].innerHTML = Progress+"타";
	      ctx2.beginPath();
	      ctx2.rect(0, 0, 2*Progress/5, canvas1.height);
	      ctx2.fillStyle = "#FFCC33";
	      ctx2.fill();
	      ctx2.closePath();
	      
	      document.getElementsByClassName("sp")[2].innerHTML = max+"타";
	      ctx3.beginPath();
	      ctx3.rect(0, 0, 2* max/5 , canvas1.height);
	      ctx3.fillStyle = "#66FF33";
	      ctx3.fill();
	      ctx3.closePath();
	      
	      var err =0;
	      
	      if(errcountImsi>0 || errcount>0 || total>0 || totalImsi>0){
	      err =  Math.ceil((total+totalImsi-errcountImsi-errcount)/(total+totalImsi)* 100);
	      }
	      document.getElementsByClassName("sp")[4].innerHTML =err+"%";
	      ctx4.beginPath();
	      ctx4.rect(0, 0, err*2,canvas1.height);
	      ctx4.fillStyle = "#FF6633";
	      ctx4.fill();
	      ctx4.closePath();
	     	
	  }
	  
	  
	  function draw() {
		    ctx1.clearRect(0, 0, canvas1.width, canvas1.height);
		    ctx2.clearRect(0, 0, canvas2.width, canvas1.height);
		    ctx3.clearRect(0, 0, canvas2.width, canvas1.height);
		    ctx4.clearRect(0, 0, canvas2.width, canvas1.height);
		    drawBa1();
		    drawBa2();
	 }

		setInterval(draw, 10); 
		 document.getElementsByClassName("sp")[3].innerHTML = 250 +"타";
	   	  ctx5.beginPath();
	      ctx5.rect(0, 0, 100 ,canvas1.height);
	      ctx5.fillStyle = "#FF0033";
	      ctx5.fill();
	      ctx5.closePath();





</script>