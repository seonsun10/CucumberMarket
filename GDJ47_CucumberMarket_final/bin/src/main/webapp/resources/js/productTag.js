$('document').ready(function() {
	 var area0 = ["전체 카테고리","여성의류","남성의류","신발","디지털/가전","차량/오토바이","도서/티켓/문구","가구/인테리어","스포츠"];
	  var area1 = ["패딩","코트","반팔","긴팔","셔츠","니트","바지"];
	   var area2 = ["남성패딩","남성코트","남성반팔","남성긴팔","남성셔츠","남성니트","남성바지"];
	   var area3 = ["스니커즈","구두","슬리퍼","샌들","운동화"];
	   var area4 = ["모바일","가전제품","컴퓨터","게임","카메라"];
	   var area5 = ["국산차","수입차","차량용품","오토바이","오토바이용품"];
	   var area6 = ["도서","티켓","문구"];
	   var area7 = ["가구","인테리어"];
	   var area8 = ["골프","캠핑","낚시","축구","헬스"];
	   


	 

	 

	 $("select[name^=tag1]").each(function() {
	  $selsido = $(this);
	  $.each(eval(area0), function() {
	   $selsido.append("<option value='"+this+"'>"+this+"</option>");
	  });
	  $selsido.next().append("<option value=''>세부 카테고리</option>");
	 });

	 

	 

	 $("select[name^=tag1]").change(function() {
	  var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
	  var $tag2 = $(this).next(); // 선택영역 군구 객체
	  $("option",$tag2).remove(); // 구군 초기화

	  if(area == "area0"){
	   $tag2.append("<option value=''>세부 카테고리</option>");
	  }else if(area =="area2"){
	   $.each(eval(area), function() {
	    $tag2.append("<option value='"+this+"'>"+this.substr(2,3)+"</option>");
	   });
	  }else{
		$.each(eval(area), function() {
	    $tag2.append("<option value='"+this+"'>"+this+"</option>");
	   });
	  }
	 });
	});