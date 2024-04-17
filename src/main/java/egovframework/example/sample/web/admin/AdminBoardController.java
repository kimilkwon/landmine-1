package egovframework.example.sample.web.admin;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;
import java.util.Properties;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringEscapeUtils;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.example.sample.service.impl.SampleDAO;
import egovframework.example.sample.web.util.Utils;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping("/admin")
public class AdminBoardController {
	
	@Resource(name = "sampleDAO")
	private SampleDAO sampleDAO;
	
	@Resource(name = "fileProperties")
	private Properties fileProperties;
	
	@RequestMapping(value = "/editorFileUpload.do") // attach_photo.js 에 설정한 업로드 경로 
	  public void editorFileUpload(MultipartHttpServletRequest mre,HttpServletRequest request, ModelMap model , HttpServletResponse response) throws Exception {
	      try {
	           //파일정보
	           String sFileInfo = "";
	           //파일명을 받는다 - 일반 원본파일명
	           String filename = mre.getFile("file").getOriginalFilename();
	           //파일 확장자
	           String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
	           //확장자를소문자로 변경
	           filename_ext = filename_ext.toLowerCase();
	           //파일 기본경로
	           String dftFilePath = fileProperties.getProperty("file.editor.upload");
	           //파일 기본경로 _ 상세경로
	           String filePath = dftFilePath;  // 서버 업로드 경로 
	           File file = new File(filePath);
	           if(!file.exists()) {
	              file.mkdirs();
	           }
	           String realFileNm = "";
	           realFileNm = UUID.randomUUID().toString().replaceAll("-", "") + filename.substring(filename.lastIndexOf("."));
	           String rlFileNm = filePath + realFileNm;
	           
	           ///////////////// 서버에 파일쓰기 /////////////////
	           MultipartFile mf = mre.getFile("file");
	           mf.transferTo(new File(rlFileNm));
	           // 정보 출력
	           sFileInfo += "&bNewLine=true";
	           sFileInfo += "&sFileName="+ realFileNm;;
	          sFileInfo += "&sFileURL=/filePath/alive/admin/"+realFileNm; //에디터 이미지 나타낼 소스 경로
	           PrintWriter print = response.getWriter();
	           print.print(sFileInfo);
	           print.flush();
	           print.close();
	      } catch (Exception e) {
	          e.printStackTrace();
	      }
	  }
	
	@RequestMapping(value="/notice.do")
	public String notice(HttpServletRequest request , Model model){
		String pageIndex = request.getParameter("pageIndex");
		PaginationInfo pi = new PaginationInfo();
		
		if(Utils.isNull(pageIndex)) pi.setCurrentPageNo(1);
		else pi.setCurrentPageNo(Integer.parseInt(pageIndex));
		
		pi.setRecordCountPerPage(10);
		pi.setPageSize(5);
		
		EgovMap in = new EgovMap();
		in.put("first", pi.getFirstRecordIndex());
		in.put("record", pi.getRecordCountPerPage());
		pi.setTotalRecordCount((int)sampleDAO.select("selectNoticeListCnt", in));
		model.addAttribute("list", sampleDAO.list("selectNoticeList",in));
		model.addAttribute("pi", pi);
		return "admin/notice";
	}
	
	@RequestMapping(value="/noticeInsert.do")
	public String noticeInsert(){
		return "admin/noticeInsert";
	}
	
	@ResponseBody
	@RequestMapping(value="/noticeInsertProcess.do"  , produces = "application/json; charset=utf8")
	public String noticeInsertProcess(HttpServletRequest request){
		String title = request.getParameter("title");
		String text = request.getParameter("text");
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		if(Utils.isNull(title)){
			obj.put("msg", "제목을 입력하세요");
			return obj.toJSONString();
		}
		if(Utils.isNull(text)){
			obj.put("msg", "내용을 입력하세요");
			return obj.toJSONString();
		}
		EgovMap in = new EgovMap();
		in.put("title", title);
		in.put("text", text);
		sampleDAO.insert("insertNotice",in);
		obj.put("result", "suc");
		obj.put("msg", "등록되었습니다");
		return obj.toJSONString();
	}

	@RequestMapping(value="/noticeDetail.do")
	public String noticeDetail(HttpServletRequest request, Model model){
		int idx = Integer.parseInt(""+request.getParameter("idx"));
		EgovMap info = (EgovMap)sampleDAO.select("selectNoticeDetail", idx);
		model.addAttribute("text", StringEscapeUtils.unescapeHtml3(""+info.get("text")));
		model.addAttribute("info", info);
		return "admin/noticeDetail";
	}

