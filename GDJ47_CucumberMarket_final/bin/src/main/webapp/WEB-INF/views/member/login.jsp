<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
   
    <div id="all" style="height:720px">
      <div id="content">
        <div class="container">
          <div class="row">
          	<div class="col-lg-12">
              <!-- breadcrumb-->
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">Home</a></li>
                  <li aria-current="page" class="breadcrumb-item active">로그인</li>
                </ol>
              </nav>
            </div>
			<div class="col-lg-6">
			  <div class="box">
			    <h1>Login</h1>
			    <p class="lead">::로그인::</p>
			    <p class="text-muted"></p>
			    <hr>
			    <form action="${path}/loginprocess" method="post">
			      <div class="form-group">
			        <label for="email">Email</label>
			        <input id="email" type="text" name="userId" class="form-control">
			      </div>
			      <div class="form-group">
			        <label for="password">Password</label>
			        <input id="password" type="password" name="password" class="form-control">
			      </div>
			      <div class="text-center" style="margin-bottom:6px;">
			        <button type="submit" class="btn btn-primary"><i class="fa fa-sign-in"></i> Log in</button>
			      </div>
			    </form>
			    <p class="text-center text-muted"><a href="${path }/joinForm"><strong>회원가입</strong></a>!<br>
			    	회원이 아니라면 가입을 해주세요
			    </p>
			  </div>
			</div>
		 </div>
        </div>
      </div>
    </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>