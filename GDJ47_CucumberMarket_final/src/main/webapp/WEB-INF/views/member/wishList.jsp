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
                  <a href="${path }/product/insertProductStart.do" class="nav-link" style="margin-left:2px;"><i class="fa-solid fa-hand-holding-dollar" style="margin-right:5px;"></i>판매 하기</a>
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
	              	<c:if test="${wishList ne null }">
	                    <button type="button" id="deleteBtn" onclick="fn_deleteDibs();">선택삭제</button>
	                    <input type="checkbox" id="checkAll"/>
	                    <label for="checkAll"></label>
	               </c:if>
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

<!--     </div> -->

   
      <input type="hidden" value="${loginMember.userId }" id="userIdd"/>
<script src="${path }/resources/js/wishlist.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>