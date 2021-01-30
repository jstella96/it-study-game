<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- jQuery  -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- googleFont -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">

<title>IT 3종 공부 게임</title>
<style>
body{
font-family: 'Noto Sans KR', sans-serif;
}
h1{
	font-family: 'Noto Sans KR', sans-serif;
}a{
cursor: pointer;
}
.img-circle{
	border : 5px solid #99CCFF ; background: white; width: 100%;
}.projTitle{
	margin-top: 2vh;
}.studyGameHome{
	height: 100%;
	margin-top: 2vh;
	height: 85vh;
	margin-bottom: 2vh;
	text-align: center;
}.studyGame-menu{
	background: linear-gradient(to bottom, #9966FF, #99CCFF);
	height: 100%;
}.studyGame-main{
	background-color: rgba(245,245,245,0.9);
	height: 100%;
	text-align: center;
}.studyGame-main-content{
	 background-color: white; 
	height:90%;  border-radius: 20px;
	border:5px solid rgb(230,230,230);
	text-align: center;
	width: 94%;
	margin: 3% 3%;
}.studyGame-menu .menu_ul{
    list-style: none;
    padding-left: 0px;
    text-align: center;
}.studyGame-menu .menu_ul .btn{
    width:80%; position:absolute; left:20%;
    border-radius: 40px 0 0 40px;
    background-color: #9999FF;
    font-size: 15px;color:#444444;
    font-family: 'Noto Sans KR', sans-serif;
}.studyGame-menu .menu_ul .btn:hover{
    color:white;background-color: #99B5FF;
}.studyGame-menu .profile{
	margin-top: 8%;
}.studyGame-menu .profile .nickname{
	background-color: white;
	width: 100% ;height:4% ; border-radius: 15px ;
	font-size:18px; color: black;
	margin-top: 5%;text-align: center;
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
<!--게임 시작 버튼 관련 모달 스타일-->
<style>
#gameStartModal .gameStartModalHeader{
	background: linear-gradient(to bottom, #9977FF, #99CCFF);
	color:white;
	padding:1px;
	text-align: center;
}#gameStartModal .gameStartModalHeader small{
  font-size: 12px;
}#gameStartModal .gameStartModalHeader h4{
  margin-bottom: 0;
}#gameStartModal { 
 	top : 20%; 
}#gameStartModal .modal-dialog{
 	 width: 40%
}#gameStartModal modal-footer{
	padding: 1px;
}#gameStartModal  .gameStartModalBody {
	padding-top: 40px;
	padding-bottom: 50px;
}#gameStartModal  .gameStartModalBody .gameCategoryLabel{
	width: 40%; font-size:15px
}
</style> 
</head>
<body>
<div class="container-fluid">
  <div class="row">
  	<div class="col-xs-10 col-xs-offset-1 projTitle">
  		<h1>IT STUDY GAME</h1>
  	</div>
  </div>
  <div class="row">
  	<!-- 실제 게임 판 -->
  	<div class="col-xs-10 col-xs-offset-1 studyGameHome">
  		<!-- 왼쪽 사이드 -->
  		<div class="col-xs-2 studyGame-menu">
  			<tiles:insertAttribute name="leftside"/>
  		</div>
	    <!--오른쪽 본 게임 -->
	    <div class="col-xs-10 studyGame-main">
	    	<!--오른쪽 본 게임Content _테두리 내부 직접 ..
		    	<div class="studyGame-main-content">-->
		    	
					<tiles:insertAttribute name="body"/>
					
		    	<!--</div>/studyGame-main_content _ 오른쪽 테두리 내부 -->
	    
	 </div><!-- /studyGame-main 오른쪽 본게임 -->
   </div><!-- /study GameHome 실제 게임판 -->
  </div><!-- /row -->
</div><!-- /container-fluid -->
 <!-- 모달 -->
<div class="modal fade" id="gameStartModal" data-backdrop="false" >
    <div class="modal-dialog" >
        <div class="modal-content">
            <div class="modal-header gameStartModalHeader">
               	<h4 id="modal-gameName">에러</h4>
               	<small><span id="modal-quizCount">0</span>개 미만의 퀴즈가 들어있는 카테고리는 반복된 퀴즈가 나오게 됩니다.</small> 
            </div>
       <form id="gameStartForm" action="#">
	      <div class="modal-body gameStartModalBody" id="" style="text-align: left; margin-left: 30%">
		 		저장된 카테도리가 없습니다.
		  </div>   	
	       <div class="modal-footer"> 
					<button type="submit" class="btn btn-default" id="modal-gameStartBtn">게임시작</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	       </div>
       </form>   
        </div>
    </div>
</div>
<!-- /모달 -->
<script>
	$(".gameStartBtn").click(function(){
		 gamecode = $(this).data('gamecode');

		if(gamecode=='01'){
			$("#modal-quizCount").html('20');
			$("#modal-gameName").html('긴 글 연습')
			$("#gameStartForm").attr("action", "<c:url value='/longword/page'/>");
		}else if(gamecode=='02'){
			$("#modal-quizCount").html('40');
			$("#modal-gameName").html('짧은 글 연습');
			$("#gameStartForm").attr("action", "<c:url value='/shortword/page'/>");
		}else{
			$("#modal-quizCount").html('20');
			$("#modal-gameName").html('개념 완성');
			$("#gameStartForm").attr("action", "<c:url value='/interview/page'/>");
		}
		
		 gameStartCategoryAjax(gamecode)
		$('#gameStartModal').modal()
		
	});
	
	$("#modal-gameStartBtn").click(function(){
		
		if(!$('.gameCategoryLabel input:radio[name=categoryNo]').is(':checked')){
			alert("카테고리를 한개 이상 선택해주세요.");
			return false;
		}
		
	})
	
	function gameStartCategoryAjax(gamecode){
		
		//ajax로 요청]
		$.ajax({
		url:"<c:url value="/quizplus/category/change"/>",	
		data:{gamecode:gamecode,id:"${sessionScope.memberId}"},
		dataType:'json',
		success:function(data){
			console.log(data)
			
			var radios="";
			$.each(data,function(index,element){
			    				
			    	 radios+= "<label class='gameCategoryLabel'>"
			    	 radios+= "<input type='radio' name='categoryNo' value="+element["category_no"]+">"
			    	 radios+= element["category_name"]+"</label>"
			    	 ;
			    	 
			});	
			$(".gameStartModalBody").html(radios);
			
		},			
		error:function(request,error){
			console.log("상태코드:",request.status);
			console.log("에러:",error);
			
		}
		});		
		
	}
</script>
</body>
</html>
