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
                      			<br>
                        		<p>
		                        	오이마켓은 동네 이웃 간의 연결을 도와 따스하고 활발한 교류가 있는 문화 사회를 만들기 위해 노력하고 있어요.<br>
									이웃을 향한 당신의 따뜻한 관심과 애정은 오이마켓의 가장 큰 동력이자 자부심이에요.<br> 
									오이마켓을 사용하는 이웃 모두가 가이드라인을 지키며 따뜻한 지역 커뮤니티를 함께 만들어요.<br> 
									혼자 힘으로는 할 수 없지만, 우리가 함께라면 할 수 있어요! <br>
									<br>
									오이마켓은 신뢰, 존중을 서비스의 중요한 가치라고 생각해요.<br> 
									우리는 이 가치를 지키기 위해 언제나 최선을 다할 거예요.<br> 
									더 가깝고 따뜻한 지역 커뮤니티를 위해 동참해주세요.<br>
									<br>
									신뢰<br>
									우리의 따뜻함은 신뢰로부터 나와요.<br> 
									우리는 가까운 이웃과의 만남이 따뜻함이 될 수 있도록 노력해요.<br>
									당근마켓은 언제나 사용자에게 귀 기울이고, 사용자를 위한 서비스를 제공하며 신뢰를 만들어요.<br>
									<br>
									존중<br>
									오이마켓의 모든 사용자가 우리 동네 이웃이라는 걸 기억해주세요.<br>
									어떠한 상황에서도 우리는 이웃의 다양성을 존중하고, 배려하기로 약속해요.<br> 
									오이마켓은 누구나 존중받는 따뜻한 지역 커뮤니티를 지향하고 있어요.<br>
								</p>
                      		</div>
                    	</div>
                  	</div>
                  	<div class="card border-primary mb-3">
                    	<div id="headingTwo" class="card-header p-0 border-0">
                      		<h4 class="mb-0"><a href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" class="btn btn-primary d-block text-left rounded-0">2. 오이마켓 주의사항</a></h4>
                    	</div>
                   		<div id="collapseTwo" aria-labelledby="headingTwo" data-parent="#accordion" class="collapse">
                      		<div class="card-body">
                      			<br>	
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
								구매자 또한, 당근마켓의 소중한 주민이자 여러분의 이웃이에요.<br>
								판매자의 무리한 요구는 거절할 권리가 있어요. 매너없는 이야기에 답하지 않을 권리도 있어요.<br>
								무리한 요구나 비매너 행위를 지속한다면 '비매너 평가하기'나 '사용자 신고하기', '문의 및 제안하기'를 통해서 알려주세요. <br>
								거래 관련 문제가 생겼을 때, 판매자의 의무에 명시된 상황에 해당하면 환불을 요구할 권리가 있어요. <br>
								<br>
								<h3>판매할 때</h3>
								<br>
								민법상 미성년자가 중고거래를 하기 위해서는 법정 대리인의 동의를 받아야 해요.<br>
								보호자 동의 없이 거래한 경우 거래가 취소될 수 있어요.<br>
								다만, 미성년자가 거짓으로 동의했다고 믿게 한 경우에는 거래를 취소할 수 없어요.<br>
								판매자에게는 이런 권리가 있어요.<br>
								판매자는 당근마켓의 소중한 주민이자 여러분의 이웃이에요. 우리는 모두 판매자이면서 구매자예요.<br>
								구매자의 무리한 요구는 거절할 권리가 있어요. 매너없는 이야기에 답하지 않을 권리도 있어요. <br>
								무리한 요구나 비매너 행위를 지속한다면 '비매너 평가하기'나 '사용자 신고하기', '문의 및 제안하기'를 통해서 알려주세요. <br>
								<br>
								<h3>신고는 어떻게 하나요?</h3>
								<br>
								오이마켓은 이웃 분들의 다양한 신고 제보를 받아 관련 법 또는 운영정책 기준으로 신속하고 정확하게 대응하고 있어요.<br>
								탈퇴한 사용자라도 개인정보 처리방침에 따라 부정이용 기록은 10년 동안 보관하고 있기 때문에 동일한 기준으로 신고가 처리돼요.<br>
						</div>
                    </div>
                  </div>
				<div class="card border-primary mb-3">
                    <div id="headingThree" class="card-header p-0 border-0">
                      <h4 class="mb-0"><a href="#" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree" class="btn btn-primary d-block text-left rounded-0">3. 오이마켓 운영정책</a></h4>
                    </div>
					<div id="collapseThree" aria-labelledby="headingThree" data-parent="#accordion" class="collapse">
						<div class="card-body">
                      		<br>
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
                      		<br>
                      		<h3>신고는 어떻게 하나요?</h3>
                      		<br>
							오이마켓은 이웃 분들의 다양한 신고 제보를 받아 관련 법 또는 운영정책 기준으로 신속하고 정확하게 대응하고 있어요.<br>
							탈퇴한 사용자라도 개인정보 처리방침에 따라 부정이용 기록은 10년 동안 보관하고 있기 때문에 동일한 기준으로 신고가 처리돼요.<br>
							<br>
							<p><span>1. 신고할 회원의 프로필에서 우측에 위치한 신고 버튼 클릭하기</span></p>
							<p><span>2. 신고할 사용자 및 사유 입력하기</span></p>
							<p><span>3. 신고하기</span></p>
							
							<br>
							
							<p>오이마켓은 신속하게 대응을 하기 때문에 허위로 신고할 경우 불이익을 당할 수 있으니 허위신고는 금지해주세요.</p>
                      </div>
                    </div>
                  </div>
					<div class="card border-primary mb-3">
                    	<div id="headingFive" class="card-header p-0 border-0">
                      		<h4 class="mb-0"><a href="#" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive" class="btn btn-primary d-block text-left rounded-0">5. 오이마켓을 믿고 거래하세요</a></h4>
                    	</div>
                    	<div id="collapseFive" aria-labelledby="headingFive" data-parent="#accordion" class="collapse">
                      	<div class="card-body">
                      		<br>
							<h3>1:1 오이채팅으로 대화해요</h3>
							<p>
							<br>
							오이마켓 내의 채팅을 통해 거래하는게 가장 안전해요. <br>
							오이채팅에서는 안전한 거래를 위해 대화 내용에 따라 다양한 안내 및 경고 메시지들을 보내고 있어요. <br>
							교묘해지고 있는 사기 케이스들을 모니터링하고, 이를 막기 위한 시스템을 고도화하고 있어요. <br>
							일부 사용자들을 실시간으로 제재하여 거래가 진행되지 않도록 채팅을 막기도 해요. <br>
							1년 365일 24시간 안전하게 지켜지는 오이마켓의 채팅으로 믿고 거래하세요! <br>
							</p>
							<br>
							<h3>사기꾼은 실시간으로 제재해요</h3>
							<p>
							<br>
							오이마켓은 다양한 사기 사례들을 분석하고 있어요.<br>
							비슷한 수법의 범죄가 재발하지 않도록 모니터링하여 실시간으로 제재하고 있어요. <br>
							제재 당한 사용자는 서비스를 사용할 수 없어요.<br> 
							사기를 저지른 사용자가 계정을 바꾸며 재가입해도 서비스를 사용할 수 없어요.<br>
							</p>
							<br>
							<h3>채팅 메시지로 미리 알려줘요</h3>
							<br>
							<p>
							대화 내용에 따라 다양한 안내 및 경고 메시지들을 보내고 있어요. <br>
							사기 이력이 있는 사용자와 대화를 하면 사기 이력이 있다고 알려주고, 메신저나 문자 등으로 대화를 유도하면 주의할 수 있게 안내 메시지를 보내요. <br>
							새롭게 등장한 사기 사례들도 채팅방에서 미리 알려주고 사용자가 피할 수 있게 돕고 있어요. <br>
							이 외에도 정말 많은 시스템 메시지가 있어요. 안전한 거래를 만들기 위해 오늘도 개선하고 있답니다.<br>
							</p>
							<br>
							<h3>오늘도 직거래를 이용해요</h3>
							<br>
							<p>
							중고거래 사기의 대부분은 택배거래에서 발생한다는 사실, 알고 계셨나요? <br>
							오이마켓에서는 직거래를 권장하고 있어요. <br>
							직거래할 때는 누구나 찾기 쉽고 안전한 공공장소가 좋아요. 이웃과 따뜻하게 거래하세요.<br>
							</p>
                      	</div>
                    </div>
                  </div>
                  
                  <div class="card border-primary mb-3">
                    <div id="headingSix" class="card-header p-0 border-0">
                      <h4 class="mb-0"><a href="#" data-toggle="collapse" data-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix" class="btn btn-primary d-block text-left rounded-0">6. 문의하기</a></h4>
                    </div>
                    <div id="collapseSix" aria-labelledby="headingSix" data-parent="#accordion" class="collapse">
						<div class="card-body">
                      		<br>
                      		<p>찾으시는 질문이 없으신가요? 그렇다면 오이마켓의 문의하기버튼을 클릭해서 문의해 주세요.</P>
							<br>
							<p>1. 우측의 문의하기 버튼 누르기</p>
							<p>2. 문의할 내용을 자세하게 작성하기</p>
							<p>3. 문의 버튼 누르기</p>
							<br>
                      </div>
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

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>