<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<div id="pro-body">
	<table>
		<tr id="tablehead">
			<th>사진</th>
			<th>제목</th>
			<th>대화상대</th>
			<th>입장</th>
		</tr>
			<c:if test="${not empty newChatList}">
				<c:forEach var="c" items="${newChatList }">
					
					<tr id="tablebody">
						<td><img src="${path }/resources/upload/product/${chatFilename[status.index]}" style="width:50px;"></td>
						<td><c:out value="${c.title }"/></td>
						<td><c:out value="${c.otherId}"/></td>
						<td><button onclick="open('${path}/ptestchat.do/${c.roomId }','_blank','width=600,height=640');setTimeout(function(){location.reload()}, 1000);">채팅하기</button>
							
						</td>
						
						
					</tr>
					
				</c:forEach>
			</c:if>
			<c:if test="${empty newChatList}">
				<tr>
					<td colspan="5">채팅방이 없습니다.</td>
				</tr>
			</c:if>
	</table>
</div>
