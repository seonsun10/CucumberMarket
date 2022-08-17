<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- navbar-->
    
    <div id="all">
      <div id="content">
        <div class="container">
          <div class="row">
            <div class="col-lg-12">
              <!-- breadcrumb-->
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">Home</a></li>
                  <li aria-current="page" class="breadcrumb-item active">회원 정보 수정</li>
                </ol>
              </nav>
            </div>
            <div class="col-lg-3">
              <!--
              *** CUSTOMER MENU ***
              _________________________________________________________
              -->
              <div class="card sidebar-menu">
                <div class="card-header">
                  <h3 class="h4 card-title">메뉴</h3>
                </div>
                <div class="card-body">
                  <ul class="nav nav-pills flex-column">
                     <a href="${path }/member/mypage.do?userId=${loginMember.userId}" class="nav-link"><i class="fa fa-list"></i>내 정보 보기</a>
                     <a href="${path }/member/wishList.do?userId=${loginMember.userId}" class="nav-link"><i class="fa fa-heart"></i>찜 목록</a>
                     <a href="${path }/member/myAccount.do" class="nav-link active"><i class="fa fa-user"></i>내 정보 수정</a>
                     <a href="${path }/product/insertProductStart.do" class="nav-link" style="margin-left:2px;"><i class="fa-solid fa-hand-holding-dollar" style="margin-right:5px;"></i>판매 하기</a>
                     <a href="/logout" class="nav-link"><i class="fa fa-sign-out"></i>로그아웃</a>
                     </ul>
                </div>
              </div>
              <!-- /.col-lg-3-->
              <!-- *** CUSTOMER MENU END ***-->
            </div>
            <div class="col-lg-9">
              <div class="box">
              <h1>회원정보</h1>
                <p class="text-muted">현재 페이지에서 회원님의 정보를 수정할 수 있습니다.</p>
                <form action="${path }/member/update.do" method="post" enctype="multipart/form-Data">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="email">이메일</label>
                        <input id="email" type="text" class="form-control" name="id" style="background-color:lightgray;" readonly value="<c:out value="${loginMember.userId }"/>">
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="name">이름</label>
                        <input id="name" type="text" class="form-control" value="<c:out value="${loginMember.name }"/>">
                      </div>
                    </div>
                  </div>
                  <!-- /.row-->
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="company" style="margin-top:8px;">전화번호</label> 
                        <input id="company" type="text" name="phone" class="form-control" value="<c:out value="${loginMember.phone }"/>" style="margin-top:3px;">
                      </div>
                    </div>

                    <div class="col-md-6 col-lg-3" style="display:inline;">
                      <div class="form-group">
                        <label for="company" style="margin-top:8px;">지역</label> 
                        <div >
                    	<input id="region" type="text" name="region" class="form-control" value="${loginMember.region }" style="margin-top:5px; width:365px">
                    	<input type="button" onclick="fn_area();" class="btn btn-primary" value="지역설정" style="margin-top:5px;">
                        </div>
                      </div>
                    </div>

                    <div class="col-md-12">
                      <div class="form-group">
                        <label for="intro">자기소개 한마디!</label>
                        <input id="intro" type="text" class="form-control" name="intro" value="<c:out value="${loginMember.intro}"/>">
                      </div>
                    </div>
                    <div class="col-md-12 text-center">
                      <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> 수정하기</button>
                    </div>
                  </div>
                </form>
                
                <h3>비밀번호 변경</h3>
                <form action="${path }/member/pwUpdate.do" method="post"  onsubmit="return pwcheck();">
                  <input name="userId" type="hidden" value="${loginMember.userId }">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="oldPw">현재 비밀번호</label>
                        <input name="oldPw" id="oldPw" type="password" class="form-control" required>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="newPw">새로운 비밀번호</label>
                        <input name="newPw" id="newPw" type="password" class="form-control" required>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="password_2">비밀번호 확인</label>
                        <input id="password_2" type="password" class="form-control" required>
                        <span id="pwBox"></span>
                      </div>
                    </div>
                  </div>
                  <!-- /.row-->
                  <div class="col-md-12 text-center">
                    <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i>비밀번호 변경</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
<script>
function fn_area(){
    window.open(
     "${path}/area.do",
     "현재 내 위치 설정",
     "width=800, height=600, top=100, left=600"
   );
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>