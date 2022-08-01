package com.cu.cum.pagebar;

public class PageBar {

	public static String getPageBar(int cPage, int numPerpage, int totalProduct, String url) {
		String pageBar="";
		int totalPage=(int)Math.ceil((double)totalProduct/numPerpage);
		
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		if(pageNo==1) {
			pageBar+="<span> 이전 </span>";
		}else {
			pageBar+="<span onclick='fn_ajaxPage2("+(pageNo-1)+","+numPerpage+")' style=\"cursor:pointer;font-weight:bold;\"> 이전 </span>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<span> "+pageNo+" </span>";
			}else {
				pageBar+="<span onclick='fn_ajaxPage1("+pageNo+")' style=\"cursor:pointer; color:lightgreen;\"> "+pageNo+" </span>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<span> 다음 </span>";
		}else {
			pageBar+="<span onclick='fn_ajaxPage2("+pageNo+","+numPerpage+")' style=\"cursor:pointer;font-weight:bold;\"> 다음 </span>";
		}
		return pageBar;
	}
}
