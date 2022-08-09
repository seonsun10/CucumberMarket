<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
 <div id="all">
      <div id="content">
        <div class="container">
          <div class="row">
         
            <div id="blog-post" class="col-lg-9">
              <div class="box">
                <h1>${board.boardTitle }</h1>
                <p class="author-date">By <a href="#">${board.userId }</a>${board.createDate }</p>
                <p class="lead"># ${board.boardCategory }</p>
                <div id="post-content">
     					<p>${board.boardContent }</p>
                </div>
                &nbsp&nbsp&nbsp&nbsp&nbsp
                <!-- /#post-content-->
                <div id="comments">
                <!--   <h4>댓글</h4>
                  <div class="row comment">
                    <div class="col-md-3 col-lg-2 text-center text-md-center">
                      <p><img src="img/blog-avatar2.jpg" alt="" class="img-fluid rounded-circle"></p>
                    </div>
                    <div class="col-md-9 col-lg-10">
                      <h5>Julie Alma</h5>
                      <p class="posted"><i class="fa fa-clock-o"></i> September 23, 2011 at 12:00 am</p>
                      <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>
                      <p class="reply"><a href="#"><i class="fa fa-reply"></i> Reply</a></p>
                    </div>
                  </div> -->
                  <!-- /.comment-->
               
                </div>
                <!-- /#comments-->
                <div id="comment-form">
                 <%--  <h4>댓글</h4>
                  <form>
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group">
                          <label for="name">아이디<span class="required"></span></label>
                          <input id="name" type="text" class="form-control" value="${loginMember.userId }" readonly="readonly">                      </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label for="comment">코멘트 <span class="required"></span></label>
                          <textarea id="comment" rows="4" class="form-control"></textarea>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12 text-right">
                        <button class="btn btn-primary"><i class="fa fa-comment-o"></i> 댓글 남기기</button>
                      </div>
                    </div>
                  </form> --%>
                    <div id="disqus_thread"></div>
                 
                
<script>
    /**
    *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
    *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables    */
    /*
    var disqus_config = function () {
    this.page.url = PAGE_URL;  // Replace PAGE_URL with your page's canonical URL variable
    this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
    };
    */
    (function() { // DON'T EDIT BELOW THIS LINE
    var d = document, s = d.createElement('script');
    s.src = 'https://jaygyeong.disqus.com/embed.js';
    s.setAttribute('data-timestamp', +new Date());
    (d.head || d.body).appendChild(s);
    })();
</script>
<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
                  
         
                  
                  
                  
                  
                </div>
                <!-- /#comment-form-->
              </div>
              <!-- /.box-->
            </div>
            <!-- /#blog-post-->
            <div class="col-lg-3">
              <!--
              *** BLOG MENU ***
              _________________________________________________________
              -->
              <div class="card sidebar-menu mb-4">
                <div class="card-header">
                  <h3 class="h4 panel-title">동네생활</h3>
                </div>
                <div class="card-body">
                  <ul class="nav flex-column nav-pills">
                    <li><a href="${path }/board/boardlist.do" class="nav-link">글 목록</a></li>
                    
                  </ul>
                </div>
              </div>
              <!-- /.col-lg-3-->
              <!-- *** BLOG MENU END ***-->
              <div class="banner"><a href="#"><img src="${path }/resources/img/cucumber.png" alt="sales 2014" class="img-fluid"></a></div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--
    *** FOOTER ***
    _________________________________________________________
    -->
    




<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
