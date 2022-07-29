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
              <div id="contact" class="box">
                <h1>::오이마켓:: 오늘도 이용하는 마켓</h1>
                <p class="lead">오이마켓에 오신 여러분을 환영합니다.</p>
                <p>자주찾는 질문</p>
                <hr>
                <div id="accordion">
                  <div class="card border-primary mb-3">
                    <div id="headingOne" class="card-header p-0 border-0">
                      <h4 class="mb-0"><a href="#" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="btn btn-primary d-block text-left rounded-0">1. 오이마켓 가이드라인</a></h4>
                    </div>
                    <div id="collapseOne" aria-labelledby="headingOne" data-parent="#accordion" class="collapse show">
                      <div class="card-body">
                        <p>
                        	오이마켓은 동네 이웃 간의 연결을 도와 따스하고 활발한 교류가 있는 문화 사회를 만들기 위해 노력하고 있어요.
							이웃을 향한 당신의 따뜻한 관심과 애정은 오이마켓의 가장 큰 동력이자 자부심이에요. 오이마켓을 사용하는 이웃 모두가 가이드라인을 지키며 따뜻한 지역 커뮤니티를 함께 만들어요. 혼자 힘으로는 할 수 없지만, 우리가 함께라면 할 수 있어요! <br>
							<br>
							오이마켓은 신뢰, 존중을 서비스의 중요한 가치라고 생각해요. 우리는 이 가치를 지키기 위해 언제나 최선을 다할 거예요. 더 가깝고 따뜻한 지역 커뮤니티를 위해 동참해주세요.<br>
							<br>
							신뢰<br>
							우리의 따뜻함은 신뢰로부터 나와요. 우리는 가까운 이웃과의 만남이 따뜻함이 될 수 있도록 노력해요. 당근마켓은 언제나 사용자에게 귀 기울이고, 사용자를 위한 서비스를 제공하며 신뢰를 만들어요.<br>
							<br>
							존중<br>
							당근마켓의 모든 사용자가 우리 동네 이웃이라는 걸 기억해주세요. 어떠한 상황에서도 우리는 이웃의 다양성을 존중하고, 배려하기로 약속해요. 당근마켓은 누구나 존중받는 따뜻한 지역 커뮤니티를 지향하고 있어요.<br>
							</p>
