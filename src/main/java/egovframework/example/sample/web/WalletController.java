package egovframework.example.sample.web;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import egovframework.example.sample.web.SocketHandler;
import egovframework.example.sample.service.impl.SampleDAO;
import egovframework.example.sample.sise.Coin;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@RequestMapping("/user")
@Controller
public class WalletController {
	@Resource(name = "sampleDAO")
	private SampleDAO sampleDAO;
	
	@RequestMapping(value="/deposit.do")
	public String deposit(HttpServletRequest request , Model model){
		HttpSession session = request.getSession();
		String idx = ""+session.getAttribute("userIdx");
		
		EgovMap in = new EgovMap();
		in.put("idx", idx);
		in.put("kind","+");
		List<?> dwHistory = (List<?>) sampleDAO.list("selectUserDW", in);
		EgovMap info = (EgovMap) sampleDAO.select("selectMemberByIdx", in);
		if(dwHistory!=null){
			model.addAttribute("list", dwHistory);
		}
		model.addAttribute("info", info);
	
		model.addAttribute("userIdx", idx);
		return "user/deposit";
	}

	
	@RequestMapping(value="/withdrawal.do")
	public String withdrawal(HttpServletRequest request , Model model){
		HttpSession session = request.getSession();
		String idx = ""+session.getAttribute("userIdx");
		
		EgovMap in = new EgovMap();
		in.put("idx", idx);
		in.put("kind","-");
		List<?> dwHistory = (List<?>) sampleDAO.list("selectUserDW", in);
		EgovMap info = (EgovMap) sampleDAO.select("selectMemberByIdx", in);
		if(dwHistory!=null){
			model.addAttribute("list", dwHistory);
		}
		
		model.addAttribute("info", info);
	
		model.addAttribute("userIdx", idx);
		return "user/withdrawal";
	}
	
	@RequestMapping(value="/app_withdraw_check.do")
	public String app_withdraw_check(HttpServletRequest request , Model model){
		return "wallet/app_withdraw_check";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "/depositProcess.do" , method = RequestMethod.POST ,produces = "application/json; charset=utf8")
	public String depositProcess(HttpServletRequest request, ModelMap model) throws Exception {
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		
		HttpSession session = request.getSession();
		String userIdx = ""+session.getAttribute("userIdx");

		String money = ""+request.getParameter("totalDeposit");
		
		EgovMap in = new EgovMap();
		in.put("useridx", userIdx);
		in.put("midx", userIdx);
		in.put("money", money);
		in.put("kind", "+");
		in.put("stat", "0");
		if(money.equals("") || Double.parseDouble(money)<0) {
			obj.put("msg", "금액을 입력해주세요.");
			return obj.toJSONString();
		}
		
		EgovMap checkMoneyStat = (EgovMap) sampleDAO.select("checkStat", in);
		if(checkMoneyStat==null){
			sampleDAO.insert("insertMoney",in);
			obj.put("result", "suc");
			obj.put("msg", "입금신청이 완료되었습니다.");
			SocketHandler.sh.depositInsert();
		}
		else{
			obj.put("result", "already");
			obj.put("msg", "입금 대기 목록이 존재합니다.");
		}
		return obj.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value = "/withdrawalProcess.do" , method = RequestMethod.POST ,produces = "application/json; charset=utf8")
	public String withdrawalProcess(HttpServletRequest request, ModelMap model) throws Exception {
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		HttpSession session = request.getSession();
		String useridx = ""+session.getAttribute("userIdx");
		String money = ""+request.getParameter("totalWithdrawal");
		String pw = ""+request.getParameter("password");

		EgovMap in = new EgovMap();
		in.put("useridx", useridx);
		in.put("idx", useridx);
		in.put("money", money);
		in.put("kind", "-");
		in.put("stat", "0");
		EgovMap info = (EgovMap) sampleDAO.select("selectMemberByIdx", in);
		
		String walletpw = ""+info.get("walletpw");
		
		if(!walletpw.equals(pw)){
			obj.put("result", "fail");
			obj.put("msg", "출금 비밀번호가 맞지 않습니다.");
			return obj.toJSONString();
		}
		
		int wallet = Integer.parseInt(info.get("money").toString());
		int withdrawalMoney = Integer.parseInt(money);
		
		int afPoint = wallet-withdrawalMoney;
		if(afPoint<0){
			obj.put("result", "success");
			obj.put("msg", "출금신청금액이 출금가능금액보다 클 수 없습니다.");
			return obj.toJSONString();
		}
		
		
		EgovMap checkMoneyStat = (EgovMap) sampleDAO.select("checkStat", in);
		
		if(checkMoneyStat!=null){
			obj.put("result", "fail");
			obj.put("msg", "이미 출금신청한 상태입니다.");
			return obj.toJSONString();
		}
		try{
			in.put("afPoint", afPoint);
			sampleDAO.update("userMoneyUpdateKrw",in);
			sampleDAO.insert("insertMoney",in);
			
			
			in.put("lkind", "userWithdrawal");
			in.put("userPoint", wallet);
			in.put("money", money);
			in.put("adminIdx", "0");
			sampleDAO.insert("insertMoneyLog", in);
			
			obj.put("result", "success");
			obj.put("msg", "출금신청이 완료되었습니다.");
			SocketHandler.sh.withdrawalInsert();
			return obj.toJSONString();
			
		} catch (Exception e) {
			obj.put("result", "fail");
			obj.put("msg", "출금신청 중 오류가 발생했습니다.");
			return obj.toJSONString();
			
		}
		
		
	}

	
}
