$(()=>{
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
});

const pwcheck=()=>{
	const pw1 = $("#newPw");
	const pw2 = $("#password_2");
	const oldPw = $("#oldPw");
	const userId = $("#email").val();
	if(pw1.val()!=pw2.val()){
		alert("비밀번호를 확인해주세요!");
		pw2.focus();
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