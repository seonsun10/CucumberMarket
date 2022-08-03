<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="${path}/resources/vendor/jquery/jquery.min.js"></script>
<div id="pro-head"> 
	<div id="pro-left">
		상품&nbsp;
		<c:if test="${totalProduct ne null }">
			<span>
				<c:out value="${totalProduct }"/>
			</span>
		</c:if>	
		<c:if test="${totalProduct eq null }">
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
	<c:if test="${product ne null }">
		<c:forEach var="p" items="${product }">
			<div id="pro-box">
				<a href="#">
					<div id="pro-img">
						<img src="${path }/resources/img/오이.png"/>
					</div>
					<div id="pro-title">
						<div id="pro-head2">제목</div>
						<div id="pro-body2">
							<div style="color:black;">1000원</div>
							<div id="pro-date">3일 전</div>
						</div>
					</div>
					<div id="pro-foot">
						<img id="add-img" src="https://cdn-icons.flaticon.com/png/512/4621/premium/4621991.png?token=exp=1659408043~hmac=ef04019d8c5da51eacd21c5dd0501a4b">
						<div id="pro-add">									
							서울특별시 은평구 불광제3동
						</div>
					</div>
				</a>
			</div>
		</c:forEach>
	</c:if>
</div>
<div id="pageBar"><c:out value="${pageBar }" escapeXml="false"/></div>
<script src="${path}/resources/js/otherpage.js"></script>
				