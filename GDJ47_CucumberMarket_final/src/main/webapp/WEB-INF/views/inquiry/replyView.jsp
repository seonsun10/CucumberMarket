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
	                  			<li aria-current="page" class="breadcrumb-item active">문의글</li>
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
		                    		<li><a href="${pageContext.request.contextPath }/inquiryList" class="nav-link">문의하기</a></li>
                    				<li><a href="${pageContext.request.contextPath }/reportList" class="nav-link">신고하기</a></li>
		                  		</ul>
		                	</div>
	              		</div>
	              		<!-- *** PAGES MENU END ***-->
	              		<div class="banner"><a href="#"><img src="/resources/img/cucumber.png" alt="" class="img-fluid"></a></div>
            		</div>
            		<div class="col-lg-9">
						<table aria-label="breadcrumb" class="box" border="1" summary="게시판 상세내용" width="650" height="350" border="1" cellpadding="5" align="center" >
						 	<colgroup>
						  		<col width = "130px" />
						  		<col width = "500px" />
						 	</colgroup>
						 	<tbody class="card-body" >
 						  		<tr>
						   			<th align="center" style="text-align: center">답글 번호</th>
						   			<td align="center" style="text-align: center"><c:out value="${inq.reInquiry.replyinquiryNo}"/></td>
						  		</tr>
						  		<tr>
						   			<th align="center" style="text-align: center">제목</th>
						   			<td align="center" style="text-align: center"><c:out value="${inq.reInquiry.replyinquiryTitle}"/></td>
						  		</tr>
						  		<tr>
						   			<th align="center" style="text-align: center">작성자</th>
						   			<td align="center" style="text-align: center"><%-- <c:out value="${inq.reInquiry.writer}"/> --%>관리자</td>
						  		</tr>
						  		<tr>
						   			<th align="center" style="text-align: center">문의 유형</th>
						   			<td align="center" style="text-align: center"><c:out value="${inq.inquiryType}"/></td>
						  		</tr>
								<tr>
									<th align="center" style="text-align: center">내용</th>
						   			<td align="center" colspan="2" height="200px"><c:out value="${inq.reInquiry.replyinquiryContent}"/> </td>
						  		</tr>
						 	</tbody>
							<tr>
								<td colspan="2" align="center">
						 			<input type="button" value="목록" onclick="location.assign('${pageContext.request.contextPath }/inquiryList')"/>
						 			<c:if test="${loginMember.userId eq 'admin'}">
							 			<input type="button" value="수정" onclick="location.assign('${pageContext.request.contextPath }/updateReply/${inq.inquiryNo}')"/>
							 			<input type="button" value="삭제" onclick="location.assign('${pageContext.request.contextPath }/deleteReply/${inq.reInquiry.replyinquiryNo}')"/>
						 			</c:if>
						 		</td>
						 	</tr>
						</table>
					</div>
				</div>
				<!-- /.col-lg-9-->
			</div>
		</div>
	</div>
<!-- </div> -->
   
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>