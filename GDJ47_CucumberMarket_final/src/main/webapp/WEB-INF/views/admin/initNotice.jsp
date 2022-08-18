<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>


	<div id="all">
		<div id="content">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
              <!-- breadcrumb-->
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/">Home</a></li>
								<li aria-current="page" class="breadcrumb-item active">문의하기</li>
							</ol>
						</nav>
					</div>
					<div class="col-lg-3">
              <!--
              *** PAGES MENU ***
              _________________________________________________________
              -->
						<div class="card sidebar-menu mb-4">
							<div class="card-header">
								<h3 class="h4 card-title">Pages</h3>
							</div>
							<div class="card-body">
								<ul class="nav nav-pills flex-column">
									<li><a href="${pageContext.request.contextPath }/faqList" class="nav-link">FAQ</a></li>
									<li><a href="${pageContext.request.contextPath }/admin/searchNotice.do" class="nav-link">공지사항</a></li>
									<li><a href="${pageContext.request.contextPath }/inquiryList" class="nav-link">1:1 문의</a></li>
									<li><a href="${pageContext.request.contextPath }/reportList" class="nav-link">신고</a></li>
								</ul>
							</div>
						</div>
					<div class="banner"><a href="#"><img src="/resources/img/cucumber.png" alt="" class="img-fluid"></a></div>
					</div>


					<div class="col-lg-9">
						<div class="container">
							<form enctype="multipart/form-data" method="post" name="frmQnA">
									<h2 class="m-5">
										<c:if test="${flag eq 1}">공지사항 수정</c:if>
										<c:if test="${flag eq 0}">공지사항 작성</c:if>
									</h2>
									<hr class="m-5">
									<div class="form-group col-sm-10 mx-auto mt-5 p-0">
										<!-- 제목 -->
										<div class="mb-2 row">
										    <label for="inputSubject" class="col-lg-2 col-sm-12 col-form-label">제목</label>
										    <div class="col-lg-10 col-sm-12">
										      <input type="text" class="form-control"  id="inputSubject" name="n_title" value="${article.n_title}" required>
								    		</div>
								    	</div>
								    	<!-- 에디터 -->
										<div class="mb-2 row">
											<textarea class="form-control"  id="n_content" name="n_content" rows="30" required>
												
											</textarea>
										</div>
										<c:if test="${flag eq 1}">
											<input type="hidden" name="n_id" value="${article.n_id}" />
											<input type="button" class="btn btn-primary btn-lg btn-block mt-4" value="수정" id="updateNotice"></input>
										</c:if>
										<c:if test="${flag eq 0}">
											<input type="button" class="btn btn-primary btn-lg btn-block mt-4" value="작성" id="insertNotice"></input>
										</c:if>
									</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
	// 초기화시, 선택정보 영역 set
	
	$(document).ready(function(){
		$("#n_content").val('${article.n_content}');

	});
	
	
	// 수정
		$("#updateNotice").click(function(){
			
			
			let frmQnA = document.frmQnA;
			frmQnA.action = "/admin/updateNotice.do";
			frmQnA.submit();
		});
	
	
	// 작성
	
	$("#insertNotice").click(function(){
			
			let frmQnA = document.frmQnA;
			frmQnA.action = "/admin/insertNotice.do";
			frmQnA.submit();
			
			  
			  var type = '70';
			  var target = 'js@js'; //모든유저들한테
			  var content = ("#n_title").html();
			  var url = '${path}/member/notify.do';
			  
			  
			  $.ajax({
				  
				  	type: 'post',
			        url: '/member/saveNotify.do',
			        dataType: 'text',
			        data: {
			            target: target,
			            content: content,
			            type: type,
			            url: url
			           
			        }
			      
			        
			        
			  });
		
	});
	
		
</script>