<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
@charset "UTF-8";
a:hover{
	text-decoration: none;
}
div.col-lg-9{
	width:1500px;
	max-width:65%;
}
p#protag{
	background-color: rgb(229,229,229);
}
div#pro-box{
	display:inline-block;
	border: 1px solid rgb(229,229,229);
	width:200px;
	height:300px;
	margin-right:40px;
	margin-bottom:20px;
	margin-left:20px;					
}

div#pro-img>img{
	width:198px;
	border-bottom:1px solid rgb(229,229,229);
}
div#pro-title{
	padding:3%;
	border-bottom:1px solid rgb(229,229,229);
	width:100%;
}
div#pro-body2{
	display:flex;
	font-weight:800px;
	justify-content: space-between;
	padding-bottom:7%;
	align-items: center;
}
div#pro-head2{
	padding-bottom:7%;
	font-size:12px;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}
div#pro-foot{
	padding:3%;
	display: flex;
	justify-content: space-between;
}
div#pro-add{
	font-size:10px;
}
div#pro-foot>img{
	width:15px;
}
div#pro-date{
	font-size:10px;
}
#lifour>img{
	width:10px;
}
#intro{
	background-color:rgb(229,229,229);
	width:400px;
	height:180px;
	border-radius: 20px;
	opacity: 0.7;
	padding:15px;
	word-break:break-all;
	font-size:15px;
	margin-top:33px;
}
#mp-ba{
	display:flex;
}
#mp-ba>div{
	padding-right:60px;
}
</style>

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

		<div><h1></h1>

        <div id="banner-container" style="text-align: center;">
        	<img src="${path }/resources/img/오이배너.jpg" width="73%"/>
        </div>
 

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
 
        </div>
        <div id="hot" >
          <div class="box py-4">
            <div class="container">
              <div class="row">
                <div class="col-md-12">
                  <h2 class="mb-0">오늘의 추천 상품</h2>
                </div>
              </div>
            </div>

          </div>     
		<div id="databox" class="col-lg-9 box" style="margin:auto;">
		<div id="pro-body" style="margin-left:60px;">
			<c:if test="${mp ne null }">
				<c:forEach var="p" items="${mp }" varStatus="status">
					<div id="pro-box">
						<a href="${path }/product/productView.do?id=${loginMember.userId}&no=${p.proNo}&tag=${p.categoryName}&name=${p.member.userId}">
							<c:forEach var="pf" items="${mpf }">
							<c:if test="${pf.product.proNo eq p.proNo }">
							<div id="pro-img">
							<!-- 나중에 여기 /manager/ << 이부분 없애야함  -->
								<img src="${path }/resources/upload/product/${pf.renameFilename}" style="width:198px; height:200px; "/>
							</div>
							</c:if>
							</c:forEach>
							<div id="pro-title">
								<div id="pro-head2">${p.title }</div>
								<div id="pro-body2">
									<div style="color:black;"><fmt:formatNumber value="${p.price}" pattern="#,###" />원</div>
									
									<div id="pro-date">${days[status.index]}일전</div>
									
								</div>
							</div>
							<div id="pro-foot">
								<img id="add-img" src="${path }/resources/img/위치.png">
								<div id="pro-add">${p.region }</div>
							</div>
						</a>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${mp eq null }">
				조회된 결과가 없습니다.
			</c:if>
		</div>
		</div>
        </div>
          
          <!-- <!-- <div class="container">
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
                  /.text
                  <div class="ribbon sale">
                    <div class="theribbon">SALE</div>
                    <div class="ribbon-background"></div>
                  </div>
                  /.ribbon
                  <div class="ribbon new">
                    <div class="theribbon">NEW</div>
                    <div class="ribbon-background"></div>
                  </div>
                  /.ribbon
                  <div class="ribbon gift">
                    <div class="theribbon">GIFT</div>
                    <div class="ribbon-background"></div>
                  </div>
                  /.ribbon
                </div>
                /.product
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
                  /.text
                  <div class="ribbon sale">
                    <div class="theribbon">SALE</div>
                    <div class="ribbon-background"></div>
                  </div>
                  /.ribbon
                  <div class="ribbon new">
                    <div class="theribbon">NEW</div>
                    <div class="ribbon-background"></div>
                  </div>
                  /.ribbon
                  <div class="ribbon gift">
                    <div class="theribbon">GIFT</div>
                    <div class="ribbon-background"></div>
                  </div>
                  /.ribbon
                </div>
                /.product
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
                  /.text
                </div>
    			
                /.product
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
                  /.text
                </div>
                /.product
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
                  /.text
                  <div class="ribbon new">
                    <div class="theribbon">NEW</div>
                    <div class="ribbon-background"></div>
                  </div>
                  /.ribbon
                </div>
                /.product
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
                  /.text
                  <div class="ribbon gift">
                    <div class="theribbon">GIFT</div>
                    <div class="ribbon-background"></div>
                  </div>
                  /.ribbon
                </div>
                /.product
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
                  /.text
                  <div class="ribbon sale">
                    <div class="theribbon">SALE</div>
                    <div class="ribbon-background"></div>
                  </div>
                  /.ribbon
                  <div class="ribbon new">
                    <div class="theribbon">NEW</div>
                    <div class="ribbon-background"></div>
                  </div>
                  /.ribbon
                  <div class="ribbon gift">
                    <div class="theribbon">GIFT</div>
                    <div class="ribbon-background"></div>
                  </div>
                  /.ribbon
                </div>
                /.product
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
                  /.text
                </div>
                /.product
              </div>
              /.product-slider
            </div>
            /.container
          </div>
          /#hot
          *** HOT END ***
        </div> --> -->

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
    

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>