<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>

.mypageProfileImg{
width: 100%;
margin: 5px;
}#mypageInfoBox{
border:  #99CCFF 3px solid;
border-radius : 10px;
font-family: 'Noto Sans KR', sans-serif;
margin-top: 60px;
padding: 15px;
}.btnBox{
margin-top: 10px;
}.btnBox .btn{
		background-color: #99CCFF;
		font-family: 'Noto Sans KR', sans-serif;
}.btnBox .btn:hover{
		background-color: #99BBFF;
}.character{
 margin:5px;
 width:200px;
 height:200px
}
.character:hover{
 border:#99CCFF 3px solid;
}.modal-header{
font-family: 'Noto Sans KR', sans-serif;
}


</style>


     <div class="row">
     	<h1 class="col-xs-12">마이페이지</h1>
     </div>
     <form class="form-horizontal" action="<c:url value='/mypage/modify'/>" method="post" autocomplete="off">
	     <div class="row">
	     	<div  class="col-xs-10 col-xs-offset-1 col-sm-6 col-sm-offset-3 " id="mypageInfoBox">
				<table > 
					<tr>
						<td rowspan="3" class="col-xs-5">
								<img class="mypageProfileImg" src="<c:url value='/resources/images/character/${sessionScope.memberProfileImg}'/>" alt="프로필이 미지"/>	
								<br>
								<button  type="button" id="characterBtn" class="btn btn-default">이미지 변경</button>	
						</td>
						<th>
						닉네임  : <input style="height:25px; width:150px; display: inline;" type="text" class="form-control" id="nickname" name="nickname" value="${sessionScope.memberNickname}">
					   	    <input type="hidden" class="form-control" name="signDate"  value="${signDate}">
					
						  <a class="duplicateCheckBtn text-rigth" id="nicknameDuplicateCheckBtn">중복체크</a>
						
						</th>
					</tr>
					<tr>
						<th>
						아이디  :  ${sessionScope.memberId}
						</th>
					</tr>
					<tr>
						<th>
							가입날짜 : ${signDate}
						</th>
					</tr>
				</table>
			</div>			
		</div>
		<div class="row btnBox text-right col-xs-10 col-xs-offset-1 col-sm-6 col-sm-offset-3 ">
			  <button type="submit" id="nicknameModifyBtn" class="btn btn-default">저 장</button>
		</div>
	</form>	
	
	<div class="modal fade" id="characterModal" data-backdrop="false" >
	    <div class="modal-dialog modal-lg" >
	        <div class="modal-content">
	            <div class="modal-header">
	               	 프로필 이미지
	            </div>
	            <div class="modal-body">		
				   	<table>
						<tr>
							<th><img class="character" id="1"
								src="<c:url value='/resources/images/character/character1.png'/>"/></th>
							<th><img class="character" id="2"
								src="<c:url value='/resources/images/character/character2.png'/>"/></th>
							<th><img class="character" id="3"
								src="<c:url value='/resources/images/character/character3.png'/>"/></th>
							<th><img class="character" id="4"
								src="<c:url value='/resources/images/character/character4.png'/>"/></th>
	
						</tr>
						<tr>
							<th><img class="character" id="5"
								src="<c:url value='/resources/images/character/character5.png'/>"/></th>
							<th><img class="character" id="6"
								src="<c:url value='/resources/images/character/character6.png'/>"/></th>
							<th><img class="character" id="7"
								src="<c:url value='/resources/images/character/character7.png'/>" /></th>
							<th><img class="character" id="8"
								src="<c:url value='/resources/images/character/character8.png'/>"/></th>
						</tr>
					</table>	
	            </div>
	            <div class="modal-footer">
	          		 <form method="post" action="<c:url value='/mypage/modify'/>">
							<input  id="profileImg" type="hidden" name="profileImg" value="${sessionScope.memberProfileImg}" />
							<input  id="signDate" type="hidden" name="signDate" value="${signDate}" />
							
							<button type="submit" class="btn btn-default">Save</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</form>
	            </div>
	        </div>
	    </div>
	</div><!-- 모달 -->



<script>
	/*프로필 이미지 바꾸기*/
	//1]모달 띄우기
	$("#characterBtn").click(function(){
		$('#characterModal').modal()
	});
	//2]사진 클릭시 테두리 만들기
	$(".character").click(function(){
		$(".character").css("border","none");
		$(this).css("border","#99CCFF 3px solid");
		var index = $(".character").index(this)+1;
		$("#profileImg").val("character"+index+".png");
	});
	   
	/*닉네임 유효성 검사*/
	var nicknameResult = "${sessionScope.memberNickname}";
	var nicknameDuplicateCheck =false;
	//1]유효성 검사
	$("#nicknameModifyBtn").click(function(){
	if(!($("#nickname").val().length >= 2 &&  $("#nickname").val().length <= 10)){
		
		alert("닉네임은 2-10자 사이로 입력해 주세요");
		return false;
		
	}else if($("#nickname").val() != nicknameResult){
		
		alert("닉네임 중복체크를 해주세요");
		return false;
		
	}else if(!nicknameDuplicateCheckelse){
		
		alert("닉네임 중복체크를 해주세요");
		return false;
		
	}else{
		
		console.log("유효성 체크완료.이상없음");
	}  
	
	})
	//2]닉네임 중복체크
	$("#nicknameDuplicateCheckBtn").click(function(){
		
		nickNameDuplicateCheckAjax();
		
	})
		
	//2]닉네임 중복체크_ 백엔드로 부터 응답 받기
	function  nickNameDuplicateCheckAjax(){
		
		if($("#nickname").val() == "${sessionScope.memberNickname}"){
			
			alert("'"+"${sessionScope.memberNickname}"+"'은 현재 유저님이 사용하시는 닉네임입니다.");
			return false;
			
		}
		
		$.ajax({
			url:"<c:url value="/sign/ajax"/>",//요청할 서버의 URL주소
			type:'get',//데이타 전송방식(디폴트는 get방식) 
			dataType:'text',//서버로 부터 응답 받을 데이타의 형식 설정
			data: "nickname="+$("#nickname").val(),
			success:function(data){//서버로부터 정상적인 응답을 받았을때 호출되는 콜백함수
				var result = (data =='available' ? true : false);
				if(result){
					alert("이 닉네임은 사용할 수 있습니다.");
					nicknameDuplicateCheck = true;
					nicknameResult = $("#nickname").val();
				}else{
					alert("이 닉네임은 사용할 수 없습니다.");
					nicknameDuplicateCheck = false;
				}
			},
			error:function(error){//서버로부터 비정상적인 응답을 받았을때 호출되는 콜백함수
				console.log("ajaxError")
				alert("이 닉네임은 사용할 수 없습니다.");
				nicknameDuplicateCheck = false;
			}
				
		});
		
	}

</script>