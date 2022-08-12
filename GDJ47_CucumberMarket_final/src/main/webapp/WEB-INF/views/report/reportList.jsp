<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		                  		<h3 class="h4 card-title">Pages</h3>
		                	</div>
		                	<div class="card-body">
		                  		<ul class="nav nav-pills flex-column">
		                    		<li><a href="${pageContext.request.contextPath }/inquiryList" class="nav-link">1:1 문의</a></li>
			                    	<li><a href="${pageContext.request.contextPath }/reportList" class="nav-link">신고</a></li>
		                    		<li><a href="${pageContext.request.contextPath }/faqList" class="nav-link">FAQ</a></li>
		                  		</ul>
		                	</div>
	              		</div>
	              		<!-- *** PAGES MENU END ***-->
	              		<div class="banner"><a href="#"><img src="/resources/img/cucumber.png" alt="" class="img-fluid"></a></div>
            		</div>
            		<div class="col-lg-9">
                  		<div class="table-responsive">
                  			<div class="input-group">
              					<input type="text" placeholder="Search" class="form-control">
				              	<div class="input-group-append">
				                <button type="button" class="btn btn-primary"><i class="fa fa-search"></i></button>
								<%-- <a href="${pageContext.request.contextPath }/reportWrite" class="btn btn-primary navbar-btn"><span>신고글 작성</span></a> --%>
				              </div>
							<%-- <div class="input-group-append">
								<a href="${pageContext.request.contextPath }/reportWrite" class="btn btn-primary navbar-btn"><span>신고글 작성</span></a>
				        	</div> --%>
			        		<br>
                    		<table class="table">
	                      		<thead>
	                        		<tr>
										<th>번호</th>
										<th>신고자 아이디</th>
	                          			<th colspan=2>제목</th>
										<th>신고대상 아이디</th>
										<th>등록일</th>
										<th>삭제</th>
	                        		</tr>
	                      		</thead>
								<tbody>
								<c:if test="${not empty report }">
								<c:forEach items="${report }" var="r">
		                        	<tr>
		                          		<td><c:out value="${r.repNo}"/></td>
		                          		<td><c:out value="${r.userId.userId }"/></td>
		                          		<td colspan=2>
		                          			<a href="${pageContext.request.contextPath }/reportView/${r.repNo}"><c:out value="${r.repTitle}"/></a>
		                          		</td>
		                          		<td style="color:red"><c:out value="${r.targetId}"/></td>
		                          		<td><fmt:formatDate value="${r.repDate}" pattern="yyyy-MM-dd"/></td>
		                          		<td><a href=""><i class="fa fa-trash-o"></i></a></td>
		                        	</tr>
		                        	</c:forEach>
		                        	</c:if>
		                        	<c:if test="${empty report }">
						            	<tr>
						            		<td colspan="7" align="center">조회 결과 없음</td>
						            	</tr>
						            </c:if>
	                      		</tbody>
                   		 	</table>
							</div>
                    		<!-- <nav aria-label="Page navigation example" class="d-flex justify-content-center">
	                  			<ul class="pagination">
	                    			<li class="page-item"><a href="#" aria-label="Previous" class="page-link"><span aria-hidden="true">«</span><span class="sr-only">Previous</span></a></li>
	                    			<li class="page-item active"><a href="#" class="page-link">1</a></li>
	                    			<li class="page-item"><a href="#" class="page-link">2</a></li>
	                    			<li class="page-item"><a href="#" class="page-link">3</a></li>
	                    			<li class="page-item"><a href="#" class="page-link">4</a></li>
	                    			<li class="page-item"><a href="#" class="page-link">5</a></li>
	                    			<li class="page-item"><a href="#" aria-label="Next" class="page-link"><span aria-hidden="true">»</span><span class="sr-only">Next</span></a></li>
								</ul>
							</nav> -->
						</div>
							<div id="pageBar"><c:out value="${pageBar }" escapeXml="false"/></div>
						<!-- /.accordion-->
					</div>
				</div>
				<!-- /.col-lg-9-->
			</div>
		</div>
	</div>
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>