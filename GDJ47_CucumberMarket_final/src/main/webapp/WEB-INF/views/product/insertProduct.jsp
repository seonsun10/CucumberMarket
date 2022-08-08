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
                  <li class="breadcrumb-item"><a href="${path}/product/insertProductStart.do?">상품등록</a></li>
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
                  <a href="${path }/member/mypage.do${loginMember.userId}" class="nav-link"><i class="fa fa-list"></i>내 정보 보기</a>
                  <a href="${path }/member/wishList.do" class="nav-link"><i class="fa fa-heart"></i>찜 목록</a>
                  <a href="${path }/member/myAccount.do" class="nav-link"><i class="fa fa-user"></i>내 정보 수정</a>
                  <a href="${path }/product/insertProductStart.do" class="nav-link active"><i class="fa fa-sign-out"></i>상품 등록</a>
                  <a href="/logout" class="nav-link"><i class="fa fa-sign-out"></i>로그아웃</a>
                  </ul>
                  <button class="btn btn-outline-success my-2 my-sm-0"
				data-toggle="modal" data-target="#loginModal">상품 등록</button>
                </div>
		
             </div>
            </div>
            <div class="col-lg-9">
              <div class="box">
                <h1>상품 등록</h1>
                <h3>상품 이미지는 최대 4개까지 등록 가능합니다.</h3>
                <form action="${path }/product/insertProduct.do" method="post" enctype="multipart/form-data">	
						<input type="button" value="상품 이미지 추가" onclick="attachFile.add()" style="margin-bottom:5px">
						<div class="row" id="row22">
						<div class="col-md-6">
						<!-- <div id="attachFileDiv"> -->
							<input type="file" name="image1" value="" size="30" onchange="readURL(this);">
							<img id="preview" style="width:200px; height:200px;"/>
						
						<!-- </div> -->
						</div>
						</div>
						
						
						<br>
						<label for="exampleInputEmail1">상품 제목</label>
						<input type="text" name="proName" class="form-control"
						placeholder="상품 제목" required><br>
						<div class="row">
		                    <div class="col-md-4">
		                      <div class="form-group">
		                      	<label for="exampleInputEmail1">상품 카테고리</label>
								<select class="form-control" style="margin-bottom:10px;" name="tag1" id="tag1" ></select>
								<select class="form-control" name="tag" id="tag2" required></select>
		                      </div>
		                      </div>
		                      <div class="col-md-4">
		                      <div class="form-group">
		                      	<label for="password_old">거래 지역</label>
		                        <select  class="form-control" style="margin-bottom:10px;" name="sido1" id="sido1"></select>
								<select class="form-control" name="gugun1" id="gugun1" required></select>
		                      </div>
		                    </div>
		                </div>
						
						<label for="exampleInputEmail1">상품 상태</label><br>
						<label class="radio-inline">
						  <input type="radio" name="proStatus" id="inlineRadio1" value="y" > 중고상품
						</label>
						<label class="radio-inline">
						  <input type="radio" name="proStatus" id="inlineRadio2" value="n"> 새상품
						</label><br>
						<label for="exampleInputEmail1">상품 가격</label>
						<input type="number" name="price" class="form-control"
						placeholder="상품 가격" required"><br>
						<label for="exampleInputEmail1">상품 설명</label>
						<textarea class="form-control" name="proContent" rows="6" placeholder="상품 설명" required></textarea><br>
						<input id="userId" name="userId"  type="hidden" value="${loginMember.userId }"/>
                    <button type="submit" onclick="fn_aaa();" class="btn btn-primary"><i class="fa fa-save"></i>상품 등록 하기</button>
                  </div>
                </form>
                
              </div>
            </div>
          </div>
        </div>
      </div>
      
<script>
function readURL(input,idx) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	      
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
	}
 
function readURL1(input,idx) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview'+idx).src = e.target.result;
 	      
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview1').src = "";
	  }
	}
	
	
	attachFile = {
	        idx:0,
	        add:function(){ // 파일필드 추가
	            var o = this;
	            var idx = o.idx;
	 			console.log(idx);
	 			
	            var div = document.createElement('div');
	            
	            div.style.marginTop = '5px';
	            div.id = 'file' + o.idx;
	            div.className = 'col-md-6';
	            var file = document.all ? document.createElement('<input name="files">') : document.createElement('input');
	            file.type = 'file';
	            file.name = 'image';
	            file.size = '30';
	            file.id = 'fileField' + o.idx;
	            file.onchange = function(){readURL1(this,idx)}
	            
	            var img = document.createElement('img');
	 			img.id = 'preview'+idx;
	 			img.style.width = '200px';
	 			img.style.height = '200px';
	 			
	 			
	            var btn = document.createElement('input');
	            btn.type = 'button';
	            btn.value = '삭제';
	            btn.onclick = function(){o.del(idx)}
	            btn.style.marginLeft = '5px';
	            div.appendChild(file);
	            div.appendChild(img);
	            div.appendChild(btn);
	            document.getElementById('row22').appendChild(div);
	 			
	            o.idx++;
	        },
	        del:function(idx){ // 파일필드 삭제
	            if(document.getElementById('fileField' + idx).value != '' && !confirm('삭제 하시겠습니까?')){
	            	
	            	return;
	            }
	          	
	            document.getElementById('row22').removeChild(document.getElementById('file' + idx));
				idx--;
				console.log(idx);
	        }
	    }
	

	
function fn_aaa(){
	alert('상품 등록이 완료되었습니다.');
}
</script>	
			

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>