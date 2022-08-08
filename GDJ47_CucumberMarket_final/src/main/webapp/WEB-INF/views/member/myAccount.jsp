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
                  <li aria-current="page" class="breadcrumb-item active">My account</li>
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
                     <a href="${path }/member/wishList.do" class="nav-link"><i class="fa fa-heart"></i>찜 목록</a>
                     <a href="${path }/member/myAccount.do" class="nav-link active"><i class="fa fa-user"></i>내 정보 수정</a>
                     <a href="${path }/product/insertProductStart.do" class="nav-link"><i class="fa fa-sign-out"></i>판매 하기</a>
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
                        <label for="company">전화번호</label> 
                        <input id="company" type="text" name="phone" class="form-control" value="<c:out value="${loginMember.phone }"/>">
                      </div>
                    </div>
<!--                     <div class="col-md-6">
                      <div class="form-group">
                        <label for="street">Street</label>
                        <input id="street" type="text" class="form-control">
                      </div>
                    </div>
                  </div>
                  /.row
                  <div class="row">
                    <div class="col-md-6 col-lg-3">
                      <div class="form-group">
                        <label for="city">Company</label>
                        <input id="city" type="text" class="form-control">
                      </div>
                    </div> -->
 <!--                    <div class="col-md-6 col-lg-3">
                      <div class="form-group">
                        <label for="zip">우편번호</label>
                        <input id="zip" type="text" class="form-control">
                      </div>
                    </div> -->
                    <div class="col-md-6 col-lg-3">
                      <div class="form-group">
                        <label for="state">활동지역</label>
                        <select id="state" class="form-control"></select>
                      </div>
                    </div>
 <!--                    <div class="col-md-6 col-lg-3">
                      <div class="form-group">
                        <label for="country">Country</label>
                        <select id="country" class="form-control"></select>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="phone">Telephone</label>
                        <input id="phone" type="text" class="form-control">
                      </div>
                    </div> -->
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
                        <input name="oldPw" id="oldPw" type="password" class="form-control">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="newPw">새로운 비밀번호</label>
                        <input name="newPw" id="newPw" type="password" class="form-control">
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="password_2">비밀번호 확인</label>
                        <input id="password_2" type="password" class="form-control">
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
  </body>
  
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>