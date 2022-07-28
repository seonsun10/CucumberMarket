<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<div id="pro-head"> 
	<div id="pro-left">
		상품&nbsp;
		<span>0</span>
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
	<c:if test="${product eq null}">
		<span>등록된 상품이 없습니다!</span>
	</c:if>
</div>