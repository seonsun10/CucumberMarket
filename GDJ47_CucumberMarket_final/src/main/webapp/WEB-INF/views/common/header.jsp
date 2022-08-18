<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
  <head>
     <link rel="icon" href="${path }/resources/img/cucumber.png"/>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>::오이마켓::오늘도 이용하는 마켓</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="${path}/resources/vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="${path}/resources/vendor/font-awesome/css/font-awesome.min.css">
    <!-- Google fonts - Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700">
    <!-- owl carousel-->
    <link rel="stylesheet" href="${path}/resources/vendor/owl.carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="${path}/resources/vendor/owl.carousel/assets/owl.theme.default.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="${path}/resources/css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="${path}/resources/css/custom.css">
    <link rel="stylesheet" href="${path}/resources/css/mypage/mypage.css">
    <!-- Favicon-->
    <!-- <link rel="shortcut icon" href="favicon.png"> -->
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
        
   <script src="https://kit.fontawesome.com/e4c89f4cce.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    
  </head>
  <body>
  <header class="header mb-5">
      <!--
      *** TOPBAR ***
      _________________________________________________________
      -->
      <div id="top">
        <div class="container">
          <div class="row">
            <div class="col-lg-6 offer mb-3 mb-lg-0"></div>
            <div class="col-lg-6 text-center text-lg-right">
              <ul class="menu list-inline mb-0">
              	<c:if test="${loginMember.userId eq null}">
                 <li class="list-inline-item"><a href="${path}/" data-toggle="modal" data-target="#login-modal">Login</a></li>
                </c:if>
                <c:if test="${loginMember.userId ne null}">
                 <li class="list-inline-item"><a href="${path}/logout">Logout</a></li>
                </c:if>
                <li class="list-inline-item"><a href="${pageContext.request.contextPath}/joinForm">Register</a></li>
                <li class="list-inline-item"><a href="${pageContext.request.contextPath}/contactPage">Contact</a></li>
                <li class="list-inline-item"><a href="#">Recently viewed</a></li>
              </ul>
            </div>
          </div>
        </div>
        <div id="login-modal" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true" class="modal fade">
          <div class="modal-dialog modal-sm">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">Customer login</h5>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
              </div>
              <div class="modal-body">
                <form action="${path}/loginprocess" method="post">
                  <div class="form-group">
                    <input id="email-modal" type="text" name="userId" placeholder="email" class="form-control">
                  </div>
                  <div class="form-group">
                    <input id="password-modal" type="password" name="password" placeholder="password" class="form-control">
                  </div>
                  <p class="text-center">
                    <button class="btn btn-primary"><i class="fa fa-sign-in"></i> Log in</button>
                  </p>
                </form>
                <p class="text-center text-muted">아직 가입하지 않으셨나요?</p>
                <p class="text-center text-muted"><a href="${path}/joinForm"><strong>바로 가입</strong></a>! 1분 안에 간단한 회원가입!!</p>
              </div>
            </div>
          </div>
        </div>

        
        
      </div>
      <nav class="navbar navbar-expand-lg">
        <div class="container"><a href="${path}/" class="navbar-brand home"><img src="${path}/resources/img/cucumber.png" style="width:85px;height:75px"alt="Obaju logo" class="d-none d-md-inline-block"><img src="/resources/img/cucumber.png" alt="Obaju logo" class="d-inline-block d-md-none"><span class="sr-only">오이마켓 - go to homepage</span></a>
          <div class="navbar-buttons">
            <button type="button" data-toggle="collapse" data-target="#navigation" class="btn btn-outline-secondary navbar-toggler"><span class="sr-only">Toggle navigation</span><i class="fa fa-align-justify"></i></button>
            <button type="button" data-toggle="collapse" data-target="#search" class="btn btn-outline-secondary navbar-toggler"><span class="sr-only">Toggle search</span><i class="fa fa-search"></i></button><a href="basket.html" class="btn btn-outline-secondary navbar-toggler"><i class="fa fa-shopping-cart"></i></a>
          </div>
          <div id="navigation" class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
              <li class="nav-item"><a href="${path}/" class="nav-link">Home</a></li>

              

              
              <li class="nav-item dropdown menu-large"><a href="#" data-toggle="dropdown" data-hover="dropdown" data-delay="200" class="dropdown-toggle nav-link">상품 카테고리<b class="caret"></b></a>

                <ul class="dropdown-menu megamenu">
                  <li>
                    <div class="row">
                      <div class="col-md-6 col-lg-3">
                        <h5>여성의류</h5>
                        <ul class="list-unstyled mb-3">
                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=패딩" class="nav-link">패딩</a></li>
                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=코트" class="nav-link">코트</a></li>

                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=반팔" class="nav-link">반팔</a></li>
                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=긴팔" class="nav-link">긴팔</a></li>

                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=티셔츠" class="nav-link">티셔츠</a></li>

                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=셔츠" class="nav-link">셔츠</a></li>
                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=바지" class="nav-link">바지</a></li>
                        </ul>
                      </div>
                      <div class="col-md-6 col-lg-3">
                        <h5>남성의류</h5>
                        <ul class="list-unstyled mb-3">

                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=남성패딩" class="nav-link">패딩</a></li>
                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=남성코트" class="nav-link">코트</a></li>
                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=남성반팔" class="nav-link">반팔</a></li>
                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=남성긴팔" class="nav-link">긴팔</a></li>
                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=남성셔츠" class="nav-link">셔츠</a></li>
                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=남성바지" class="nav-link">바지</a></li>

                          

                        </ul>
                      </div>
                      <div class="col-md-6 col-lg-3">
                        <h5>신발</h5>
                        <ul class="list-unstyled mb-3">
                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=스니커즈" class="nav-link">스니커즈</a></li>
                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=구두" class="nav-link">구두</a></li>
                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=슬리퍼" class="nav-link">슬리퍼</a></li>
                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=샌들" class="nav-link">샌들</a></li>
                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=운동화" class="nav-link">운동화</a></li>
                        </ul>
                      </div>
                      <div class="col-md-6 col-lg-3">
                        <h5>디지털/가전</h5>
                        <ul class="list-unstyled mb-3">
                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=모바일" class="nav-link">모바일</a></li>
                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=가전제품" class="nav-link">가전제품</a></li>
                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=컴퓨터" class="nav-link">컴퓨터</a></li>
                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=게임" class="nav-link">게임</a></li>
                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=카메라" class="nav-link">카메라</a></li>
                        </ul>
                      </div>
                      <div class="col-md-6 col-lg-3">
                        <h5>차량/오토바이</h5>
                        <ul class="list-unstyled mb-3">
                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=국산차" class="nav-link">국산차</a></li>
                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=수입차" class="nav-link">수입차</a></li>
                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=차량용품" class="nav-link">차량용품</a></li>
                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=오토바이" class="nav-link">오토바이</a></li>

                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=오토바이용품" class="nav-link">오토바이 용품</a></li>

                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=오토바이 용품" class="nav-link">오토바이 용품</a></li>

                        </ul>
                      </div>
                      <div class="col-md-6 col-lg-3">
                        <h5>도서/티켓/문구</h5>
                        <ul class="list-unstyled mb-3">
                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=도서" class="nav-link">도서</a></li>
                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=티켓" class="nav-link">티켓</a></li>
                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=문구" class="nav-link">문구</a></li>
                        </ul>
                      </div>
                      <div class="col-md-6 col-lg-3">
                        <h5>가구/인테리어</h5>
                        <ul class="list-unstyled mb-3">
                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=가구" class="nav-link">가구</a></li>
                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=인테리어" class="nav-link">인테리어</a></li>
                        </ul>
                      </div>
                      <div class="col-md-6 col-lg-3">
                        <h5>스포츠</h5>
                        <ul class="list-unstyled mb-3">
                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=골프" class="nav-link">골프</a></li>
                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=캠핑" class="nav-link">캠핑</a></li>
                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=낚시" class="nav-link">낚시</a></li>
                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=축구" class="nav-link">축구</a></li>
                          <li class="nav-item"><a href="${path }/product/productTotal.do?tag=헬스" class="nav-link">헬스</a></li>
                        </ul>
                      </div>
                    </div>
                  </li>
                </ul>
              </li>
              <li class="nav-item"><a href="${path }/board/boardlist.do" class="nav-link">동네생활</a></li>
              <%-- <li class="nav-item dropdown menu-large"><a href="#" data-toggle="dropdown" data-hover="dropdown" data-delay="200" class="dropdown-toggle nav-link">Ladies<b class="caret"></b></a>
                <ul class="dropdown-menu megamenu">
                  <li>
                    <div class="row">
                      <div class="col-md-6 col-lg-3">
                        <h5>Clothing</h5>
                        <ul class="list-unstyled mb-3">
                          <li class="nav-item"><a href="category.html" class="nav-link">T-shirts</a></li>
                          <li class="nav-item"><a href="category.html" class="nav-link">Shirts</a></li>
                          <li class="nav-item"><a href="category.html" class="nav-link">Pants</a></li>
                          <li class="nav-item"><a href="category.html" class="nav-link">Accessories</a></li>
                        </ul>
                      </div>
                      <div class="col-md-6 col-lg-3">
                        <h5>Shoes</h5>
                        <ul class="list-unstyled mb-3">
                          <li class="nav-item"><a href="category.html" class="nav-link">Trainers</a></li>
                          <li class="nav-item"><a href="category.html" class="nav-link">Sandals</a></li>
                          <li class="nav-item"><a href="category.html" class="nav-link">Hiking shoes</a></li>
                          <li class="nav-item"><a href="category.html" class="nav-link">Casual</a></li>
                        </ul>
                      </div>
                      <div class="col-md-6 col-lg-3">
                        <h5>Accessories</h5>
                        <ul class="list-unstyled mb-3">
                          <li class="nav-item"><a href="category.html" class="nav-link">Trainers</a></li>
                          <li class="nav-item"><a href="category.html" class="nav-link">Sandals</a></li>
                          <li class="nav-item"><a href="category.html" class="nav-link">Hiking shoes</a></li>
                          <li class="nav-item"><a href="category.html" class="nav-link">Casual</a></li>
                          <li class="nav-item"><a href="category.html" class="nav-link">Hiking shoes</a></li>
                          <li class="nav-item"><a href="category.html" class="nav-link">Casual</a></li>
                        </ul>
                        <h5>Looks and trends</h5>
                        <ul class="list-unstyled mb-3">
                          <li class="nav-item"><a href="category.html" class="nav-link">Trainers</a></li>
                          <li class="nav-item"><a href="category.html" class="nav-link">Sandals</a></li>
                          <li class="nav-item"><a href="category.html" class="nav-link">Hiking shoes</a></li>
                        </ul>
                      </div>
                      <div class="col-md-6 col-lg-3">
                        <div class="banner"><a href="#"><img src="${path}/resources/img/banner.jpg" alt="" class="img img-fluid"></a></div>
                        <div class="banner"><a href="#"><img src="${path}/resources/img/banner2.jpg" alt="" class="img img-fluid"></a></div>
                      </div>
                    </div>
                  </li>
                </ul>
              </li>
              <--<li class="nav-item dropdown menu-large"><a href="#" data-toggle="dropdown" data-hover="dropdown" data-delay="200" class="dropdown-toggle nav-link">Template<b class="caret"></b></a>
                <ul class="dropdown-menu megamenu">
                  <li>
                    <div class="row">
                      <div class="col-md-6 col-lg-3">
                        <h5>Shop</h5>
                        <ul class="list-unstyled mb-3">
                          <li class="nav-item"><a href="index.html" class="nav-link">Homepage</a></li>
                          <li class="nav-item"><a href="category.html" class="nav-link">Category - sidebar left</a></li>
                          <li class="nav-item"><a href="category-right.html" class="nav-link">Category - sidebar right</a></li>
                          <li class="nav-item"><a href="category-full.html" class="nav-link">Category - full width</a></li>
                          <li class="nav-item"><a href="detail.html" class="nav-link">Product detail</a></li>
                        </ul>
                      </div>
                      <div class="col-md-6 col-lg-3">
                        <h5>User</h5>
                        <ul class="list-unstyled mb-3">
                          <li class="nav-item"><a href="register.html" class="nav-link">Register / login</a></li>
                          <li class="nav-item"><a href="customer-orders.html" class="nav-link">Orders history</a></li>
                          <li class="nav-item"><a href="customer-order.html" class="nav-link">Order history detail</a></li>
                          <li class="nav-item"><a href="customer-wishlist.html" class="nav-link">Wishlist</a></li>
                          <li class="nav-item"><a href="customer-account.html" class="nav-link">Customer account / change password</a></li>
                        </ul>
                      </div>
                      <div class="col-md-6 col-lg-3">
                        <h5>Order process</h5>
                        <ul class="list-unstyled mb-3">
                          <li class="nav-item"><a href="basket.html" class="nav-link">Shopping cart</a></li>
                          <li class="nav-item"><a href="checkout1.html" class="nav-link">Checkout - step 1</a></li>
                          <li class="nav-item"><a href="checkout2.html" class="nav-link">Checkout - step 2</a></li>
                          <li class="nav-item"><a href="checkout3.html" class="nav-link">Checkout - step 3</a></li>
                          <li class="nav-item"><a href="checkout4.html" class="nav-link">Checkout - step 4</a></li>
                        </ul>
                      </div>
                      <div class="col-md-6 col-lg-3">
                        <h5>Pages and blog</h5>
                        <ul class="list-unstyled mb-3">
                          <li class="nav-item"><a href="blog.html" class="nav-link">Blog listing</a></li>
                          <li class="nav-item"><a href="post.html" class="nav-link">Blog Post</a></li>
                          <li class="nav-item"><a href="${pageContext.request.contextPath }/faqList" class="nav-link">FAQ</a></li>
                          <li class="nav-item"><a href="text.html" class="nav-link">Text page</a></li>
                          <li class="nav-item"><a href="text-right.html" class="nav-link">Text page - right sidebar</a></li>
                          <li class="nav-item"><a href="404.html" class="nav-link">404 page</a></li>
                          <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
                        </ul>
                      </div>
                    </div>
                  </li>
                </ul>
              </li> --%>
            </ul>
            <div class="navbar-buttons d-flex justify-content-end">
              <div id="search-not-mobile" class="navbar-collapse collapse"></div><a data-toggle="collapse" href="#search" class="btn navbar-btn btn-primary d-none d-lg-inline-block"><span class="sr-only">Toggle search</span><i class="fa fa-search"></i></a>
              
                 <div id="search-not-mobile" class="navbar-collapse collapse">
                       <a href="${path }/member/mypage.do?userId=${loginMember.userId}" class="btn btn-primary navbar-btn">마이페이지</a>
                 </div>
   
              
             <%--  <div id="search-not-mobile" class="navbar-collapse collapse">
                 <input type="button" onclick="fn_area();" class="btn btn-primary navbar-btn" value="지역설정"/>
                 <a href="${path }/area.do">지역설정</a>
              </div> --%>
              <div id="search-not-mobile" class="navbar-collapse collapse">
                 <a href="${path }/faqList" class="btn btn-primary navbar-btn"> FAQ</a>
				</div>
             
          			
					<c:choose>
					<c:when test="${ loginMember != null}">

	              		<div id="search-not-mobile" class="navbar-collapse collapse">
				  			<a class="nav-link py-0" href="${path }/member/chat.do">
					  			<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chat-text " fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						  			<path fill-rule="evenodd" d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"></path>
						  			<path fill-rule="evenodd" d="M4 5.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zM4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8zm0 2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5z"></path>
								</svg>
							</a>
							<span id="newChatCnt" class="badge badge-pill badge-primary"></span>
						</div>
				
			
					
			
      					<div id="search-not-mobile" class="navbar-collapse collapse">
		       				<a class="nav-link py-0" href="${path }/member/notify.do">
				       			<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-bell" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
									<path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2z"/>
							  		<path fill-rule="evenodd" d="M8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
								</svg>
							<span id="newNoticeCnt" class="badge badge-pill badge-primary"></span>
							</a>
	      				</div>
	      		
	      			</c:when>
					<c:otherwise>
					
					</c:otherwise>
					</c:choose>
              
           
              </div>
            </div>
          </div>
        </div>
      </nav>
      <div id="search" class="collapse">
        <div class="container">
          <form role="search" class="ml-auto" action="${path }/product/searchProduct.do" method="post">
            <div class="input-group">
              <input type="text" placeholder="지역명, 상품명을 검색하세요!" class="form-control" name="keyword">
              <div class="input-group-append">
                <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
              </div>
            </div>
          </form>
        </div>
      </div>
