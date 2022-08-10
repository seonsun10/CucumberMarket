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
        textarea{
              width:100%;
            }
        .reply_reply {
                border: 2px solid #FF50CF;
            }
        .reply_modify {
                border: 2px solid #FFBB00;
            }
            
  	table#tbl-comment{ width:100%; margin:0 auto; border-collapse:collapse; clear:both; } 
    table#tbl-comment tr td{border-bottom:1px solid; border-top:1px solid; padding:5px; text-align:left; line-height:230%;}
    table#tbl-comment tr td:first-of-type{padding: 5px 5px 5px 50px;}
    table#tbl-comment tr td:last-of-type {text-align:right; width: 100px;}
    table#tbl-comment button.btn-reply{display:none;}
    table#tbl-comment button.btn-delete{display:none;}
    table#tbl-comment tr:hover {background:lightgray;}
    table#tbl-comment tr:hover button.btn-reply{display:inline;}
    table#tbl-comment tr:hover button.btn-delete{display:inline;}
    table#tbl-comment tr.level2 {color:gray; font-size: 14px;}
    table#tbl-comment sub.comment-writer {color:navy; font-size:14px}
    table#tbl-comment sub.comment-date {color:tomato; font-size:10px}
    table#tbl-comment tr.level2 td:first-of-type{padding-left:100px;}
    table#tbl-comment tr.level2 sub.comment-writer {color:#8e8eff; font-size:14px}
    table#tbl-comment tr.level2 sub.comment-date {color:#ff9c8a; font-size:10px}
    /*답글관련*/
    /* table#tbl-comment textarea{margin: 4px 0 0 0;} */
  
    </style>
 <div id="all">
 	<input type="hidden" value="${board.boardId }" id="board_id">
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
             
                  
                  
                  
     	<div id="comment-container">
			<div class="comment-editor">
				<%-- <form action ="${path}/board/insertboardcomment.do" method="post">
					<textarea name="boardCommentContent" cols="40"	rows="3" required class="form-control"></textarea>
					<input type ="hidden" name="boardCommentLevel" value="1">
					<input type ="text" name="boardCommentWriter" class="form-control" value="${loginMember != null?loginMember.userId:""}" readonly="readonly">
					<input type = "hidden" name ="boardRef" value="${board.boardId }">
					<input type="hidden" name="boardCommentRef" value="0">
					<button type="submit" id="btn-insert"  class="btn btn-primary">등록</button>
					
				</form> --%>
				  <form action ="${path}/board/insertboardcomment.do" method="post">
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group">
                          <label for="name">Name <span class="required">*</span></label>
                          <input type ="text" name="boardCommentWriter" class="form-control" value="${loginMember != null?loginMember.userId:""}" readonly="readonly">
                        	<input type="hidden" name="boardCommentRef" value="0">
                        	<input type = "hidden" name ="boardRef" value="${board.boardId }">
                        	<input type ="hidden" name="boardCommentLevel" value="1">
                        </div>
                      </div>
                    </div>
                 
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label for="comment">Comment <span class="required">*</span></label>
                          <textarea name="boardCommentContent" cols="40"	rows="3" required class="form-control"></textarea>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12 text-right">
                        <button type="submit" id="btn-insert"  class="btn btn-primary"><i class="fa fa-comment-o"></i>등록</button>
                      </div>
                    </div>
                  </form>
			</div>
		</div>
		<div>
		<table id ="tbl-comment">
		<c:forEach var="bc" items="${comments }">
			<c:if test="${bc.boardCommentLevel==1 }">
					<tr class="level1">
				<td>
					 <p><img src="/resources/img/cucumber.png" alt="" class="img-fluid rounded-circle" width="50" height="50"></p>
					<sub class="comment-writer">${bc.boardCommentWriter} </sub>
					<sub class="comment-date">${bc.boardCommentDate }</sub>
					<br>
					${bc.boardCommentContent }
				
				</td>
				<td>
				
				<c:if test="${loginMember != null }">
						<button class="btn-reply" value="${bc.boardCommentNo }">답글</button>
					<c:if test="${loginMember.userId=='admin' || bc.boardCommentWriter == loginMember.userId }">
	
						<button class="btn-delete">삭제</button>
					</c:if>
				</c:if>
			
				</td>
			
			</tr>
			
			</c:if>
			<c:if test="${bc.boardCommentLevel!=1 }">
				<tr class="level2">
				<td>
					 
					<sub><p><img src="/resources/img/cucumber.png" alt="" class="img-fluid rounded-circle" width="50" height="50"></p>${bc.boardCommentWriter}</sub>
					<sub>${bc.boardCommentDate}</sub>
					<br>
					${bc.boardCommentContent}
				
				</td>
				<td>
				</td>
			
			</tr>
			
			</c:if>
		
		</c:forEach>
		
		
		</table>
		</div>   
		
                    <!-- <div id="disqus_thread"></div> -->
                 
                
<!-- <script>
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
</script> -->
<!-- <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
                   -->
         
                  
                  
                  
                  
               
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
    <script>
    $(document).ready(function(){
    	console.log("dd");
    	
    	
    });
    
    </script>
     <script type="text/javascript">
     $(".comment-editor textarea[name=content]").focus(e=>{
     	if(${loginMember==null}){
     		alert("로그인 후 이용하실 수 있습니다.");
     		$("#userId").focus();
     	}
     });
     $(".btn-reply").click(e=>{
     	//이전에 생성된 form을삭제
     	const preForm=$("#tbl-comment").find("form");
     	preForm.parents("tr").remove();
     	
     	const form=$("#comment-container").find("form");
     	const newform = form.clone();
     	newform.find("textarea").attr("rows","2");
     	newform.find("input[name=boardCommentLevel]").val("2");
     	newform.find("input[name=boardCommentRef]").val($(e.target).val());
     	newform.find("button").removeAttr("id").addClass("btn-insert2");
     	const tr =$("<tr>");
     	const td=$("<td colspan='2'>");
     	td.append(newform);
     	tr.append(td);
     	$(e.target).parents("tr").after(tr);
     });
        </script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
