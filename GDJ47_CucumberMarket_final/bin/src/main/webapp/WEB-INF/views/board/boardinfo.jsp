<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<style>
        #modal.modal-overlay {
        	margin-top:150px;
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            top: 0;
            display: none;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(1.5px);
            -webkit-backdrop-filter: blur(1.5px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
        }
        #modal .modal-window {
            background: rgba(8, 147, 96, 0.715);
            box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
            backdrop-filter: blur( 13.5px );
            -webkit-backdrop-filter: blur( 13.5px );
            border-radius: 10px;
            border: 1px solid rgba( 255, 255, 255, 0.18 );
            width: 400px;
            height: 400px;
            position: relative;
            top: -100px;
            padding: 10px;
        }
        #modal .title {
        	
            padding-left: 40px;
            display: inline;
            text-shadow: 1px 1px 2px gray;
            color: white;
            
        }
        #modal .title h2 {
        	
        	padding-top:40px;
            display: inline;
        }
        #modal .close-area {
            display: inline;
            float: right;
            padding-right: 10px;
            cursor: pointer;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
        
        #modal .content {
            margin-top: 20px;
            padding: 0px 10px;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
      #mtitle{
      	
      }
    </style> 
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
                <p class="author-date">By &nbsp
                <c:if test="${board.userId ne loginMember.userId }">
                    <a href="${path }/member/otherMember.do?writer=${board.userId }&customer=${loginMember.userId}">${board.userId }</a>&nbsp&nbsp
                 </c:if>
                 <c:if test="${board.userId eq loginMember.userId }">
                    <a href="${path }/member/mypage.do?userId=${loginMember.userId}">${board.userId }</a>&nbsp&nbsp
                 </c:if>
                
                <fmt:formatDate value="${board.createDate }" pattern="yyyy년 MM월 dd일"/> <a href ="#" id="btn-modal"> &nbsp&nbsp &nbsp&nbsp <i class="bi bi-hand-thumbs-up-fill"></i> :&nbsp ${board.recommendCount }&nbsp 개</a></p>
                <p class="lead"># ${board.boardCategory }</p>
                <div id="post-content">
     					<p>${board.boardContent }</p>
                </div>
                &nbsp&nbsp&nbsp&nbsp&nbsp
                <!-- /#post-content-->
                <div style='text-align: center'>
                <p class="read-more"><button class="btn btn-primary" onclick="recommend(${board.boardId});"><i class="bi bi-hand-thumbs-up-fill"></i>&nbsp추천하기</button></p>
                
                </div>
             
                  
                  
                  
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
		<div id="commentcount">
		<c:if test="${not empty count}">
			<p><i class="fa fa-comment-o"></i>&nbsp comment [ ${count } ]</p>
		</c:if>
		<c:if test="${empty count }">
			<p><i class="fa fa-comment-o"></i>&nbsp comment </p>
		</c:if>
		</div>
		<table id ="tbl-comment">
		<c:forEach var="bc" items="${comments }">
			<c:if test="${bc.boardCommentLevel==1 }">
					<tr class="level1">
				<td>
					 <sub><p><img src="/resources/img/cucumber.png" alt="" class="img-fluid rounded-circle" width="50" height="50">&nbsp ${bc.boardCommentWriter}</p></sub>
					<sub class="comment-date"> <fmt:formatDate value="${bc.boardCommentDate }" pattern="yyyy년 MM월 dd일"/> </sub>
					<br>
					${bc.boardCommentContent }
				
				</td>
				<td>
				
				<c:if test="${loginMember != null }">
						<button class="btn-reply" value="${bc.boardCommentNo }">답글</button>
					<c:if test="${loginMember.userId=='admin' || bc.boardCommentWriter == loginMember.userId }">
	
						<button class="btn-delete" onclick="fn_deletecomment(${bc.boardCommentNo},${board.boardId })">삭제</button>
					</c:if>
				</c:if>
			
				</td>
			
			</tr>
			
			</c:if>
			<c:if test="${bc.boardCommentLevel!=1 }">
				<tr class="level2">
				<td>
					 
					<sub><p><img src="/resources/img/cucumber.png" alt="" class="img-fluid rounded-circle" width="50" height="50">&nbsp ${bc.boardCommentWriter}</p></sub>
					<sub> <fmt:formatDate value="${bc.boardCommentDate}" pattern="yyyy년 MM월 dd일"/>  </sub>
					<br>
					${bc.boardCommentContent}
				
				</td>
				<td>
					<c:if test="${loginMember != null }">
						
					<c:if test="${loginMember.userId=='admin' || bc.boardCommentWriter == loginMember.userId }">
	
						<button class="btn-delete" onclick="fn_deletecomment2(${bc.boardCommentNo},${board.boardId })">삭제</button>
					</c:if>
				</c:if>
				</td>
			
			</tr>
			
			</c:if>
		
		</c:forEach>
		
		
		</table>
		<div>${pageBar }</div>
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
    
    
    
    <div id="modal" class="modal-overlay">
	        <div class="modal-window">
	            <div class="title" id="mtitle">
	                <h2>추천을 누른 사람들 &nbsp<i class="bi bi-hand-thumbs-up-fill"></i> </h2>
	            </div>
	            <div class="close-area">X</div>
	            <div class="content">
	                <c:if test="${not empty Rlist }">
	                	<c:forEach items="${Rlist }" var="r" >
	                		<p>${r.rec_UserId }</p>
	                	</c:forEach>
	                
	                </c:if>
	                
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
     
     const modal = document.getElementById("modal")
     const btnModal = document.getElementById("btn-modal")
     btnModal.addEventListener("click", e => {
         modal.style.display = "flex"
     });
     const closeBtn = modal.querySelector(".close-area")
		closeBtn.addEventListener("click", e => {
	    modal.style.display = "none"
	});
	modal.addEventListener("click", e => {
	    const evTarget = e.target
	    if(evTarget.classList.contains("modal-overlay")) {
	        modal.style.display = "none"
	    }
	});
    function fn_deletecomment(id,no){
    	console.log(id,no);
    	location.assign('${path}/board/deletecomment/'+id+'/'+no);
    }
    function fn_deletecomment2(id,no){
    	console.log(id);
    	location.assign('${path}/board/deletecomment2/'+id+'/'+no);
    }
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
     function recommend(id){
    	 	
    		console.log(location);
    	 location.assign("${path}/board/boardRecommend.do/"+id);
     }
        </script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
