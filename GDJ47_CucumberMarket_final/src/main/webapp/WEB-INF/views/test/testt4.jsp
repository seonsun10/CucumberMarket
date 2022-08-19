<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<style>
div#intro{
	background-color:rgb(229,229,229);
	width:500px;
	height:400px;
	border-radius: 20px;
	opacity: 0.7;
	padding:15px;
	word-break:break-all;
	font-size:15px;
	margin-top:33px;
	
}

#myform{
	text-align: center
}

#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform fieldset legend{
    text-align: left;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewContents {
    width: 100%;
    height: 150px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}
#hhead{
	text-align: center;
	font-size:17px
}
</style>

<body>

							<div id ="intro">
								<div id="hhead">${host }님과 거래는 어떠셧나요?
								</div>
								<div id="hhead">솔직한 거래후기를 남겨주세요.</div>
						
							
							<form class="mb-3" name="myform" id="myform"
					  				 action="${path }/product/productReview.do" method="post">
					  				 
					  				 <p><textarea name="ment"cols="50" rows="10" placeholder='욕설은 삼가해주세요.'
							  		autofocus></textarea></p>
							  		
							  		<fieldset>
							  		
							  			
										<input type="radio" name="oi" value="5" id="rate1"><label
											for="rate1">★</label>
										<input type="radio" name="oi" value="4" id="rate2"><label
											for="rate2">★</label>
										<input type="radio" name="oi" value="3" id="rate3"><label
											for="rate3">★</label>
										<input type="radio" name="oi" value="2" id="rate4"><label
											for="rate4">★</label>
										<input type="radio" name="oi" value="1" id="rate5"><label
											for="rate5">★</label>
										<input type ="hidden" name="host" value="${host }">
										<input type ="hidden" name="proNo" value="${proNo }">
										
										
									</fieldset>
									&nbsp &nbsp &nbsp &nbsp 
									<button type="submit" class="btn btn-secondary">리뷰쓰기</button>
									
					  		</form>
					  		</div>
</body>
</html>