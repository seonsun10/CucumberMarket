<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<div id="pro-head"> 
		<div class="table-responsive">
	 			 <div id="myList">
				  	<p id="pchat">판매중인 채팅방</p>
				  	<p id="gchat">구매중인 채팅방</p>
				 </div>
		</div>
	
</div>
 <div id="databox2" class="col-lg-9 box " style="max-width:100%;">
              </div>

<script>
if($("#gchat").click(e=>{
	$("#gchat").css("backgroundColor","lightgray");

	$("#pchat").css("backgroundColor","white");
}));

if($("#pchat").click(e=>{
	$("#pchat").css("backgroundColor","lightgray");
	
	$("#gchat").css("backgroundColor","white");
}));

		$(function(){
			$("#gchat").click(e=>{
				
				$.ajax({
					url:"${path}/chatlist/"+'${loginMember.userId}',
					dataType:"html",
					success:data=>{
						$("#databox2").html(data);
					}
				});
			});
			
			$("#pchat").click(e=>{
				
				$.ajax({
					url:"${path}/chatlist2/"+'${loginMember.userId}',
					dataType:"html",
					success:data=>{
						$("#databox2").html(data);
					}
				});
			});
			
		});


	


</script>