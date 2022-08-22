<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
@charset "UTF-8";
a:hover{
	text-decoration: none;
}
div.col-lg-9{
	width:1500px;
}
p#protag{
	background-color: rgb(229,229,229);
}
div#pro-box{
	display:inline-block;
	border: 1px solid rgb(229,229,229);
	width:200px;
	height:300px;
	margin-right:20px;
	margin-bottom:30px;
	margin-left:30px;					
}

div#pro-img>img{
	width:198px;
	border-bottom:1px solid rgb(229,229,229);
}
div#pro-title{
	padding:3%;
	border-bottom:1px solid rgb(229,229,229);
	width:100%;
}
div#pro-body2{
	display:flex;
	font-weight:800px;
	justify-content: space-between;
	padding-bottom:7%;
	align-items: center;
}
div#pro-head2{
	padding-bottom:7%;
	font-size:12px;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}
div#pro-foot{
	padding:3%;
	display: flex;
	justify-content: space-between;
}
div#pro-add{
	font-size:10px;
}
div#pro-foot>img{
	width:15px;
}
div#pro-date{
	font-size:10px;
}
#lifour>img{
	width:10px;
}
#intro{
	background-color:rgb(229,229,229);
	width:400px;
	height:180px;
	border-radius: 20px;
	opacity: 0.7;
	padding:15px;
	word-break:break-all;
	font-size:15px;
	margin-top:33px;
}
#mp-ba{
	display:flex;
}
#mp-ba>div{
	padding-right:60px;
}
</style>

    <!-- 헤더-->
    <div id="all">
      <div id="content">
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <div id="main-slider" class="owl-carousel owl-theme">
                <div class="item" ><img src="${path }/resources/img/cucumber-banner.jpg" alt="" class="img-fluid"></div>
                <!-- <div class="item"><img src="resources/img/cucumber.png" alt="" class="img-fluid"></div>
                <div class="item"><img src="resources/img/cucumber.png" alt="" class="img-fluid"></div>
                <div class="item"><img src="resources/img/cucumber.png" alt="" class="img-fluid"></div> -->
              </div>
              <!-- /#main-slider-->
            </div>
          </div>
        </div>
	   </div>
	

        <div id="banner-container" style="text-align: center; margin-bottom:30px;">
        	<img src="${path }/resources/img/오이배너.jpg" width="1500px" style="max-width:80%;"/>
        </div>
 

       
        
             
		<div id="databox" class="col-lg-9 box" style="margin:auto; margin-bottom:20px; max-width:80%; ">
         <div id="hot" style="justify-content:center;">
          
              <div class="row">
                <div class="col-md-12" style="margin-bottom:13px;">
                  <h2 class="mb-0">오늘의 인기 상품</h2>
                </div>
              </div>
        
         </div>

		<div id="pro-body" style="margin-left:70px; margin-right:70px; ">
			<c:if test="${mp ne null }">
				<c:forEach var="p" items="${mp }" varStatus="status">
					<div id="pro-box">
						<a href="${path }/product/productView.do?id=${loginMember.userId}&no=${p.proNo}&tag=${p.categoryName}&name=${p.member.userId}&region=${p.region}&proStatus=${p.proStatus}">
							<c:forEach var="pf" items="${mpf }">
							<c:if test="${pf.product.proNo eq p.proNo }">
							<div id="pro-img">
							<!-- 나중에 여기 /manager/ << 이부분 없애야함  -->
								<img src="${path }/resources/upload/product/${pf.renameFilename}" style="width:198px; height:200px; "/>
							</div>
							</c:if>
							</c:forEach>
							<div id="pro-title">
								<div id="pro-head2">${p.title }</div>
								<div id="pro-body2">
									<div style="color:black;"><fmt:formatNumber value="${p.price}" pattern="#,###" />원</div>
									
									<!-- <div id="pro-date"></div> -->
									
								</div>
							</div>
							<div id="pro-foot">
								<img id="add-img" src="${path }/resources/img/위치.png">
								<div id="pro-add">${p.region }</div>
							</div>
						</a>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${mp eq null }">
				조회된 결과가 없습니다.
			</c:if>
		</div>
		</div>
        </div>
          
  
    

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>