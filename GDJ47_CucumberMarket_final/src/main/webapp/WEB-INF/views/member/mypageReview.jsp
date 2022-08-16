<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<input id="page" type="hidden" value="Review"/>
<div id="pro-head"> 
	<div id="pro-left">
		후기&nbsp;
		<c:if test="${totalReview ne null }">
			<span>
				<c:out value="${totalReview}"/>
			</span>
		</c:if>	
		<c:if test="${totalReview eq null }">
			<span>
				0
			</span>
		</c:if>
	</div>
</div>
<c:if test="${review ne null }">
	<c:forEach var="r" items="${review }" varStatus="status">
		<div id="pro-body">
			<a id="review-a" href="${path }/member/otherMember.do?writer=${r.writer}&customer=${loginMember.userId}"><img src="${path }/resources/img/cucumber.png" style="width:50px;"></a>
			<div>
				<div>
					<div id="writer"><c:out value="${r.writer }"/></div>
					<div id="oi">
						<c:choose>
							<c:when test="${r.oi eq 1 }">
								<img src="${path }/resources/img/별.png">
								<img src="${path }/resources/img/빈별.png">
								<img src="${path }/resources/img/빈별.png">
								<img src="${path }/resources/img/빈별.png">
								<img src="${path }/resources/img/빈별.png">
							</c:when>
							<c:when test="${r.oi eq 2 }">
								<img src="${path }/resources/img/별.png">
								<img src="${path }/resources/img/별.png">
								<img src="${path }/resources/img/빈별.png">
								<img src="${path }/resources/img/빈별.png">
								<img src="${path }/resources/img/빈별.png">
							</c:when>
							<c:when test="${r.oi eq 3 }">
								<img src="${path }/resources/img/별.png">
								<img src="${path }/resources/img/별.png">
								<img src="${path }/resources/img/별.png">
								<img src="${path }/resources/img/빈별.png">
								<img src="${path }/resources/img/빈별.png">
							</c:when>
							<c:when test="${r.oi eq 4 }">
								<img src="${path }/resources/img/별.png">
								<img src="${path }/resources/img/별.png">
								<img src="${path }/resources/img/별.png">
								<img src="${path }/resources/img/별.png">
								<img src="${path }/resources/img/빈별.png">
							</c:when>
							<c:when test="${r.oi eq 5 }">
								<img src="${path }/resources/img/별.png">
								<img src="${path }/resources/img/별.png">
								<img src="${path }/resources/img/별.png">
								<img src="${path }/resources/img/별.png">
								<img src="${path }/resources/img/별.png">
							</c:when>
						</c:choose>
					</div>
				</div>
				<div id="reviewPro" onclick="location.assign('${path}/product/productView.do?id=${loginMember.userId }&no=${products[status.index].proNo }&tag=${products[status.index].categoryName }&name=${r.writer }')">
					<div id="proTitle">
						<c:out value="${products[status.index].title }"/>
					</div>
					<img src="${path }/resources/img/right-arrow.png" width="10px" height="10px"/>
				</div>
			</div>
			<div id="review">
				<div id="reviewMent">
					<c:out value="${r.ment }"/>
				</div>
			</div>
			<div id="review-date"><fmt:formatDate value="${r.writeDate }" pattern="yyyy-MM-dd"/></div>
			<div id="deleteBtn"><button type="button" onclick="javascript:fn_deleteReview(${r.reviewNo});">신고하기</button></div>
		</div>
	</c:forEach>
</c:if>
<c:if test="${review ne null }">
	<div id="pageBar"><c:out value="${pageBar }" escapeXml="false"/></div>
</c:if>

<style>
	div#pro-head{
		border-bottom:1px solid rgb(229,229,229);
	}
	div#pro-body{
		display:flex;
		padding:20px;
		align-items:center;
		border-bottom:1px solid rgb(229,229,229);
	}
	div#oi>img{
		width:10px;
	}
	a#review-a{
		margin-right:15px;
	}
	div#review{
		flex:1 1 0%;
		align-items:center;
		text-align:center;
		justify-content: center;
	}
	div#review-date{
		margin-left:15px;
	}
	div#deleteBtn>button{
		margin-left:10px;
	}
	div#reviewPro{
		border:1px solid lightgray;
		color:gray;
		border-radius: 4px;
		padding-left:5px;
		overflow: hidden;
		display: flex;
		justify-content: space-between;
		cursor: pointer;
	}
	div#proTitle{
		overflow: hidden;
		font-size:10px;
		padding-top:2px;
	}
	div#reviewPro>img{
		margin-top:4px;
	}
</style>
<script>