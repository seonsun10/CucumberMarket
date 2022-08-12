<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>

<style>
#write{
	text-align: right
}
#pboard{
	margin-left: 30px;
	margin-top: 20px;

}
#palert{
	width:320px;
	 position: absolute;
  top:150px; 
  right: 90px;
  font-size: 14px;
  

}
</style>
 <div id="all">
 	
      <div id="content">
     
        <div class="container">
           
          <div class="row">
            <!--
            *** LEFT COLUMN ***
            _________________________________________________________
            -->
            <div id="blog-listing" class="col-lg-9">
              <div class="box">
               
                <h1>동네 생활</h1>
                <p>동네 생활에서 다양한 주제로 이야기를 나눠보세요.
                 </p>
                 <div id="pboard"'>
                
                 	<c:if test="${not empty pboard }">
                 	 <p id="pinfo" style='color:green;font-size:18px;font-weight: bold;'>시끌벅적 동네소식 <i class="bi bi-hand-thumbs-up-fill"></i></p>
                 	<c:forEach items="${pboard }" var="p" varStatus="status">
                 		<a href="${path }/board/boardinfo.do/${p.boardId}"><p><b> ⊙ ${p.boardTitle } &nbsp <i class="bi bi-hand-thumbs-up-fill"></i>${p.recommendCount}</b></p></a>
                 	</c:forEach>
                 	  <div id="palert">
                  		<b><i class="bi bi-info-square-fill"></i>&nbsp&nbsp오이마켓 존중문화</b> <br>
                  		<br>
					    &nbsp오이마켓의 모든 사용자가 우리 동네 이웃이라는 걸 기억해주세요.<br>
					    어떠한 상황에서도 우리는 이웃의 다양성을 존중하고, 배려하기로 약속해요.<br>
						오이마켓은 누구나 존중받는 따뜻한 지역 커뮤니티를 지향하고 있어요.   <br>       
                  </div>
                 	</c:if>
                 	
                  </div>
                  
                 
                 <div style='text-align: right'>
           			<p><button class="btn btn-primary" onclick="fn_boardWrite();">글쓰기</button></p>
           		</div>
                 
              </div>
             
              <c:if test="${not empty boards}">
              <!-- post-->
              <c:forEach items="${boards }" var="b">
              	 <div class="post" id="databox">
              	 
                <h2><a href="${path }/board/boardinfo.do/${b.boardId}">${b.boardTitle }</a></h2>
                <p class="author-category">작성자 
                  <c:if test="${b.userId ne loginMember.userId }">
                    <a href="${path }/member/otherMember.do?writer=${b.userId }&customer=${loginMember.userId}">${b.userId }</a>
                  </c:if>
                  <c:if test="${b.userId eq loginMember.userId }">
                    <a href="${path }/member/mypage.do?userId=${loginMember.userId}">${b.userId }</a>
                  </c:if>
               
                
                
                  &nbsp <a href="${path }/board/boardlist.do/${b.boardCategory eq '동네 분실/실종센터'?'실종센터':b.boardCategory}">#${b.boardCategory }</a>&nbsp&nbsp  <a> <i class="bi bi-hand-thumbs-up-fill"></i> : ${b.recommendCount }&nbsp 개</a></p>
                <hr>
                <p class="date-comments"><a href=""><i class="fa fa-calendar-o"></i> ${b.createDate }</a><a href=""><i class="fa fa-comment-o"></i>  Comments &nbsp [ ${b.count } ]</a></p>
                
                <p class="intro">${b.boardContent }</p>
                <p class="read-more"><button class="btn btn-primary" onclick="recommend(${b.boardId});"><i class="bi bi-hand-thumbs-up-fill"></i>&nbsp추천하기</button></p>
              </div>
              </c:forEach>
             
              </c:if>
              <c:if test="${empty boards }">
              	<div class="post">
              	조회결과 없습니다
              	</div>
              </c:if>
          
              
              <div>${pageBar }</div>
            </div>

            
            <div class="col-lg-3">
              <!--
              *** BLOG MENU ***
              _________________________________________________________
              -->
              <div class="card sidebar-menu mb-4">
                <div class="card-header">
                  <h3 class="h4 panel-title">관심주제</h3>
                </div>
                <div class="card-body">
                  <ul class="nav flex-column nav-pills">
                    <li><a href="${path }/board/boardlist.do/동네맛집" class="nav-link">동네맛집</a></li>
                    <li><a href="${path }/board/boardlist.do/동네소식" class="nav-link">동네소식</a></li>
                    <li><a href="${path }/board/boardlist.do/동네질문" class="nav-link">동네질문</a></li>
                    <li><a href="${path }/board/boardlist.do/실종센터" class="nav-link">동네 분실/실종센터</a></li>
                  </ul>
                </div>
              </div>
              
              <div class="banner"><a href="#"><img src="${path }/resources/img/cucumber.png" alt="sales 2014" class="img-fluid"></a></div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
<script type="text/javascript">
 const fn_boardWrite=()=>{
		 location.assign("${path}/board/boardWrite.do");
 }
 function recommend(id){
	
	 location.assign("${path}/board/boardRecommend.do/"+id);
 }
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