</header>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<script>
/* function fn_area(){
     window.open(
      "${path}/area.do",
      "현재 내 위치 설정",
      "width=800, height=600, top=100, left=600"
    );
} */
 

	
   


	// 알림 카운트 받아오기
	 
	$.ajax({
       type: "post",
       async: "true",
       dataType: "text",
       data: {
    	   userId: '${loginMember.userId}' //data로 넘겨주기
       },
       url: "${path }/member/selectNewNoticeCnt.do",
       success: function (data, textStatus) {
    	   if(data!='0'){
       			$("#newNoticeCnt").text(data);
    	   }
       }
});

	// 채팅 카운트 받아오기
	$.ajax({
       type: "post",
       async: "true",
       dataType: "text",
       data: {
    	   userId: '${loginMember.userId}' //data로 넘겨주기
       },
       url: "${path }/member/selectNewChatCnt.do",
       success: function (data, textStatus) {
    	   if(data!='0'){
       			$("#newChatCnt").text(data);
    	   }
       }
		
});

   	
   	// 실시간 알림 받았을 시 ing
	function onMessage(evt){
		var data = evt.data;
		// toast
		let toast = "<div class='toast' role='alert' aria-live='assertive' aria-atomic='true'>";
		toast += "<div class='toast-header'><i class='fas fa-bell mr-2'></i><strong class='mr-auto'>알림</strong>";
		toast += "<small class='text-muted'></small><button type='button' class='ml-2 mb-1 close' data-dismiss='toast' aria-label='Close'>";
		toast += "<span aria-hidden='true'>&times;</span></button>";
		toast += "</div> <div class='toast-body'>" + data + "</div></div>";
		$("#msgStack").append(toast);
		$(".toast").toast({"animation": true, "autohide": false});
// 		$(".toast").toast({"animation": true, "autohide": true, "delay": 5000});
		$('.toast').toast('show');
		// 알림 카운트 추가
		$("#newChatCnt").text($("#newChatCnt").text()*1+1);
	};	
</script>