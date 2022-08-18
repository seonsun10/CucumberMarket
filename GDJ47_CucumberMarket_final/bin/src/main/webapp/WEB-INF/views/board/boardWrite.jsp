<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
<!-- <style>body {  padding-top: 70px;  padding-bottom: 30px;}</style> -->
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>



<body>	

		<div class="container" role="main">	
			<h2>오이마켓 글쓰기</h2>		
				<form name="form" id="form" role="form" method="post" action="${path}/board/saveBoard.do" enctype="multipart/form-data">
					<div class="mb-3">
						
						 <div>
						 <label for="tag">TAG</label>
						 
							<select name='boardCategory'>
								<option  value="동네맛집">동네맛집</option>
								<option  value="동네소식">동네소식</option>
								<option  value="동네질문">동네질문</option>
								<option  value="동네 분실/실종센터">동네 분실/실종센터</option>
							</select>
						</div>	
							<label for="title">제목</label>
							<input type="text" class="form-control" name="boardTitle" id="title" placeholder="제목을 입력해 주세요">
					</div>
					<div class="mb-3">
					<div class="mb-3">
											
					</div>			
						<label for="reg_id">작성자</label>	
						<input type="text" class="form-control" name="userId" id="reg_id" placeholder="이름을 입력해 주세요" readonly="readonly"  value="${loginMember.userId }">
					</div>
				<!-- <div >
			      <input type="file" class="form-control-file border" name="picName">
			    </div> -->
					<div class="mb-3">
						<label for="content">내용</label>	
							<textarea class="form-control" rows="5" name="boardContent" id="content" placeholder="내용을 입력해 주세요" ></textarea>
					</div>
								
				</form>			
				<div>		
						<button type="button" class="btn btn-sm btn-primary" id="btnSave" onclick="fn_boardWrite();">저장</button>			
						<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="fn_boardList();">목록</button>	
						
						<div>
						&nbsp&nbsp&nbsp&nbsp
						</div>
						
				</div>	
		</div>	
	
	
</body>
<script>
	const fn_boardList=()=>{
		
		location.assign("${path}/board/boardlist.do");
	}
	const fn_boardWrite=()=>{
		$("#form").submit();
	}
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>