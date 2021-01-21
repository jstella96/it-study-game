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
<title>Game Index</title>
</head>

<body>
<!-- Top -->
<jsp:include page="/WEB-INF/views/Template/Top.jsp"/>
<!-- Top -->
<section class="section">
  <div class="container">
    <div class="row">
      <div class="col-12 text-center">
        <h2 class="section-title" style="font-size : 5em; padding-top: 50px; padding-bottom: 50px;">GameRoom</h2>
      </div>
      <div class="col-lg-4 col-sm-6 mb-4 mb-lg-0">
        <article class="card shadow">
          <img class="rounded card-img-top" src='<c:url value="/resources/images/blog/post-3.jpg"/>' alt="post-thumb">
          <div class="card-body">
            <h4 class="card-title"><a href='<c:url value="/GameRoom/LongWordGame.do"/>' class="text-dark" >긴글게임</a>
            </h4>
            <p class="cars-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
              incididunt ut labore et
              dolore magna aliqua.</p>
            <a href='<c:url value="/GameRoom/LongWordGame.do"/>' class="btn btn-xs btn-primary">시작하기</a>
          </div>
        </article>
      </div>
      <div class="col-lg-4 col-sm-6 mb-4 mb-lg-0">
        <article class="card shadow">
          <img class="rounded card-img-top" src="<c:url value="/resources/images/blog/post-4.jpg"/>" alt="post-thumb">
          <div class="card-body">
            <h4 class="card-title"><a class="text-dark" href="<c:url value="/GameRoom/ShotWordGame.do"/>">짧은 낱말 게임</a>
            </h4>
            <p class="cars-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
              incididunt ut labore et
              dolore magna aliqua.</p>
            <a href="<c:url value="/GameRoom/ShotWordGame.do"/>" class="btn btn-xs btn-primary">시작하기</a>
          </div>
        </article>
      </div>
      <div class="col-lg-4 col-sm-6 mb-4 mb-lg-0">
        <article class="card shadow">
          <img class="rounded card-img-top" src="<c:url value="/resources/images/blog/post-2.jpg"/>" alt="post-thumb">
          <div class="card-body">
            <h4 class="card-title"><a class="text-dark" href="blog-single.html">개발중</a>
            </h4>
            <p class="cars-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
              incididunt ut labore et
              dolore magna aliqua.</p>
            <a href="<c:url value="/GameRoom/ShotWordGame.do"/>" class="btn btn-xs btn-primary">시작하기</a>
          </div>
        </article>
      </div>

            
    </div>
  </div>
</section>

<!-- /blog -->

<!-- Footer -->
<!-- Footer/ -->
</body>
</html>