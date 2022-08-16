<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
<script src="${path}/resources/vendor/jquery/jquery.min.js"></script>
    <div id="all">
      <div id="content">
        <div class="container">
          <div class="row">
            <div class="col-lg-12">
              <!-- breadcrumb-->
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="${path}/member/mypage.do?userId=${loginMember.userId}">마이페이지</a></li>
                  <li aria-current="page" class="breadcrumb-item active"><c:out value="${loginMember.userId }"/></li>
                </ol>
              </nav>
            </div>
            <div class="col-lg-3">
              <!--
              *** CUSTOMER MENU ***
              _________________________________________________________
              -->
              <div class="card sidebar-menu">
                <div class="card-header">
                  <h3 class="h4 card-title">메뉴</h3>
                </div>
                <div class="card-body">
                  <ul class="nav nav-pills flex-column">
                  <a href="${path }/member/mypage.do?userId=${loginMember.userId}" class="nav-link active"><i class="fa fa-list"></i>내 정보 보기</a>
                  <a href="${path }/member/wishList.do?userId=${loginMember.userId}" class="nav-link"><i class="fa fa-heart"></i>찜 목록</a>
                  <a href="${path }/member/myAccount.do" class="nav-link"><i class="fa fa-user"></i>내 정보 수정</a>

                  <a href="${path }/product/insertProductStart.do" class="nav-link" style="margin-left:2px;"><i class="fa-solid fa-hand-holding-dollar" style="margin-right:5px;"></i>판매 하기</a>


                  <a href="/logout" class="nav-link"><i class="fa fa-sign-out"></i>로그아웃</a>
                  </ul>
                  <!-- <button class="btn btn-outline-success my-2 my-sm-0"
				data-toggle="modal" data-target="#loginModal">상품 등록</button> -->
                </div>
              </div>
              <!-- /.col-lg-3-->
              <!-- *** CUSTOMER MENU END ***-->
            </div>
            <div class="box">
                <h1 align="center"><c:out value="${loginMember.name }"/>님의 신고 목록</h1>
                <hr>
				<div class="col-lg-9">
						<table aria-label="breadcrumb" class="box" border="1" summary="게시판 상세내용" width="650" height="350" border="1" cellpadding="5" align="center" >
						 	<colgroup>
						  		<col width = "130px" />
						  		<col width = "500px" />
						 	</colgroup>
						 	<tbody class="card-body" >
						  		<tr>
						   			<th align="center" style="text-align: center">글번호</th>
						   			<td style="text-align: center"><c:out value="${rep.repNo}"/></td>
						  		</tr>
						  		<tr>
						   			<th align="center" style="text-align: center">제목</th>
						   			<td style="text-align: center"><c:out value="${rep.repTitle}"/></td>
						  		</tr>
						  		<tr>
						   			<th align="center" style="text-align: center">작성자 아이디</th>
						   			<td style="text-align: center"><c:out value="${rep.userId.userId}"/></td>
						  		</tr>
								<tr>
									<th align="center" style="text-align: center">신고한 아이디</th>
						   			<%-- <td style="text-align: center; color:red"><c:out value="${rep.targetId}"/></td> --%>
						   			<td style="text-align: center; color:red"><a href="${path}/member/otherMember.do?writer=${rep.targetId}&customer=${loginMember.userId}">${rep.targetId }</a></td>
						  		</tr>
								<tr>
									<th align="center" style="text-align: center">내용</th>
						   			<td colspan="2" height="200px" style="text-align: center"><c:out value="${rep.repContent}"/></td>
						  		</tr>
						 	</tbody>
							<tr>
								<td colspan="2" align="center">
						 			<input type="button" value="목록" onclick="location.assign('${path}/member/mypage.do?userId=${loginMember.userId}')"/>
						 		</td>
						 	</tr>
						</table>
					</div>
					</div>
      </div>
    </div>
    
  
<input id="userIdd" type="hidden" value="${loginMember.userId }"/>

    


<style>
#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform fieldset legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewContents {
    width: 100%;
    height: 150px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}

</style>


</style>
<script>
function getImageFiles(e) {
    const uploadFiles = [];
    const files = e.currentTarget.files;
    const imagePreview = document.querySelector('.image-preview');
    const docFrag = new DocumentFragment();
}
</script>
<script src="${path}/resources/js/mypage.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>