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
                  <a href="${path }/member/mypage.do" class="nav-link active"><i class="fa fa-list"></i>내 정보 보기</a>
                  <a href="${path }/member/wishList.do" class="nav-link"><i class="fa fa-heart"></i>찜 목록</a>
                  <a href="${path }/member/myAccount.do" class="nav-link"><i class="fa fa-user"></i>내 정보 수정</a>
                  <a href="/logout" class="nav-link"><i class="fa fa-sign-out"></i>로그아웃</a>
                  </ul>
                  <button class="btn btn-outline-success my-2 my-sm-0"
				data-toggle="modal" data-target="#loginModal">상품 등록</button>
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
				  		<div id="havePro">
				  		<img src="https://cdn-icons-png.flaticon.com/512/4695/4695312.png"
				  		 width="14px"/>
				  			방문자수&nbsp;
				  			<span id="count">0명</span>
				  		</div>
				  		<div id="dibs">
				  		<img src="https://cdn-icons-png.flaticon.com/512/6696/6696548.png" width="14px"/>
				  			등록상품&nbsp;
				  			<span id="count">0개</span>
				  		</div>
				  		<div id="report">
				  		<img src="https://cdn-icons-png.flaticon.com/512/5132/5132236.png" width="14px"/>
				  			상품판매&nbsp;
				  			<span id="count">0개</span>
				  		</div>
				  	</div>
				  	<div id="produce">
				  		<c:if test="${loginMember.intro ne null }">
				  			<c:out value="${loginMember.intro }"/>
				  		</c:if>
				  		<c:if test="${loginMember.intro eq null }">
				  			소개 내용이 없습니다~.~;;
				  		</c:if>
				  		<form class="mb-3" name="myform" id="myform"
				  		 action="${path }/product/productReview.do?proNo=151&writer=${loginMember.userId}" method="post">
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
				  <div>
				  <div id="myList">
				  	<p id="protag">상품</p>
				  	<p id="reviewtag">후기</p>
				  	<p id="dibstag">찜</p>
				  	<p id="reporttag">신고</p>
				  	<p id="chattag">채팅</p>
				  </div>
				  </div>
                </div>
              </div>
              
              <!-- 여기 이제 분기처리 해야함 등록한 상품이없으면 안보이게 -->
              <div id="databox" class="col-lg-9 box " style="max-width:100%;">
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
   
    <div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="loginModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h2 class="modal-title" id="loginModalLabel">상품 등록</h2>
						<button type="button" class="close" 
						data-dismiss="modal" aria-label="close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<form action="${path }/product/insertProduct.do" method="post">
					<div class="modal-body">
						<label for="exampleInputFile">상품 이미지 업로드</label><br>
   						<input type="file" id="exampleInputFile" name="image" class="real-upload" accept="image/*" required multiple>
   						<div class="upload"></div>
  						<ul class="image-preview"></ul>
  						
						<input type="text" name="proName" class="form-control"
						placeholder="제목" required><br>
						<select class="form-control" name="tag" aria-label="Default select example">
						  <option selected>상품태그</option>
						  <option value="의류">의류</option>
						  <option value="핸드폰">핸드폰</option>
						  <option value="컴퓨터">컴퓨터</option>
						  <option value="자동차/오토바이">차량용품</option>
						  <option value="가전제품">가전제품</option>
						  <option value="상품권">상품권</option>
						  <option value="가구/인테리어">가구/인테리어</option>
						  <option value="스포츠">스포츠</option>
						  <option value="기타">기타</option>
						</select><br>
						<input type="text" name="region" class="form-control"
						placeholder="거래 지역" required><br>
						<label class="radio-inline">
						  <input type="radio" name="proStatus" id="inlineRadio1" value="y"> 중고상품
						</label>
						<label class="radio-inline">
						  <input type="radio" name="proStatus" id="inlineRadio2" value="n"> 새상품
						</label><br>
						<input type="number" name="price" class="form-control"
						placeholder="가격" required"><br>
						<textarea class="form-control" name="proContent" rows="5" placeholder="상품내용"></textarea><br>
						<!-- <input type="text" name="user" value="admin" class="form-control">		 -->								
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-outline-success">로그인</button>
						<button type="button" class="btn btn-outline-success"
						data-dismiss="modal">취소</button>
					</div>
					</form>
				</div>
			</div>
			<input id="userIdd" type="hidden" value="${loginMember.userId }"/>
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
<script>
function getImageFiles(e) {
    const uploadFiles = [];
    const files = e.currentTarget.files;
    const imagePreview = document.querySelector('.image-preview');
    const docFrag = new DocumentFragment();

    if ([...files].length >= 7) {
      alert('이미지는 최대 6개 까지 업로드가 가능합니다.');
      return;
    }

    // 파일 타입 검사
    [...files].forEach(file => {
      if (!file.type.match("image/.*")) {
        alert('이미지 파일만 업로드가 가능합니다.');
        return
      }

      // 파일 갯수 검사
      if ([...files].length < 3) {
        uploadFiles.push(file);
        const reader = new FileReader();
        reader.onload = (e) => {
          const preview = createElement(e, file);
          imagePreview.appendChild(preview);
        };
        reader.readAsDataURL(file);
      }
    });
  }

  function createElement(e, file) {
    const li = document.createElement('li');
    const img = document.createElement('img');
    img.setAttribute('src', e.target.result);
    img.setAttribute('data-file', file.name);
    li.appendChild(img);

    return li;
  }

  const realUpload = document.querySelector('.real-upload');
  const upload = document.querySelector('.upload');

  upload.addEventListener('click', () => realUpload.click());

  realUpload.addEventListener('change', getImageFiles);
</script>
<script src="${path}/resources/js/mypage.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>