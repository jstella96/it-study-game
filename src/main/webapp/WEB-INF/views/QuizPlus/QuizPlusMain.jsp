<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.quizPlusMainBtns {
margin-top: 9%;
}
.quizPlusMainBtns a{
margin-bottom: 8%;
width: 40%;
padding: 10px;
background-color: #99CCFF;
font-size : 20px;
border: 0px;
font-family: 'Noto Sans KR', sans-serif;
}
</style>
<div class="studyGame-main-content">
	<div class="row">
		<div class="quizPlusMainBtns">
			<a href="<c:url value="/quizplus/page"/>" class="btn btn-info">문제 추가</a>
			<br>
			<a href="<c:url value="/quizplus/quizs?gamecode=1&id=${sessionScope.memberId}"/>" class="btn btn-info">긴 글 연습 문제집</a>
			<br>
			<a href="<c:url value="/quizplus/quizs?gamecode=2&id=${sessionScope.memberId}"/>" class="btn btn-info">짧은 글 연습 문제집</a>	
			<br>
			<a href="<c:url value="/quizplus/quizs?gamecode=3&id=${sessionScope.memberId}"/>" class="btn btn-info">개념완성 문제집</a>
		</div>
	</div>
</div>