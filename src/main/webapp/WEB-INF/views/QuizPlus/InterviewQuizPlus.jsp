<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row col-md-10 col-md-offset-1" style="margin-top: 20px">
   <form action="<c:url value="/GameRoom/QuizInsert.do"/>" method = "post">
			<div class="form-group">
					<select name="gamecode" class="form-control">
							<option value="1">긴글게임</option>
							<option value="2">짧은글게임</option>
							<option value="3">도전 면접</option>
					</select>
			</div>
					
			    	
</select>
			</form>

</div>
	<div class="row col-md-10 col-md-offset-1" style="margin-top: 20px">
		<form  action="<c:url value="/sign"/>" method="post" autocomplete="off">
			 <div align="left">
				 <label for="inputEmail3" class="col-md-12">문제</label>
				 <div class="col-md-12">
				   <textarea rows="2" name="content" style="width:100%;"></textarea>
				 </div>
			  </div>
			  <div align="left">
				 <label for="inputEmail3" class="col-md-12">문제 해설</label>
				 <div class="col-md-12">
				   <textarea rows="5" name="content" style="width:100%;"></textarea>
				 </div>
			  </div>
			  <div class="col-md-12" align="right">
		   		  <button class="btn btn-info">등록</button>
		      </div>	  
		</form>	
	 </div>

