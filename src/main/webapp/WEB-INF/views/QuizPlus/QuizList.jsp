<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.btn{
	border:none;
}
.searchDiv{
	margin-top: 20px;
	margin-bottom: 20px;
}.quizs-table tr td{
 	font-size: 15px;
 	cursor: pointer;
}.quizs-table tr:nth-child(1){
 	border-bottom: 4px solid #c3c3c3;
 	font-size: 30px;
}.quizs-table tr:nth-child(1) :hover{
 	background-color: white;
}
.quizs-table tr:nth-child(1) th{
 	border-top: none;
}
.quizs-table a{
 	color:#650c1e;
}
</style>

<div class="studyGame-main-content">
	<div class="row">
		<div class="searchDiv col-md-12">
			<form class="form-inline"  autocomplete="off">
				<div class="form-group">
					<select name="categoryNo" id="category" class=" form-control">
						<c:forEach var="item" items="${categoryList}" varStatus="loop">
					<option value="${item.category_no}">${item.category_name}</option>	
				</c:forEach>
			</select>
		</div>
		<div class="form-group">
			<input type="text" id="searchWord" name="searchWord" class="form-control"/>
			<input type="hidden"  id="gamecode" name="gamecode" value="${gamecode}"/>
				</div>
				<button type="button" id="searchBtn" class="btn btn-info">검색</button>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div  id="quizList">
	
			</div>
		</div>
		<!-- column -->
	</div>
	<!-- row -->
	<div class="row">
		<div class="col-md-12 text-center">페이징....</div>
	</div>
</div>	
<!-- 모달 -->
	<div class="modal fade" id="infoModal" data-backdrop="false" >
	    <div class="modal-dialog modal-lg" >
	        <div class="modal-content">
	            <div class="modal-header">
	               	<p id="modalQuiz"></p>
	            </div>
	            <div class="modal-body">
	           		 <p id="modalQuizInfo"></p>		
				</div>
	            <div class="modal-footer">
	          		 <form method="get" action="<c:url value='/quizplus/quiz/delete'/>">
							<input  id="quizNo" type="hidden" name="quizNo" value="" />
							<input  id="gamecode" type="hidden" name="gamecode" value="${gamecode}" />
							<button type="submit" class="btn btn-default">delete</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</form>
	            </div>
	        </div>
	    </div>
	</div><!-- 모달 -->

<script>

//프로그램 시작하자마자
$(document).ready(function(){
	
	quizListChangeAjax();

});

$('#category').change(function(){
	
	quizListChangeAjax();
	
});

$('#searchBtn').click(function(){
	
	quizListChangeAjax();
});

$(document).on('click','.quiz',function(){

	$('#modalQuiz').html($(this).html())
	$('#modalQuizInfo').html($(this).data('info'))
	$('#quizNo').val($(this).data('no'))
	$('#infoModal').modal()
	
}) 

//게임모드가 바뀔때 마다 Ajax를 통해 새로 카테고리를 뿌려준다.
function quizListChangeAjax(){
	//console.log($("#gamecode").val());
	//console.log($("#category").val())
	//console.log($("#searchWord").val())
	//ajax로 요청]
	$.ajax({
	url:"<c:url value="/quizplus/change"/>",	
	data:{gamecode:"${gamecode}",categoryNo:$("#category").val(),searchWord:$("#searchWord").val()},
	dataType:'json',
	success:function(data){
		//{'i01':'라즈베리 파이','i02':'파이썬'}
		var quizs="<table class='table table-hover quizs-table'><tr><th class='text-center'>${gamename}</th></tr>";
		$.each(data,function(index,element){			
			quizs+="<tr><td class='quiz' data-no="+element["quiz_no"]+" data-info="+element["quiz_info"]+">"+element["quiz"]+"</td></tr>";
		});	
		quizs+="</table"
		$("#quizList").html(quizs);
		
	},			
	error:function(request,error){
		console.log("상태코드:",request.status);
		console.log("에러:",error);
	}
	});		
	
}



</script>
	
