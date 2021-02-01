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
}
</style>
<div class="studyGame-main-content">
     <div class="row">
     	<h1 class="col-xs-12">마이페이지</h1>
     </div>
     <div class="row">
     	<div  class="col-xs-10 col-xs-offset-1 col-sm-6 col-sm-offset-3 " id="mypageInfoBox">
			<table > 
				<tr>
					<td rowspan="3" class="col-xs-5">
							<img class="mypageProfileImg" src="<c:url value='/resources/images/character/${sessionScope.memberProfileImg}'/>" alt="프로필이 미지"/>	
					</td>
					<th>
					닉네임  : ${sessionScope.memberNickname}
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
		<a href="<c:url value="/logout"/>" class="btn btn-default">로그아웃</a>
		<a href="<c:url value="/mypage/modify"/>" class="btn btn-default">수 정</a>	
	</div>	
</div>
				
