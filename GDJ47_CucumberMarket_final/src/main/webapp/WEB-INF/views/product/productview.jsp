<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="snsTitle" value="${result.title }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${path}/resources/css/product/productView.css">
<link rel="stylesheet" href="${path}/resources/css/category.css">
<style>
.link-icon { position: relative; display: inline-block;  width:40px;  font-size: 14px; font-weight: 500; color: #333; margin-right: 20px; padding-top: 50px; }
.link-icon.twitter { background-image: url(../resources/img/icon-twitter.png); background-repeat: no-repeat; }
.link-icon.facebook { background-image: url(../resources/img/icon-facebook.png); background-repeat: no-repeat; } 
.link-icon.kakao { background-image: url(../resources/img/icon-kakao.png); background-repeat: no-repeat; }
.link-icon.band { background-image: url(../resources/img/band.png); background-repeat: no-repeat;}
</style>

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
                  <li class="breadcrumb-item">${tag }</li>
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
                  <div class="menu1" >
                  <span class="">여성의류</span>
                  	<ul class="sub1 up">
                        <li><a href="${path }/product/productTotal.do?tag=패딩" class="nav-link">패딩</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=코트" class="nav-link">코트</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=반팔" class="nav-link">반팔</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=긴팔" class="nav-link">긴팔</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=셔츠" class="nav-link">셔츠</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=바지" class="nav-link">바지</a></li>
                   </ul>
                   </div>
                   <div class="menu2">
                   <span class="">남성의류</span>
                      <ul class="sub2 up">
                        <li><a href="${path }/product/productTotal.do?tag=남성패딩" class="nav-link">패딩</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=남성코트" class="nav-link">코트</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=남성반팔" class="nav-link">반팔</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=남성긴팔" class="nav-link">긴팔</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=남성셔츠" class="nav-link">셔츠</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=남성바지" class="nav-link">바지</a></li>
                      </ul>
                    </div>
                    
                    <div class="menu3">
                    <span class="">신발</span>
                      <ul class="sub3">
                        <li><a href="${path }/product/productTotal.do?tag=스니커즈" class="nav-link">스니커즈</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=구두" class="nav-link">구두</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=슬리퍼" class="nav-link">슬리퍼</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=샌들" class="nav-link">샌들</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=운동화" class="nav-link">운동화</a></li>
                      </ul>
                    </div>
                    <div class="menu4">
                    <span class="">디지털/가전</span>
                      <ul class="sub4">
                        <li><a href="${path }/product/productTotal.do?tag=모바일" class="nav-link">모바일</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=가전제품" class="nav-link">가전제품</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=컴퓨터" class="nav-link">컴퓨터</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=게임" class="nav-link">게임</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=카메라" class="nav-link">카메라</a></li>
                      </ul>
                    </div>
                    <div class="menu5">
                    <span class="">차량/오토바이</span>
                      <ul class="sub5"> 
                        <li><a href="${path }/product/productTotal.do?tag=국산차" class="nav-link">국산차</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=수입차" class="nav-link">수입차</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=차량용품" class="nav-link">차량용품</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=오토바이" class="nav-link">오토바이</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=오토바이용품" class="nav-link">오토바이 용품</a></li>
                      </ul>
                    </div>
                    <div class="menu6">
                    <span class="">도서/티켓/문구</span>
                      <ul class="sub6">
                        <li><a href="${path }/product/productTotal.do?tag=도서" class="nav-link">도서</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=티켓" class="nav-link">티켓</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=문구" class="nav-link">문구</a></li>
                      </ul>
                      </div>
                    <div class="menu7">
                    <span class="">가구/인테리어</span>
                      <ul class="sub7">
                        <li><a href="${path }/product/productTotal.do?tag=가구" class="nav-link">가구</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=인테리어" class="nav-link">인테리어</a></li>

                      </ul>
                   </div>
                   <div class="menu8">
                   <span class="">스포츠</span>
                      <ul class="sub8">
                        <li><a href="${path }/product/productTotal.do?tag=골프" class="nav-link">골프</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=캠핑" class="nav-link">캠핑</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=낚시" class="nav-link">낚시</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=축구" class="nav-link">축구</a></li>
                        <li><a href="${path }/product/productTotal.do?tag=헬스" class="nav-link">헬스</a></li>
                      </ul>
                  </div>
                </div>
              </div>
            </div>
            
            
            
            <div class="col-lg-9 order-1 order-lg-2">
              <div id="productMain" class="row">
                <div class="col-md-6">
                  <!-- <div data-slider-id="1" class="owl-carousel shop-detail-carousel"> -->
                  <div id="main-slider" class="owl-carousel owl-theme">
                  <c:forEach var="name" items="${filename }" varStatus="status">
                    <div class="item">
                    <img src="${path }/resources/upload/product/${name}" class="img-fluid" style="height:350px;">
                    </div>
                    <c:forEach var="names" items="${filesname}">
                    <div class="item">
                    <img src="${path }/resources/upload/product/${names}" class="img-fluid" style="height:350px;">
                    </div>
                     </c:forEach>
                  </c:forEach>
                  </div>
                </div>
                
                <div class="col-md-6">
                
                  <div class="box">
                    <h3 class="text-center">${result.title }</h3>
                    <c:if test="${name ne loginMember.userId }">
                    <h4 class="text-center">판매자 : <a href="${path}/member/otherMember.do?writer=${name}&customer=${loginMember.userId}">${name }</a></h4>
                    </c:if>
                    <c:if test="${name eq loginMember.userId }">
                    <h4 class="text-center">판매자 : <a href="${path }/member/mypage.do?userId=${loginMember.userId}">${name}</a></h4>
                    </c:if>
                    <p class="text-center">판매 지역 : ${region }</p>
                    <c:if test="${proStatus eq 'y' }">
                    	<p class="text-center">상품 상태 : 중고</p>
                    </c:if>
                    <c:if test="${proStatus eq 'n' }">
                   		<p class="text-center">상품 상태 : 새 상품</p>
                    </c:if>
                    <p class="price"><fmt:formatNumber value="${result.price}" pattern="#,###" />원</p>
                    <p class="text-center buttons">
                    <c:if test="${loginMember.userId eq null }">
                    	
                    </c:if>
                     <c:if test="${loginMember.userId ne null }">
                    	<button class="btn btn-primary" id="chat-Btn">오이채팅</button>
                    </c:if>
                    
                    
               		
               		<c:if test="${count==0}">
               			<c:if test="${loginMember.userId ne name }">
                    	<button  class="btn btn-primary" onclick="location.assign('${path }/wishlist/insertWishList.do?id=${loginMember.userId}&no=${no}&tag=${tag}&name=${name}&region=${region}&proStatus=${proStatus }'); alert('관심상품등록');">관심상품등록</button>
   		            	</c:if>
   		            	<%-- <c:if test="${loginMember.userId eq name }">
                    	<button  class="btn btn-primary" onclick="alert('본인상품은 관심상품으로 등록할 수 없습니다.');">관심상품등록</button>
   		            	</c:if> --%>
                    </c:if>
                    
                    <c:if test="${count==1}">
                    	<button class="btn btn-primary" onclick="location.assign('${path }/wishlist/deleteWishList.do?id=${loginMember.userId}&no=${no}&tag=${tag}&name=${name}&region=${region}&proStatus=${proStatus }'); alert('관심상품삭제');">관심상품삭제</button>
                    </c:if>
                    </p>
                  </div>
                  
                  
                  
                </div>
              </div>
              
              
              <div id="details" class="box">
                <h2>상품 정보</h2>
                <hr>
                <h4>${result.proContent }</h4>
                <hr>
                <div class="social">
                  <c:set var="title" value="${result.title }"/>
                  <h4>공유하기</h4>
                    <a id="btnKakao" onclick="fn_sendFB('kakao');return false;" class="link-icon kakao" target="_self" title="카카오톡 새창열림" >&nbsp;</a>
                    <a id="btnBand" onclick="fn_sendFB('band'); return false;" class="link-icon band" target="_self" title="밴드 새창열림">&nbsp;</a>
                    <a id="btnFacebook" onclick="fn_sendFB('facebook');return false;" class="link-icon facebook" target="_self" title="페이스북 새창열림">&nbsp;</a>
				    <a id="btnTwitter" onclick="fn_sendFB('twitter');return false;" class="link-icon twitter" target="_self" title="트위터 새창열림">&nbsp;</a>
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
                        <div class="front"><a href="${path }/product/productView.do?id=${loginMember.userId}&no=${rP.proNo}&tag=${rP.categoryName}&name=${rP.member.userId}&region=${rP.region}&proStatus=${rP.proStatus}"><img src="${path }/resources/upload/product/${relFilename[status.index]}" style="width:166px; height:177px;" class="img-fluid"></a></div>
                      </div>
                    </div><img src="${path }/resources/upload/product/${relFilename[status.index]}" style="width:166px; height:177px;" class="img-fluid">
                    <div class="text">
                      <h4 class="text-center" style="text-overflow:ellipsis; white-space:nowrap; overflow:hidden;"><strong>${rP.title }</strong></h4>
                      <p class="text-center">판매 지역 : ${rP.region}</p>
                      <p class="text-center"><fmt:formatNumber value="${rP.price}" pattern="#,###" />원</p>
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
        
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	
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
    function fn_sendFB(sns) {
        var thisUrl = document.URL;
        console.log(thisUrl);
        var snsTitle = '<c:out value="${snsTitle}"/>';
        /* var snsContent = '<c:out value="${snsContent}"/>'; */
        console.log(snsTitle);
        if( sns == 'facebook' ) {
            var url = "http://www.facebook.com/sharer/sharer.php?u="+encodeURIComponent(thisUrl);
            window.open(url, "", "width=500, height=700");
        }
        else if( sns == 'twitter' ) {
            var url = "http://twitter.com/share?url="+encodeURIComponent(thisUrl)+"&text="+encodeURIComponent(snsTitle);
            window.open(url, "tweetPop", "width=500, height=500,scrollbars=yes");
        }
        else if( sns == 'band' ) {
            var url = "http://www.band.us/plugin/share?body="+encodeURIComponent(snsTitle)+"&route="+encodeURIComponent(thisUrl);
            window.open(url, "shareBand", "width=500, height=800, resizable=yes");
        }
        else if( sns == 'kakao' ) {
            // 사용할 앱의 JavaScript 키 설정
            //Kakao.init('00357f88543d6b75340e69e7b3972b9d');
            try {
		        if (Kakao) {
		            Kakao.init('00357f88543d6b75340e69e7b3972b9d');
		        };
		    } catch(e) {};
            // 카카오링크 버튼 생성

            Kakao.Share.sendDefault({
            	  objectType: 'feed',
            	  content: {
            	    title: '오이마켓',
            	    description: snsTitle,
            	    imageUrl:
            	    	thisUrl,
            	    link: {
            	      mobileWebUrl: thisUrl,
            	      androidExecutionParams: 'test',
            	    },
            	  },
/*             	  social: {
            		    likeCount: 10,
            		    commentCount: 20,
            		    sharedCount: 30,
                  }, */
            		  buttons: [
            			    {
            			      title: '웹으로 이동',
            			      link: {
            			        mobileWebUrl: thisUrl,
            			      }
            			    }
/*             			    {
            			      title: '앱으로 이동',
            			      link: {
            			        mobileWebUrl: 'https://developers.kakao.com',
            			      },
            			    }, */
            			  ]
            })
        }
    }
    

    $("#chat-Btn").on("click",function(){
    	console.log('${result.member.userId}');
    	console.log('${loginMember.userId}');
    	console.log('${result.proNo}');
			$.ajax({
				
				data:JSON.stringify({userId:'${result.member.userId}',
  	       			otherId:'${loginMember.userId}',
  	       			proNo:${result.proNo}
  	       			 }),
				headers:{"Content-Type":"application/json"},
      		 	url: '/chatingRoom',
      			type: "POST",
      			
      			
      		
      		 success:data=> {
      			 console.log(data.roomId);
      			 if(data.roomId!=null){
      			open("${path}/testchat.do/"+data.roomId,"_blank","width=590,height=600");
      			 }else{
      				 alert("본인 상품에는 채팅을 하실 수 없습니다.")
      			 }
      			
      			
      		 }
      	 }); 

 	});
     
    

    const openchat=()=>{
    	console.log('${result.member.userId}');
    	console.log('${loginMember.userId}');
    	console.log('${result.proNo}');
			$.ajax({
				
				data:JSON.stringify({userId:'${result.member.userId}',
  	       			otherId:'${loginMember.userId}',
  	       			proNo:${result.proNo}
  	       			 }),
				headers:{"Content-Type":"application/json"},
      		 	url: '/chatingRoom',
      			type: "POST",
      			
      			
      		
      		 success:data=> {
      			 console.log(data.roomId);
      			 if(data.roomId!=null){
      			open("${path}/testchat.do/"+data.roomId,"_blank","width=590,height=600");
      			 }else{
      				 alert("본인 상품에는 채팅을 하실 수 없습니다.")
      			 }
      			
      			
      		 }
      	 }); 
		};
    </script>
    <script src="${path }/resources/js/category.js"></script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>