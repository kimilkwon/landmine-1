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
public class AdminMoneyController {
	
	@Resource(name = "sampleDAO")
	private SampleDAO sampleDAO;
	
	@RequestMapping(value="/withdrawList.do")
	public String withdrawList(HttpServletRequest request , Model model){
		String pageIndex = request.getParameter("pageIndex");
		String coin = request.getParameter("coin");
		String wstat = request.getParameter("wstat");
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		String search = request.getParameter("search");
		String searchSelect = request.getParameter("searchSelect");
		String order = request.getParameter("order");
		String orderAD = request.getParameter("orderAD");
		PaginationInfo pi = new PaginationInfo();
		
		if(Utils.isNull(pageIndex)) pi.setCurrentPageNo(1);
		else pi.setCurrentPageNo(Integer.parseInt(pageIndex));
		
		pi.setRecordCountPerPage(10);
		pi.setPageSize(5);
		
		EgovMap in = new EgovMap();
		in.put("first", pi.getFirstRecordIndex());
		in.put("record", pi.getRecordCountPerPage());
		in.put("stat", wstat);
		in.put("coin", coin);
		in.put("sdate", sdate);
		in.put("edate", edate);
		in.put("search", search);
		in.put("searchSelect", searchSelect);
		in.put("order", "money."+order);
		in.put("orderAD", orderAD);
		in.put("kind","-");
		pi.setTotalRecordCount((int)sampleDAO.select("selectAdminDWListCnt", in));
		model.addAttribute("list", sampleDAO.list("selectAdminDWList",in));
		model.addAttribute("pi", pi);
		model.addAttribute("coin", coin);
		model.addAttribute("sdate", sdate);
		model.addAttribute("edate", edate);
		
		return "admin/withdrawList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/withdrawProcess.do" , produces="application/json; charset=utf8")
    public String withdrawProcess(HttpServletRequest request){
		
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		obj.put("msg", "잘못된 요청입니다.");
		
		HttpSession session = request.getSession();
		String widx = ""+request.getParameter("widx");
		String stat = ""+request.getParameter("stat");
		
		EgovMap in = new EgovMap();
		in.put("idx", widx);
		in.put("stat", stat);
		EgovMap moneyCheck = (EgovMap) sampleDAO.select("moneyCheck", in);
		if(!moneyCheck.get("stat").equals(0)){
			return obj.toJSONString();
		}
		
		
		sampleDAO.update("moneyStatUpdate", in);
		if(stat.equals("2")){
			in.put("idx", moneyCheck.get("useridx"));
			
			EgovMap ed = (EgovMap) sampleDAO.select("selectMemberDetail", in);
			String stringCoin = moneyCheck.get("coin").toString().toLowerCase();
			double wallet =  Double.parseDouble(ed.get("money").toString());
			double inMoney =  Double.parseDouble(moneyCheck.get("money").toString());
			
			EgovMap in2 = new EgovMap();
			in2.put("idx", moneyCheck.get("useridx"));
			in2.put("afPoint",wallet+ inMoney);
			in2.put("lkind", "withdrawNot");
			in2.put("kind", "-");
			in2.put("userPoint", wallet);
			in2.put("money", inMoney);
			in2.put("adminIdx", "0");
			sampleDAO.insert("insertMoneyLog", in2);
			sampleDAO.update("userMoneyUpdateKrw",in2);
		}
		
		obj.put("result", "success");
		obj.put("msg", "정상적으로 처리되었습니다.");
		return obj.toJSONString();
    }
	@RequestMapping(value="/depositList.do")
	public String depositList(HttpServletRequest request , Model model){
		String pageIndex = request.getParameter("pageIndex");
		String coin = request.getParameter("coin");
		String wstat = request.getParameter("wstat");
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		String search = request.getParameter("search");
		String searchSelect = request.getParameter("searchSelect");
		String order = request.getParameter("order");
		String orderAD = request.getParameter("orderAD");
		PaginationInfo pi = new PaginationInfo();
		
		if(Utils.isNull(pageIndex)) pi.setCurrentPageNo(1);
		else pi.setCurrentPageNo(Integer.parseInt(pageIndex));
		
		pi.setRecordCountPerPage(10);
		pi.setPageSize(5);
		
		EgovMap in = new EgovMap();
		in.put("first", pi.getFirstRecordIndex());
		in.put("record", pi.getRecordCountPerPage());
		in.put("stat", wstat);
		in.put("coin", coin);
		in.put("sdate", sdate);
		in.put("edate", edate);
		in.put("search", search);
		in.put("searchSelect", searchSelect);
		in.put("order", "money."+order);
		in.put("orderAD", orderAD);
		in.put("kind","+");
		pi.setTotalRecordCount((int)sampleDAO.select("selectAdminDWListCnt", in));
		model.addAttribute("list", sampleDAO.list("selectAdminDWList",in));
		model.addAttribute("pi", pi);
		model.addAttribute("coin", coin);
		model.addAttribute("sdate", sdate);
		model.addAttribute("edate", edate);
		
		return "admin/depositList";
	}
	@ResponseBody
	@RequestMapping(value = "/depositProcess.do" , produces="application/json; charset=utf8")
    public String depositProcess(HttpServletRequest request){
		
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		obj.put("msg", "잘못된 요청입니다.");
		
		HttpSession session = request.getSession();
		String adminIdx = ""+session.getAttribute("adminIdx");
		String widx = ""+request.getParameter("widx");
		String stat = ""+request.getParameter("stat");
		
		EgovMap in = new EgovMap();
		in.put("idx", widx);
		in.put("stat", stat);
		EgovMap moneyCheck = (EgovMap) sampleDAO.select("moneyCheck", in);
		if(!moneyCheck.get("stat").equals(0)){
			return obj.toJSONString();
		}
		sampleDAO.update("moneyStatUpdate", in);
		
		if(stat.equals("1")){
			in.put("idx", moneyCheck.get("useridx"));
			
			EgovMap ed = (EgovMap) sampleDAO.select("selectMemberDetail", in);

			int money =Integer.parseInt(ed.get("money").toString());
			int requestMoney = Integer.parseInt(moneyCheck.get("money").toString());
			EgovMap in1 = new EgovMap();
			in1.put("idx", ed.get("idx").toString());
			in1.put("afPoint", requestMoney+money);
			in1.put("kind", "+");
			sampleDAO.update("userMoneyUpdateKrw", in1);
			
			in1.put("lkind", "adminDeposit");
			in1.put("userPoint",money );
			in1.put("money", requestMoney);
			in1.put("adminIdx", adminIdx);
			sampleDAO.insert("insertMoneyLog", in1);
		}
		
		obj.put("result", "success");
		obj.put("msg", "정상적으로 처리되었습니다.");
		return obj.toJSONString();
    }
}
