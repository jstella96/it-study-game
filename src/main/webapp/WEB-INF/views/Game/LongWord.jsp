<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
canvas{
   background : gray;
   display:block;
   margin : 0 auto;
}table tr th{
   text-align : center;
   padding : 10px
}.longwordGame-main-content{
	background-color: white; 
	border-radius: 20px;
	border:5px solid rgb(230,230,230);
	text-align: center;
	width: 94%;
	margin: 3% 3%;
	height: 60vh;
}#containerMain{
	margin-top:15px; padding :10px 0;
	border-radius: 20px;
	color: white;  background: linear-gradient(to right, #9966FF, #99AAFF);
	font-weight: bolder;font-size:xx-large ;
}#bottomground{
	margin-top:15px; padding :10px 0;
	border-radius: 15px;background-color: rgb(200, 200, 200); 
}#infoBox{
	background-color: white; 
	border-radius: 20px;
	border:5px solid rgb(230,230,230);
	text-align: center;
	width: 94%;
	margin: 0 3%;
 	
}</style>
</head>
<body>
<div class="row">
	<div class="longwordGame-main-content col-xs-12">
		<table class="col-xs-12 text-center">
			<tr>
                <th>진행도<span class = "sp">0</span></th>
                <th>현재타수<span class = "sp">0</span></th>
                <th>최고타수<span class = "sp">0</span></th>
                <th>목표타수<span class = "sp">0</span></th>
                <th>정확도<span class = "sp">0</span></th>
	        </tr>
	        <tr> 	
                <th>
                    <canvas id="my1" width="150" height="15"></canvas>
                </th>
                <th>
                    <canvas id="my2" width="150" height="15"></canvas>
                </th>
                <th>
                    <canvas id="my3" width="150" height="15"></canvas>
                </th>
                 <th>
                    <canvas id="my5" width="150" height="15"></canvas>
                </th>
                <th>
                    <canvas id="my4" width="150" height="15"></canvas>
                </th>
	         </tr>
	     </table>
 
	     <div class="col-xs-12 text-center" name="containerMain" id="containerMain" >${quizList[0].QUIZ}</div>
		
	    <div class="col-xs-12 text-center" id='bottomground'>
			<input id='enter' onkeyup='enterkey();' type="text" value="" style="height: 30px; font-size : xx-large;" />
		</div>
		<div class="col-xs-12 text-center" style="margin-top: 30px" >
		    
			    <div name="containerNext"  style="font-size : x-large;">${quizList[1].QUIZ}</div><br/>
				<div name="containerNext"  style="font-size : x-large;">${quizList[2].QUIZ}</div><br/>
				<div name="containerNext"  style="font-size : x-large;">${quizList[3].QUIZ}</div><br/>
				
		</div>
	</div>
</div><!-- row -->			  		 	
<div class="row">			
	<div id="infoBox" class="col-xs-12">  	
 		<div  style="height :12vh; ;position: relative; ">
			<span id='infoicon' style = " position:absolute;  left:15px; top:15px; font-weight: 30px " class="glyphicon glyphicon-search" aria-hidden="true"></span>	
			<span id="infoDiv" style = "font-size :1.3em;">${quizList[0].INFO}</span>
		 </div>
	 </div>		
</div>				


 
<script>
	
	var count =0;
   	var errcount =0;
   	var	total=0;
	var errcountImsi =0;
   	var	totalImsi=0;
 
   	 var arr = new Array();
   	 var arrinfo = new Array();
   	<c:forEach var="item" items="${quizList}">
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