<!--                         <ul>
                          <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>
                          <li>Aliquam tincidunt mauris eu risus.</li>
                          <li>Vestibulum auctor dapibus neque.</li>
                        </ul> -->
                      </div>
                    </div>
                  </div>
                  <div class="card border-primary mb-3">
                    <div id="headingTwo" class="card-header p-0 border-0">
                      <h4 class="mb-0"><a href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" class="btn btn-primary d-block text-left rounded-0">2. 오이마켓 주의사항</a></h4>
                    </div>
                    <div id="collapseTwo" aria-labelledby="headingTwo" data-parent="#accordion" class="collapse">
                      <div class="card-body">
                      		<h3>거래매너를 지키기</h3>
                      		<br>
							<li>서로 존중하고 배려하며 존댓말로 대화하기.</li>
							<li>약속은 반드시 지켜기.</li>
							<li>언제나 따뜻한 인사로 시작하고 마무리하기.</li>
							<li>늦은 시간, 새벽 시간에는 채팅을 자제하기.</li>
							<li>택배 거래보다는 만나서 직거래를 우선시하기.</li>
							<li>이웃과의 거래는 만 14세 이상 부터 하기.</li>
							<br>
							<h3>구매할 때</h3>
							<br>
							판매글을 꼼꼼히 읽고 질문해요.<br>
							미리 신중하게 고민한 뒤 판매자와 거래 약속을 잡아요.<br>
							직거래할 땐 판매자에게 가까운 장소에서 만나요.<br>
							지나치게 가격을 깎지 않아요. 판매자의 가격 책정을 존중해요.<br>
							가격제안불가 게시글에는 가격 할인을 요구하지 않아요.<br>
							물건 금액에 맞게 현금을 미리 준비해요.<br>
							나눔을 받으면 따뜻한 감사인사로 마무리해요.<br>
							<br>
							<h3>판매할 때</h3>
							<br>
							판매글을 꼼꼼히 읽고 질문해요.<br>
							미리 신중하게 고민한 뒤 판매자와 거래 약속을 잡아요.<br>
							직거래할 땐 판매자에게 가까운 장소에서 만나요.<br>
							지나치게 가격을 깎지 않아요. 판매자의 가격 책정을 존중해요.<br>
							가격제안불가 게시글에는 가격 할인을 요구하지 않아요.<br>
							물건 금액에 맞게 현금을 미리 준비해요.<br>
							나눔을 받으면 따뜻한 감사인사로 마무리해요.<br>
                      </div>
                    </div>
                  </div>
                  <div class="card border-primary mb-3">
                    <div id="headingThree" class="card-header p-0 border-0">
                      <h4 class="mb-0"><a href="#" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree" class="btn btn-primary d-block text-left rounded-0">3. 오이마켓 운영정책</a></h4>
                    </div>
                    <div id="collapseThree" aria-labelledby="headingThree" data-parent="#accordion" class="collapse">
                      <div class="card-body">
                      		<h3>판매 금지물품</h3>
							<br>
							<li>가품∙이미테이션 (상표권, 저작권 침해 물품, 특정 브랜드의 스타일을 모방한 물품)</li>
							<li>경유, LPG, 휘발유 등의 유류 거래</li>
							<li>반려동물, 생명이 있는 동물·곤충</li>
							<li>한약, 의약품, 의료기기, 마약류 (청소년 유해약물∙유해화학물질)</li>
							<li>반영구 화장 등 면허나 자격 없는 자의 불법 유사 의료 행위 홍보/모집글</li>
							<li>수제 음식물, 건강기능식품 : 직접 만들거나 가공한 음식, 건강기능식품(지자체 및 영업 신고를 한 사람만 판매할 수 있음</li>
							<li>유통기한이 지난 제품, 포장이 훼손되거나 개봉된 식품</li>
							<li>도수 있는 안경, 선글라스 (온라인 판매 불법)</li>
							<li>콘택트 렌즈, 써클 렌즈 (온라인 판매 불법)</li>
							<li>반복/다량 판매하는 핸드메이드 제품</li>
							<li>화장품 샘플 (온라인 판매 불법)</li>
							<li>음란물 (청소년 유해 매체물)</li>
							<li>촬영 여부를 상대방이 알기 어려운 카메라 혹은 그밖에 유사한 기능을 갖춘 기계장치(불법 카메라 등)성생활용품</li>
							<li>개인정보 (게임 계정, 추천인 계정 포함)</li>
							<li>조건부 무료나눔</li>
							<li>렌탈 제품</li>
							<li>헌혈증 (무료나눔만 가능)</li>
							<li>군용품, 군마트용품, 경찰용품, 도검, 화약류, 전자충격기 (안전확인∙안전인증표시 없는 전기용품 및 단전지 또는 공산품)</li>
							<li>스스로 사용할 목적으로 세금을 면제받은 해외직구 물품을 국내에서 재판매 하는 행위</li>
							<li>암표매매 행위</li>
							<li>오이마켓 광고주센터에 등록되지 않은 모든 홍보/광고</li>
							<br>
							<h3>계정 정지 사유</h3>
							<br>
							<p>서비스 일반</p>
							<br>
							<li>스토킹, 욕설, 게시글 또는 댓글 도배, 번개톡 도배 등 행위로 다른 회원의 서비스 이용을 방해하는 행위</li>
							<li>외설적인, 선정적, 폭력적인 내용이 담긴 내용, 불법적인 단체의 가입이나, 불법적인 시술을 권하는 내용을 게시하는 행위</li>
							<li>공공질서 또는 미풍양속에 위배되는 내용의 정보, 문장, 도형, 음성 등을 유포하는 행위</li>
							<li>다른 회원의 개인정보를 그 동의 없이 수집, 저장, 공개하는 행위</li>
							<li>회사의 임직원 또는 서비스 관리자를 가장하거나 사칭하는 행위</li>
							<li>정보통신망 이용촉진 및 정보보호 등에 관한 법률, 법령에 의하여 그 전송 또는 금지되는 정보를 전송, 게시하는 행위</li>
							<li>소프트웨어 바이러스, 기타 다른 컴퓨터 코드, 파일, 프로그램을 포함하고 있는 자료를 게시하는 행위</li>
							<li>정상적인 방법이 아닌 방법으로 서비스를 이용하여 회사의 정상적인 서비스를 방해하는 행위</li>
							<br>
							<p>계정</p>
							<br>
							<li>회원가입 신청 또는 정보 변경 시 허위 내용을 등록하거나 회사에 통지하는 행위</li>
							<li>타인의 정보를 도용하는 행위</li>
							<li>회원 본인이 아닌 제3자에게 자신의 계정 접속 권한을 부여하는 행위</li>
							<li>서비스를 이용하여 제3자에게 본인 홍보 기회를 제공, 제3자의 홍보를 대행 등의 방법으로 금전을 수수하는 행위</li>
							<li>계정을 타인에게 판매·양도·대여하거나, 타인에게 그 이용을 허락 또는 이를 시도하는 행위</li>
							<br>
							<p>상품</p>
							<Br>
							<li>거래금지품목을 등록하는 행위</li>
							<li>회사가 정한 상품 등록 양식 및 제한 범위를 위반해서 등록하는 행위</li>
							<li>상품이미지, 상품명, 상품 상세, 카테고리, 가격, 수량 등 실제 판매와 무관한 허위 정보를 입력하는 행위</li>
							<li>상품이미지, 상품명, 상품설명, 번개톡에 외부 채널로의 결제 및 대화를 유도하는 행위</li>
							<li>회사의 광고 서비스를 이용하지 않고 광고성 상품을 게재 및 판매하는 행위</li>
							<li>연관태그에 상품과 관련없는 태그 정보를 입력하는 행위</li>
							<li>거래금지품목, 사기유도, 불법현금유통 등의 소지가 있는 키워드를 상품명, 상점설명, 연관태그 등에 사용하는 행위</li>
							<li>판매가 불가능한 상품을 등록하는 행위</li>
							<br>
							<p>거래</p>
							<br>
							<li>물품 정보의 전부 또는 일부를 비공개로하거나 상품의 상태를 확인할 수 없도록 하여(랜덤 박스) 거래하는 행위</li>
							<li>실제 판매하려는 가격과 다른 가격 정보를 기재하는 등 불명확한 거래 조건을 제시하는 행위</li>
							<li>거래금지품목을 판매 및 구매하는 행위</li>
							<li>구매자가 구매의사 없이 고의적으로 판매자의 상품판매 기회를 방해 혹은 다른 구매자의 구매기회를 방해하는 행위</li>
							<li>구매자가 거래취소 또는 반품의 원인이 발생한 경우 상품을 임의로 사용하거나 훼손하는 행위</li>
							<li>구매자 또는 판매자가 상품 매매 절차에서 분쟁이 발생할 경우 불성실로 인하여 구매자, 판매자, 회사에 손실, 손해를 주는 행위</li>
							<li>판매자가 구매자의 문의에 불성실, 부정확한 답변으로 인하여 구매자에게 손해를 발생시키는 행위</li>
							<li>상품의 매매와 관련하여 관련법령, 약관 및 회사가 서비스 화면에서 고지하는 내용을 준수하지 않는 행위</li>
							<li>판매자가 구매자의 구매취소 요청이 있는 경우 타당한 이유 없이 거부하거나 부당한 요금을 요구하는 행위</li>
							<li>상품 판매와 관련하여 특정한 인허가 자격 없이 판매하는 행위</li>
							<br>
							<p>후기</p>
							<li>거래 없이 허위로 거래기록을 만들어 후기를 남기는 행위</li>
							<li>대가를 받고 허위로 후기를 만들어주거나 요청하여 후기를 만드는 행위</li>
                      </div>
                    </div>
                  </div>
                  <div class="card border-primary mb-3">
                    <div id="headingFour" class="card-header p-0 border-0">
                      <h4 class="mb-0"><a href="#" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour" class="btn btn-primary d-block text-left rounded-0">4. 신고 방법</a></h4>
                    </div>
                    <div id="collapseFour" aria-labelledby="headingFour" data-parent="#accordion" class="collapse">
                      <div class="card-body">
                      		<h3>신고는 어떻게 하나요?</h3>
                      		<br>
							오이마켓은 이웃 분들의 다양한 신고 제보를 받아 관련 법 또는 운영정책 기준으로 신속하고 정확하게 대응하고 있어요.
							탈퇴한 사용자라도 개인정보 처리방침에 따라 부정이용 기록은 10년 동안 보관하고 있기 때문에 동일한 기준으로 신고가 처리돼요.<br>
							<br>
							<p><span>1. 우측의 신고하기 버튼 누르기</span></p>
							<p><span>2. 신고할 사용자 및 사유 입력하기</span></p>
							<p><span>3. 신고 버튼 누르기</span></p>
							
							<br>
							
							<p>오이마켓은 신속하게 대응을 하기 때문에 허위로 신고할 경우 불이익을 당할 수 있으니 허위신고는 금지해주세요.</p>
                      </div>
                    </div>
                  </div>
                  <div class="card border-primary mb-3">
                    <div id="headingFive" class="card-header p-0 border-0">
                      <h4 class="mb-0"><a href="#" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive" class="btn btn-primary d-block text-left rounded-0">5. 문의하기</a></h4>
                    </div>
                    <div id="collapseFive" aria-labelledby="headingFive" data-parent="#accordion" class="collapse">
                      <div class="card-body">
                      		<p>찾으시는 질문이 없으신가요? 그렇다면 오이마켓에 문의하기버튼을 클릭해서 문의해 주세요.</P>
							<br>
							<p>1. 우측의 문의하기 버튼 누르기</p>
							<p>2. 문의할 내용을 자세하게 작성하기</p>
							<p>3. 문의 버튼 누르기</p>
							<br>
                      </div>
                    </div>
                  </div>
                  <div class="card border-primary mb-3">
                    <div id="headingSix" class="card-header p-0 border-0">
                      <h4 class="mb-0"><a href="#" data-toggle="collapse" data-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix" class="btn btn-primary d-block text-left rounded-0">6. 여기에는 뭐넣냐</a></h4>
                    </div>
                    <div id="collapseSix" aria-labelledby="headingSix" data-parent="#accordion" class="collapse">
                      <div class="card-body">
                      		<h3>거래매너를 지키기</h3>
                      		<br>
							<li>서로 존중하고 배려하며 존댓말로 대화하기.</li>
							<li>약속은 반드시 지켜기.</li>
							<li>언제나 따뜻한 인사로 시작하고 마무리하기.</li>
							<li>늦은 시간, 새벽 시간에는 채팅을 자제하기.</li>
							<li>택배 거래보다는 만나서 직거래를 우선시하기.</li>
							<li>이웃과의 거래는 만 14세 이상 부터 하기.</li>
							<br>
							<h3>구매할 때</h3>
							<br>
							판매글을 꼼꼼히 읽고 질문해요.<br>
							미리 신중하게 고민한 뒤 판매자와 거래 약속을 잡아요.<br>
							직거래할 땐 판매자에게 가까운 장소에서 만나요.<br>
							지나치게 가격을 깎지 않아요. 판매자의 가격 책정을 존중해요.<br>
							가격제안불가 게시글에는 가격 할인을 요구하지 않아요.<br>
							물건 금액에 맞게 현금을 미리 준비해요.<br>
							나눔을 받으면 따뜻한 감사인사로 마무리해요.<br>
							<br>
							<h3>판매할 때</h3>
							<br>
							판매글을 꼼꼼히 읽고 질문해요.<br>
							미리 신중하게 고민한 뒤 판매자와 거래 약속을 잡아요.<br>
							직거래할 땐 판매자에게 가까운 장소에서 만나요.<br>
							지나치게 가격을 깎지 않아요. 판매자의 가격 책정을 존중해요.<br>
							가격제안불가 게시글에는 가격 할인을 요구하지 않아요.<br>
							물건 금액에 맞게 현금을 미리 준비해요.<br>
							나눔을 받으면 따뜻한 감사인사로 마무리해요.<br>
                      </div>
                    </div>
                  </div>
                  <div class="card border-primary">
                    <div id="headingFour" class="card-header p-0 border-0">
                      <h4 class="mb-0"><a href="#" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour" class="btn btn-primary d-block text-left rounded-0">3. Do you send overseas?</a></h4>
                    </div>
                    <div id="collapseFour" aria-labelledby="headingThree" data-parent="#accordion" class="collapse">
                      <div class="card-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.</div>
                    </div>
                  </div>
                </div>
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