<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${path}/resources/css/product/productView.css">
<div id="all">
      <div id="content">
        <div class="container">
          <div class="row">
            <div class="col-lg-12">
              <!-- breadcrumb-->
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">Home</a></li>
                  <li class="breadcrumb-item"><a href="#">카테고리</a></li>
                  <li class="breadcrumb-item"><a href="#">상세카테고리</a></li>
                  <li aria-current="page" class="breadcrumb-item active">제품이름</li>
                </ol>
              </nav>
            </div>
            <div class="col-lg-3 order-2 order-lg-1">
              <!--
              *** MENUS AND FILTERS ***
              _________________________________________________________
              -->
              <div class="card sidebar-menu mb-4">
                <div class="card-header">
                  <h3 class="h4 card-title">카테고리</h3>
                </div>
                <div class="card-body">
                  <ul class="nav nav-pills flex-column category-menu">
                    <li><a href="category.html" class="nav-link active">여성의류<span class="badge badge-secondary"></span></a>
                      <ul class="list-unstyled">
                        <li><a href="${path }/product/productTotal.do?tag=패딩" class="nav-link">패딩</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=코트" class="nav-link">코트</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=반팔" class="nav-link">반팔</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=긴팔" class="nav-link">긴팔</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=셔츠" class="nav-link">셔츠</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=바지" class="nav-link">바지</a></li>
                      </ul>
                    </li>
                    <li><a href="category.html" class="nav-link active">남성의류<span class="badge badge-light"></span></a>
                      <ul class="list-unstyled">
                        <li><a href="${path }/product/productTotal.do?tag=남성패딩" class="nav-link">패딩</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=남성코트" class="nav-link">코트</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=남성반팔" class="nav-link">반팔</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=남성긴팔" class="nav-link">긴팔</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=남성셔츠" class="nav-link">셔츠</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=남성바지" class="nav-link">바지</a></li>
                      </ul>
                    </li>
                    <li><a href="category.html" class="nav-link active">신발<span class="badge badge-secondary">11</span></a>
                      <ul class="list-unstyled">
                        <li><a href="${path }/product/productTotal.do?tag=스니커즈" class="nav-link">스니커즈</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=구두" class="nav-link">구두</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=슬리퍼" class="nav-link">슬리퍼</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=샌들" class="nav-link">샌들</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=운동화" class="nav-link">운동화</a></li>
                        
                      </ul>
                    </li>
                    <li><a href="category.html" class="nav-link active">디지털/가전<span class="badge badge-secondary"></span></a>
                      <ul class="list-unstyled">
                        <li><a href="${path }/product/productTotal.do?tag=모바일" class="nav-link">모바일</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=가전제품" class="nav-link">가전제품</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=컴퓨터" class="nav-link">컴퓨터</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=게임" class="nav-link">게임</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=카메라" class="nav-link">카메라</a></li>
                        
                      </ul>
                    </li>
                    <li><a href="category.html" class="nav-link active">차량/오토바이<span class="badge badge-secondary"></span></a>
                      <ul class="list-unstyled">
                        <li><a href="${path }/product/productTotal.do?tag=국산차" class="nav-link">국산차</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=수입차" class="nav-link">수입차</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=차량용품" class="nav-link">차량용품</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=오토바이" class="nav-link">오토바이</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=오토바이용품" class="nav-link">오토바이 용품</a></li>
                        
                      </ul>
                    </li>
                    <li><a href="category.html" class="nav-link active">도서/티켓/문구<span class="badge badge-secondary"></span></a>
                      <ul class="list-unstyled">
                        <li><a href="${path }/product/productTotal.do?tag=도서" class="nav-link">도서</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=티켓" class="nav-link">티켓</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=문구" class="nav-link">문구</a></li>
                        
                      </ul>
                    </li>
                    <li><a href="category.html" class="nav-link active">가구/인테리어<span class="badge badge-secondary"></span></a>
                      <ul class="list-unstyled">
                        <li><a href="${path }/product/productTotal.do?tag=가구" class="nav-link">가구</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=인테리어" class="nav-link">인테리어</a></li>
                       
                      </ul>
                    </li>
                    <li><a href="category.html" class="nav-link active">스포츠<span class="badge badge-secondary"></span></a>
                      <ul class="list-unstyled">
                        <li><a href="${path }/product/productTotal.do?tag=골프" class="nav-link">골프</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=캠핑" class="nav-link">캠핑</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=낚시" class="nav-link">낚시</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=축구" class="nav-link">축구</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=헬스" class="nav-link">헬스</a></li>
                        
                      </ul>
                    </li>                                        
                  </ul>
                </div>
              </div>
              <!-- <div class="card sidebar-menu mb-4">
                <div class="card-header">
                  <h3 class="h4 card-title">Brands <a href="#" class="btn btn-sm btn-danger pull-right"><i class="fa fa-times-circle"></i> Clear</a></h3>
                </div>
                <div class="card-body">
                  <form>
                    <div class="form-group">
                      <div class="checkbox">
                        <label>
                          <input type="checkbox"> Armani  (10)
                        </label>
                      </div>
                      <div class="checkbox">
                        <label>
                          <input type="checkbox"> Versace  (12)
                        </label>
                      </div>
                      <div class="checkbox">
                        <label>
                          <input type="checkbox"> Carlo Bruni  (15)
                        </label>
                      </div>
                      <div class="checkbox">
                        <label>
                          <input type="checkbox"> Jack Honey  (14)
                        </label>
                      </div>
                    </div>
                    <button class="btn btn-default btn-sm btn-primary"><i class="fa fa-pencil"></i> Apply</button>
                  </form>
                </div>
              </div>
              <div class="card sidebar-menu mb-4">
                <div class="card-header">
                  <h3 class="h4 card-title">Colours <a href="#" class="btn btn-sm btn-danger pull-right"><i class="fa fa-times-circle"></i> Clear</a></h3>
                </div>
                <div class="card-body">
                  <form>
                    <div class="form-group">
                      <div class="checkbox">
                        <label>
                          <input type="checkbox"><span class="colour white"></span> White (14)
                        </label>
                      </div>
                      <div class="checkbox">
                        <label>
                          <input type="checkbox"><span class="colour blue"></span> Blue (10)
                        </label>
                      </div>
                      <div class="checkbox">
                        <label>
                          <input type="checkbox"><span class="colour green"></span>  Green (20)
                        </label>
                      </div>
                      <div class="checkbox">
                        <label>
                          <input type="checkbox"><span class="colour yellow"></span>  Yellow (13)
                        </label>
                      </div>
                      <div class="checkbox">
                        <label>
                          <input type="checkbox"><span class="colour red"></span>  Red (10)
                        </label>
                      </div>
                    </div>
                    <button class="btn btn-default btn-sm btn-primary"><i class="fa fa-pencil"></i> Apply</button>
                  </form>
                </div>
              </div>-->
             
              <!-- <div class="banner"><a href="#"><img src="img/banner.jpg" alt="sales 2014" class="img-fluid"></a></div> -->
            </div>
            <div class="col-lg-9 order-1 order-lg-2">
              <div id="productMain" class="row">
                <div class="col-md-6">
                  <div data-slider-id="1" class="owl-carousel shop-detail-carousel">
                    <div class="item"> <img src="img/detailbig1.jpg" alt="" class="img-fluid"></div>
                    <div class="item"> <img src="img/detailbig2.jpg" alt="" class="img-fluid"></div>
                    <div class="item"> <img src="img/detailbig3.jpg" alt="" class="img-fluid"></div>
                  </div>

