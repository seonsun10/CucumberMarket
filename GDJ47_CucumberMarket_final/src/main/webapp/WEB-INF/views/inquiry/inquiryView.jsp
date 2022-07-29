<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" /> -->

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
                  <h3 class="h4 card-title">Pages</h3>
                </div>
                <div class="card-body">
                  <ul class="nav nav-pills flex-column">
                    <li><a href="${pageContext.request.contextPath }/inquiryView" class="nav-link">문의하기</a></li>
                    <li><a href="contact.html" class="nav-link">신고하기</a></li>
                    <li><a href="${pageContext.request.contextPath }/inquiry" class="nav-link">FAQ</a></li>
                  </ul>
                </div>
              </div>
              <!-- *** PAGES MENU END ***-->
              <div class="banner"><a href="#"><img src="img/banner.jpg" alt="sales 2014" class="img-fluid"></a></div>
            </div>
            <div class="col-lg-9">
				<div id="inquiryPage">
			        <h3>문의 목록</h3>
			        <form class="navbar-form navbar-left" role="search">
			            <div class="form-group">
			                <select id="searchType" class="form-control" style="width: 100px;">
					            <option value="">전체</option>
					            <option value="title">제목</option>
					            <option value="content">내용</option>
					            <option value="writer">작성자</option>
					        </select>
			                <input type="text" id="searchInput" class="form-control" placeholder="키워드를 입력해주세요"/>
			            </div>
			            <!-- <div class="card-body">
		                  <ul class="nav nav-pills flex-column">
		                    <li><a href="/" class="btn btn-primary">검색하기</a></li>
		                    <li><a href="/" class="btn btn-primary">모두보기</a></li>
		                    <li><a href="/" class="btn btn-primary">문의글 작성</a></li>
		                  </ul>
		                </div> -->
		                <div class="navbar-buttons d-flex justify-content-end">
			              <!-- /.nav-collapse-->
			              <div id="basket-overview" class="navbar-collapse collapse d-none d-lg-block">
				              <a href="basket.html" class="btn btn-primary navbar-btn"><span>검색하기</span></a>
				              <a href="basket.html" class="btn btn-primary navbar-btn"><span>모두보기</span></a>
				              <a href="${pageContext.request.contextPath }/inquiryWrite" class="btn btn-primary navbar-btn"><span>문의글 작성</span></a>
			              </div>
			            </div>
			        </form>
			        <br>
			        <div id="inquiryTableTitle">
			            <span id="inquiryNo">번호</span>
			            <span id="inquiryID">회원 ID</span>
			            <span id="inquiryPhone">전화번호</span>
			            <span id="inquiryContent">제목</span>
			            <span id="inquiryDate">작성일</span>
			            <span id="inquiryBtns">답변 완료</span>
			        </div>
			       <div id="inquiryTable">
			       		
			       </div>
			    </div>
            </div>
			<style>
				#inquiryPage {
				    width: 100%;
				    height: auto;
				    font-family: 'Noto Sans', sans-serif !important;
				    padding: 0 30px;
				}
				#inquiryPage .navbar-form.navbar-left{
				    width: 100%;
				    padding-left: 0;
				}
				
				#inquiryPage #inquiryTableTitle{
				    width: 100%;
				    height: 40px;
				    display: flex;
				    font-size: 15px;
				    text-align: center;
				    /* border-bottom: 1px solid black; */
				}
				
				#inquiryPage #inquiryTableTitle #inquiryNo,
				#inquiryPage #inquiryTable .suggestions-createDate{
				    flex: 1;
				}
				
				#inquiryPagee #inquiryTableTitle #inquiryID,
				#inquiryPage #inquiryTable .suggestions-member-no{
				    flex: 0.5;
				}
				
				#inquiryPage #inquiryTableTitle #inquiryPhone,
				#inquiryPage #inquiryTable .suggestions-phone-number{
				    flex: 1;
				}
				
				#inquiryPage #inquiryTableTitle #suggestionsEmail,
				#inquiryPage #inquiryTable .suggestions-email{
				    flex: 1;
				}
				
				#inquiryPage #inquiryTableTitle #inquiryContent,
				#inquiryPage #inquiryTable .suggestions-memo{
				    flex: 3;
				}
				
				#inquiryPage #inquiryTableTitle #inquiryBtns,
				#inquiryPage #inquiryTable .suggestions-btns{
				    flex: 1;
				}
				
				#inquiryPage #inquiryTable{
				    text-align: center;
				}
				
				#inquiryPage #inquiryTable .suggestions-row{
				    display: flex;
				    padding-top: 10px;
				}
				
				#suggestionsModal #suggestionsModalForm{
				    position: absolute;
				    width: 400px;
				    height: auto;
				    top: 50%;
				    left: 50%;
				    transform: translate(-50%, -50%);
				    text-align: center;
				    padding: 50px;
				    background-color: white;
				    border: 10px solid grey;
				    opacity: 1;
				}
				
				#suggestionsModal #suggestionsModalForm h1{
				    margin-bottom: 30px;
				}
				
				#suggestionsModal #suggestionsModalForm .suggestion-input{
				    margin-bottom: 10px;
				    display: flex;
				    justify-content: space-between;
				}
				
				#suggestionsModal #suggestionsModalForm .suggestion-input input{
				    border: 1px solid;
				}
				
				#suggestionsModal #suggestionsModalForm #suggestionsAddModalBtn{
				    width: 100px;
				    height: 40px;
				    border-radius: 20px;
				    background-color: blue;
				    color: white;
				    margin-top: 20px;
				    font-weight: 600;
				}
				
				#suggestionsModal #suggestionsBackGround {
				    width: 100%;
				    height: 100%;
				    position: absolute;
				    top: 0;
				    background-color: black;
				    opacity: 0.4;
				}
				
				#suggestionsModalBtn {
				    width: 100px;
				    height: 40px;
				    border-radius: 20px;
				    background-color: blue;
				    color: white;
				    margin: 5px 40px 0 0;
				    font-weight: 600;
				}
				
				#suggestionsUpdateBtn {
				    border-radius: 7px;
				    margin-right: 5px;
				    background-color: greenyellow;
				    font-weight: 600;
				}
				
				#suggestionsDeleteBtn {
				    border-radius: 7px;
				    background-color: pink;
				    font-weight: 600;
				}
			</style>
                <!-- /.accordion-->
              </div>
            </div>
            <!-- /.col-lg-9-->
          </div>
        </div>
      </div>
    </div>
    <!--
    *** FOOTER ***
    _________________________________________________________
    -->
    <div id="footer">
      <div class="container">
        <div class="row">
          <div class="col-lg-3 col-md-6">
            <h4 class="mb-3">Pages</h4>
            <ul class="list-unstyled">
              <li><a href="text.html">About us</a></li>
              <li><a href="text.html">Terms and conditions</a></li>
              <li><a href="faq.html">FAQ</a></li>
              <li><a href="contact.html">Contact us</a></li>
            </ul>
            <hr>
            <h4 class="mb-3">User section</h4>
            <ul class="list-unstyled">
              <li><a href="#" data-toggle="modal" data-target="#login-modal">Login</a></li>
              <li><a href="register.html">Regiter</a></li>
            </ul>
          </div>
          <!-- /.col-lg-3-->
          <div class="col-lg-3 col-md-6">
            <h4 class="mb-3">Top categories</h4>
            <h5>Men</h5>
            <ul class="list-unstyled">
              <li><a href="category.html">T-shirts</a></li>
              <li><a href="category.html">Shirts</a></li>
              <li><a href="category.html">Accessories</a></li>
            </ul>
            <h5>Ladies</h5>
            <ul class="list-unstyled">
              <li><a href="category.html">T-shirts</a></li>
              <li><a href="category.html">Skirts</a></li>
              <li><a href="category.html">Pants</a></li>
              <li><a href="category.html">Accessories</a></li>
            </ul>
          </div>
          <!-- /.col-lg-3-->
          <div class="col-lg-3 col-md-6">
            <h4 class="mb-3">Where to find us</h4>
            <p><strong>Obaju Ltd.</strong><br>13/25 New Avenue<br>New Heaven<br>45Y 73J<br>England<br><strong>Great Britain</strong></p><a href="contact.html">Go to contact page</a>
            <hr class="d-block d-md-none">
          </div>
          <!-- /.col-lg-3-->
          <div class="col-lg-3 col-md-6">
            <h4 class="mb-3">Get the news</h4>
            <p class="text-muted">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>
            <form>
              <div class="input-group">
                <input type="text" class="form-control"><span class="input-group-append">
                  <button type="button" class="btn btn-outline-secondary">Subscribe!</button></span>
              </div>
              <!-- /input-group-->
            </form>
            <hr>
            <h4 class="mb-3">Stay in touch</h4>
            <p class="social"><a href="#" class="facebook external"><i class="fa fa-facebook"></i></a><a href="#" class="twitter external"><i class="fa fa-twitter"></i></a><a href="#" class="instagram external"><i class="fa fa-instagram"></i></a><a href="#" class="gplus external"><i class="fa fa-google-plus"></i></a><a href="#" class="email external"><i class="fa fa-envelope"></i></a></p>
          </div>
          <!-- /.col-lg-3-->
        </div>
        <!-- /.row-->
      </div>
      <!-- /.container-->
    </div>
    <!-- /#footer-->
    <!-- *** FOOTER END ***-->

 
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>