<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
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
	<div id="pro-right">
		<select id="listOption">
			<option>1</option>
			<option>2</option>
			<option>3</option>
		</select>
	</div>
</div>
<c:if test="${review ne null }">
	<c:forEach var="r" items="${review }">
		<div id="pro-body">
			<a id="review-a" href="${path }/member/otherMember.do?writer=${r.writer}"><img src="${path }/resources/img/cucumber.png" style="width:50px;"></a>
			<div>
				<div>
					<div id="writer"><c:out value="${r.writer }"/></div>
					<div id="oi">
						<c:choose>
							<c:when test="${r.oi eq 1 }">
								<img src="${path }/resources/img/별.png">
							</c:when>
							<c:when test="${r.oi eq 2 }">
								<img src="${path }/resources/img/별.png">
								<img src="${path }/resources/img/별.png">
							</c:when>
							<c:when test="${r.oi eq 3 }">
								<img src="${path }/resources/img/별.png">
								<img src="${path }/resources/img/별.png">
								<img src="${path }/resources/img/별.png">
							</c:when>
							<c:when test="${r.oi eq 4 }">
								<img src="${path }/resources/img/별.png">
								<img src="${path }/resources/img/별.png">
								<img src="${path }/resources/img/별.png">
								<img src="${path }/resources/img/별.png">
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
					<div>
					</div>
				</div>
			</div>
			<div id="review"><c:out value="${r.ment }"/></div>
			<div id="review-date"><fmt:formatDate value="${r.writeDate }" pattern="yyyy-MM-dd"/></div>
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
	}
	div#review-date{
		margin-left:15px;
	}
</style>