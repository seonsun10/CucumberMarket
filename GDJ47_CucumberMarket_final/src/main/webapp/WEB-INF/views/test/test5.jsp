<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 	<div> 판매중 채팅방 목록</div>
   	<table id="tbl-board" class="table table-striped table-hover">
            <tr>
                <th>상품명</th>
                <th>대화상대</th>
                <th>채팅방입장</th>
            </tr>
            <c:if test="${not empty chatList}">
            
            	<c:forEach var="c" items="${chatList}"> 
            	
            	<c:if test="${c.userId eq loginMember.userId }">
            	
            	
            		<tr>
            			<td><c:out value="${c.proNo }"/></td>
            			<td> <c:out value="${c.otherId }"/></td>       			
            			<td><button id="chatBtn23" onclick="open('${path}/testchat.do/${c.roomId }','_blank','width=300,height=500');" >채팅하기</button></td>
            		</tr>
            	</c:if>
          
            	</c:forEach>
            </c:if>
            <c:if test="${empty chatList}">
            	<tr>
            		<td colspan="3">조회결과 없음</td>
            	</tr>
            </c:if>
        </table> 
        
        <div> 구매중 채팅방목록</div>
   	<table id="tbl-board" class="table table-striped table-hover">
            <tr>
                <th>상품명</th>
                <th>대화상대</th>
                <th>채팅방입장</th>
            </tr>
            <c:if test="${not empty chatList}">
            
            	<c:forEach var="c" items="${chatList}"> 
            	
            	<c:if test="${c.userId ne loginMember.userId }">
            	
            	
            		<tr>
            			<td><c:out value="${c.proNo }"/></td>
            			<td> <c:out value="${c.userId }"/></td>       			
            			<td><button id="chatBtn23" onclick="open('${path}/testchat.do/${c.roomId }','_blank','width=300,height=500');" >채팅하기</button></td>
            		</tr>
            	</c:if>
          
            	</c:forEach>
            </c:if>
            <c:if test="${empty chatList}">
            	<tr>
            		<td colspan="3">조회결과 없음</td>
            	</tr>
            </c:if>
        </table> 
        
        
        <script type="text/javascript">
        
        const openChatting=()=>{
			open("${path}/chatting/openChatting.do","_blank","width=300,height=500");
		}
		</script>
  

    
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

