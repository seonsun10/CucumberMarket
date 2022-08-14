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
			<th>알림</th>
		</tr>
			<c:if test="${not empty newChatList}">
				<c:forEach var="c" items="${newChatList }">
					<c:if test="${c.userid ne loginMember.userId }">
					<tr id="tablebody">
						<td><img src="${path }/resources/img/오이.png" style="width:50px;"></td>
						<td><c:out value="${prono.title }"/></td>
						<td><c:out value="${c.userid}"/></td>
						<td><button onclick="open('${path}/ptestchat.do/${c.roomId }','_blank','width=600,height=640');setTimeout(function(){location.reload()}, 1000);">채팅하기</button>
							
						</td>
						<c:if test="${c.unReadCount ne 0 }">
            			<td style='color:#ff0a00'> 
            			<c:out value="${c.unReadCount }개의 새로운메시지가 있습니다"/> 
            			</td>
            			</c:if>
            			<c:if test="${c.unReadCount eq 0 }">
            			<td> 
            			 
            			</td>
            			</c:if>
						
					</tr>
					
					</c:if>
				</c:forEach>
			</c:if>
			<c:if test="${empty newChatList}">
				<tr>
					<td colspan="5">채팅방이 없습니다.</td>
				</tr>
			</c:if>
	</table>
</div>
