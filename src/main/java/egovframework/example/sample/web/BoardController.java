package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringEscapeUtils;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.sample.web.SocketHandler;
import egovframework.example.sample.service.impl.SampleDAO;
import egovframework.example.sample.web.util.Utils;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@RequestMapping("/user")
@Controller
public class BoardController {
	@Resource(name = "sampleDAO")
	private SampleDAO sampleDAO;
	
	@RequestMapping(value="/notice.do")
	public String notice(HttpServletRequest request , Model model){
		String pageIndex = request.getParameter("pageIndex");
		PaginationInfo pi = new PaginationInfo();
		
		if(Utils.isNull(pageIndex)) pi.setCurrentPageNo(1);
		else pi.setCurrentPageNo(Integer.parseInt(pageIndex));
		
		pi.setRecordCountPerPage(8);
		pi.setPageSize(4);
		
		EgovMap in = new EgovMap();
		in.put("first", pi.getFirstRecordIndex());
		in.put("record", pi.getRecordCountPerPage());
		pi.setTotalRecordCount((int)sampleDAO.select("selectNoticeListCnt", in));
		model.addAttribute("list", sampleDAO.list("selectNoticeList",in));
		model.addAttribute("pi", pi);
		return "board/app_notice";
	}
	

	@RequestMapping(value="/app_faq.do")
	public String app_faq(HttpServletRequest request , Model model){
		String pageIndex = request.getParameter("pageIndex");
		PaginationInfo pi = new PaginationInfo();
		
		if(Utils.isNull(pageIndex)) pi.setCurrentPageNo(1);
		else pi.setCurrentPageNo(Integer.parseInt(pageIndex));
		
		pi.setRecordCountPerPage(8);
		pi.setPageSize(4);
		
		EgovMap in = new EgovMap();
		in.put("first", pi.getFirstRecordIndex());
		in.put("record", pi.getRecordCountPerPage());
		pi.setTotalRecordCount((int)sampleDAO.select("selectFaqListCnt", in));
		model.addAttribute("list", sampleDAO.list("selectFaqList",in));
		model.addAttribute("pi", pi);
		return "board/app_faq";
	}
	
	@RequestMapping(value="/app_faq_detail.do")
	public String app_faq_detail(HttpServletRequest request , Model model){
		int idx = Integer.parseInt(""+request.getParameter("idx"));
		EgovMap info = (EgovMap)sampleDAO.select("selectFaqDetail", idx);
		model.addAttribute("text", StringEscapeUtils.unescapeHtml3(""+info.get("text")));
		model.addAttribute("info", info);
		return "board/app_faq_detail";
	}

	@RequestMapping(value="/app_qna.do")
	public String app_qna(HttpServletRequest request , Model model){
		return "board/app_qna";
	}
	@RequestMapping(value="/app_qnaList.do")
	public String app_qnaList(HttpServletRequest request , Model model){
		String pageIndex = request.getParameter("pageIndex");
		PaginationInfo pi = new PaginationInfo();
		HttpSession session = request.getSession();
		String idx = ""+session.getAttribute("userIdx");

		if(Utils.isNull(pageIndex)) pi.setCurrentPageNo(1);
		else pi.setCurrentPageNo(Integer.parseInt(pageIndex));
		
		pi.setRecordCountPerPage(8);
		pi.setPageSize(4);
		
		EgovMap in = new EgovMap();
		in.put("idx",idx);
		in.put("first", pi.getFirstRecordIndex());
		in.put("record", pi.getRecordCountPerPage());
		pi.setTotalRecordCount((int)sampleDAO.select("selectQnaListCnt", in));
		model.addAttribute("list", sampleDAO.list("selectQnaList",in));
		model.addAttribute("pi", pi);
		return "user/qnaList";
	}
	@RequestMapping(value="/app_qna_detail.do")
	public String app_qna_detail(HttpServletRequest request , Model model){
		int idx = Integer.parseInt(""+request.getParameter("idx"));
		EgovMap info = (EgovMap)sampleDAO.select("selectQnaDetail", idx);
		model.addAttribute("text", StringEscapeUtils.unescapeHtml3(""+info.get("text")));
		model.addAttribute("info", info);
		return "board/app_qna_detail";
	}
	