<!--                   <div class="ribbon sale">
                    <div class="theribbon">SALE</div>
                    <div class="ribbon-background"></div>
                  </div>
                  /.ribbon
                  <div class="ribbon new">
                    <div class="theribbon">NEW</div>
                    <div class="ribbon-background"></div>
                  </div> -->
                  <!-- /.ribbon-->
                <img style="width:400px; height:350px;">

                  <!-- /.ribbon-->
                  <div class="box" id="photoBox">
                  	이미지 박스
                  </div>

                </div>

                <div class="col-md-6" style="height:350px;">
                  <div class="box" style="height:350px;">
                  	<br>
                    <h1 class="text-center">상품 제목</h1>
                    <br>
                    
                    <p class="price" style="font-size:20px;">상품가격 원</p>
                    <br>
                    <br>
                    <p class="text-center buttons">
                    <button class="btn btn-primary">오이채팅</button>

                <div class="col-md-6">
                  <div class="box">
                    <h4>상품명</h4>
                    <p>1000원</p>
                    채팅하기 추가 / 신고하기추가 / 
<<<<<<< HEAD
                    <button  class="btn btn-primary" onclick="openchat();">채팅하기</button>
=======

>>>>>>> branch 'main' of https://github.com/seonsun10/CucumberMarket.git
                    <c:if test="${count==0}">
                    <!-- <a href="basket.html" class="btn btn-outline-primary" style="background-color:lightgreen"><i class="fa fa-heart" style="color:white"></i></a></p> -->
                    
                    <button  class="btn btn-primary" onclick="location.assign('${path }/wishlist/insertWishList.do?id=${loginMember.userId}&no=${no}'); alert('관심상품등록');">관심상품등록</button>
                    </c:if>
                    <c:if test="${count==1}">
                    <!-- <a href="basket.html" class="btn btn-outline-primary "><i class="fa fa-heart"></i></a></p> -->
                    
                    <button class="btn btn-primary" onclick="location.assign('${path }/wishlist/deleteWishList.do?id=${loginMember.userId}&no=${no}'); alert('관심상품삭제');">관심상품삭제</button>
                    </c:if>

                    </p>

                    /상품상태(중고,새거)/판매지역/찜 개수/ 올린 날 / /
                    /올린 사람 상점으로 갈 수 있도록

                  </div>
 <!--                  <div data-slider-id="1" class="owl-thumbs">
                    <button class="owl-thumb-item"><img src="img/detailsquare.jpg" alt="" class="img-fluid"></button>
                    <button class="owl-thumb-item"><img src="img/detailsquare2.jpg" alt="" class="img-fluid"></button>
                    <button class="owl-thumb-item"><img src="img/detailsquare3.jpg" alt="" class="img-fluid"></button>
                  </div> -->
                </div>
              </div>
              <div id="details" class="box">
                <p></p>
                <h4>상품 정보</h4>
				<h2>상품 설명</h2>
                <!-- <blockquote>
                  <p><em>Define style this season with Armani's new range of trendy tops, crafted with intricate details. Create a chic statement look by teaming this lace number with skinny jeans and pumps.</em></p>
                </blockquote> -->
                <hr>
                <div class="social">
                  <h4>상품 공유하기</h4>
                  <p><a href="#" class="external facebook"><i class="fa fa-facebook"></i></a><a href="#" class="external gplus"><i class="fa fa-google-plus"></i></a><a href="#" class="external twitter"><i class="fa fa-twitter"></i></a><a href="#" class="email"><i class="fa fa-envelope"></i></a></p>
                </div>
              </div>
              <div id="details" class="box">
              <h2>연관 상품</h2>
              <br>
              <div class="row same-height-row">
                <div class="col-md-3 col-sm-6">
                  <div class="box same-height">
                    <h3>You may also like these products</h3>
                  </div>
                </div>
                <div class="col-md-3 col-sm-6">
                  <div class="product same-height">
                    <div class="flip-container">
                      <div class="flipper">
                        <div class="front"><a href="detail.html"><img src="img/product2.jpg" alt="" class="img-fluid"></a></div>
                        <div class="back"><a href="detail.html"><img src="img/product2_2.jpg" alt="" class="img-fluid"></a></div>
                      </div>
                    </div><a href="detail.html" class="invisible"><img src="img/product2.jpg" alt="" class="img-fluid"></a>
                    <div class="text">
                      <h3>Fur coat</h3>
                      <p class="price">$143</p>
                    </div>
                  </div>
                  <!-- /.product-->
                </div>
                <div class="col-md-3 col-sm-6">
                  <div class="product same-height">
                    <div class="flip-container">
                      <div class="flipper">
                        <div class="front"><a href="detail.html"><img src="img/product1.jpg" alt="" class="img-fluid"></a></div>
                        <div class="back"><a href="detail.html"><img src="img/product1_2.jpg" alt="" class="img-fluid"></a></div>
                      </div>
                    </div><a href="detail.html" class="invisible"><img src="img/product1.jpg" alt="" class="img-fluid"></a>
                    <div class="text">
                      <h3>Fur coat</h3>
                      <p class="price">$143</p>
                    </div>
                  </div>
                  <!-- /.product-->
                </div>
                <div class="col-md-3 col-sm-6">
                  <div class="product same-height">
                    <div class="flip-container">
                      <div class="flipper">
                        <div class="front"><a href="detail.html"><img src="img/product3.jpg" alt="" class="img-fluid"></a></div>
                        <div class="back"><a href="detail.html"><img src="img/product3_2.jpg" alt="" class="img-fluid"></a></div>
                      </div>
                    </div><a href="detail.html" class="invisible"><img src="img/product3.jpg" alt="" class="img-fluid"></a>
                    <div class="text">
                      <h3>Fur coat</h3>
                      <p class="price">$143</p>
                    </div>
                  </div>
                  <!-- /.product-->
                </div>
              </div>
              <div class="row same-height-row">
                <div class="col-md-3 col-sm-6">
                  <div class="box same-height">
                    <h3>Products viewed recently</h3>
                  </div>
                </div>
                <div class="col-md-3 col-sm-6">
                  <div class="product same-height">
                    <div class="flip-container">
                      <div class="flipper">
                        <div class="front"><a href="detail.html"><img src="img/product2.jpg" alt="" class="img-fluid"></a></div>
                        <div class="back"><a href="detail.html"><img src="img/product2_2.jpg" alt="" class="img-fluid"></a></div>
                      </div>
                    </div><a href="detail.html" class="invisible"><img src="img/product2.jpg" alt="" class="img-fluid"></a>
                    <div class="text">
                      <h3>Fur coat</h3>
                      <p class="price">$143</p>
                    </div>
                  </div>
                  <!-- /.product-->
                </div>
                <div class="col-md-3 col-sm-6">
                  <div class="product same-height">
                    <div class="flip-container">
                      <div class="flipper">
                        <div class="front"><a href="detail.html"><img src="img/product1.jpg" alt="" class="img-fluid"></a></div>
                        <div class="back"><a href="detail.html"><img src="img/product1_2.jpg" alt="" class="img-fluid"></a></div>
                      </div>
                    </div><a href="detail.html" class="invisible"><img src="img/product1.jpg" alt="" class="img-fluid"></a>
                    <div class="text">
                      <h3>Fur coat</h3>
                      <p class="price">$143</p>
                    </div>
                  </div>
                  <!-- /.product-->
                </div>
                <div class="col-md-3 col-sm-6">
                  <div class="product same-height">
                    <div class="flip-container">
                      <div class="flipper">
                        <div class="front"><a href="detail.html"><img src="img/product3.jpg" alt="" class="img-fluid"></a></div>
                        <div class="back"><a href="detail.html"><img src="img/product3_2.jpg" alt="" class="img-fluid"></a></div>
                      </div>
                    </div><a href="detail.html" class="invisible"><img src="img/product3.jpg" alt="" class="img-fluid"></a>
                    <div class="text">
                      <h3>Fur coat</h3>
                      <p class="price">$143</p>
                    </div>
                  </div>
                  <!-- /.product-->
                </div>
              </div>
            </div>
            </div>
            <!-- /.col-md-9-->
          </div>
        </div>
      </div>
    </div>
    <script>
     const count = ${count}
    const id = "${id}"
    const no = ${no}
    if(count==1){
	    function jjim_delete() {
	    	console.log(count);
	     	$.ajax({ 
	    		url : "${path}/wishlist/deleteWishList.do",
	    		method:"GET",
	    		data : {"id":id,"no":no},
	    		success: function (data) { 
	        		if(data>0){
	        			console.log("삭제됨");
	        		}else{
	        			console.log("삭제실패");
	        			
	        		}
	    		}
	    	});
	    }
    }
    if(count==0){
    	function jjim_insert(){
    		console.log(count);
    	}
    }
    </script>
    <script type="text/javascript">
   			const openchat=()=>{
   				$.ajax({
   					
   					data:JSON.stringify({userId:'${pro.member.userId}',
   	   	       			otherId:'${loginMember.userId}',
   	   	       			proNo:${pro.proNo}
   	   	       			 }),
   					headers:{"Content-Type":"application/json"},
   	       		 	url: '/chatingRoom',
   	       			type: "POST",
   	       			
   	       			
   	       		
   	       		 success:data=> {
   	       			 console.log(data.roomId);
   	       			 if(data.roomId!=null){
   	       			open("${path}/testchat.do/"+data.roomId,"_blank","width=580,height=600");
   	       			 }else{
   	       				 alert("본인 상품에는 채팅을 하실 수 없습니다.")
   	       			 }
   	       			
   	       			
   	       		 }
   	       	 }); 
   			};
        	
        
	
		</script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>