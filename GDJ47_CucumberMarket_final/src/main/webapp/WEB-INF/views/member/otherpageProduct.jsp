<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="${path}/resources/vendor/jquery/jquery.min.js"></script>
<input id="page" type="hidden" value="Product"/>
<div id="pro-head"> 
	<div id="pro-left">
		상품&nbsp;
		<c:if test="${totalProduct ne null }">
			<span>
				<c:out value="${totalProduct }"/>
			</span>
		</c:if>	
		<c:if test="${totalProduct eq null }">
			<span>
				0
			</span>
		</c:if>
	</div>
</div>
<div id="pro-body">
	<c:if test="${product ne null }">
		<c:forEach var="p" items="${product }" varStatus="status">
			<div id="pro-box">
				<a href="${path }/product/productView.do?id=${loginMember.userId}&no=${p.proNo}&tag=${p.categoryName}&name=${p.member.userId}">
					<div id="pro-img">
						<img src="${path }/resources/upload/product/${renames[status.index]}"/>
					</div>
					<div id="pro-title">
						<div id="pro-head2"><c:out value="${p.title }"/></div>
						<div id="pro-body2">
							<div style="color:black;"><c:out value="${p.price }"/>원</div>
							<div id="pro-date"><c:out value="${dayList[status.index] }"/>일 전</div>
						</div>
					</div>
					<div id="pro-foot">
						<img id="add-img" src="${path }/resources/img/위치.png">
						<div id="pro-add">									
							<c:out value="${p.region }"/>
						</div>
					</div>
				</a>
			</div>
		</c:forEach>
	</c:if>
	<c:if test="${product eq null }">
		조회된 결과가 없습니다.
	</c:if>
</div>
<div id="pageBar"><c:out value="${pageBar }" escapeXml="false"/></div>
				