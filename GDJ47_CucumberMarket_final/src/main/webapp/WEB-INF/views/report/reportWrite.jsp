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
                    <li><a href="${pageContext.request.contextPath }/inquiryList" class="nav-link">문의하기</a></li>
                    <li><a href="${pageContext.request.contextPath }/reportList" class="nav-link">신고</a></li>
                  </ul>
                </div>
              </div>
              <!-- *** PAGES MENU END ***-->
              <div class="banner"><a href="#"><img src="${path }/resources/img/cucumber.png" alt="" class="img-fluid"></a></div>
            </div>
            <div class="col-lg-9">
				
                  <h4>신고글 작성</h4>
                  <form action="${pageContext.request.contextPath }/report/insertReport.do" method="post">
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group">
                          <label for="repId">작성자 아이디</label>
                          <input name="repId" id="repId" type="text" class="form-control" value="<c:out value="${loginMember.userId }"/>" readonly>
                        </div>
                      </div>
                    </div>
                    <!-- <div class="row">
                      <div class="col-md-6">
                        <div class="form-group">
                          <label for="proNo">상품 번호</label>
                          <input id="proNo" type="text" class="form-control">
                        </div>
                      </div>
                    </div> -->
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group">
                          <label for="repType">신고 사유</label>
                          <select name="repType" class="form-control">
                          		<option selected>선택</option>
                          		<option value="욕설">욕설</option>
                          		<option value="사기">사기</option>
                          		<option value="도배">도배</option>
                          		<option value="음란성">음란성</option>
                          		<option value="종교및정치적발언">종교및정치적발언</option>
                          		<option value="기타">기타</option>
                        	</select>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group">
                          <label for="repTitle">제목</label>
                          <input name="repTitle" id="repTitle" type="text" class="form-control">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group">
                          <label for="targetId">신고자 아이디</label>
                          <input name="targetId" id="targetId" type="text" value="<c:out value="${id}"/>" class="form-control" readonly>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label for="repContent">신고 내용</label>
                          <textarea name="repContent" id="repCotent" rows="4" class="form-control"></textarea>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12 text-right">
                        <button type="submit" class="btn btn-primary">등록</button>
                      	<button type="reset" class="btn btn-primary">재설정</button>
                      	<button type="button" class="btn btn-primary" onclick="location.assign('${pageContext.request.contextPath }/reportList')">취소</button>
                      </div>
                    </div>
                  </form>
                
                <br>
            <!-- /.col-lg-9-->
          </div>
        </div>
      </div>
    </div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>