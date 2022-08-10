<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
<style>
#write{
	text-align: right
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
                 <div style='text-align: right'>
           		<p><button class="btn btn-primary" onclick="fn_boardWrite();">글쓰기</button></p>
           </div>
                 
              </div>
             
              <c:if test="${not empty boards}">
              <!-- post-->
              <c:forEach items="${boards }" var="b">
              	 <div class="post" id="databox">
              	 
                <h2><a href="${path }/board/boardinfo.do/${b.boardId}">${b.boardTitle }</a></h2>
                <p class="author-category">작성자 <a href="">${b.userId }</a>  &nbsp <a href="">#${b.boardCategory }</a>&nbsp&nbsp  <a> 추천 : ${b.recommendCount }&nbsp 개</a></p>
                <hr>
                <p class="date-comments"><a href=""><i class="fa fa-calendar-o"></i> ${b.createDate }</a><a href=""><i class="fa fa-comment-o"></i>  Comments</a></p>
                
                <p class="intro">${b.boardContent }</p>
                <p class="read-more"><button class="btn btn-primary" onclick="recommend(${b.boardId});">추천하기</button></p>
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
