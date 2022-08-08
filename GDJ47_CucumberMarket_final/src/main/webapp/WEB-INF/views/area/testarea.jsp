<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- <style>
    .map_wrap {position:relative;width:50%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
</style> -->
</head>
<body>
	<%-- <div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
	    <div class="hAddr">
	        <span class="title">지도중심기준 행정동 주소정보</span>
	        <form action="${path }/testarea.do" method="post">
	        <input type="text" id="centerAddr" name="address" readonly>
	        <input type="submit" value="적용">
	        </form>
	    </div>
	</div>
	<button type="button" class="btn btn-lg btn-primary" id="getMyPositionBtn" onclick="getCurrentPosBtn()">내 위치 가져오기</button> --%>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=00357f88543d6b75340e69e7b3972b9d&libraries=services"></script>
	<br>
	<br>
	활동지역
	<select name="sido1" id="sido1"></select>
	<select name="gugun1" id="gugun1"></select>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>