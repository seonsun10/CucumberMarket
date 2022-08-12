package com.cu.cum.pagebar;

public class PageBar {

	public static String getPageBar(int cPage, int numPerpage, int totalProduct, String url) {
		String pageBar="";
		int totalPage=(int)Math.ceil((double)totalProduct/numPerpage);
		
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		pageBar="<ul class='pagination justify-content-center pagination-sm'>";
		if(pageNo==1) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<span class='page-link'> 이전 </span>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<span class='page-link' onclick='fn_ajaxPage2("+(pageNo-1)+","+numPerpage+")' style=\"cursor:pointer;font-weight:bold;\"> 이전 </span>";
			pageBar+="</li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<li class='page-item disabled'>";
				pageBar+="<span class='page-link'> "+pageNo+" </span>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<span class='page-link' onclick='fn_ajaxPage1("+pageNo+")' style=\"cursor:pointer; color:lightgreen;\"> "+pageNo+" </span>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<span class='page-link'> 다음 </span>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<span class='page-link' onclick='fn_ajaxPage2("+pageNo+","+numPerpage+")' style=\"cursor:pointer;font-weight:bold;\"> 다음 </span>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";
		return pageBar;
	}
}
