/**
 * 
 */
 
 if($("#protag").click(e=>{
	$("#protag").css("backgroundColor","lightgray");
	$("#reviewtag").css("backgroundColor","white");
	$("#dibstag").css("backgroundColor","white");
	$("#reporttag").css("backgroundColor","white");
	$("#chattag").css("backgroundColor","white");
}));
if($("#reviewtag").click(e=>{
	$("#reviewtag").css("backgroundColor","lightgray");
	$("#protag").css("backgroundColor","white");
	$("#dibstag").css("backgroundColor","white");
	$("#reporttag").css("backgroundColor","white");
	$("#chattag").css("backgroundColor","white");
}));


//다른 사람 상점페이지 상품목록 출력 연결
$("#protag").click(e=>{
	$.ajax({
		url:"/member/otherPage.do",
		data:{"userId":$("#userIdd").val()},
		dataType:"html",
		success:data=>{
			$("#databox").html(data);
		}
	});
});

//다른 사람 페이지 후기 목록 출력 연결
$("#reviewtag").click(e=>{
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
		url:"/member/otherPage.do",
		data:{"cPage":pageNo,"userId":$("#userIdd").val()},
		dataType:"html",
		success:data=>{
			$("#databox").html(data);
		}	
	});
};