	@RequestMapping(value="/noticeList.do")
	public String noticeList(HttpServletRequest request, Model model){
		String pageIndex = request.getParameter("pageIndex");
		PaginationInfo pi = new PaginationInfo();
		HttpSession session = request.getSession();
		String userIdx = ""+session.getAttribute("userIdx");
		model.addAttribute("userIdx", userIdx);
		if(Utils.isNull(pageIndex)) pi.setCurrentPageNo(1);
		else pi.setCurrentPageNo(Integer.parseInt(pageIndex));
		
		pi.setRecordCountPerPage(8);
		pi.setPageSize(4);
		
		EgovMap in = new EgovMap();
		in.put("first", pi.getFirstRecordIndex());
		in.put("record", pi.getRecordCountPerPage());
		pi.setTotalRecordCount((int)sampleDAO.select("selectNoticeListCnt", in));
		model.addAttribute("list", sampleDAO.list("selectNoticeList",in));
		model.addAttribute("page", pi.getCurrentPageNo());
		model.addAttribute("totalpage", Math.ceil(pi.getTotalRecordCount()/pi.getRecordCountPerPage())+1);
		return "user/noticeList";
	}
	@RequestMapping(value="/noticeDetail.do")
	public String noticeDetail(HttpServletRequest request , Model model){
		int idx = Integer.parseInt(""+request.getParameter("idx"));
		
		HttpSession session = request.getSession();
		String userIdx = ""+session.getAttribute("userIdx");
		model.addAttribute("userIdx", userIdx);
		
		EgovMap info = (EgovMap)sampleDAO.select("selectNoticeDetail", idx);
		model.addAttribute("text", StringEscapeUtils.unescapeHtml3(""+info.get("text")));
		model.addAttribute("info", info);
		return "user/noticeDetail";
	}
	@RequestMapping(value="/faqList.do")
	public String faqList(HttpServletRequest request, Model model){
		String pageIndex = request.getParameter("pageIndex");
		HttpSession session = request.getSession();
		String userIdx = ""+session.getAttribute("userIdx");
		model.addAttribute("userIdx", userIdx);
		PaginationInfo pi = new PaginationInfo();
		
		if(Utils.isNull(pageIndex)) pi.setCurrentPageNo(1);
		else pi.setCurrentPageNo(Integer.parseInt(pageIndex));
		
		pi.setRecordCountPerPage(8);
		pi.setPageSize(4);
		
		EgovMap in = new EgovMap();
		in.put("first", pi.getFirstRecordIndex());
		in.put("record", pi.getRecordCountPerPage());
		pi.setTotalRecordCount((int)sampleDAO.select("selectFaqListCnt", in));
		model.addAttribute("list", sampleDAO.list("selectFaqList",in));
		model.addAttribute("page", pi.getCurrentPageNo());
		model.addAttribute("totalpage", Math.ceil(pi.getTotalRecordCount()/pi.getRecordCountPerPage())+1);
		return "user/faqList";
	}
	@RequestMapping(value="/faqDetail.do")
	public String faqDetail(HttpServletRequest request, Model model){
		int idx = Integer.parseInt(""+request.getParameter("idx"));
		HttpSession session = request.getSession();
		String userIdx = ""+session.getAttribute("userIdx");
		model.addAttribute("userIdx", userIdx);
		EgovMap info = (EgovMap)sampleDAO.select("selectFaqDetail", idx);
		model.addAttribute("text", StringEscapeUtils.unescapeHtml3(""+info.get("text")));
		model.addAttribute("info", info);
		return "user/faqDetail";
	}
	@RequestMapping(value="/personalInfo.do")
	public String personalInfo(HttpServletRequest request, Model model){
		HttpSession session = request.getSession();
		String userIdx = ""+session.getAttribute("userIdx");
		model.addAttribute("userIdx", userIdx);
		return "user/personalInfo";
	}
	@RequestMapping(value="/serviceInfo.do")
	public String serviceInfo(HttpServletRequest request, Model model){
		HttpSession session = request.getSession();
		String userIdx = ""+session.getAttribute("userIdx");
		model.addAttribute("userIdx", userIdx);
		return "user/serviceInfo";
	}
	@ResponseBody
	@RequestMapping(value="/askInsertProcess.do"  , produces = "application/json; charset=utf8")
	public String inquryInsertProcess(HttpServletRequest request, Model model){
		HttpSession session = request.getSession();
		String text = request.getParameter("text");
		String title = request.getParameter("title");
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		if(Utils.isNull(title)){
			obj.put("msg", "제목을 입력하세요.");
			return obj.toJSONString();
		}
		if(Utils.isNull(text)){
			obj.put("msg", "내용을 입력하세요.");
			return obj.toJSONString();
		}
		EgovMap in = new EgovMap();
		in.put("text", text);
		in.put("title", title);
		in.put("midx", session.getAttribute("userIdx"));
		sampleDAO.insert("insertAsk", in);
		
		SocketHandler.sh.qnaInsert();
		obj.put("result", "suc");
		return obj.toJSONString();
	}
	
	@RequestMapping(value="/qnaList.do")
	public String qnaList(HttpServletRequest request , Model model){
		String pageIndex = request.getParameter("pageIndex");
		PaginationInfo pi = new PaginationInfo();
		HttpSession session = request.getSession();
		String idx = ""+session.getAttribute("userIdx");

		if(Utils.isNull(pageIndex)) pi.setCurrentPageNo(1);
		else pi.setCurrentPageNo(Integer.parseInt(pageIndex));
		
		pi.setRecordCountPerPage(8);
		pi.setPageSize(4);
		
		EgovMap in = new EgovMap();
		in.put("idx",idx);
		in.put("first", pi.getFirstRecordIndex());
		in.put("record", pi.getRecordCountPerPage());
		pi.setTotalRecordCount((int)sampleDAO.select("selectQnaListCnt", in));
		model.addAttribute("userIdx", idx);
		model.addAttribute("list", sampleDAO.list("selectQnaList",in));
		model.addAttribute("page", pi.getCurrentPageNo());
		model.addAttribute("totalpage", Math.ceil(pi.getTotalRecordCount()/pi.getRecordCountPerPage())+1);
		return "user/qnaList";
	}

	@RequestMapping(value="/qnaDetail.do")
	public String qnaDetail(HttpServletRequest request , Model model){
		int idx = Integer.parseInt(""+request.getParameter("idx"));
		EgovMap info = (EgovMap)sampleDAO.select("selectQnaDetail", idx);
		HttpSession session = request.getSession();
		String useridx = ""+session.getAttribute("userIdx");
		model.addAttribute("userIdx", useridx);
		model.addAttribute("text", StringEscapeUtils.unescapeHtml3(""+info.get("text")));
		model.addAttribute("answer", StringEscapeUtils.unescapeHtml3(""+info.get("answer")));
		model.addAttribute("info", info);
		return "user/qnaDetail";
	}
	@RequestMapping(value="/qna.do")
	public String qna(HttpServletRequest request , Model model){
		HttpSession session = request.getSession();
		String useridx = ""+session.getAttribute("userIdx");
		model.addAttribute("userIdx", useridx);
		return "user/qna";
	}
}
