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

<style>
       table tr th{
            text-align : center;
            padding : 10px
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
        <h2 class="section-title">&nbsp&nbsp&nbsp문제추가</h2>
      </div>
     
		
		<table class="table col-10 col-sm-offset-1  text-center" style= "width : 90%  ; height: 100% ;background-color: rgba(245,245,245,0.9) ;margin-top: -50px">
		
			 <tr style= "height: 900px" >
				<th rowspan ="2" style="width: 15% ; background: linear-gradient(to bottom, #9966FF, #99CCFF); position:relative; ">
					<div style="padding-top: 8% ; padding-bottom :7%;">
					<img style=" border : 5px solid #99CCFF ; background: white; width: 88%;" src= "<c:url value="/resources/images/character/character1.png"/>" class="img-circle">
					</div>
					<div class="col-xs-8"  style="background-color: white; width: 100% ;height:4% ; border-radius: 15px ;font-size: 1.7em; color: black;" >
					김길동
					</div>
					<a href="<c:url value="/GameRoom/LongWordGame.do"/>" class="btn" style=" width:80% ; position:absolute;left:20%; top:40%; border-radius: 20px  0  0 20px; background-color: #9999FF ;">
    				<span class="glyphicon glyphicon-education"  ></span>긴글연습
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
    				<a href="<c:url value="/GameRoom/QuizPlus.do"/>" class="btn" style=" width:80% ; color:white; position:absolute;left:20%; top:80%; border-radius: 20px  0  0 20px; background-color: #99B5FF;">
    				<span class="glyphicon glyphicon-education"  ></span>문제추가
    				</a>
					
						
					
					
				</th>
				<th style="border-top : none;">
		  		  
				<div style="padding: 65px;  margin:65px;  background-color: white; width: 90% ;height: 80% ;border:5px solid rgb(230,230,230); border-radius: 20px">  
						
					
			   
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
						
			
				

				  </div>		  		 	
					
				
	
					
						
				</th>
			 </tr>
					
		</table>
	
 </div>
<!-- Footer -->

<!-- Footer/ -->

</body>
</html>