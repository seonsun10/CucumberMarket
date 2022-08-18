<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
              <!-- *** PAGES MENU END ***-->
              <div class="banner"><a href="#"><img src="/resources/img/cucumber.png" alt="" class="img-fluid"></a></div>
            </div>
			<div class="col-lg-9">
				<div class="table-responsive">
						<form action="${pageContext.request.contextPath }/searchInquiry.do" method="post">
                  			<div class="input-group">
	                      		<div class="products-sort-by mt-2 mt-lg-0">
                        			<select name="searchType" class="form-control">
                          				<option value="inquiryTitle" selected>제목</option>
                          				<option value="inquiryType">문의 유형</option>
                        			</select>
                     			 </div>
              					<input name="keyword" type="text" placeholder="계정/상품/거래/채팅/사기/기타" class="form-control">
				              	<div class="input-group-append">
					                <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
									<a href="${pageContext.request.contextPath }/inquiryWrite" class="btn btn-primary navbar-btn"><span>문의글 작성</span></a>
				              	</div>
				            <!-- </div>
							<div class="input-group-append"> -->
				        	</div>
				        	</form>
			        		<br>
                    		<table class="table">
	                      		<thead>
	                        		<tr>
										<th>번호</th>
										<th>문의 유형</th>
	                          			<th colspan=2>제목</th>
										<th>아이디</th>
										<th>등록일</th>
										<c:if test="${loginMember.userId  eq 'admin'}">
											<th>삭제</th>
										</c:if>
										<!-- <th>답변 여부</th> -->
	                        		</tr>
	                      		</thead>
								<tbody>
								<c:if test="${not empty list }">
								<%-- ${list } --%>
								<c:forEach items="${list }" var="i">
		                        	<tr>
		                          		<td><c:out value="${i.inquiryNo}"/></td>
		                          		<td><c:out value="${i.inquiryType}"/></td>
		                          		<td colspan=1>
		                          			<%-- <a href="${pageContext.request.contextPath }/inquiryView"> --%>
		                          			<a href="${pageContext.request.contextPath }/inquiryView/${i.inquiryNo}">
												<c:out value="${i.inquiryTitle}"/>
											</a>
		                          		</td>
		                          		<td></td>
		                          		<c:if test="${loginMember.userId eq i.writer.userId }">
		                          			<td style="color:#4fbfa8">${i.writer.userId }</td>
		                          		</c:if>
		                          		<c:if test="${loginMember.userId ne i.writer.userId }">
		                          			<td>${i.writer.userId }</td>
		                          		</c:if>
		                          		<td><fmt:formatDate value="${i.inquiryDate}" pattern="yyyy-MM-dd"/></td>
		                          		<%-- <td><c:out value="${i.answer}"/></td> --%>
		                          		<c:if test="${loginMember.userId  eq 'admin'}">
		                          			<td>
		                          				<%-- <button type="button" class="btn btn-primary" onclick="location.assign('${pageContext.request.contextPath }/deleteInquiry/${i.inquiryNo}')">삭제</button> --%>
		                          				<a href="${pageContext.request.contextPath }/deleteInquiry/${i.inquiryNo}"><i class="fa fa-trash-o"></i></a>
		                          			</td>
		                          			
		                          		</c:if>
		                        	</tr>
		                        	<!-- 여기서부터 답글  -->
		                        	<c:if test="${i.reInquiry.replyinquiryNo ne null }">
		                        	<tr>
		                          		<td><%-- <c:out value="${i.inquiryNo}"/> --%></td>
		                          		<td><c:out value="${i.inquiryType}"/></td>
		                          		<td colspan=1>
		                          			<%-- <a href="${pageContext.request.contextPath }/inquiryView"> --%>
		                          				<img src="/resources/img/replyLogo.png" style="width:50px; height:20px; margin : 0;" class="img-fluid">
		                          			<a href="${pageContext.request.contextPath }/replyView/${i.inquiryNo}">
												<c:out value="${i.reInquiry.replyinquiryTitle}"/>
											</a>
		                          		</td>
		                          		<td></td>
		                          		<td style="color:blue">관리자</td>
		                          		<td><fmt:formatDate value="${i.reInquiry.replyinquiryDate}" pattern="yyyy-MM-dd"/></td>
		                          		<%-- <td><c:out value="${i.answer}"/></td> --%>
		                          		<c:if test="${loginMember.userId  eq 'admin'}">
		                          			<td>
		                          				<%-- <button type="button" class="btn btn-primary" onclick="location.assign('${pageContext.request.contextPath }/deleteInquiry/${i.inquiryNo}')">삭제</button> --%>
		                          				<a href="${pageContext.request.contextPath }/deleteReply/${i.reInquiry.replyinquiryNo}"><i class="fa fa-trash-o"></i></a>
		                          			</td>
		                          		</c:if>
		                        	</tr>
		                        	</c:if>
		                        	</c:forEach>
		                        	</c:if>
		                        	<c:if test="${empty list }">
						            	<tr>
						            		<td colspan="8" align="center">조회 결과 없음</td>
						            	</tr>
						            </c:if>
	                      		</tbody>
                   		 	</table>
							<div id="pageBar"><c:out value="${pageBar }" escapeXml="false"/></div>
						</div>
            </div>
            <!-- /.col-lg-9-->
          </div>
        </div>
      </div>
    </div>

 
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>