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
public class AdminGameController {
	
	@Resource(name = "sampleDAO")
	private SampleDAO sampleDAO;
	
	
	@RequestMapping(value="/gameList.do")
	public String gameList(HttpServletRequest request , Model model){
		
		
		model.addAttribute("list", sampleDAO.list("selectAdminBetlog"));
		return "admin/gameList";
	}
	@RequestMapping(value="/betList.do")
	public String betList(HttpServletRequest request , Model model){
		String pageIndex = request.getParameter("pageIndex");
		String wstat = request.getParameter("wstat");
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		String search = request.getParameter("search");
		String searchSelect = request.getParameter("searchSelect");
		PaginationInfo pi = new PaginationInfo();
		
		if(Utils.isNull(pageIndex)) pi.setCurrentPageNo(1);
		else pi.setCurrentPageNo(Integer.parseInt(pageIndex));
		
		pi.setRecordCountPerPage(10);
		pi.setPageSize(5);
		
		EgovMap in = new EgovMap();
		in.put("first", pi.getFirstRecordIndex());
		in.put("record", pi.getRecordCountPerPage());
		in.put("result", wstat);
		in.put("sdate", sdate);
		in.put("edate", edate);
		in.put("search", search);
		in.put("searchSelect", searchSelect);
		pi.setTotalRecordCount((int)sampleDAO.select("selectAdminBetlogListCnt", in));
		model.addAttribute("list", sampleDAO.list("selectAdminBetlogList",in));
		model.addAttribute("pi", pi);
		model.addAttribute("sdate", sdate);
		model.addAttribute("edate", edate);
		
		return "admin/betList";
	}
	
}
