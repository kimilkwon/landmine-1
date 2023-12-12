package egovframework.example.sample.web.util;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

public class UserPaginationRenderer extends AbstractPaginationRenderer {
	public UserPaginationRenderer() {
		firstPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\" class=\"page_btn w-button\">&lt;&lt;</a>"; // 첫페이지 
		previousPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\" class=\"page_btn w-button\">&lt;</a>"; // 이전페이지
		currentPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\" class=\"page_btn w-button\">{0}</a>"; // 현재페이지
		otherPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\" class=\"page_btn w-button\">{2}</a>"; // 나머지 페이지 
		nextPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\" class=\"page_btn w-button\">&gt;</a>"; // 다음 페이지 
		lastPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\" class=\"page_btn w-button\">&gt;&gt;</a>"; // 마지막페이지
	}
}
