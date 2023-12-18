package egovframework.example.sample.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.sample.service.impl.SampleDAO;
import egovframework.example.sample.web.util.Utils;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class GameController {
	@Resource(name = "sampleDAO")
	private SampleDAO sampleDAO;
	
	
	@ResponseBody
	@RequestMapping(value = "/gameStartProcess.do" , method = RequestMethod.POST ,produces = "application/json; charset=utf8")
	public String depositProcess(HttpServletRequest request, ModelMap model) throws Exception {
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		
		HttpSession session = request.getSession();
		String userIdx = ""+session.getAttribute("userIdx");
		String betMoney = ""+request.getParameter("betMoney");
		String mineSet = ""+request.getParameter("mineSet");
		
		try{
			EgovMap in = new EgovMap();
			in.put("useridx", userIdx);
			in.put("midx", userIdx);
			in.put("idx", userIdx);
			in.put("betMoney", betMoney);
			in.put("mineSet", mineSet);
			EgovMap info = (EgovMap) sampleDAO.select("selectMemberByIdx", in);
			
			int wallet = Integer.parseInt(info.get("money").toString());
			int bet = Integer.parseInt(betMoney); 
			int afPoint= wallet-bet;
			if(afPoint<0){
				obj.put("result", "fail");
				obj.put("msg", "현재 보유금액이 배팅금액보다 작습니다.");
				return obj.toJSONString();
			}else{
				in.put("afPoint", afPoint);
				sampleDAO.update("userMoneyUpdateKrw",in);
				in.put("lkind", "gameStart");
				in.put("kind", "-");
				in.put("userPoint", wallet);
				in.put("money", bet);
				in.put("adminIdx", "0");
				sampleDAO.insert("insertMoneyLog", in);
				int betIdx = (int)sampleDAO.insert("insertBetlog", in);
				
				obj.put("result", "suc");
				session.setAttribute("betIdx", betIdx);
				return obj.toJSONString();
			}
		}catch (Exception e) {
			obj.put("result", "fail");
			obj.put("msg", "배팅중에 오류가 났습니다.");
			return obj.toJSONString();
		}
		
		
	}
	@ResponseBody
	@RequestMapping(value = "/gameEndProcess.do" , method = RequestMethod.POST ,produces = "application/json; charset=utf8")
	public String gameEndProcess(HttpServletRequest request, ModelMap model) throws Exception {
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		
		HttpSession session = request.getSession();
		String userIdx = ""+session.getAttribute("userIdx");
		String betIdx = ""+session.getAttribute("betIdx");
		String result = ""+request.getParameter("result");
		String resultMoney = ""+request.getParameter("resultMoney");
		
		try{
			EgovMap in = new EgovMap();
			in.put("useridx", userIdx);
			in.put("midx", userIdx);
			in.put("idx", userIdx);
			in.put("betIdx", betIdx);
			in.put("result", result);
			in.put("resultMoney", resultMoney);
			if(result.equals("win")){
				EgovMap info = (EgovMap) sampleDAO.select("selectMemberByIdx", in);
				
				int wallet = Integer.parseInt(info.get("money").toString());
				int bet = Integer.parseInt(resultMoney); 
				int afPoint= wallet+bet;
				if(afPoint<0){
					obj.put("result", "fail");
					obj.put("msg", "현재 보유금액이 배팅금액보다 작습니다.");
					return obj.toJSONString();
				}else{
					in.put("afPoint", afPoint);
					sampleDAO.update("userMoneyUpdateKrw",in);
					in.put("lkind", "gameWin");
					in.put("kind", "+");
					in.put("userPoint", wallet);
					in.put("money", bet);
					in.put("adminIdx", "0");
					sampleDAO.insert("insertMoneyLog", in);
					sampleDAO.update("updateBetlog", in);
					
					obj.put("result", "suc");
					session.setAttribute("betIdx", null);
					return obj.toJSONString();
				}
			}else{
				in.put("resultMoney", "0");
				sampleDAO.update("updateBetlog", in);
				obj.put("result", "suc");
				session.setAttribute("betIdx", null);
				return obj.toJSONString();
			}
		}catch (Exception e) {
			obj.put("result", "fail");
			obj.put("msg", "배팅중에 오류가 났습니다.");
			return obj.toJSONString();
		}
		
		
	}
	@ResponseBody
	@RequestMapping(value = "/gameBoxCheck.do" , method = RequestMethod.POST ,produces = "application/json; charset=utf8")
	public String gameBoxCheck(HttpServletRequest request, ModelMap model) throws Exception {
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		
		HttpSession session = request.getSession();
		String userIdx = ""+session.getAttribute("userIdx");
		String betIdx = ""+session.getAttribute("betIdx");
	
		
		try{
			EgovMap in = new EgovMap();
			in.put("useridx", userIdx);
			in.put("midx", userIdx);
			in.put("idx", userIdx);
			in.put("betIdx", betIdx);

			EgovMap info = (EgovMap) sampleDAO.select("selectBetlogBoxCheck", in);
				
			String result = ""+info.get("result");
			if(result.equals("adminBoom")){
				obj.put("result", "fail");
				return obj.toJSONString();
			}else{
				obj.put("result", "suc");
				return obj.toJSONString();
			}
		}catch (Exception e) {
			obj.put("result", "err");
			return obj.toJSONString();
		}
		
		
	}
	@RequestMapping(value="/betList.do")
	public String betList(HttpServletRequest request , Model model){
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
		pi.setTotalRecordCount((int)sampleDAO.select("selectUserBetlogListCnt", in));
		model.addAttribute("userIdx", idx);
		model.addAttribute("list", sampleDAO.list("selectUserBetlogList",in));
		model.addAttribute("page", pi.getCurrentPageNo());
		model.addAttribute("totalpage", Math.ceil(pi.getTotalRecordCount()/pi.getRecordCountPerPage())+1);
		
		return "user/betList";
	}
}
