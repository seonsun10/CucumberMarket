<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

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
           		<p><button class="btn btn-primary">글쓰기</button></p>
           </div>
                 
              </div>
             
              <c:if test="${not empty boards}">
              <!-- post-->
              <c:forEach items="${boards }" var="b">
              	 <div class="post">
                <h2><a href="post.html">${b.boardTitle }</a></h2>
                <p class="author-category">작성자 <a href="#">${b.userId }</a>  &nbsp <a href="">#${b.boardCategory }</a></p>
                <hr>
                <p class="date-comments"><a href="post.html"><i class="fa fa-calendar-o"></i> ${b.createDate }</a><a href="post.html"><i class="fa fa-comment-o"></i>  Comments</a></p>
                <div class="image"><a href="post.html"><img src="img/blog2.jpg" alt="Example blog post alt" class="img-fluid"></a></div>
                <p class="intro">${b.boardContent }</p>
                <p class="read-more"><a href="post.html" class="btn btn-primary">추천하기</a></p>
              </div>
              </c:forEach>
             
              </c:if>
              <c:if test="${empty boards }">
              	<div class="post">
              	조회결과 없습니다
              	</div>
              </c:if>
              <!-- post        -->
             <!--  <div class="post">
                <h2><a href="post.html">Who is who - example blog post</a></h2>
                <p class="author-category">By <a href="#">John Slim</a> in <a href="">About Minimal</a></p>
                <hr>
                <p class="date-comments"><a href="post.html"><i class="fa fa-calendar-o"></i> June 20, 2013</a><a href="post.html"><i class="fa fa-comment-o"></i> 8 Comments</a></p>
                <div class="image"><a href="post.html"><img src="img/blog.jpg" alt="Example blog post alt" class="img-fluid"></a></div>
                <p class="intro">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>
                <p class="read-more"><a href="post.html" class="btn btn-primary">추천하기</a></p>
              </div> -->
              
              <div>페이징처리여</div>
            </div>
            <!-- /.col-lg-9-->
            <!-- *** LEFT COLUMN END ***-->
            
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
                    <li><a href="blog.html" class="nav-link">동네맛집</a></li>
                    <li><a href="blog.html" class="nav-link">동네소식</a></li>
                    <li><a href="blog.html" class="nav-link">동네질문</a></li>
                    <li><a href="blog.html" class="nav-link">동네 분실/실종센터</a></li>
                  </ul>
                </div>
              </div>
              
              <div class="banner"><a href="#"><img src="${path }/resources/img/cucumber.png" alt="sales 2014" class="img-fluid"></a></div>
            </div>
          </div>
        </div>
      </div>
    </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
