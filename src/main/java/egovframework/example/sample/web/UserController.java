package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.impl.SampleDAO;
import egovframework.example.sample.web.util.Utils;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@RequestMapping("/user")
@Controller
public class UserController {
	@Resource(name = "sampleDAO")
	private SampleDAO sampleDAO;
	@RequestMapping(value="/main.do")
	public String main(HttpServletRequest request , Model model){
		HttpSession session = request.getSession();
		String pageIndex = ""+request.getParameter("pageIndex");
		String userIdx = ""+session.getAttribute("userIdx");
		PaginationInfo pi = new PaginationInfo();
		if(Utils.isNull(pageIndex)) pi.setCurrentPageNo(1);
		else pi.setCurrentPageNo(Integer.parseInt(pageIndex));
		
		pi.setRecordCountPerPage(6);
		pi.setPageSize(4);
		
		//언어
		int lang = 0;
		if(session.getAttribute("lang") == null) lang = 0;
		else if(session.getAttribute("lang").equals("EN")) lang = 1;

		if(lang ==0){
			session.setAttribute("lang","KO" );
		}
		else{
			session.setAttribute("lang","EN");
		}

		
		EgovMap in = new EgovMap();
		in.put("first", pi.getFirstRecordIndex());
		in.put("record", pi.getRecordCountPerPage());
		model.addAttribute("list", sampleDAO.list("selectFaqList",in));
		model.addAttribute("userIdx", userIdx);
		return "user/main";
	}
	@RequestMapping(value="/game.do")
	public String game(HttpServletRequest request , Model model){
		HttpSession session = request.getSession();
		String userIdx = ""+session.getAttribute("userIdx");
		model.addAttribute("userIdx", userIdx);
		return "user/game";
	}
	@RequestMapping(value="/app_mypage.do")
	public String app_mypage(HttpServletRequest request , Model model){
		HttpSession session = request.getSession();
		String myAddress = ""+session.getAttribute("myAddress");
		
		String idx = ""+session.getAttribute("userIdx");
		EgovMap info = (EgovMap)sampleDAO.select("selectMemberDetail", idx);
		model.addAttribute("info", info);
		model.addAttribute("myAddress", myAddress);
		return "user/app_mypage";
	}
	
	@RequestMapping(value="/app_mypage_detail.do")
	public String app_mypage_detail(HttpServletRequest request , Model model){
		return "user/app_mypage_detail";
	}
	
	@RequestMapping(value="/app_mypage_list.do")
	public String app_mypage_list(HttpServletRequest request , Model model){
		HttpSession session = request.getSession();
		String idx = ""+session.getAttribute("userIdx");
		EgovMap info = (EgovMap)sampleDAO.select("selectMemberDetail", idx);
		String coin = ""+request.getParameter("coin");
		String kind = ""+request.getParameter("kind");
		String coinSearch = ""+info.get(coin.toLowerCase()+"Lockup");
		if(coinSearch.equals("1")){
			
			return "user/app_lockup";
		}
		if(kind.equals("null")){
			kind = "";
		}else if(kind.equals("deposit")){
			kind = "+";
		}else if(kind.equals("withdraw")){
			kind = "-";
		}
		EgovMap in = new EgovMap();
		in.put("idx", idx);
		in.put("coin", coin);
		in.put("kind", kind);
		EgovMap ed = (EgovMap) sampleDAO.select("selectUserMoney", in);
		if(ed!=null){
			model.addAttribute("money", ed.get("money"));
		}
		List<?> dwHistory = (List<?>) sampleDAO.list("selectUserDW", in);
		model.addAttribute("kind",kind);
		model.addAttribute("coin", coin);
		model.addAttribute("list", dwHistory);
		return "user/app_mypage_list";
	}

	@RequestMapping(value="/app_seed.do")
	public String app_seed(HttpServletRequest request , Model model){
		return "user/app_seed";
	}
	
	@RequestMapping(value="/app_lockup.do")
	public String app_lockup(HttpServletRequest request , Model model){
		HttpSession session = request.getSession();
		String myAddress = ""+session.getAttribute("myAddress");
		String idx = ""+session.getAttribute("userIdx");
		EgovMap info = (EgovMap)sampleDAO.select("selectMemberDetail", idx);
		
		String lockupDate = ""+info.get("lockupDate");
		if(!lockupDate.equals("null")){
			model.addAttribute("lockupDate", lockupDate);
		}
		model.addAttribute("info",info);
		model.addAttribute("myAddress", myAddress);
		return "user/app_lockup";
	}

	
//	@RequestMapping(value="/app_trade.do")
//	public String app_trade(HttpServletRequest request , Model model){
//		HttpSession session = request.getSession();
//		String myAddress = ""+session.getAttribute("myAddress");
//		String idx = ""+session.getAttribute("userIdx");
//		EgovMap info = (EgovMap)sampleDAO.select("selectMemberDetail", idx);
//		
//		String lockupDate = ""+info.get("lockupDate");
//		if(!lockupDate.equals("null")){
//			model.addAttribute("lockupDate", lockupDate);
//		}
//		model.addAttribute("info",info);
//		model.addAttribute("myAddress", myAddress);
//		return "user/app_lockup";
//	}
	
}
