<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.quiz-label{
margin-top: 20px;
}.quizPlusBtns {
margin-top: 1%;
}
.quizPlusBtns .btn{
margin-bottom: 8%;
width: 18%;
padding: 5px;
font-size : 15px;
border: 0px;
}.categoryModalBox{
padding:10px;
margin: 30px;
border: 2px  #99B5FF solid;
border-radius: 5px;
}.modal-header{
font-size : 20px;
}
</style>

<div class="row col-md-8 col-md-offset-2" style="margin-top:12%">
   <form action="<c:url value="/quizplus/quiz"/>" method = "post">
			<div class="col-md-3">
				<select name="gamecode" id="gamecode" class="form-control">
							<option value="1">긴글게임</option>
							<option value="2">짧은글게임</option>
							<option value="3">개념완성</option>
				</select>
			</div>
			<div class="col-md-4">	
				<select name="categoryNo" id="category" class="form-control col-xs-4">
						
				</select>
			</div>
			<div class="form-group quiz-group" >
				<div align="left">
				 <label class="col-md-12 quiz-label">문제</label>
				 <div class="col-md-12" >
				   <textarea class="form-control" rows="3" id="quiz" name="quiz" style="width:100%;"></textarea>
				 </div>
			  </div>
			</div>
			<div class="form-group">
				<div align="left">
				 <label class="col-md-12 quiz-label">문제 해설</label>
				 <div class="col-md-12" >
				   <textarea class="form-control" rows="6" id="quizInfo" name="quizInfo" style="width:100%;"></textarea>
				 </div>
			  </div>
			</div>
			
			<div class="col-md-12 quizPlusBtns" align="right">
		   		  <button id="categoryModalBtn" type="button" class="btn btn-info">카테고리</button>
		   		  <button type="submit" id="quizSubmitBtn" class="btn btn-info">등록</button>
		     </div>		
		</form>
	</div>
	<!--카테고리 추가 모달창 -->
	<div class="modal fade" id="categoryModal" data-backdrop="false" >
	    <div class="modal-dialog modal-lg" >
	        <div class="modal-content">
	            <div class="modal-header">
	               	카테고리 관리
	            </div>
	            <div class="modal-body">
	            	<div class="categoryModalBox">
			             <form method="post" action="<c:url value='/quizplus/category/delete'/>">
								<div class="col-md-3">
									<select name="gamecode" id="modalGamecode" class="form-control">
												<option value="1">긴글게임</option>
												<option value="2">짧은글게임</option>
												<option value="3">개념완성</option>
									</select>
								</div>
								<div class="col-md-4">	
									<select name="categoryNo" id="modalCategory" class="form-control">
												
									</select>
									
								</div>
								<input  id="id" name="id"  type="hidden" value="${sessionScope.memberId}" />
								<div align="left">
								<button type="submit" class="btn btn-default">삭제</button>
								</div>
						</form>	
					</div>
					<div class="categoryModalBox">
						<form method="post" action="<c:url value='/quizplus/category'/>" autocomplete="off" >
							<div class="col-md-3">
								<select name="gamecode" class="form-control">
									<option value="1">긴글게임</option>
									<option value="2">짧은글게임</option>
									<option value="3">개념완성</option>
								</select>
							</div>
							<div class="col-md-4">	
								<input class="form-control" id="modalCategoryInput" name="category" type="text" value="" />
								<input  id="id" name="id"  type="hidden" value="${sessionScope.memberId}" />
							</div>
							<div align="left">
								<button type="submit" id="modalCategorySubmitBtn" class="btn btn-default">추가</button>
							</div>
						</form>	
					</div>   
			 </div>
	         <div class="modal-footer">
	      			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	          </div>
	        </div>
	    </div>
	</div><!--/모달창 -->
<script>
/*유효성 체크*/
 $("#quizSubmitBtn").click(function(){
	
	 if($("#category").val() == null){
		alert("카테고리는 필수 선택입니다.");
		return false;
		
  }else if($("#quiz").val().length < 2){
	
		alert("문제는 2글자 이상 작성해 주세요");
		return false;
		
	}else if($("#quizInfo").val().length < 2){
	
		alert("문제해설는 2글자 이상 작성해 주세요");
		return false;
		
	}else if($("#quizInfo").val().length > 1000){
	
		alert("문제해설은 1000자 이내로 작성 되어야 합니다.");
		return false;
		
	}else if($("#gamecode").val() == 1 &&  $("#quiz").val().length > 50){
	
		alert("긴 글 게임의 문제는 50자 이내로 작성 되어야 합니다.");
		return false;
		
	}else if($("#quizInfo").val().length > 1000){
	
		alert("문제해설은 1000자 이내로 작성 되어야 합니다.");
		return false;
		
	}else if($("#gamecode").val() == 1 &&  $("#quiz").val().length > 50){
	
		alert("긴 글 게임의 문제는 50자 이내로 작성 되어야 합니다.");
		return false;
		
	}else if($("#gamecode").val() == 2 &&  $("#quiz").val().length > 20){
	
		alert("짧은 글 게임의 문제는 20자 이내로 작성 되어야 합니다.");
		return false;
		
	}else if($("#gamecode").val() == 3 &&  $("#quiz").val().length > 1000){
	
		alert("개념완성의 문제는 1000자 이내로 작성 되어야 합니다.");
		return false;
		
	}else{
		console.log("유효성 체크완료.이상없음");
	}  
	
})

 $("#modalCategorySubmitBtn").click(function(){
		
	 if($("#modalCategoryInput").val() == 0){
		alert("카테고리를 입력해주세요.");
		return false;
	 }else{
		 console.log("유효성 체크완료.이상없음");
	 }
});
 
 
$("#categoryModalBtn").click(function(){
	$('#categoryModal').modal()
});

	
//프로그램 시작하자마자
$(document).ready(function(){
	
	categoryChangeAjax("#gamecode","#category");
	categoryChangeAjax("#modalGamecode","#modalCategory");
});

$('#gamecode').change(function(){
	
	categoryChangeAjax("#gamecode","#category");
	
});


$('#modalGamecode').change(function(){
	
	categoryChangeAjax("#modalGamecode","#modalCategory");
	
});



//게임모드가 바뀔때 마다 Ajax를 통해 새로 카테고리를 뿌려준다.
function categoryChangeAjax(gamecode,category){
	
	//ajax로 요청]
	$.ajax({
	url:"<c:url value="/quizplus/category/change"/>",	
	data:{gamecode:$(gamecode).val(),id:"${sessionScope.memberId}"},
	dataType:'json',
	success:function(data){
		//{'i01':'라즈베리 파이','i02':'파이썬'}
		var options="";
		$.each(data,function(index,element){
		    	 options+="<option value='"+element["category_no"]+"'>"+element["category_name"]+"</option>";				
		 		
		});	
		$(category).html(options);
		
	},			
	error:function(request,error){
		console.log("상태코드:",request.status);
		console.log("에러:",error);
		$(category).html("<option value='"+"re"+"'>"+"error"+"</option>");
	}
	});		
	
}

</script>

