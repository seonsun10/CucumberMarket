<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="msg" value="${msg }"/>
<c:set var="loc" value="${loc }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<script>
		const script='${script}';
		alert('${msg}');
		if(script!=null){
			window.close();
		}
		location.replace('${path}/${loc}');
	</script>
	
</body>
<script src="${path}/resources/vendor/jquery/jquery.min.js"></script>
</html>