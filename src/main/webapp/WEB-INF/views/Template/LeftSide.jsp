<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


   	<div class="col-xs-12 profile">
		<img src= "<c:url value="/resources/images/character/${sessionScope.memberProfileImg}"/>" class="img-circle">
		<div class="col-xs-12 nickname">
		${sessionScope.memberNickname}
		</div>
	</div>
  		<!-- 왼쪽 메뉴 부분 -->
   	<ul class="menu_ul">
   		<li>
   			<a href="<c:url value="/shortword/page"/>" class="btn"  style="top:38%">
  				<span class="glyphicon glyphicon-education"></span>긴글연습</a>
  			</li>
  			<li >
   			<a href="<c:url value="/longword/page"/>" class="btn" style="top:48%;">
  				<span class="glyphicon glyphicon-education"></span>짧은글연습</a>
  			</li>
  			<li >
   			<a href="<c:url value="/interview/page"/>" class="btn" style="top:58%">
  				<span class="glyphicon glyphicon-education"></span>개념완성</a>
  			</li>
  			<li>
   			<a href="<c:url value="/record/page"/>" class="btn" style="top:68%">
  				<span class="glyphicon glyphicon-education"></span>성적확인</a>
  			</li>
  			<li>
   			<a href="<c:url value="/quizplus/main/page"/>" class="btn" style="top:78%">
  				<span class="glyphicon glyphicon-education"></span>문제관리</a>
  			</li>
  			<li>
   			<a href="<c:url value="/mypage/page"/>" class="btn" style="top:88%">
  				<span class="glyphicon glyphicon-education"></span>마이페이지</a>
  			</li>
   	</ul>
   	<!-- / 왼쪽 메뉴 부분 -->

<!-- /왼쪽 사이드 -->