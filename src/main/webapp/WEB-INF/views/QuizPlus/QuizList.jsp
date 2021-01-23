<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.RecordPage-Content .searchDiv .btn{
border:none;
background-color:#bc3234;
}.RecordPage-Content .searchDiv .btn:hover{
background-color:#bc1717;
}
.RecordPage-Content{
width:80%;
}
.RecordPage-Content .searchDiv{
margin-top: 20px;
margin-bottom: 20px;
}.RecordPage-Content .RecordPage-Table tr:nth-child(1){
 border-bottom: 4px solid #c3c3c3;
}
.RecordPage-Content .RecordPage-Table tr:nth-child(1) th{
 border-top: none;
}
.RecordPage-Content .RecordPage-Table a{
 color:#650c1e;
}.RecordPage-Content .modal-dialog {
width: 90%;
max-width:1300px;
height: 100%;
}.RecordPage-Content .modal-header{
	font-family: 'Nanum Pen Script', cursive;
	font-size: 30px;
}#calendar{
    max-width: 1000px;
    margin: 0 auto;
    font-size: 10px;
   
}.fc-toolbar {
    font-size: 20px;
    font-family: 'Do Hyeon', sans-serif;
}.fc-toolbar h2 {
    
    white-space: normal !important;
    font-family: 'Nanum Pen Script', cursive;
}.fc .fc-button-primary {
    color: #fff;
    color: var(--fc-button-text-color, #fff);
    background-color: #2C3E50;
    background-color: var(--fc-button-bg-color, #2C3E50);
    border:none;
}.fc .fc-button-primary:disabled { /* not DRY */
    background-color: #CC0000;
    background-color: var(--fc-button-bg-color, #CC0000);
}.fc{
font-family: 'Noto Serif KR', serif;
}.fc-sticky{
 font-size: 1.4em;
}</style>
<div class="container RecordPage-Content">
	<div class="row">
		<div class="searchDiv col-md-12">
			<form class="form-inline" method="post"
				action="<c:url value='/BookReport/List.do'/>">
				<div class="form-group">
					<select name="searchColumn" class="form-control">
						<option value="BOOK_TITLE">책 제목</option>
						<option value="BOOK_CATEGORY">카테고리</option>
						<option value="BOOK_WRITER">저자</option>
					</select>
				</div>
				<div class="form-group">
					<input type="text" name="searchWord" class="form-control" />
				</div>
				<button type="submit" class="btn btn-info">검색</button>
				<a href="<c:url value="/BookReport/Write.do"/>"
				class="btn btn-info">등록</a>
			</form>
			<div class="text-right">
				<span id="calendarBtn"  class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<table class="table table-hover RecordPage-Table">
				<!-- 테이블 컬럼폭은 col-*-*계열로 설정 -->
				    <tr>
					<th  class="col-md-2 text-center">카테고리</th>
					<th  class="text-left">책 제목</th>
					<th  class="col-md-2 text-left">저자</th>
					<th  class="col-md-1 text-center">출판사</th>
					<th  class="col-md-2 text-center">작성일</th>
					</tr>
				<c:if test="${empty bookList}" var="isEmpty">
					<tr>
						<td colspan="5">등록된 게시물이 없어요</td>
					</tr>
				</c:if>
				<c:if test="${!isEmpty}">
					<c:forEach var="item" items="${bookList}" varStatus="loop">
						<tr>
							<td  class="text-center">${item.bookCategory}</td>
							<td  class="text-left"><a href="<c:url value='/BookReport/View.do?no=${item.bookNo}&nowPage='/><c:out value='${param.nowPage}' default='1'/>">${item.bookTitle}</a></td>
							<td  class="text-left">${item.bookWriter}</td>
							<td  class="text-center">${item.bookPublishing}</td>
							<td  class="text-center">${item.bookDate}</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
		<!-- column -->
	</div>
	<!-- row -->
	<div class="row">
		<div class="col-md-12 text-center">${pagingString}</div>
	</div>


<!-- 모달 -->
	<div class="modal fade" id="calendarModal" data-backdrop="false" >
	    <div class="modal-dialog modal-lg" >
	        <div class="modal-content">
	            <div class="modal-header">
	               	 월간 독서
	            </div>
	            <div class="modal-body">		
				   		<div  id='calendar'></div>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	            </div>
	        </div>
	    </div>
	</div><!-- /모달 -->
</div><!--container-->
