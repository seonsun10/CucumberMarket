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
                  		<form action="${pageContext.request.contextPath }/searchReport.do" method="post">
                  			<div class="input-group">
                  				<div class="products-sort-by mt-2 mt-lg-0">
                        			<select name="searchType" class="form-control">
                          				<option value="reportTitle" selected>제목</option>
                          				<option value="reportType">신고 유형</option>
                        			</select>
                     			 </div>
              					<input name="keyword" type="text" placeholder="욕설/사기/도배/음란성/종교및정치적발언/기타 " class="form-control">
				              	<div class="input-group-append">
				                	<button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
								<%-- <a href="${pageContext.request.contextPath }/reportWrite" class="btn btn-primary navbar-btn"><span>신고글 작성</span></a> --%>
				              	</div>
				              </div>
				              </form>
							<%-- <div class="input-group-append">
								<a href="${pageContext.request.contextPath }/reportWrite" class="btn btn-primary navbar-btn"><span>신고글 작성</span></a>
				        	</div> --%>
			        		<br>
                    		<table class="table">
	                      		<thead>
	                        		<tr>
										<th>번호</th>
										<th>신고 유형</th>
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
		                          		<td><c:out value="${r.repType}"/></td>
		                          		<td><c:out value="${r.userId.userId }"/></td>
		                          		<td colspan=2>
		                          			<a href="${pageContext.request.contextPath }/reportView/${r.repNo}"><c:out value="${r.repTitle}"/></a>
		                          		</td>
		                          		<td style="color:red"><c:out value="${r.targetId}"/></td>
		                          		<td><fmt:formatDate value="${r.repDate}" pattern="yyyy-MM-dd"/></td>
		                          		<td><a href="${pageContext.request.contextPath }/deleteReport/${r.repNo}"><i class="fa fa-trash-o"></i></a></td>
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
							<div id="pageBar"><c:out value="${pageBar }" escapeXml="false"/></div>
							</div>
						</div>
						<!-- /.accordion-->
					</div>
				</div>
				<!-- /.col-lg-9-->
			</div>
		</div>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>