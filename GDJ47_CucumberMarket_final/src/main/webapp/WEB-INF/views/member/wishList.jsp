<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${path }/resources/css/wishList/wishlist.css"/>
<script src="${path}/resources/vendor/jquery/jquery.min.js"></script>
<div id="all">
      <div id="content">
        <div class="container">
          <div class="row">
            <div class="col-lg-12">
              <!-- breadcrumb-->
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">Home</a></li>
                  <li aria-current="page" class="breadcrumb-item active">찜 목록</li>
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
                  <a href="${path }/member/wishList.do?userId=${loginMember.userId}" class="nav-link active"><i class="fa fa-heart"></i>찜 목록</a>
                  <a href="${path }/member/myAccount.do" class="nav-link"><i class="fa fa-user"></i>내 정보 수정</a>
                  <a href="${path }/product/insertProductStart.do" class="nav-link"><i class="fa fa-sign-out"></i>판매 하기</a>
                  <a href="" class="nav-link"><i class="fa fa-sign-out"></i>로그아웃</a>
                  </ul>
                </div>
              </div>
              <!-- /.col-lg-3-->
              <!-- *** CUSTOMER MENU END ***-->
            </div>
            <div id="wishlist" class="col-lg-9">
              <ul class="breadcrumb">
                <li><a href="/member/mypage.do">Home</a></li>
                <li> 찜 목록</li>
              </ul>
              <div class="box">
                <h1>찜 목록</h1>
                <p class="lead" style="font-size:16px;">*찜 목록은 최대 8개 까지 가능합니다.</p>
              </div>
              <div class="dibs-box">
	              	<button type="button" id="deleteBtn" onclick="fn_deleteDibs();">선택삭제</button>
	              	<input type="checkbox" id="checkAll"/>
	              	<label for="checkAll"></label>
	              	<c:forEach var="w" items="${wishList }" varStatus="status">
		              	<div id="wish-box"> 
		              		<a href="#">
		              			<div>
			              			<input type="checkbox" id="myCheck${status.index }" class="normal" value="${w.wishId }">
									<label for="myCheck${status.index }"></label>
								</div>
		              			<div id="wish-pro-img">
		              				<img src="${path }/resources/img/cucumber.png" width="130px"/>
		              			</div>
		              			<div id="wish-pro-content">
			              			<div>
			              				<div id="pro-title">
			              					<c:out value="${products[status.index].title }"/>
			              				</div>
			              				<div id="pro-price">
			              					<c:out value="${products[status.index].price }"/> 
			              				</div>
			              				<div id="pro-enrollDate">
			              					<c:out value="${dayList[status.index] }"/>일 전
			              				</div>
			              			</div>
		              				<div id="pro-add">
		              					<img src="${path }/resources/img/위치.png"/>
		              					<c:out value="${products[status.index].region }"/>
		              				</div>
		              			</div>
		              		</a>
		              	</div>
		          </c:forEach>
	          </div>
              </div>
            </div>
          </div>
        </div>
      </div>
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
<script src="${path }/resources/js/wishlist.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>