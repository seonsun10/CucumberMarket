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
                  <li aria-current="page" class="breadcrumb-item active">FAQ</li>
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
                    <li><a href="${pageContext.request.contextPath }/inquiryList" class="nav-link">1:1 문의</a></li>
                    <li><a href="${pageContext.request.contextPath }/reportList" class="nav-link">신고</a></li>
                  </ul>
                </div>
              </div>
              <!-- *** PAGES MENU END ***-->
              <div class="banner"><a href="#"><img src="/resources/img/cucumber.png" alt="" class="img-fluid"></a></div>
            </div>
			<div class="col-lg-9">
				<form action="${pageContext.request.contextPath }/inquiry/updateInquiry.do" method="post">
					<input type="hidden" name="id" value="${loginMember.userId}"/>
					<div class="row">
						<div class="col-md-6">
						<div class="form-group">
	                        <label for="no">글 번호</label>
	                        <input name="inquiryNo" id="inquiryNo" type="text" value="<c:out value="${inq.inquiryNo}"/>" readonly class="form-control">
                      	</div>	
						<div class="form-group">
	                        <label for="id">작성자</label>
	                        <input name="inquiryId" id="inquiryId" type="text" value="<c:out value="${inq.writer.userId }"/>" readonly class="form-control">
                      	</div>	
						<div class="form-group">
                        	<label for="title">제목</label>
                        	<input name="inquiryTitle" id="inquiryTitle" type="text" value="<c:out value="${inq.inquiryTitle }"/>" class="form-control"  >
						</div>
						<div class="form-group">
                        	<label for="type">문의 유형</label>
                        	<%-- <input name="inquiryType" id="inquiryType" type="text" value="<c:out value="${inq.inquiryType }"/>" class="form-control"> --%>
                        	<select name="inquiryType" class="form-control">
                          		<option selected><span>${inq.inquiryType }</span></option>
                          		<option>---- 선택 ----</option>
                          		<option value="계정">계정</option>
                          		<option value="상품">상품</option>
                          		<option value="거래">거래</option>
                          		<option value="채팅">채팅</option>
                          		<option value="사기">사기</option>
                          		<option value="기타">기타</option>
                        	</select>
						</div>
                    </div>
					<div class="col-md-12">
						<div class="form-group">
	                        <label for="inquiryContent">문의 내용</label>
	                        <textarea name="inquiryContent" id="inquiryContent" class="form-control"><c:out value="${inq.inquiryContent }"/></textarea>
						</div>
                      <button type="submit" class="btn btn-primary">수정</button>
                      <button type="reset" class="btn btn-primary">재설정</button>
                      <button type="button" class="btn btn-primary" onclick="location.assign('${pageContext.request.contextPath }/inquiryList')">취소</button>
                    </div>
                  </div>
                  <!-- /.row-->
                </form>
			
                <!-- /.accordion-->
              </div>
            </div>
            <!-- /.col-lg-9-->
          </div>
        </div>
      </div>
<!--     </div> -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>