<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
<section id="content">
 		<p>총 건의 게시물이 있습니다.</p>
        <button onclick="location.assign('${path}/board/boardWrite.do');">글쓰기</button>
        <table id="tbl-board" class="table table-striped table-hover">
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>첨부파일</th>
                <th>조회수</th>
            </tr>
            <c:if test="${not empty product }">
            	<c:forEach var="p" items="${product }">
            		<tr>
            			<td><c:out value="${p.proNo }"/></td>
            			<td>
            			<a href="${path }/test/testview/${p.proNo}">
            				<c:out value="${p.proName }"/>
            			</a>
            			
            			
            			</td>
            			<td><c:out value="${p.member.userId }"/></td>
            			<td><c:out value="${p.price }"/></td>
            			<td><c:out value="첨부파일"/></td>
            			<td><c:out value="${p.proStatus }"/></td>            			
            		</tr>
            	</c:forEach>
            </c:if>
            <c:if test="${empty product }">
            	<tr>
            		<td colspan="6">조회결과 없음</td>
            	</tr>
            </c:if>
        </table> 
      <%--   <div id="pageBar">
        	${pageBar }
        </div> --%>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
