<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <style>
    div#board-container{width:400px; margin:0 auto; text-align:center;}
    div#board-container input,div#board-container button{margin-bottom:15px;}
    div#board-container label.custom-file-label{text-align:left;}
    </style>
 <div id="board-container">
        <input type="text" class="form-control" placeholder="제목" name="boardTitle" id="boardTitle"  required value="${pro.proName}">
        <input type="text" class="form-control" name="boardWriter"  readonly required value="${pro.member.userId}">
        <input type="text" class="form-control" name="boardWriter"  readonly required value="${pro.proContent}">
		
		<div id="username-page">
		<div class="username-page-container">
			<h1 class="title">Type your username</h1>
			<form id="usernameForm" name="usernameForm">
				<div class="form-group">
					<input type="text" id="name" placeholder="Username"
						autocomplete="off" class="form-control" value="${pro.member.userId}"/>
				</div>
				<div class="form-group">
					<button type="submit" class="accent username-submit">Start
						Chatting</button>
				</div>
			</form>
		</div>
	</div>
                    
   
        
        <textarea class="form-control" name="boardContent" placeholder="내용" required>
        		${pro.proContent}
        </textarea>
        
        
        <button id="chatBtn23" onclick="openchat();">채팅하기</button>
        <script type="text/javascript">
   			const openchat=()=>{
   				$.ajax({
   					
   					data:JSON.stringify({userId:'${pro.member.userId}',
   	   	       			otherId:'${loginMember.userId}',
   	   	       			proNo:${pro.proNo}
   	   	       			 }),
   					headers:{"Content-Type":"application/json"},
   	       		 	url: '/chatingRoom',
   	       			type: "POST",
   	       			
   	       			
   	       		
   	       		 success:data=> {
   	       			 console.log(data.roomId);
   	       			 console.log(${path}/testchat.do/+data.roomId); 
   	       			open("${path}/testchat.do/"+data.roomId,"_blank","width=300,height=500");
   	       			
   	       		 }
   	       	 }); 
   			};
        	
        
			
			
	
		</script>
    </div>
   
  

    
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

