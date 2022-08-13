<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<div id="pro-head"> 
	<div id="pro-left">
		신고&nbsp;
		<c:if test="${totalReport ne null }">
			<span>
				<c:out value="${totalReport }"/>
			</span>
		</c:if>	
		<c:if test="${totalReport eq null }">
			<span>
				0
			</span>
		</c:if>
	</div>
<!-- 	<div id="pro-right">
		<select id="listOption">
			<option>1</option>
			<option>2</option>
			<option>3</option>
		</select>
	</div> -->
</div>
<div id="pro-body">
	<table>
		<tr id="tablehead">
			<th>번호</th>
			<th>신고 유형</th>
			<th>제목</th>
			<th>신고 아이디</th>
			<th>신고 날짜</th>
		</tr>
			<c:if test="${report ne null}">
				<c:forEach var="r" items="${report }">
					<tr id="tablebody">
						<td><c:out value="${r.repNo }"/></td>
						<td><c:out value="${r.repType }"/></td>
						<td><a href="${pageContext.request.contextPath }/mypagereportView/${r.repNo}"><c:out value="${r.repTitle}"/></a></td>
						<td><c:out value="${r.targetId }"/></td>
						<td><fmt:formatDate value="${r.repDate}" pattern="yyyy-MM-dd"/></td>
						
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${report eq null }">
				<tr>
					<td colspan="5" align="center">신고 내역이 없습니다.</td>
				</tr>
			</c:if>
	</table>
</div>
<div id="pageBar"><c:out value="${pageBar }" escapeXml="false"/></div>