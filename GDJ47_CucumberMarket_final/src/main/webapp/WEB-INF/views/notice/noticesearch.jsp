<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- JQuery -->



	<div id="all">
		<div id="content">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
              <!-- breadcrumb-->
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/">Home</a></li>
								<li aria-current="page" class="breadcrumb-item active">공지사항</li>
							</ol>
						</nav>
					</div>
					<div class="col-lg-3">
              <!--
              *** PAGES MENU ***
              _________________________________________________________
              -->
						<div class="card sidebar-menu mb-4">
							<div class="card-header">
								<h3 class="h4 card-title">Pages</h3>
							</div>
							<div class="card-body">
								<ul class="nav nav-pills flex-column">
									<li><a href="${pageContext.request.contextPath }/faqList" class="nav-link">FAQ</a></li>
									<li><a href="${pageContext.request.contextPath }/admin/searchNotice.do" class="nav-link">공지사항</a></li>
									<li><a href="${pageContext.request.contextPath }/inquiryList" class="nav-link">1:1 문의</a></li>
									<li><a href="${pageContext.request.contextPath }/reportList" class="nav-link">신고</a></li>
								</ul>
							</div>
						</div>
              <!-- *** PAGES MENU END ***-->
						<div class="banner"><a href="#"><img src="${path }/resources/img/cucumber.png" alt="" class="img-fluid"></a></div>
					</div>
            
					<div class="col-lg-9">
						<div class="table-responsive">
							<div class="input-group">
								<div class="products-sort-by mt-2 mt-lg-0">
									<select name="searchType" class="form-control">
	                          			<option value="noticeTitle" selected>제목</option>
	                          			<option value="noticeType">내용</option>
	                        		</select>
	                     		</div>
	              				<input name="keyword" type="text" placeholder="제목을 검색해주세요!" class="form-control">
					            	<div class="input-group-append">
		            	
						        		<button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
							        		<c:if test="${loginMember.userId eq 'admin'}">
												<a href="${pageContext.request.contextPath }/admin/initNotice.do"" class="btn btn-primary navbar-btn"><span>공지사항 작성</span></a>
				              				</c:if>
					              	</div>
					            </div>
					            <br>
								<table class="table">
									<thead>
										<tr>
											<th>글 번호</th>
											<th style="width:500px;">제목</th>
											<th>날짜</th>
										</tr>
									</thead>
									
									<c:forEach var="list" items="${articleList}">
										<tbody id="${list.n_id}">
											<tr class="arcticleSubject text-center">
												<td>${list.n_id}</td>
												<td class="text-left">${list.n_title}</td>
												<td>${list.n_time}</td>
											</tr>
								<!-- 내용영역 -->
											<tr style="display:none;" class="arcticleBody">
												<td colspan="5" class="p-3">
													${list.n_content}
												<c:if test="${loginMember.userId eq 'admin'}">
													<div class="form-inline">
														<div class="mt-2 ml-auto">
															<button type="button" class="editContent btn btn-primary mr-1">수정</button>
															<button type="button" class="deleteArticle btn btn-danger">삭제</button>
														</div>
													</div>
												</c:if>
												</td>
											</tr>
								<!-- 내용영역 END -->
										</tbody>
									</c:forEach>
								</table>
							<!-- 페이징  -->
				
			</div>
</div>
</div>
</div>
</div>
</div>

<script>
	// 초기화시, 선택정보 영역 set
	$(document).ready(function(){
		$(".arcticleSubject").click(function(){
		  	let id = getArticleId(this);
		    $("#"+id + " .arcticleBody").toggle();	// id get
		});
		
		// 수정
		$(".editContent").click(function(){
			let id = getArticleId(this);	// id get
			dynamicFormInsert(id,"initNotice");
		});
		
		// 삭제
		$(".deleteArticle").click(function(){
			let id = getArticleId(this);	// id get
			if(confirm("삭제 하시겠습니까?")){
				dynamicFormInsert(id, "deleteNotice");
			}
		});
		
		function getArticleId(elem){
			let result =  $("tbody").has(elem);
			return result.attr("id");
		}
		
		function dynamicFormInsert(id, dest){
			// 동적 form 생성
			let frm = document.createElement('form');
			frm.name = "frmQnA";				
			frm.action = "${contextPath}/admin/"+dest+".do";
			// form에 연결
			let input = document.createElement('input');
			input.setAttribute("type","hidden");
			input.setAttribute("name","n_id");
			input.setAttribute("value",id);
			frm.appendChild(input);	// append id
			document.body.appendChild(frm);	// append form
			frm.submit();
		}
		
	});
</script>
</head>
<body>