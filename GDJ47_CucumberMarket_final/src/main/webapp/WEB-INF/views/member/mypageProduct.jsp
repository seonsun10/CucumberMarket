<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
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
	<table>
		<tr id="tablehead">
			<th>사진</th>
			<th>제목</th>
			<th>가격</th>
			<th>최근수정일</th>
			<th>수정</th>
			<th>삭제</th>
		</tr> 
			<c:if test="${products ne null}">
				<c:forEach var="p" items="${products}">
						<tr id="tablebody">
							<c:forEach var="pp" items="${pp }">
								<c:if test="${pp.product.proNo eq p.proNo}">
									<c:if test="${pp.renameFilename ne null}">
										<td><a href="${path }/product/productView.do?id=${loginMember.userId}&no=${p.proNo}&tag=${p.categoryName}&name=${p.member.userId}"><img src="${path }/resources/upload/product/${pp.renameFilename}" style="width:50px;"></a></td>
									</c:if>
									<c:if test="${pp.renameFilename eq null}">
										<td><a href="${path }/product/productView.do?id=${loginMember.userId}&no=${p.proNo}&tag=${p.categoryName}&name=${p.member.userId}"><img src="${path }/resources/img/cucumber.png}" style="width:50px;"></a></td>
									</c:if>
						 		</c:if>
							</c:forEach>
							
							<td onclick="location.assign('${path}/product/productView.do?id=${loginMember.userId}&no=${p.proNo}&tag=${p.categoryName}&name=${p.member.userId}')"><c:out value="${p.title}"/></td>
							<td onclick="location.assign('${path}/product/productView.do?id=${loginMember.userId}&no=${p.proNo}&tag=${p.categoryName}&name=${p.member.userId}')"><c:out value="${p.price }"/>원</td>
							<td><fmt:formatDate value="${p.enrollDate}" pattern="yyyy-MM-dd"/></td>
							<td><button onclick="location.assign('${path}/product/updateProductStart.do?proNo=${p.proNo }&userId=${loginMember.userId}')">수정</button></td>
							<td id="deleteBtn"><button onclick="location.assign('${path}/product/deleteProduct.do?proNo=${p.proNo }&userId=${loginMember.userId}')">삭제</button></td>
						</tr>
				</c:forEach>
			</c:if>
			<c:if test="${products eq null }">
				<tr>
					<td colspan="5">등록된 상품이 없습니다.</td>
				</tr>
			</c:if>
	</table>
</div>
<div id="pageBar"><c:out value="${pageBar }" escapeXml="false"/></div>