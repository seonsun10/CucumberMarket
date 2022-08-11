$(()=>{
	$(".dibs-box").on('click',"#checkAll",function(){
		var checked = $(this).is(":checked");
	
	  	if(checked){
	  		$("input[type='checkbox']").prop("checked", true);
	 	} else {
	 	 	$("input[type='checkbox']").prop("checked", false);
	 	}
	});
	
	$(".dibs-box").on("click", ".normal", function() {
	  var checked = $(this).is(":checked");
	
	  if (!checked) {
	  	$("#checkAll").prop("checked", false);
	  }
	});
	
	$(".dibs-box").on("click", ".normal", function() {
	    var is_checked = true;
	    
	    $(".dibs-box .normal").each(function(){
	        is_checked = is_checked && $(this).is(":checked");
	    });
	    
	    $("#checkAll").prop("checked", is_checked);
	});
});

function fn_deleteDibs(){
	let arr = [];
	$("input:checked[type='checkbox'].normal").each(function(i,iVal){
		arr.push(iVal.value);
	});
	location.replace('/wishlist/deleteDibs.do?dibsList='+arr);
}
