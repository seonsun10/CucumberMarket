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
<div id="pro-body">
	<table>
		<tr id="tablehead">
			<th>사진</th>
			<th>제목</th>
			<th>가격</th>
			<th>최근수정일</th>
			<th>삭제</th>
		</tr>
		<c:if test="${review ne null}">
			<c:forEach var="r" items="${review }">
				<tr id="tablebody">
					<td id="lione"><img src="${path }/resources/img/cucumber.png" style="width:50px;"></td>
					<td><c:out value=""/></td>
					<td id=""><c:out value="${r.ment }"/></td>
					<td id="lifour"><c:out value="${r.oi}"/></td>
					<td id="lithr"><button>삭제</button></td>
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