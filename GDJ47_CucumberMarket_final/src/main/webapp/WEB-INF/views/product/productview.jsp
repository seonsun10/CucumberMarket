<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
                  <li class="breadcrumb-item">카테고리</li>
                  <li class="breadcrumb-item"></li>
                  <li aria-current="page" class="breadcrumb-item active"></li>
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
            </div>
            
            
            
            <div class="col-lg-9 order-1 order-lg-2">
              <div id="productMain" class="row">
                <div class="col-md-6">
                  <!-- <div data-slider-id="1" class="owl-carousel shop-detail-carousel"> -->
                  <div id="main-slider" class="owl-carousel owl-theme">
                  <c:forEach var="name" items="${filename }" varStatus="status">
                    <div class="item"><img src="${path }/resources/upload/product/${name}" class="img-fluid" style="height:350px;"></div>
                  </c:forEach>
                  </div>
                </div>
                
                <div class="col-md-6">
                
                  <div class="box">
                    <h1 class="text-center">${result.title }</h1>
                    <p class="price"><fmt:formatNumber value="${result.price}" pattern="#,###" />원</p>
                    <p class="text-center buttons">
                    <button class="btn btn-primary">오이채팅</button>
               <c:if test="${count==0}">
                    <button  class="btn btn-primary" onclick="location.assign('${path }/wishlist/insertWishList.do?id=${loginMember.userId}&no=${no}'); alert('관심상품등록');">관심상품등록</button>
                    </c:if>
                    <c:if test="${count==1}">
                    <button class="btn btn-primary" onclick="location.assign('${path }/wishlist/deleteWishList.do?id=${loginMember.userId}&no=${no}'); alert('관심상품삭제');">관심상품삭제</button>
                    </c:if>
                    </p>
                  </div>
                  
                  <div data-slider-id="1" class="owl-thumbs">
                    <button class="owl-thumb-item"><img src="img/detailsquare.jpg" alt="" class="img-fluid"></button>
                    <button class="owl-thumb-item"><img src="img/detailsquare2.jpg" alt="" class="img-fluid"></button>
                    <button class="owl-thumb-item"><img src="img/detailsquare3.jpg" alt="" class="img-fluid"></button>
                  </div>
                  
                </div>
              </div>
              
              
              <div id="details" class="box">
                <h2>상품 정보</h2>
                <hr>
                <h4>${result.proContent }</h4>
                <hr>
                <div class="social">
                  <h4>공유하기</h4>
                  <p><a href="#" class="external facebook"><i class="fa fa-facebook"></i></a><a href="#" class="external gplus"><i class="fa fa-google-plus"></i></a><a href="#" class="external twitter"><i class="fa fa-twitter"></i></a><a href="#" class="email"><i class="fa fa-envelope"></i></a></p>
                </div>
              </div>
              
              
              <div id="details" class="box">
              <h2>연관 상품</h2>
              <br>
            <c:if test="${relProduct ne null }">
            <div class="row same-height-row">
               <c:forEach var="rP" items="${relProduct }" varStatus="status">
               <div class="col-md-3 col-sm-6">
                  <div class="product same-height">
                    <div class="flip-container">
                      <div class="flipper">
                        <div class="front"><a href="${path }/product/productView.do?id=${loginMember.userId}&no=${rP.proNo}&tag=${rP.categoryName}"><img src="${path }/resources/upload/product/${relFilename[status.index]}" style="width:166px; height:177px;" class="img-fluid"></a></div>
                      </div>
                    </div><img src="${path }/resources/upload/product/${relFilename[status.index]}" style="width:166px; height:177px;" class="img-fluid">
                    <div class="text">
                      <h3>${rP.title }</h3>
                      <p class="price"><fmt:formatNumber value="${rP.price}" pattern="#,###" />원</p>
                    </div>
                  </div>
                </div>
             
                </c:forEach>
                </div>
                </c:if>
                <c:if test="${relProduct eq null }">
                <div>없음</div>
                </c:if>
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
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>