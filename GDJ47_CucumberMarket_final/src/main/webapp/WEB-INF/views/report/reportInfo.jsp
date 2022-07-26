<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" /> -->

	<div id="all">
		<div id="content">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
              		<!-- breadcrumb-->
						<nav aria-label="breadcrumb">
	                		<ol class="breadcrumb">
	                  			<li class="breadcrumb-item"><a href="/">Home</a></li>
	                  			<li aria-current="page" class="breadcrumb-item active">신고하기</li>
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
		                  		<h3 class="h4 card-title">FAQ</h3>
		                	</div>
		                	<div class="card-body">
		                  		<ul class="nav nav-pills flex-column">
		                    		<li><a href="${pageContext.request.contextPath }/faqList" class="nav-link">FAQ</a></li>
		                    		<li><a href="${pageContext.request.contextPath }/admin/searchNotice.do" class="nav-link">공지사항</a></li>
		                    		<li><a href="${pageContext.request.contextPath }/inquiryList" class="nav-link">1:1 문의</a></li>
			                    	<c:choose>
							        	<c:when test="${loginMember.userId eq 'admin'}">
							            	<li><a href="${pageContext.request.contextPath }/reportList" class="nav-link">신고</a></li>
							            </c:when>
							            <c:when test="${loginMember.userId ne 'admin'}">
							            	<li><a href="${pageContext.request.contextPath }/reportInfo" class="nav-link">신고</a></li>
							            </c:when>
						            </c:choose>
		                  		</ul>
		                	</div>
	              		</div>
	              		<!-- *** PAGES MENU END ***-->
	              		<div class="banner"><a href="#"><img src="${path }/resources/img/banner.jpg" alt="sales 2014" class="img-fluid"></a></div>
            		</div>
            		<div class="col-lg-9">
                  		<div class="box">
                  		<h1 align ="center">신고하기전 읽어주세요.</h1>
                  			<ol class="card-body">
			                	<li class="breadcrumb-item">오이마켓에서는 깨끗하고 편안한 마켓운영을 위하여 신고게시판을 개설하여 운영하고 있어요.</li>
								<li>신고인의 비밀은 절대 보장되며, 사실확인을 위하여 인적사항 및 연락처를 정확히 입력하여 주세요.</li>
								<li>신고사항을 구체적으로 작성해 주세요.</li>
								<li>허위 사실인 경우 횟수에 상관없이 계정이 삭제되요. 그러니 신중히 작성해주세요</li>
								<li>이 메뉴의 책임자는 전적으로 관리자에게 있어요.</li>
								<li>공익신고 보호법에 따라 신고자는 보호되고 지원됨을 알려드려요.</li>
							</ol>
							<br>
							<div class="input-group" align="right">
				              	<div class="input-group-append">
									<a href="${pageContext.request.contextPath }/reportWrite" class="btn btn-primary navbar-btn"><span>신고 글 작성</span></a>
								</div> 
							</div>
						<!-- /.accordion-->
					</div>
				</div>
				<!-- /.col-lg-9-->
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>