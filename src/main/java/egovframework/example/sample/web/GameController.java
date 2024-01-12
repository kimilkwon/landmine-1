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
import egovframework.example.sample.web.util.MinefieldGenerator;
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
		String mineLocation = MinefieldGenerator.generateMinefield(Integer.parseInt(mineSet));
		
		try{
			int bet = Integer.parseInt(betMoney);
			if(bet<10000){
				obj.put("result", "fail");
				obj.put("msg", bet+"은 최소금액보다 작습니다");
				return obj.toJSONString();
			}
			EgovMap in = new EgovMap();
			in.put("useridx", userIdx);
			in.put("midx", userIdx);
			in.put("idx", userIdx);
			in.put("betMoney", betMoney);
			in.put("mineSet", mineSet);
			in.put("mineLocation", mineLocation);
			EgovMap info = (EgovMap) sampleDAO.select("selectMemberByIdx", in);
			
			int wallet = Integer.parseInt(info.get("money").toString());
			 
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
				session.setAttribute("nextStake", Integer.parseInt(betMoney)*0.12);
				session.setAttribute("totalStake", Integer.parseInt(betMoney));
				session.setAttribute("betIdx", betIdx);
				session.setAttribute("mineLocation", mineLocation);
				session.setAttribute("searchBoxHistory", "");
				
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
		
		double totalStake = Double.parseDouble(""+session.getAttribute("totalStake"));
		String userIdx = ""+session.getAttribute("userIdx");
		String betIdx = ""+session.getAttribute("betIdx");
		String mineLocation = ""+session.getAttribute("mineLocation");
		
		try{
			EgovMap in = new EgovMap();
			in.put("useridx", userIdx);
			in.put("midx", userIdx);
			in.put("idx", userIdx);
			in.put("betIdx", betIdx);
			EgovMap info = (EgovMap) sampleDAO.select("selectBetlogBoxCheck", in);
			
			EgovMap memInfo = (EgovMap) sampleDAO.select("selectMemberByIdx", in);
			
			int wallet = Integer.parseInt(memInfo.get("money").toString());
			int betMoney = Integer.parseInt(info.get("betMoney").toString());
			int bet = (int) Math.floor(totalStake); 
			int afPoint= wallet+bet;

			in.put("afPoint", afPoint);
			sampleDAO.update("userMoneyUpdateKrw",in);
			in.put("lkind", "gameWin");
			in.put("kind", "+");
			in.put("userPoint", wallet);
			in.put("money", bet);
			in.put("adminIdx", "0");
			sampleDAO.insert("insertMoneyLog", in);
			
			
			in.put("result","win");
			in.put("resultMoney", bet);
			in.put("mineLocation", mineLocation);
			sampleDAO.update("updateBetlog", in);
			obj.put("result", "suc");
			session.setAttribute("betIdx", null);
			session.setAttribute("mineLocation", null);
			session.setAttribute("nextStake", 0);
			session.setAttribute("searchBoxHistory", 0);
			
			return obj.toJSONString();
			
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
		double nextStake =0;
		double totalStake =0;
		String userIdx ="";
		String betIdx="";
		String gameBoxNum ="";
		String mineLocation ="";
		String searchBoxHistory ="";
		boolean check = false;
		
		try{
			nextStake = Double.parseDouble(""+session.getAttribute("nextStake"));
			totalStake = Double.parseDouble(""+session.getAttribute("totalStake"));
			userIdx = ""+session.getAttribute("userIdx");
			betIdx = ""+session.getAttribute("betIdx");
			gameBoxNum = ""+request.getParameter("gameBoxNum");
			mineLocation = ""+session.getAttribute("mineLocation");
			searchBoxHistory = ""+session.getAttribute("searchBoxHistory");
			check = MinefieldGenerator.checkMine(mineLocation,Integer.parseInt(gameBoxNum));
		}catch (Exception e) {
			obj.put("result", "errBetIdxNull");
			return obj.toJSONString();
		}


		try{
			if(MinefieldGenerator.checkSerch(searchBoxHistory,Integer.parseInt(gameBoxNum))){
				obj.put("result", "alreadySelect");
				return obj.toJSONString();
			}
			
			searchBoxHistory = MinefieldGenerator.generateSerchfield(searchBoxHistory,Integer.parseInt(gameBoxNum));
			
			EgovMap in = new EgovMap();
			in.put("useridx", userIdx);
			in.put("midx", userIdx);
			in.put("idx", userIdx);
			in.put("betIdx", betIdx);

			EgovMap info = (EgovMap) sampleDAO.select("selectBetlogBoxCheck", in);
				
			String result = ""+info.get("result");
			if(check==false){ // 찾지 못한것
				if(result.equals("adminBoom")){//어드민 리모콘 작동
					String mineLocationChanged = MinefieldGenerator.replaceMine(mineLocation,Integer.parseInt(gameBoxNum));
					in.put("mineLocation", mineLocationChanged);
					obj.put("result", "fail");
					obj.put("mineLocation", mineLocationChanged);
				}else{
					obj.put("result", "suc");
					obj.put("mineLocation", null);
					session.setAttribute("nextStake", nextStake*1.2);
					session.setAttribute("totalStake", totalStake+nextStake);
					session.setAttribute("searchBoxHistory", searchBoxHistory);
					return obj.toJSONString();
				}
			}else{
				//지뢰찾은것
				in.put("mineLocation", mineLocation);
				obj.put("result", "fail");
				obj.put("mineLocation", mineLocation);
			}
			
			in.put("result","lose");
			in.put("resultMoney", "0");
			sampleDAO.update("updateBetlog", in);
			session.setAttribute("betIdx", null);
			session.setAttribute("mineLocation", null);
			session.setAttribute("checkCount", 0);
			session.setAttribute("searchBoxHistory", 0);
			return obj.toJSONString();
			
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
