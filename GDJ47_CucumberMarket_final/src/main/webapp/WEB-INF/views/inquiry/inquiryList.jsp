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
                    <li><a href="${pageContext.request.contextPath }/inquiryList" class="nav-link">문의하기</a></li>
                    <c:choose>
			        	<c:when test="${loginMember.userId eq 'admin'}">
			            	<li><a href="${pageContext.request.contextPath }/reportList" class="nav-link">신고하기</a></li>
			            </c:when>
			            <c:when test="${loginMember.userId ne 'admin'}">
			            	<li><a href="${pageContext.request.contextPath }/reportInfo" class="nav-link">신고하기</a></li>
			            </c:when>
		            </c:choose>
                    <li><a href="${pageContext.request.contextPath }/faqList" class="nav-link">FAQ</a></li>
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
              					<input name="keyword" type="text" placeholder="Search" class="form-control">
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
										<th>아이디</th>
	                          			<th colspan=2>제목</th>
										<th>문의 유형</th>
										<th>등록일</th>
										<c:if test="${loginMember.userId  eq 'admin'}">
											<th>삭제</th>
										</c:if>
										<!-- <th>답변 여부</th> -->
	                        		</tr>
	                      		</thead>
								<tbody>
								<c:if test="${not empty list }">
								<c:forEach items="${list }" var="i">
		                        	<tr>
		                          		<td><c:out value="${i.inquiryNo}"/></td>
		                          		<td>${i.writer.userId }</td>
		                          		<td colspan=2>
		                          			<%-- <a href="${pageContext.request.contextPath }/inquiryView"> --%>
		                          			<a href="${pageContext.request.contextPath }/inquiryView/${i.inquiryNo}">
												<c:out value="${i.inquiryTitle}"/>
											</a>
		                          		</td>
		                          		<td><c:out value="${i.inquiryType}"/></td>
		                          		<td><fmt:formatDate value="${i.inquiryDate}" pattern="yyyy-MM-dd"/></td>
		                          		<%-- <td><c:out value="${i.answer}"/></td> --%>
		                          		<c:if test="${loginMember.userId  eq 'admin'}">
		                          			<td><button type="button" class="btn btn-primary" onclick="location.assign('${pageContext.request.contextPath }/deleteInquiry/${i.inquiryNo}')">삭제</button></td>
		                          		</c:if>
		                        	</tr>
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
    <!--
    *** FOOTER ***
    _________________________________________________________
    -->
    <div id="footer">
      <div class="container">
        <div class="row">
          <div class="col-lg-3 col-md-6">
            <h4 class="mb-3">Pages</h4>
            <ul class="list-unstyled">
              <li><a href="text.html">About us</a></li>
              <li><a href="text.html">Terms and conditions</a></li>
              <li><a href="faq.html">FAQ</a></li>
              <li><a href="contact.html">Contact us</a></li>
            </ul>
            <hr>
            <h4 class="mb-3">User section</h4>
            <ul class="list-unstyled">
              <li><a href="#" data-toggle="modal" data-target="#login-modal">Login</a></li>
              <li><a href="register.html">Regiter</a></li>
            </ul>
          </div>
          <!-- /.col-lg-3-->
          <div class="col-lg-3 col-md-6">
            <h4 class="mb-3">Top categories</h4>
            <h5>Men</h5>
            <ul class="list-unstyled">
              <li><a href="category.html">T-shirts</a></li>
              <li><a href="category.html">Shirts</a></li>
              <li><a href="category.html">Accessories</a></li>
            </ul>
            <h5>Ladies</h5>
            <ul class="list-unstyled">
              <li><a href="category.html">T-shirts</a></li>
              <li><a href="category.html">Skirts</a></li>
              <li><a href="category.html">Pants</a></li>
              <li><a href="category.html">Accessories</a></li>
            </ul>
          </div>
          <!-- /.col-lg-3-->
          <div class="col-lg-3 col-md-6">
            <h4 class="mb-3">Where to find us</h4>
            <p><strong>Obaju Ltd.</strong><br>13/25 New Avenue<br>New Heaven<br>45Y 73J<br>England<br><strong>Great Britain</strong></p><a href="contact.html">Go to contact page</a>
            <hr class="d-block d-md-none">
          </div>
          <!-- /.col-lg-3-->
          <div class="col-lg-3 col-md-6">
            <h4 class="mb-3">Get the news</h4>
            <p class="text-muted">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>
            <form>
              <div class="input-group">
                <input type="text" class="form-control"><span class="input-group-append">
                  <button type="button" class="btn btn-outline-secondary">Subscribe!</button></span>
              </div>
              <!-- /input-group-->
            </form>
            <hr>
            <h4 class="mb-3">Stay in touch</h4>
            <p class="social"><a href="#" class="facebook external"><i class="fa fa-facebook"></i></a><a href="#" class="twitter external"><i class="fa fa-twitter"></i></a><a href="#" class="instagram external"><i class="fa fa-instagram"></i></a><a href="#" class="gplus external"><i class="fa fa-google-plus"></i></a><a href="#" class="email external"><i class="fa fa-envelope"></i></a></p>
          </div>
          <!-- /.col-lg-3-->
        </div>
        <!-- /.row-->
      </div>
      <!-- /.container-->
    </div>
    <!-- /#footer-->
    <!-- *** FOOTER END ***-->

 
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>