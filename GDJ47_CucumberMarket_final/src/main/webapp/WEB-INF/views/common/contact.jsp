<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <div id="all">
      <div id="content">
        <div class="container">
          <div class="row">
            <div class="col-lg-12">
              <!-- breadcrumb-->
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="/">Home</a></li>
                  <li aria-current="page" class="breadcrumb-item active">FAQ</li>
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
                  <h3 class="h4 card-title">FAQ</h3>
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
              <div class="banner"><a href="#"><img src="/resources/img/cucumber.png" alt="" class="img-fluid"></a></div>
            </div>
			<div class="col-lg-9">
				<div id="contact" class="box">
                <h1>Contact</h1>
                <p class="lead">궁금한게 있으신가요?? 문의게시판을 가세요.</p>
                <p>아 문의하려면 회원가입은 필수입니다.</p>
                <hr>
                <div class="row">
                  <div class="col-md-4">
                    <h3><i class="fa fa-map-marker"></i>방문 주소</h3>
                    <p>대륭테크노타운3차 1109-1호<br>가산디지털2로 115<br>금천구 가산동<br>서울특별시<br><strong>대한민국</strong></p>
                  </div>
                  <!-- /.col-sm-4-->
                  <div class="col-md-4">
                    <h3><i class="fa fa-phone"></i>문의 전화</h3>
                    <p class="text-muted">오이님의 거래를 도와드리는 오이마켓에 오신 것을 환영합니다.</p>
                    <p><strong>02 52 555 222</strong></p>
                  </div>
                  <!-- /.col-sm-4-->
                  <div class="col-md-4">
                    <h3><i class="fa fa-envelope"></i>문의 메일</h3>
                    <p class="text-muted">전화연결이 안된다면 메일로 문의해 주세요</p>
                    <ul>
                      <li><strong><a href="mailto:">cucumber@cucumber.com</a></strong></li>
                    </ul>
                  </div>
                  <!-- /.col-sm-4-->
                </div>
                <!-- /.row-->
                <hr>
                <div id="" class="leaflet-container leaflet-touch leaflet-retina leaflet-fade-anim leaflet-grab leaflet-touch-drag leaflet-touch-zoom" tabindex="0" style="position: relative; outline: none;">
                	<img src="${path }/resources/img/goodeeAddress.png" style="width:762px;height:400px"alt="Obaju logo" class="d-none d-md-inline-block"><img src="/resources/img/cucumber.png" alt="Obaju logo" class="d-inline-block d-md-none"><span class="sr-only">Obaju - go to homepage</span></a>
                </div>
                <hr>
                
              </div>
            </div>
            <!-- /.col-lg-9-->
          </div>
        </div>
      </div>
    </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>