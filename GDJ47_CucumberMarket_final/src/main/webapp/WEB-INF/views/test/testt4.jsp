<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
div#intro{
	background-color:rgb(229,229,229);
	width:400px;
	height:500px;
	border-radius: 20px;
	opacity: 0.7;
	padding:15px;
	word-break:break-all;
	font-size:15px;
	margin-top:33px;
	
}
#but{
	border: 1px solid rgb(229,229,229);
	opacity: 0.7;
	border-radius:7px;
	align-items: center;
	background-color:lightgray;
	color:"black";
	
}
#but:hover{
	background-color:gray;
}
</style>
<body>
							<div id ="intro">
							<form class="mb-3" name="myform" id="myform"
					  				 action="${path }/product/productReview.do" method="post">
					  				 
							  		<fieldset>
							  		<p><textarea name="ment"cols="50" rows="10"></textarea></p>
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
										
											&nbsp &nbsp &nbsp &nbsp<input type="submit" value="리뷰쓰기"  id ="but"/>
									</fieldset>
									
					  		</form>
					  		</div>
</body>
</html>