/**
 * 
 */
 
 if($("#protag1").click(e=>{
	$("#protag1").css("backgroundColor","lightgray");
	$("#reviewtag1").css("backgroundColor","white");
}));
if($("#reviewtag1").click(e=>{
	$("#reviewtag1").css("backgroundColor","lightgray");
	$("#protag1").css("backgroundColor","white");
}));


//다른 사람 상점페이지 상품목록 출력 연결
$("#protag1").click(e=>{
	$.ajax({
		url:"/member/otherpageProduct.do",
		data:{"userId":$("#userIdd").val()},
		dataType:"html",
		success:data=>{
			$("#databox").html(data);
		}
	});
});

//다른 사람 페이지 후기 목록 출력 연결
$("#reviewtag1").click(e=>{
	$.ajax({
		url:"/member/otherpageReview.do",
		data:{"userId":$("#userIdd").val()},
		dataType:"html",
		success:data=>{
			$("#databox").html(data);
		}
	});
});

function fn_ajaxPage1(pageNo){
	$.ajax({
		url:"/member/otherpage"+$("#page").val()+".do",
		data:{"cPage":pageNo,"userId":$("#userIdd").val()},
		dataType:"html",
		success:data=>{
			$("#databox").html(data);
		}	
	});
};