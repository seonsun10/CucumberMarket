<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
	<head>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<link rel="icon" href="${path }/resources/img/오이.png"/>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <title>::오이마켓::오늘도 이용하는 마켓</title>
	    <meta name="description" content="">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta name="robots" content="all,follow">
	    <!-- Bootstrap CSS-->
	    <link rel="stylesheet" href="${path}/resources/vendor/bootstrap/css/bootstrap.min.css">
	    <!-- Font Awesome CSS-->
	    <link rel="stylesheet" href="${path}/resources/vendor/font-awesome/css/font-awesome.min.css">
	    <!-- Google fonts - Roboto -->
	    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700">
	    <!-- owl carousel-->
	    <link rel="stylesheet" href="${path}/resources/vendor/owl.carousel/assets/owl.carousel.css">
	    <link rel="stylesheet" href="${path}/resources/vendor/owl.carousel/assets/owl.theme.default.css">
	    <!-- theme stylesheet-->
	    <link rel="stylesheet" href="${path}/resources/css/style.default.css" id="theme-stylesheet">
	    <!-- Custom stylesheet - for your changes-->
	    <link rel="stylesheet" href="${path}/resources/css/custom.css">
	    <link rel="stylesheet" href="${path}/resources/css/mypage/mypage.css">
	    
	    <!-- Favicon-->
	    <link rel="shortcut icon" href="favicon.png">
	    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
	        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
	    
	    
	    <link rel="stylesheet" href="${path}/resources/file/css/fileupload.css">
	</head>
	<body>
	<header class="header mb-5">
      <!--
      *** TOPBAR ***
      _________________________________________________________
      -->
      
        <!-- *** TOP BAR END ***-->
        
        
    
		<nav class="navbar navbar-expand-lg">
        <div class="container"><a href="${path}/" class="navbar-brand home"><img src="/resources/img/cucumber.png" style="width:90px;height:70px"alt="Obaju logo" class="d-none d-md-inline-block"><img src="/resources/img/cucumber.png" alt="Obaju logo" class="d-inline-block d-md-none"><span class="sr-only">Obaju - go to homepage</span></a>
        	<div class="navbar-buttons">
            	<button type="button" data-toggle="collapse" data-target="#navigation" class="btn btn-outline-secondary navbar-toggler"><span class="sr-only">Toggle navigation</span><i class="fa fa-align-justify"></i></button>
            	<button type="button" data-toggle="collapse" data-target="#search" class="btn btn-outline-secondary navbar-toggler"><span class="sr-only">Toggle search</span><i class="fa fa-search"></i></button><a href="basket.html" class="btn btn-outline-secondary navbar-toggler"><i class="fa fa-shopping-cart"></i></a>
        	</div>
        	<div id="navigation" class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
            	<li class="nav-item"><a href="#" class="nav-link active">Home</a></li>
            	<li class="nav-item dropdown menu-large"><a href="#" data-toggle="dropdown" data-hover="dropdown" data-delay="200" class="dropdown-toggle nav-link">상품 카테고리<b class="caret"></b></a>
                <ul class="dropdown-menu megamenu">
                	<li>
	                    <div class="row">
	                    	<div class="col-md-6 col-lg-3">
	                        	<h5>여성의류</h5>
	                        <ul class="list-unstyled mb-3">
	                        	<li class="nav-item"><a href="${path }/product/productTotal.do?tag=패딩" class="nav-link">패딩</a></li>
	                        	<li class="nav-item"><a href="category.html" class="nav-link">코트</a></li>
	                        	<li class="nav-item"><a href="category.html" class="nav-link">티셔츠</a></li>
	                        	<li class="nav-item"><a href="category.html" class="nav-link">셔츠</a></li>
	                        	<li class="nav-item"><a href="category.html" class="nav-link">바지</a></li>
	                        </ul>
	                      	</div>
	                      	<div class="col-md-6 col-lg-3">
		                        <h5>남성의류</h5>
		                        <ul class="list-unstyled mb-3">
		                        	<li class="nav-item"><a href="category.html" class="nav-link">패딩</a></li>
		                          	<li class="nav-item"><a href="category.html" class="nav-link">코트</a></li>
		                         	<li class="nav-item"><a href="category.html" class="nav-link">티셔츠</a></li>
		                          	<li class="nav-item"><a href="category.html" class="nav-link">셔츠</a></li>
		                          	<li class="nav-item"><a href="category.html" class="nav-link">바지</a></li>
	                        	</ul>
	                      	</div>
	                      	<div class="col-md-6 col-lg-3">
	                        	<h5>신발</h5>
	                        	<ul class="list-unstyled mb-3">
		                        	<li class="nav-item"><a href="category.html" class="nav-link">스니커즈</a></li>
			                          <li class="nav-item"><a href="category.html" class="nav-link">구두</a></li>
			                          <li class="nav-item"><a href="category.html" class="nav-link">슬리퍼</a></li>
			                          <li class="nav-item"><a href="category.html" class="nav-link">샌들</a></li>
			                          <li class="nav-item"><a href="category.html" class="nav-link">운동화</a></li>
	                        	</ul>
	                      	</div>
	                      	<div class="col-md-6 col-lg-3">
	                        	<h5>디지털/가전</h5>
	                        	<ul class="list-unstyled mb-3">
	                          		<li class="nav-item"><a href="category.html" class="nav-link">모바일</a></li>
			                        <li class="nav-item"><a href="category.html" class="nav-link">가전제품</a></li>
			                        <li class="nav-item"><a href="category.html" class="nav-link">컴퓨터</a></li>
			                        <li class="nav-item"><a href="category.html" class="nav-link">게임</a></li>
			                        <li class="nav-item"><a href="category.html" class="nav-link">카메라</a></li>
	                        	</ul>
	                      	</div>
	                      	<div class="col-md-6 col-lg-3">
		                        <h5>차량/오토바이</h5>
		                        <ul class="list-unstyled mb-3">
	                          		<li class="nav-item"><a href="category.html" class="nav-link">국산차</a></li>
	                          		<li class="nav-item"><a href="category.html" class="nav-link">수입차</a></li>
			                        <li class="nav-item"><a href="category.html" class="nav-link">차량용품</a></li>
			                        <li class="nav-item"><a href="category.html" class="nav-link">오토바이</a></li>
			                        <li class="nav-item"><a href="category.html" class="nav-link">오토바이 용품</a></li>
	                        	</ul>
	                      	</div>
	                      	<div class="col-md-6 col-lg-3">
	                        	<h5>도서/티켓/문구</h5>
	                        	<ul class="list-unstyled mb-3">
	                          		<li class="nav-item"><a href="category.html" class="nav-link">도서</a></li>
	                          		<li class="nav-item"><a href="category.html" class="nav-link">티켓</a></li>
	                          		<li class="nav-item"><a href="category.html" class="nav-link">문구</a></li>
	                        	</ul>
	                        	<h5>가구/인테리어</h5>
	                        	<ul class="list-unstyled mb-3">
	                          		<li class="nav-item"><a href="category.html" class="nav-link">가구</a></li>
	                          		<li class="nav-item"><a href="category.html" class="nav-link">인테리어</a></li>
	                        	</ul>
	                      	</div>
	                      	<div class="col-md-6 col-lg-3">
	                        	<h5>스포츠</h5>
	                        	<ul class="list-unstyled mb-3">
		                          	<li class="nav-item"><a href="category.html" class="nav-link">골프</a></li>
		                          	<li class="nav-item"><a href="category.html" class="nav-link">캠핑</a></li>
		                          	<li class="nav-item"><a href="category.html" class="nav-link">낚시</a></li>
		                          	<li class="nav-item"><a href="category.html" class="nav-link">축구</a></li>
		                          	<li class="nav-item"><a href="category.html" class="nav-link">헬스</a></li>
	                        	</ul>
	                      	</div>
	                    </div>
                  	</li>
                </ul>
              	</li>  
			</ul>
            <div class="navbar-buttons d-flex justify-content-end">
            	<div id="search-not-mobile" class="navbar-collapse collapse"></div><a data-toggle="collapse" href="#search" class="btn navbar-btn btn-primary d-none d-lg-inline-block"><span class="sr-only">Toggle search</span><i class="fa fa-search"></i></a>
	            <div id="search-not-mobile" class="navbar-collapse collapse">
	              		<a href="${path }/member/mypage.do?userId=${loginMember.userId}" class="btn btn-primary navbar-btn">마이페이지</a>
	            </div>
	            <div id="search-not-mobile" class="navbar-collapse collapse">
	           		<a href="${path }/product/productView.do?id=${loginMember.userId }&no=151" class="btn btn-primary navbar-btn">제품상세보기 테스트용 </a> <!-- 나중에 id는 세션값(이때 input hidden사용도 해볼것) link에서 no도 넣어서 해야함 -->
				</div>
				<div id="search-not-mobile" class="navbar-collapse collapse">
					<a href="${path }/area.do" class="btn btn-primary navbar-btn"> 지역설정 테스트용</a>
				</div>
				<div id="search-not-mobile" class="navbar-collapse collapse">
			  		<a class="nav-link py-0" href="${contextPath}/member/chat.do">
			  			<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chat-text " fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				  			<path fill-rule="evenodd" d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"></path>
				  			<path fill-rule="evenodd" d="M4 5.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zM4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8zm0 2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5z"></path>
						</svg>
					</a>
					<span id="newChatCnt" class="badge badge-pill badge-primary"></span>
				</div>
					
			
      			<div id="search-not-mobile" class="navbar-collapse collapse">
		       		<a class="nav-link py-0" href="${contextPath}/member/notify.do">
		       			<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-bell" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							<path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2z"/>
					  		<path fill-rule="evenodd" d="M8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
						</svg>
					</a>
	      			<span id="newNoticeCnt" class="badge badge-pill badge-primary"></span>
	      		</div>
	  			</div>
			</nav>
    		<div id="msgStack"></div>
			
      		<div id="search" class="collapse">
        		<div class="container">
          			<form role="search" class="ml-auto">
            			<div class="input-group">
              				<input type="text" placeholder="Search" class="form-control">
              				<div class="input-group-append">
                				<button type="button" class="btn btn-primary"><i class="fa fa-search"></i></button>
              				</div>
            			</div>
          			</form>
        		</div>
      		</div>
    </header>
    <!-- sockJS -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script>
	// 웹소켓 연결
	
   
    const id='${loginMember.userId}';
   
	
	$(document).ready(function(){
		 sock = new SockJS("<c:url value="/ws/chat"/>");
		 socket = sock;

		// 데이터를 전달 받았을때 
		sock.onmessage = onMessage;
		
		
       	//setinterval
       	setInterval(chatCall, 300);
    	setInterval(alertCall, 300);
       	// 채팅 카운트 받아오기
       	function chatCall(){
	   		$.ajax({
	               type: "post",
	               async: "true",
	               dataType: "text",
	               data: {
	            	   userId: '${loginMember.userId}' //data로 넘겨주기
	               },
	               url: "${contextPath}/member/selectNewChatCnt.do",
	               success: function (data, textStatus) {
	            	   if(data!='0'){
			       			$("#newChatCnt").text(data);
	            	   }
	               }
	   			
			});
		}
		
   		// 알림 카운트 받아오기
   		function alertCall(){
   	   		$.ajax({
   	               type: "post",
   	               async: "true",
   	               dataType: "text",
   	               data: {
   	            	   userId: '${loginMember.userId}' //data로 넘겨주기
   	               },
   	               url: "${contextPath}/member/selectNewNoticeCnt.do",
   	               success: function (data, textStatus) {
   	            	   if(data!='0'){
   			       			$("#newNoticeCnt").text(data);
   	            	   }
   	               }
   			});
   		}
	});
   	
   	// 실시간 알림 받았을 시 ing
	function onMessage(evt){
		var data = evt.data;
		// toast
		let toast = "<div class='toast' role='alert' aria-live='assertive' aria-atomic='true'>";
		toast += "<div class='toast-header'><i class='fas fa-bell mr-2'></i><strong class='mr-auto'>알림</strong>";
		toast += "<small class='text-muted'></small><button type='button' class='ml-2 mb-1 close' data-dismiss='toast' aria-label='Close'>";
		toast += "<span aria-hidden='true'>&times;</span></button>";
		toast += "</div> <div class='toast-body'>" + data + "</div></div>";
		$("#msgStack").append(toast);
		$(".toast").toast({"animation": true, "autohide": false});
// 		$(".toast").toast({"animation": true, "autohide": true, "delay": 5000});
		$('.toast').toast('show');
		// 알림 카운트 추가
		$("#newChatCnt").text($("#newChatCnt").text()*1+1);
	};	
</script>