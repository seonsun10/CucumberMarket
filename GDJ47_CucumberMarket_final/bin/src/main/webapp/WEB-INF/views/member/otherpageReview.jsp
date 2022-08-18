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
<div id="pro-body">
	<table>
		<tr id="tablehead">
			<th>사진</th>
			<th>상품</th>
			<th>후기</th>
			<th>평점</th>
			<th>작성자</th>
		</tr>
		<c:if test="${review ne null}">
			<c:forEach var="r" items="${review }" varStatus="status">
				<tr id="tablebody">
					<td id="lione"><img src="${path }/resources/img/cucumber.png" style="width:50px;"></td>
					<td>
						<div id="reviewPro" onclick="location.assign('${path}/product/productView.do?id=${loginMember.userId }&no=${products[status.index].proNo }&tag=${products[status.index].categoryName }&name=${r.writer }')">
							<div id="proTitle">
								<c:out value="${products[status.index].title }"/>
							</div>
							<img src="${path }/resources/img/right-arrow.png" width="10px" height="10px"/>
						</div>
					</td>
					<td id=""><c:out value="${r.ment }"/></td>
					<td id="lifour">
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
					</td>
					<td id="lithr"><c:out value="${r.writer }"/></td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${review eq null }">
			<tr>
				<td colspan="5">등록된 후기가 없습니다.</td>
			</tr>
		</c:if>
	</table>
</div>
<c:if test="${review ne null }">
<div id="pageBar"><c:out value="${pageBar }" escapeXml="false"/></div>
</c:if>
<style>
	div#reviewPro{
		border:1px solid lightgray;
		color:gray;
		border-radius: 4px;
		padding-left:5px;
		overflow: hidden;
		display: flex;
		justify-content: space-between;
		cursor: pointer;
		width: 150px;
    	margin-left: 80px;
	}
	div#proTitle{
		overflow: hidden;
		font-size:15px;
		padding-top:2px;
	}
	div#reviewPro>img{
		margin-top:4px;
	}
</style>