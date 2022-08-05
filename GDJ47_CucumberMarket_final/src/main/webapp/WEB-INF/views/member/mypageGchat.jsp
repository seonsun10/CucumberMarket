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
			<c:if test="${not empty chatList}">
				<c:forEach var="c" items="${chatList }">
					<c:if test="${c.userId ne loginMember.userId }">
					<tr id="tablebody">
						<td><img src="${path }/resources/img/오이.png" style="width:50px;"></td>
						<td><c:out value="${c.title }"/></td>
						<td><c:out value="${c.userId}"/></td>
						<td><button onclick="open('${path}/ptestchat.do/${c.roomId }','_blank','width=570,height=600');setTimeout(function(){location.reload()}, 1000);">채팅하기</button>
							<button onclick="location.href='${path}/deletechatroom/${c.roomId }' " >채팅방 삭제</button>
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
			<c:if test="${empty chatList}">
				<tr>
					<td colspan="5">채팅방이 없습니다.</td>
				</tr>
			</c:if>
	</table>
</div>