	@RequestMapping(value="/noticeUpdate.do")
	public String noticeUpdate(HttpServletRequest request, Model model){
		int idx = Integer.parseInt(""+request.getParameter("idx"));
		model.addAttribute("info", sampleDAO.select("selectNoticeDetail",idx));
		return "admin/noticeUpdate";
	}

	@ResponseBody
	@RequestMapping(value="/noticeUpdateProcess.do"  , produces = "application/json; charset=utf8")
	public String noticeUpdateProcess(HttpServletRequest request){
		String idx = request.getParameter("idx");
		String title = request.getParameter("title");
		String text = request.getParameter("text");
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		if(Utils.isNull(title)){
			obj.put("msg", "제목을 입력하세요");
			return obj.toJSONString();
		}
		if(Utils.isNull(text)){
			obj.put("msg", "내용을 입력하세요");
			return obj.toJSONString();
		}
		EgovMap in = new EgovMap();
		in.put("idx", idx);
		in.put("title", title);
		in.put("text", text);
		sampleDAO.update("updateNotice",in);
		obj.put("result", "suc");
		obj.put("msg", "수정되었습니다");
		return obj.toJSONString();
	}

	@ResponseBody
	@RequestMapping(value="/deleteNoticeProcess.do"  , produces = "application/json; charset=utf8")
	public String deleteNoticeProcess(HttpServletRequest request){
		String idx = request.getParameter("idx");
		JSONObject obj = new JSONObject();
		sampleDAO.delete("deleteNotice",idx);
		obj.put("result", "suc");
		obj.put("msg", "삭제되었습니다");
		return obj.toJSONString();
	}

	@RequestMapping(value="/faq.do")
	public String faq(HttpServletRequest request , Model model){
		String pageIndex = request.getParameter("pageIndex");
		PaginationInfo pi = new PaginationInfo();
		
		if(Utils.isNull(pageIndex)) pi.setCurrentPageNo(1);
		else pi.setCurrentPageNo(Integer.parseInt(pageIndex));
		
		pi.setRecordCountPerPage(10);
		pi.setPageSize(5);
		
		EgovMap in = new EgovMap();
		in.put("first", pi.getFirstRecordIndex());
		in.put("record", pi.getRecordCountPerPage());
		pi.setTotalRecordCount((int)sampleDAO.select("selectFaqListCnt", in));
		model.addAttribute("list", sampleDAO.list("selectFaqList",in));
		model.addAttribute("pi", pi);
		return "admin/faq";
	}
	
	@RequestMapping(value="/faqInsert.do")
	public String faqInsert(){
		return "admin/faqInsert";
	}
	
	@ResponseBody
	@RequestMapping(value="/faqInsertProcess.do"  , produces = "application/json; charset=utf8")
	public String faqInsertProcess(HttpServletRequest request){
		String title = request.getParameter("title");
		String text = request.getParameter("text");
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		if(Utils.isNull(title)){
			obj.put("msg", "제목을 입력하세요");
			return obj.toJSONString();
		}
		if(Utils.isNull(text)){
			obj.put("msg", "내용을 입력하세요");
			return obj.toJSONString();
		}
		EgovMap in = new EgovMap();
		in.put("title", title);
		in.put("text", text);
		sampleDAO.insert("insertFaq",in);
		obj.put("result", "suc");
		obj.put("msg", "등록되었습니다");
		return obj.toJSONString();
	}
	
	@RequestMapping(value="/faqDetail.do")
	public String faqDetail(HttpServletRequest request, Model model){
		int idx = Integer.parseInt(""+request.getParameter("idx"));
		EgovMap info = (EgovMap)sampleDAO.select("selectFaqDetail", idx);
		model.addAttribute("text", StringEscapeUtils.unescapeHtml3(""+info.get("text")));
		model.addAttribute("info", info);
		return "admin/faqDetail";
	}
	
	@RequestMapping(value="/faqUpdate.do")
	public String faqUpdate(HttpServletRequest request, Model model){
		int idx = Integer.parseInt(""+request.getParameter("idx"));
		model.addAttribute("info", sampleDAO.select("selectFaqDetail",idx));
		return "admin/faqUpdate";
	}
	
