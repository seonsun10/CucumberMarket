<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                  <li class="breadcrumb-item"><a href="#">Home</a></li>
                  <li aria-current="page" class="breadcrumb-item active">My page</li>
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
<<<<<<< HEAD
                  <ul class="nav nav-pills flex-column"><a href="${path }/member/mypage.do" class="nav-link active">
                  <i class="fa fa-list"></i>내 정보 보기</a><a href="#" class="nav-link">
                  <i class="fa fa-heart"></i>찜 목록</a><a href="${path }/member/myAccount.do" class="nav-link">
                  <i class="fa fa-user"></i>내 정보 수정</a><a href="/logout" class="nav-link">
                  <i class="fa fa-sign-out"></i>로그아웃</a></ul>
=======
                  <ul class="nav nav-pills flex-column">
                  <a href="${path }/member/mypage.do" class="nav-link active"><i class="fa fa-list"></i>내 정보 보기</a>
                  <a href="${path }/member/wishList.do" class="nav-link"><i class="fa fa-heart"></i>찜 목록</a>
                  <a href="${path }/member/myAccount.do" class="nav-link"><i class="fa fa-user"></i>내 정보 수정</a>
                  <a href="" class="nav-link"><i class="fa fa-sign-out"></i>로그아웃</a>
                  </ul>
>>>>>>> branch 'main' of https://github.com/seonsun10/CucumberMarket.git
                </div>
              </div>
              <!-- /.col-lg-3-->
              <!-- *** CUSTOMER MENU END ***-->
            </div>
            <div id="customer-orders" class="col-lg-9">
              <div class="box">
                <h1>내 정보보기</h1>
                <hr>
                <div class="table-responsive">
                  <!-- <table class="table table-hover">
                    <thead>
                      <tr>
                        <th>Order</th>
                        <th>Date</th>
                        <th>Total</th>
                        <th>Status</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th># 1735</th>
                        <td>22/06/2013</td>
                        <td>$ 150.00</td>
                        <td><span class="badge badge-info">Being prepared</span></td>
                        <td><a href="customer-order.html" class="btn btn-primary btn-sm">View</a></td>
                      </tr>
                      <tr>
                        <th># 1735</th>
                        <td>22/06/2013</td>
                        <td>$ 150.00</td>
                        <td><span class="badge badge-info">Being prepared</span></td>
                        <td><a href="customer-order.html" class="btn btn-primary btn-sm">View</a></td>
                      </tr>
                      <tr>
                        <th># 1735</th>
                        <td>22/06/2013</td>
                        <td>$ 150.00</td>
                        <td><span class="badge badge-success">Received</span></td>
                        <td><a href="customer-order.html" class="btn btn-primary btn-sm">View</a></td>
                      </tr>
                      <tr>
                        <th># 1735</th>
                        <td>22/06/2013</td>
                        <td>$ 150.00</td>
                        <td><span class="badge badge-danger">Cancelled</span></td>
                        <td><a href="customer-order.html" class="btn btn-primary btn-sm">View</a></td>
                      </tr>
                      <tr>
                        <th># 1735</th>
                        <td>22/06/2013</td>
                        <td>$ 150.00</td>
                        <td><span class="badge badge-warning">On hold</span></td>
                        <td><a href="customer-order.html" class="btn btn-primary btn-sm">View</a></td>
                      </tr>
                    </tbody>
                  </table> -->
                  <br/>
				  <div>
				  <h3>이메일</h3>
				  <input type="text" value="admin" readonly>
				  </div>
				  <br/>
				  <div>
				  <h3>이름</h3>
				  <input type="text" value="관리자" readonly>
				  </div>
				  <br/>
				  <div>
				  <h3>휴대폰번호</h3>
				  <input type="text" value="01011112222" readonly>
				  </div>
				  <br/>
				  <div>
				  <h3>소개글</h3>
				  <input type="text" value="소개글이야~" readonly>
				  </div>
                </div>
              </div>
              
              <!-- 여기 이제 분기처리 해야함 등록한 상품이없으면 안보이게 -->
              <div  class="col-lg-9 box " style="max-width:100%;">
                  <div class="row products" style="justify-content:center" >
                           <div style="width:200px;">
                              <h1>1</h1>
                           </div>
                           <div style="width:200px;">
                              <h1>2</h1>
                           </div>
                           <div style="width:200px;">
                              <h1>3</h1>
                           </div>
                           <div style="width:200px;">
                              <h1>4</h1>
                           </div>
                           <div style="width:200px;">
                              <h1>5</h1>
                           </div>
                           <div style="width:200px;">
                              <h1>6</h1>
                           </div>
                  </div>
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
    <!-- /#footer-->
    <!-- *** FOOTER END ***-->
    
    
    <!--
    *** COPYRIGHT ***
    _________________________________________________________
    -->
   

    <!-- *** COPYRIGHT END ***-->
    <!-- JavaScript files-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/owl.carousel/owl.carousel.min.js"></script>
    <script src="vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.js"></script>
    <script src="js/front.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>