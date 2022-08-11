<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
<script src="${path}/resources/vendor/jquery/jquery.min.js"></script>
    <div id="all">
      <div id="content">
        <div class="container">
          <div class="row">
            <div class="col-lg-12">
              <!-- breadcrumb-->
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="${path}/member/mypage.do?userId=${loginMember.userId}">마이페이지</a></li>
                  <li aria-current="page" class="breadcrumb-item active"><c:out value="${loginMember.userId }"/></li>
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
                  <a href="${path }/member/mypage.do?${loginMember.userId}" class="nav-link active"><i class="fa fa-list"></i>내 정보 보기</a>
                  <a href="${path }/member/wishList.do" class="nav-link"><i class="fa fa-heart"></i>찜 목록</a>
                  <a href="${path }/member/myAccount.do" class="nav-link"><i class="fa fa-user"></i>내 정보 수정</a>
                  <a href="${path }/product/insertProductStart.do" class="nav-link" style="margin-left:2px;"><i class="fa-solid fa-hand-holding-dollar" style="margin-right:5px;"></i>판매 하기</a>
                  <a href="/logout" class="nav-link"><i class="fa fa-sign-out"></i>로그아웃</a>
                  </ul>
                  <!-- <button class="btn btn-outline-success my-2 my-sm-0"
				data-toggle="modal" data-target="#loginModal">상품 등록</button> -->
                </div>
              </div>
              <!-- /.col-lg-3-->
              <!-- *** CUSTOMER MENU END ***-->
            </div>
            <div id="customer-orders" class="col-lg-9">
              <div class="box">
                <h1><c:out value="${loginMember.name }"/>님 어서오세요</h1>
                <hr>
                <div class="table-responsive">
                  <br/>
                  <div id="mp-h">
				  	<div id="imgBox">
				  		<img src="https://cdn-icons-png.flaticon.com/512/149/149071.png"/>
				  	</div>
				  	<div id="mp-b">
				  		<div id="mp-ba">
					  		<div id="havePro">
					  		<img src="https://cdn-icons-png.flaticon.com/512/4695/4695312.png"
					  		 width="14px"/>
					  			방문자수&nbsp;
					  			<span id="count"><c:out value="${viewCount }"/>명</span>
					  		</div>
					  		<div id="dibs">
					  		<img src="https://cdn-icons-png.flaticon.com/512/6696/6696548.png" width="14px"/>
					  			등록상품&nbsp;
					  			<span id="count"><c:out value="${productCount }"/>개</span>
					  		</div>
					  		<div id="sale">
					  		<img src="https://cdn-icons-png.flaticon.com/512/5132/5132236.png" width="14px"/>
					  			상품판매&nbsp;
					  			<span id="count"><c:out value="${solveCount }"/>개</span>
					  		</div>
				  		</div>
					  		<div id="intro">
						  		${loginMember.intro}
						  		<form class="mb-3" name="myform" id="myform"
					  				 action="${path }/product/productReview.do?proNo=6301&writer=${loginMember.userId}&host=manager" method="post">
							  		<fieldset>
										<input type="radio" name="oi" value="5" id="rate1"><label
											for="rate1">★</label>
										<input type="radio" name="oi" value="4" id="rate2"><label
											for="rate2">★</label>
										<input type="radio" name="oi" value="3" id="rate3"><label
											for="rate3">★</label>
										<input type="radio" name="oi" value="2" id="rate4"><label
											for="rate4">★</label>
										<input type="radio" name="oi" value="1" id="rate5"><label
											for="rate5">★</label>
									</fieldset>
									<input type="submit" value="제출" />
					  		</form>
					  	</div>
	              </div>
			  	</div>
			  <div>
			  <div id="myList">
			  	<p id="protag">상품</p>
			  	<p id="reviewtag">후기</p>
			  	<p id="dibstag">찜</p>
			  	<p id="reporttag">신고</p>
			  	<p id="chattag">채팅</p>
			  	<input id="userIdd" type="hidden" value="${loginMember.userId }"/>
			  </div>
			  <br/>
			  
               </div>
              
              <!-- 여기 이제 분기처리 해야함 등록한 상품이없으면 안보이게 -->
              <div id="databox" class="col-lg-9 box " style="max-width:100%;">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    

<style>
#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform fieldset legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewContents {
    width: 100%;
    height: 150px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}

</style>


</style>
<script>
function getImageFiles(e) {
    const uploadFiles = [];
    const files = e.currentTarget.files;
    const imagePreview = document.querySelector('.image-preview');
    const docFrag = new DocumentFragment();
}
</script>
<script src="${path}/resources/js/mypage.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>