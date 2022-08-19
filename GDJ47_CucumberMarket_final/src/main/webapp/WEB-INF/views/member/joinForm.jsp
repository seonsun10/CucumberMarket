<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
   <button type="button" class="btn btn-primary"><i class="fa fa-search"></i></button>
    <div id="all">
      <div id="content">
        <div class="container">
          <div class="row">
            <div class="col-lg-12">
              <!-- breadcrumb-->
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">Home</a></li>
                  <li aria-current="page" class="breadcrumb-item active">회원가입</li>
                </ol>
              </nav>
            </div>
            <div class="col-lg-6">
              <div class="box">
                <h1>회원가입</h1>
                <p class="lead">아직 가입하지 않으셨나요?</p>
                <p>중고 거래를 통해 돈도 벌고, 차지하던 공간의 확보를 통해 쾌적할 삶을 즐기세요!</p>
                <p class="text-muted">문의사항은 <a href="${pageContext.request.contextPath}/contactPage">contact us</a> 로 부탁드려요, 가능한 빠르게 답변드리도록 하겠습니다!</p>
                <hr>
                <form action="${path}/join" method="post" onsubmit="return fn_join()">
                  <div class="form-group">
                    <label for="email">이메일 - ID로 사용됩니다</label>
                    <input id="userId" type="text" name="userId" class="form-control" placeholder="example@cu.com" required oninput = "checkId()" onchange="validEmail(this)">
					<d id="idAvailable" class="valid-feedback" style="display: none;"></d>
					<d id="idNotAvailable" class="invalid-feedback" style="display: none;"></d>
                    <div class="input-group-addon">
						<button type="button" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
					</div>
					<div class="mail-check-box">
						<input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" required disabled="disabled" maxlength="6">
					</div>
					<span id="mail-check-warn"></span>
                  </div>
                  <div class="form-group">
                    <label for="password">비밀번호</label>
                    <input id="password" type="password" required name="password" class="form-control">
                  </div>
                  <div class="form-group">
                    <label for="name">이름</label>
                    <input id="name" type="text" name="name" required class="form-control">
                  </div>
                  <div class="form-group">
                    <label for="phone">핸드폰 번호</label>
                    <input id="phone" type="text" name="phone" required class="form-control">
                  </div>
                  <div class="form-group">
                    <input type="button" onclick="fn_area();" class="btn btn-primary navbar-btn" value="지역설정"/>
                    <input id="region" type="text" name="region" class="form-control" readonly required style="margin-top:5px;">
                  </div>
                  <div class="text-center">
                    <button type="submit" class="btn btn-primary"><i class="fa fa-user-md"></i> Register</button>
                  </div>
                </form>
              </div>
            </div>
           
          </div>
        </div>
      </div>
    </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script>
	//이메일 정규식 입력 확인
	function validEmail(obj){
	    if(validEmailCheck(obj) == false){
	        alert('올바른 이메일 주소를 입력해주세요.')
	        obj.value='';
	        obj.focus();
	        return false;
	    }
	}
	//이메일 정규식
	function validEmailCheck(obj){
	    var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	    return (obj.value.match(pattern) != null)
	}


	//이메일 중복확인
	function checkId(){
	    var userId = $('#userId').val(); //id값이 "userid"인 입력란의 값을 저장
		$.ajax({
		    url: '/idCheck',
		    type: 'GET',
		    contentType: 'application/json',
		    headers: {
		    	// 스프링 시큐리티를 위한 헤더 설정
		    	"X-CSRF-TOKEN": $("meta[name='_csrf']").attr("content")
		    },
		    data: {
		    	userId: $('#userId').val()
		    },
		    success: function (result) {
		    	// 성공 시 실패 메시지 hide, 성공 메시지 show
		        $('#idNotAvailable').hide();
		        $('#idAvailable').show().text(result).append($('<br />'));
		        
		    }, error: function(error) {
		    	// 실패 시 실패 메시지 show, 성공 메시지 hide
		        $('#idAvailable').hide();
		        $('#idNotAvailable').show().text('이미 사용중인 아이디 입니다.').append($('<br />'));
		    }
		});
	}
	
	
	var code = "";
	$('#mail-Check-Btn').click(function() {
		const email = $('#userId').val(); // 이메일 주소값 얻어오기//직접 입력, @이하 선택분류 설정가능
		console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
		const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
		
		$.ajax({
			type : 'get',
			url : '${path}/mailCheck?email='+email, // GET방식이라 Url 뒤에 email을 추가
			success : function (data) {
				console.log("data : " +  data);
				checkInput.attr('disabled',false);
				code = data;
				alert('인증번호가 전송되었습니다.')
			}			
		}); // ajax종료
	}); //email 전송
	
	// 인증번호 비교 
	$('.mail-check-input').blur(function () {
		const inputCode = $(this).val();
		const $resultMsg = $('#mail-check-warn');
		
		if(inputCode === code){
			$resultMsg.html('인증번호가 일치합니다.');
			$resultMsg.css('color','green');
			$('#mail-Check-Btn').attr('disabled',true);
			$('#userId').attr('readonly',true);

		}else{
			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
			$resultMsg.css('color','red');
		}
	});
	
	
	
	function fn_area(){
	     window.open(
	      "${path}/area.do",
	      "현재 내 위치 설정",
	      "width=800, height=600, top=100, left=600"
	    );
	}

	/* function join(){
		const resultMsg = $('#mail-check-warn').val();
		if(resultMsg=='인증번호가 일치합니다.'){
			return true;
		}
		alert('이메일 인증을 완료해야 가입이됩니다.');
		return false;
	} */
	
	function fn_join(){
		var region = $('#region').val();
		if(region==''){
			alert('지역설정을 해주세요.');
			return false;
		}
		return true;
	}
</script>
    