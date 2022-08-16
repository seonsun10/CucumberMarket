<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<input id="page" type="hidden" value="Dibs"/>
<div id="pro-head"> 
	<div id="pro-left">
		찜&nbsp;
		<c:if test="${totalWish ne null }">
			<span>
				<c:out value="${totalWish }"/>
			</span>
		</c:if>	
		<c:if test="${totalWish eq null }">
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
			<th>삭제</th>
		</tr>
			<c:if test="${wish ne null}">
				<c:forEach var="d" items="${wish }" varStatus="status">
					<tr id="tablebody">
						<td onclick="location.assign('${path}/product/productView.do?id=${loginMember.userId}&no=${d.proNo}&tag=${d.categoryName}&name=${d.member.userId}')"><img src="${path }/resources/upload/product/${renames[status.index]}" style="width:50px;"></td>
						<td onclick="location.assign('${path}/product/productView.do?id=${loginMember.userId}&no=${d.proNo}&tag=${d.categoryName}&name=${d.member.userId}')"><c:out value="${d.title }"/></td>
						<td onclick="location.assign('${path}/product/productView.do?id=${loginMember.userId}&no=${d.proNo}&tag=${d.categoryName}&name=${d.member.userId}')"><c:out value="${d.price }"/>원</td>
						<td onclick="location.assign('${path}/product/productView.do?id=${loginMember.userId}&no=${d.proNo}&tag=${d.categoryName}&name=${d.member.userId}')"><fmt:formatDate value="${d.enrollDate}" pattern="yyyy-MM-dd"/></td>
						<td><button>삭제</button></td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${wish eq null }">
				<tr>
					<td colspan="5">찜한 상품이 없습니다.</td>
				</tr>
			</c:if>
	</table>
</div>
<div id="pageBar"><c:out value="${pageBar }" escapeXml="false"/></div>