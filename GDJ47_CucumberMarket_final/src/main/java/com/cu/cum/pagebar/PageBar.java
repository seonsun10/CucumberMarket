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
			pageBar+="<a href="+url
					+"?cPage="+(pageNo-1)
					+"&numPerpage="+numPerpage+"> 이전 </a>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<span> "+pageNo+" </span>";
			}else {
				pageBar+="<span onclick='fn_ajaxPage("+pageNo+")' style=\"color:lightgreen; cursor=pointer\"> "+pageNo+" </span>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<span> 다음 </span>";
		}else {
			pageBar+="<a href="+url+"/member/mypage.do"
			+"?cPage="+(pageNo)
			+"&numPerpage="+numPerpage+"> 다음 </a>";
		}
		return pageBar;
	}
}
