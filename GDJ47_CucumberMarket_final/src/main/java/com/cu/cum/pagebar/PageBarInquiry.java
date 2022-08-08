package com.cu.cum.pagebar;

public class PageBarInquiry {

			public static String getPageBar(int cPage, int numPerpage, int totalData, String url) {
				String pageBar="";
				int totalPage=(int)Math.ceil((double)totalData/numPerpage);
				
				int pageBarSize=5;
				int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
				int pageEnd=pageNo+pageBarSize-1;
				if(pageNo==1) {
					pageBar+="<nav aria-label=\"Page navigation example\" class=\"d-flex justify-content-center\">"
							+"<ul class=\"pagination\">"
							+"<li class=\"page-item\"><a href=\"inquiryList?cPage="+(cPage-1)+"&numPerpage=5\" aria-label=\"Previous\" class=\"page-link\"><span aria-hidden=\"true\">«</span><span class=\"sr-only\">Previous</span></a>";
				}else {
					pageBar+="<li class=\"page-item\">"
							+"<a href="+url
							+"?cPage="+(pageNo-1)
							+"&numPerpage="+numPerpage+">[이전]</a>";
				}
				
				while(!(pageNo>pageEnd||pageNo>totalPage)) {
					if(cPage==pageNo) {
						pageBar+="<li class=\"page-item\">"
								+"<span>"+pageNo+"</span>"
								+"</li>";
					}else {
						pageBar+="<li class=\"page-item\">"
								+"<a href="+url
						+"?cPage="+(pageNo)
						+"&numPerpage="+numPerpage+">"+pageNo+"</a>"
						+"</li>";
					}
					pageNo++;
				}
				
				if(pageNo>totalPage) {
					pageBar+="<li class=\"page-item\"><a href=\"inquiryList?cPage="+(cPage+1)+"&numPerpage=5\" aria-label=\"Next\" class=\"page-link\"><span aria-hidden=\"true\">»</span><span class=\"sr-only\">Next</span></a>";
				}else {
					pageBar+="<a href="+url
					+"?cPage="+(pageNo)
					+"&numPerpage="+numPerpage+">[다음]</a>"
					+"</ul>"
					+"</nav>";
				}
				return pageBar;
			}
}
