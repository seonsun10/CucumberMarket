<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <!-- 헤더-->
    <div id="all">
      <div id="content">
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <div id="main-slider" class="owl-carousel owl-theme">
                <div class="item"><img src="resources/img/cucumber.png" alt="" class="img-fluid"></div>
                <div class="item"><img src="resources/img/cucumber.png" alt="" class="img-fluid"></div>
                <div class="item"><img src="resources/img/cucumber.png" alt="" class="img-fluid"></div>
                <div class="item"><img src="resources/img/cucumber.png" alt="" class="img-fluid"></div>
              </div>
              <!-- /#main-slider-->
            </div>
          </div>
        </div>
        <div id="banner-container" style="text-align: center;">
        	<img src="${path }/resources/img/오이배너.jpg" width="73%"/>
        </div>
        <!--
        *** ADVANTAGES HOMEPAGE ***
        _________________________________________________________
        -->
        <div id="advantages">
          <div class="container">
            <div class="row mb-4">
              <div class="col-md-4">
                <div class="box clickable d-flex flex-column justify-content-center mb-0 h-100">
                  <div class="icon"><i class="fa fa-heart"></i></div>
                  <h3><a href="#">We love our customers</a></h3>
                  <p class="mb-0">We are known to provide best possible service ever</p>
                </div>
              </div>
              <div class="col-md-4">
                <div class="box clickable d-flex flex-column justify-content-center mb-0 h-100">
                  <div class="icon"><i class="fa fa-tags"></i></div>
                  <h3><a href="#">Best prices</a></h3>
                  <p class="mb-0">You can check that the height of the boxes adjust when longer text like this one is used in one of them.</p>
                </div>
              </div>
              <div class="col-md-4">
                <div class="box clickable d-flex flex-column justify-content-center mb-0 h-100">
                  <div class="icon"><i class="fa fa-thumbs-up"></i></div>
                  <h3><a href="#">100% satisfaction guaranteed</a></h3>
                  <p class="mb-0">Free returns on everything for 3 months.</p>
                </div>
              </div>
            </div>
            <!-- /.row-->
          </div>
          <!-- /.container-->
        </div>
        <!-- /#advantages-->
        <!-- *** ADVANTAGES END ***-->
        <!--
        *** HOT PRODUCT SLIDESHOW ***
        _________________________________________________________
        -->
        <div id="hot">
          <div class="box py-4">
            <div class="container">
              <div class="row">
                <div class="col-md-12">
                  <h2 class="mb-0">오늘의 추천 상품</h2>
                </div>
              </div>
            </div>
          </div>
          <div class="container">
            <div class="product-slider owl-carousel owl-theme">
              <div class="item">
                <div class="product">
                  <div class="flip-container">
                    <div class="flipper">
                      <div class="front"><a href="detail.html"><img src="resources/img/product1.jpg" alt="" class="img-fluid"></a></div>
                      <div class="back"><a href="detail.html"><img src="resources/img/product1_2.jpg" alt="" class="img-fluid"></a></div>
                    </div>
                  </div><a href="detail.html" class="invisible"><img src="resources/img/product1.jpg" alt="" class="img-fluid"></a>
                  <div class="text">
                    <h3><a href="detail.html">Fur coat with very but very very long name</a></h3>
                    <p class="price"> 
                      <del></del>$143.00
                    </p>
                  </div>
                  <!-- /.text-->
                  <div class="ribbon sale">
                    <div class="theribbon">SALE</div>
                    <div class="ribbon-background"></div>
                  </div>
                  <!-- /.ribbon-->
                  <div class="ribbon new">
                    <div class="theribbon">NEW</div>
                    <div class="ribbon-background"></div>
                  </div>
                  <!-- /.ribbon-->
                  <div class="ribbon gift">
                    <div class="theribbon">GIFT</div>
                    <div class="ribbon-background"></div>
                  </div>
                  <!-- /.ribbon-->
                </div>
                <!-- /.product-->
              </div>
              <div class="item">
                <div class="product">
                  <div class="flip-container">
                    <div class="flipper">
                      <div class="front"><a href="detail.html"><img src="resources/img/product2.jpg" alt="" class="img-fluid"></a></div>
                      <div class="back"><a href="detail.html"><img src="resources/img/product2_2.jpg" alt="" class="img-fluid"></a></div>
                    </div>
                  </div><a href="detail.html" class="invisible"><img src="resources/img/product2.jpg" alt="" class="img-fluid"></a>
                  <div class="text">
                    <h3><a href="detail.html">White Blouse Armani</a></h3>
                    <p class="price"> 
                      <del>$280</del>$143.00
                    </p>
                  </div>
                  <!-- /.text-->
                  <div class="ribbon sale">
                    <div class="theribbon">SALE</div>
                    <div class="ribbon-background"></div>
                  </div>
                  <!-- /.ribbon-->
                  <div class="ribbon new">
                    <div class="theribbon">NEW</div>
                    <div class="ribbon-background"></div>
                  </div>
                  <!-- /.ribbon-->
                  <div class="ribbon gift">
                    <div class="theribbon">GIFT</div>
                    <div class="ribbon-background"></div>
                  </div>
                  <!-- /.ribbon-->
                </div>
                <!-- /.product-->
              </div>
              <div class="item">
                <div class="product">
                  <div class="flip-container">
                    <div class="flipper">
                      <div class="front"><a href="detail.html"><img src="resources/img/product3.jpg" alt="" class="img-fluid"></a></div>
                      <div class="back"><a href="detail.html"><img src="resources/img/product3_2.jpg" alt="" class="img-fluid"></a></div>
                    </div>
                  </div><a href="detail.html" class="invisible"><img src="resources/img/product3.jpg" alt="" class="img-fluid"></a>
                  <div class="text">
                    <h3>
                    <a href="detail.html">Black Blouse Versace</a></h3>
                    <p class="price">
					<del></del>$143.00
                    </p>
                  </div>
                  <!-- /.text-->
                </div>
    			
                <!-- /.product-->
              </div>
              <div class="item">
                <div class="product">
                  <div class="flip-container">
                    <div class="flipper">
                      <div class="front"><a href="detail.html"><img src="resources/img/product3.jpg" alt="" class="img-fluid"></a></div>
                      <div class="back"><a href="detail.html"><img src="resources/img/product3_2.jpg" alt="" class="img-fluid"></a></div>
                    </div>
                  </div><a href="detail.html" class="invisible"><img src="resources/img/product3.jpg" alt="" class="img-fluid"></a>
                  <div class="text">
                    <h3><a href="detail.html">Black Blouse Versace</a></h3>
                    <p class="price"> 
                      <del></del>$143.00
                    </p>
                  </div>
                  <!-- /.text-->
                </div>
                <!-- /.product-->
              </div>
              <div class="item">
                <div class="product">
                  <div class="flip-container">
                    <div class="flipper">
                      <div class="front"><a href="detail.html"><img src="resources/img/cucumber.png" alt="" class="img-fluid"></a></div>
                      <div class="back"><a href="detail.html"><img src="resources/img/cucumber.png" alt="" class="img-fluid"></a></div>
                    </div>
                  </div><a href="detail.html" class="invisible"><img src="resources/img/cucumber.png" alt="" class="img-fluid"></a>
                  <div class="text">
                    <h3><a href="detail.html">White Blouse Versace</a></h3>
                    <p class="price"> 
                      <del></del>$143.00
                    </p>
                  </div>
                  <!-- /.text-->
                  <div class="ribbon new">
                    <div class="theribbon">NEW</div>
                    <div class="ribbon-background"></div>
                  </div>
                  <!-- /.ribbon-->
                </div>
                <!-- /.product-->
              </div>
              <div class="item">
                <div class="product">
                  <div class="flip-container">
                    <div class="flipper">
                      <div class="front"><a href="detail.html"><img src="resources/img/product1.jpg" alt="" class="img-fluid"></a></div>
                      <div class="back"><a href="detail.html"><img src="resources/img/product1_2.jpg" alt="" class="img-fluid"></a></div>
                    </div>
                  </div><a href="detail.html" class="invisible"><img src="resources/img/product1.jpg" alt="" class="img-fluid"></a>
                  <div class="text">
                    <h3><a href="detail.html">Fur coat</a></h3>
                    <p class="price"> 
                      <del></del>$143.00
                    </p>
                  </div>
                  <!-- /.text-->
                  <div class="ribbon gift">
                    <div class="theribbon">GIFT</div>
                    <div class="ribbon-background"></div>
                  </div>
                  <!-- /.ribbon-->
                </div>
                <!-- /.product-->
              </div>
              <div class="item">
                <div class="product">
                  <div class="flip-container">
                    <div class="flipper">
                      <div class="front"><a href="detail.html"><img src="resources/img/product2.jpg" alt="" class="img-fluid"></a></div>img                      <div class="back"><a href="detail.html"><img src="resources/img/product2_2.jpg" alt="" class="img-fluid"></a></div>
                    </div>
                  </div><a href="detail.html" class="invisible"><img src="resources/img/product2.jpg" alt="" class="img-fluid"></a>
                  <div class="text">
                    <h3><a href="detail.html">White Blouse Armani</a></h3>
                    <p class="price"> 
                      <del>$280</del>$143.00
                    </p>
                  </div>
                  <!-- /.text-->
                  <div class="ribbon sale">
                    <div class="theribbon">SALE</div>
                    <div class="ribbon-background"></div>
                  </div>
                  <!-- /.ribbon-->
                  <div class="ribbon new">
                    <div class="theribbon">NEW</div>
                    <div class="ribbon-background"></div>
                  </div>
                  <!-- /.ribbon-->
                  <div class="ribbon gift">
                    <div class="theribbon">GIFT</div>
                    <div class="ribbon-background"></div>
                  </div>
                  <!-- /.ribbon-->
                </div>
                <!-- /.product-->
              </div>
              <div class="item">
                <div class="product">
                  <div class="flip-container">
                    <div class="flipper">
                      <div class="front"><a href="detail.html"><img src="resources/img/product3.jpg" alt="" class="img-fluid"></a></div>
                      <div class="back"><a href="detail.html"><img src="resources/img/product3_2.jpg" alt="" class="img-fluid"></a></div>
                    </div>
                  </div><a href="detail.html" class="invisible"><img src="resources/img/product3.jpg" alt="" class="img-fluid"></a>
                  <div class="text">
                    <h3><a href="detail.html">Black Blouse Versace</a></h3>
                    <p class="price"> 
                      <del></del>$143.00
                    </p>
                  </div>
                  <!-- /.text-->
                </div>
                <!-- /.product-->
              </div>
              <!-- /.product-slider-->
            </div>
            <!-- /.container-->
          </div>
          <!-- /#hot-->
          <!-- *** HOT END ***-->
        </div>
        <!--
        *** GET INSPIRED ***
        _________________________________________________________
        -->
        <!-- <div class="container">
          <div class="col-md-12">
            <div class="box slideshow">
              <h3>Get Inspired</h3>
              <p class="lead">Get the inspiration from our world class designers</p>
              <div id="get-inspired" class="owl-carousel owl-theme">
                <div class="item"><a href="#"><img src="resources/img/getinspired1.jpg" alt="Get inspired" class="img-fluid"></a></div>
                <div class="item"><a href="#"><img src="resources/img/getinspired2.jpg" alt="Get inspired" class="img-fluid"></a></div>
                <div class="item"><a href="#"><img src="resources/img/getinspired3.jpg" alt="Get inspired" class="img-fluid"></a></div>
              </div>
            </div>
          </div>
        </div> -->
        <!-- *** GET INSPIRED END ***-->
        <!--
        *** BLOG HOMEPAGE ***
        _________________________________________________________
        -->
        <!-- <div class="box text-center">
          <div class="container">
            <div class="col-md-12">
              <h3 class="text-uppercase">From our blog</h3>
              <p class="lead mb-0">What's new in the world of fashion? <a href="blog.html">Check our blog!</a></p>
            </div>
          </div>
        </div>
        <div class="container">
          <div class="col-md-12">
            <div id="blog-homepage" class="row">
              <div class="col-sm-6">
                <div class="post">
                  <h4><a href="post.html">Fashion now</a></h4>
                  <p class="author-category">By <a href="#">John Slim</a> in <a href="">Fashion and style</a></p>
                  <hr>
                  <p class="intro">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>
                  <p class="read-more"><a href="post.html" class="btn btn-primary">Continue reading</a></p>
                </div>
              </div>
              <div class="col-sm-6">
                <div class="post">
                  <h4><a href="post.html">Who is who - example blog post</a></h4>
                  <p class="author-category">By <a href="#">John Slim</a> in <a href="">About Minimal</a></p>
                  <hr>
                  <p class="intro">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>
                  <p class="read-more"><a href="post.html" class="btn btn-primary">Continue reading</a></p>
                </div>
              </div>
            </div>
            /#blog-homepage
          </div>
        </div>
        /.container
        *** BLOG HOMEPAGE END ***
      </div>
    </div> -->
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
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>