<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<body>
    <div id="all">
      <div id="content">
        <div class="container">
          <div class="row">                       
            <div class="col-lg-12">
              <!-- breadcrumb-->
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">Home</a></li>
                  <li aria-current="page" class="breadcrumb-item active"><c:out value="${tag }"/></li>
                </ol>
              </nav>
              <div id="product-container">
              	<c:if test="${product ne null }">
					<c:forEach var="p" items="${product }" varStatus="status">
						<div id="pro-box">
							<a href="#">
								<div id="pro-img">
									<img src="${path }/resources/img/cucumber.png"/>
								</div>
								<div id="pro-title">
									<div id="pro-head2"><c:out value="${p.title}"/></div>
									<div id="pro-body2">
										<div style="color:black;"><c:out value="${p.price }"/></div>
										<div id="pro-date">
											<c:out value="${daylist[status.index]}"/>일전
										</div>
									</div>
								</div>
								<div id="pro-foot">
									<img id="add-img" src="${path }/resources/img/위치.png">
									<div id="pro-add">									
										<c:out value="${p.region }"/>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${product eq null }">
					조회된 결과가 없습니다.
				</c:if>
              </div>
              <c:if test="${productCount > 20 }">
	              <div style="text-align:center">
	              	<button type="button" id="more-box">더보기</button>
	              </div>
              </c:if>
              <!-- <div class="pages">
                <p class="loadMore"><a href="#" class="btn btn-primary btn-lg"><i class="fa fa-chevron-down"></i> Load more</a></p>
                <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                  <ul class="pagination">
                    <li class="page-item"><a href="#" aria-label="Previous" class="page-link"><span aria-hidden="true">«</span><span class="sr-only">Previous</span></a></li>
                    <li class="page-item active"><a href="#" class="page-link">1</a></li>
                    <li class="page-item"><a href="#" class="page-link">2</a></li>
                    <li class="page-item"><a href="#" class="page-link">3</a></li>
                    <li class="page-item"><a href="#" class="page-link">4</a></li>
                    <li class="page-item"><a href="#" class="page-link">5</a></li>
                    <li class="page-item"><a href="#" aria-label="Next" class="page-link"><span aria-hidden="true">»</span><span class="sr-only">Next</span></a></li>
                  </ul>
                </nav>
              </div>
            </div> -->
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
    <style>
    	#product-container{
    		justify-content: space-between;
    		display:inline-block;
    	}
    	#pro-add{
    		text-align: center;
    	}
		a:hover{
			text-decoration: none;
		}
		div.col-lg-9{
			max-width:100%;
		}
		p#protag{
			background-color: rgb(229,229,229);
		}
		div#pro-box:nth-child(5n){
			margin-right:0;
		}
		
		div#pro-box{
			display:inline-block;
			border: 1px solid rgb(229,229,229);
			width:200px;
			height:307px;
			margin-right:23.9px;
			margin-bottom:20px;
			background-color:white;
		}
		
		div#pro-img>img{
			width:199px;
			border-bottom:1px solid rgb(229,229,229);
		}
		div#pro-title{
			padding:3%;
			width:100%;
			border-bottom:1px solid rgb(229,229,229);
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
    	#pro-box:nth-child(n+21){
    		display:none;
    	}
    	
    </style>
    <script src="${path}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${path}/resources/js/otherpage.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>