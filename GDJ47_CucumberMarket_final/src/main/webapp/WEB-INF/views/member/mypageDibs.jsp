<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
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
	<div id="pro-right">
		<select id="listOption">
			<option>1</option>
			<option>2</option>
			<option>3</option>
		</select>
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
				<c:forEach var="d" items="${wish }">
					<tr id="tablebody">
						<td><img src="${path }/resources/img/오이.png" style="width:50px;"></td>
						<td><c:out value="${d.title }"/></td>
						<td><c:out value="${d.price }"/>원</td>
						<td><fmt:formatDate value="${d.enrollDate}" pattern="yyyy-MM-dd"/></td>
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