	@ResponseBody
	@RequestMapping(value="/faqUpdateProcess.do"  , produces = "application/json; charset=utf8")
	public String faqUpdateProcess(HttpServletRequest request){
		String idx = request.getParameter("idx");
		String title = request.getParameter("title");
		String text = request.getParameter("text");
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		if(Utils.isNull(title)){
			obj.put("msg", "제목을 입력하세요");
			return obj.toJSONString();
		}
		if(Utils.isNull(text)){
			obj.put("msg", "내용을 입력하세요");
			return obj.toJSONString();
		}
		EgovMap in = new EgovMap();
		in.put("idx", idx);
		in.put("title", title);
		in.put("text", text);
		sampleDAO.update("updateFaq",in);
		obj.put("result", "suc");
		obj.put("msg", "수정되었습니다");
		return obj.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteFaqProcess.do"  , produces = "application/json; charset=utf8")
	public String deleteFaqProcess(HttpServletRequest request){
		String idx = request.getParameter("idx");
		JSONObject obj = new JSONObject();
		sampleDAO.delete("deleteFaq",idx);
		obj.put("result", "suc");
		obj.put("msg", "삭제되었습니다");
		return obj.toJSONString();
	}
	
	@RequestMapping(value="/qna.do")
	public String qna(HttpServletRequest request , Model model){
		String pageIndex = request.getParameter("pageIndex");
		PaginationInfo pi = new PaginationInfo();
		
		if(Utils.isNull(pageIndex)) pi.setCurrentPageNo(1);
		else pi.setCurrentPageNo(Integer.parseInt(pageIndex));
		
		pi.setRecordCountPerPage(10);
		pi.setPageSize(5);
		
		EgovMap in = new EgovMap();
		in.put("first", pi.getFirstRecordIndex());
		in.put("record", pi.getRecordCountPerPage());
		pi.setTotalRecordCount((int)sampleDAO.select("selectAdminQnaListCnt", in));
		model.addAttribute("list", sampleDAO.list("selectAdminQnaList",in));
		model.addAttribute("pi", pi);
		return "admin/qna";
	}
	
	@RequestMapping(value="/qnaDetail.do")
	public String qnaDetail(HttpServletRequest request, Model model){
		int idx = Integer.parseInt(""+request.getParameter("idx"));
		EgovMap info = (EgovMap)sampleDAO.select("selectQnaDetail", idx);
		model.addAttribute("info", info);
		model.addAttribute("text", StringEscapeUtils.unescapeHtml3(""+info.get("text")));
		model.addAttribute("answer", StringEscapeUtils.unescapeHtml3(""+info.get("answer")));
		return "admin/qnaDetail";
	}
	@RequestMapping(value="/qnaDetailUpdate.do")
	public String qnaDetailUpdate(HttpServletRequest request, Model model){
		int idx = Integer.parseInt(""+request.getParameter("idx"));
		EgovMap info = (EgovMap)sampleDAO.select("selectQnaDetail", idx);
		model.addAttribute("info", info);
		return "admin/qnaDetailUpdate";
	}
	@ResponseBody
	@RequestMapping(value="/qnaAnswer.do"  , produces = "application/json; charset=utf8")
	public String qnaAnswer(HttpServletRequest request){
		int idx = Integer.parseInt(""+request.getParameter("idx"));		
		String answer = request.getParameter("answer");
		JSONObject obj = new JSONObject();
		if(answer == null || answer.isEmpty()){
			obj.put("result", "fail");
			obj.put("msg", "답변내용을 작성해주세요");
			return obj.toJSONString();
		}
		
		EgovMap in = new EgovMap();
		in.put("idx", idx);
		in.put("answer", answer);
		sampleDAO.update("updateQnaAnswer" , in);	
		
		obj.put("result", "success");
		obj.put("msg", "답변이 등록 되었습니다.");
		return obj.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value = "/isAllAlarmCheck.do", produces = "application/json; charset=utf8")
	public String isAllAlarmCheck(HttpServletRequest request) throws Exception {
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");

		obj.put("dcnt", (int)sampleDAO.select("selectIsDeposit"));
		obj.put("wcnt", (int)sampleDAO.select("selectIsWithdraw"));
		obj.put("newMemCnt", (int)sampleDAO.select("selectNewMemberCnt"));
		obj.put("askcnt", (int)sampleDAO.select("selectContactCnt"));
		obj.put("gcnt",(int)sampleDAO.select("selectIsGaming"));
		obj.put("result", "success");
		return obj.toJSONString();
	}
}
