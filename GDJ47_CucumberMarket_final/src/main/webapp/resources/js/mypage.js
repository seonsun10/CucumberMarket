$(()=>{
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
    	 	var contextPath =location.href.substring(hostIndex,location.href.indexOf('/',hostIndex+1));
	
	$("#password_2").keyup(e=>{
  		const pw = $("#newPw").val();
  		const pw2 = $(e.target).val();
  		if(pw2.trim().length>2){
  			if(pw === pw2){
  				$("#pwBox").text("비밀번호가 일치합니다.").css('color','green');
  			}else{
  				$("#pwBox").text("비밀번호가 일치하지 않습니다.").css('color','red');
  			}
  		}else{
  			$("#pwBox").text("");
  		}
	})
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
	if($("#dibstag").click(e=>{
		$("#dibstag").css("backgroundColor","lightgray");
		$("#protag").css("backgroundColor","white");
		$("#reviewtag").css("backgroundColor","white");
		$("#reporttag").css("backgroundColor","white");
		$("#chattag").css("backgroundColor","white");
	}));
	if($("#reporttag").click(e=>{
		$("#reporttag").css("backgroundColor","lightgray");
		$("#protag").css("backgroundColor","white");
		$("#reviewtag").css("backgroundColor","white");
		$("#dibstag").css("backgroundColor","white");
		$("#chattag").css("backgroundColor","white");
	}));
	if($("#chattag").click(e=>{
		$("#chattag").css("backgroundColor","lightgray");
		$("#protag").css("backgroundColor","white");
		$("#reviewtag").css("backgroundColor","white");
		$("#dibstag").css("backgroundColor","white");
		$("#reporttag").css("backgroundColor","white");
	}));
	
	//마이페이지 상품목록 출력 연결
	$("#protag").click(e=>{
		$.ajax({
			url:"/GDJ47_CucumberMarket_final/member/mypageProduct.do",
			data:{"userId":$("#userIdd").val()},
			dataType:"html",
			success:data=>{
				$("#databox").html(data);
			}
		});
		$("#page").val('Product');
	});
	
	//마이페이지 후기 목록 출력 연결
	$("#reviewtag").click(e=>{
		$.ajax({
			url:"/GDJ47_CucumberMarket_final/member/mypageReview.do",
			data:{"userId":$("#userIdd").val()},
			dataType:"html",
			success:data=>{
				$("#databox").html(data);
			}
		});
		$("#page").val('Review');
	});
	//마이페이지 찜 목록 출력 연결
	$("#dibstag").click(e=>{
		$.ajax({
			url:"/GDJ47_CucumberMarket_final/member/mypageDibs.do",
			dataType:"html",
			data:{"userId":$("#userIdd").val()},
			success:data=>{
				$("#databox").html(data);
			}
		});
		$("#page").val('Dibs');
	});
	//마이페이지 신고 목록 출력 연결
	$("#reporttag").click(e=>{
		$.ajax({
			url:"/GDJ47_CucumberMarket_final/member/mypageReport.do",
			dataType:"html",
			success:data=>{
				$("#databox").html(data);
			}
		});
		$("#page").val('Report');
	});
	//마이페이지 채팅 목록 출력 연결
	$("#chattag").click(e=>{
		
		$.ajax({
			url: "/GDJ47_CucumberMarket_final/member/mypageChat.do",
			dataType:"html",
			success:data=>{
				$("#databox").html(data);
			}
		});
	});
	
	
});
function fn_ajaxPage1(pageNo){
	const page = $("#page").val();
	$.ajax({
		url:"/GDJ47_CucumberMarket_final/member/mypage"+$("#page").val()+".do",
		data:{"cPage":pageNo,"userId":$("#userIdd").val()},
		dataType:"html",
		success:data=>{
			$("#databox").html(data);
		}
	});
};
function fn_ajaxPage2(pageNo,numPerpage){
	$.ajax({
		url:"/GDJ47_CucumberMarket_final/member/mypage"+$("#page").val()+".do",
		data:{"cPage":pageNo,"numPerpage":numPerpage,"userId":$("#userIdd").val()},
		dataType:"html",
		success:data=>{
			$("#databox").html(data);
		}
	});
};
function fn_ajaxPage5(pageNo){
	$.ajax({
		url:"/GDJ47_CucumberMarket_final/board/boardlist.do",
		data:{"cPage":pageNo,"userId":$("#userIdd").val()},
		dataType:"html",
		success:data=>{
			$("#databox").html(data);
		}
	});
};
function fn_ajaxPage6(pageNo,numPerpage){
	$.ajax({
		url:"/GDJ47_CucumberMarket_final/board/boardlist.do",
		data:{"cPage":pageNo,"numPerpage":numPerpage,"userId":$("#userIdd").val()},
		dataType:"html",
		success:data=>{
			$("#databox").html(data);
		}
	});
};


const pwcheck=()=>{
	const pw1 = $("#newPw");
	const pw2 = $("#password_2");
	if(pw1.val()!=pw2.val()){
		alert("비밀번호를 확인해주세요!");
		pw2.focus();
		return false;
	}else if(pw1.trim().length<8){
		alert("비밀번호를 8자 이상으로 입력해주세요");	
		return false;
	}
	
	//$.ajax({
		//url: "${path}/member/pwCheck.do",
		//method: 'POST',
		//data: {"userId":userId,"pw":oldPw},
		//success: data=>{
			//console.log(data);
		//}
	//});
	return true;
}

