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

import egovframework.example.sample.service.impl.SampleDAO;
import egovframework.example.sample.sise.Coin;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@RequestMapping("/user")
@Controller
public class AppWalletController {
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

	
	@RequestMapping(value="/app_withdraw.do")
	public String app_withdraw(HttpServletRequest request , Model model){
		HttpSession session = request.getSession();
		String userIdx = ""+session.getAttribute("userIdx");
		String address = ""+session.getAttribute("address");
		String amount = ""+session.getAttribute("amount");
		String coin = ""+ session.getAttribute("coin");
		
		String myAddress = ""+session.getAttribute("myAddress");
		if(address=="null"||amount=="null"){
			return "wallet/app_main";
		}
		model.addAttribute("myAddress", myAddress);
		model.addAttribute("address", address);
		model.addAttribute("amount", amount);
		model.addAttribute("coin", coin);
			
		return "wallet/app_withdraw";
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
		}
		else{
			obj.put("result", "already");
			obj.put("msg", "입금 대기 목록이 존재합니다.");
		}
		return obj.toJSONString();
	}
	@ResponseBody
	@RequestMapping(value = "/withdrawNextProcess.do" , method = RequestMethod.POST ,produces = "application/json; charset=utf8")
	public String withdrawNextProcess(HttpServletRequest request, ModelMap model) throws Exception {
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		HttpSession session = request.getSession();
		String useridx = ""+session.getAttribute("userIdx");
		String address = ""+request.getParameter("address");
		String amount = ""+request.getParameter("amount");
		String coin = ""+request.getParameter("coin");
		
		EgovMap in = new EgovMap();
		in.put("idx", useridx);
		EgovMap ed = (EgovMap) sampleDAO.select("selectMemberDetail", in);
		
		if(ed.get(coin.toLowerCase()+"Lockup").equals(1)){
			obj.put("result", "lockup");
			
			return obj.toJSONString();
		}
		if(address.equals("")||amount.equals("")){
			obj.put("msg", "주소와 출금 코인 개수를 제대로 입력하세요.");
			return obj.toJSONString();
		}
		session.setAttribute("address", address);
		session.setAttribute("amount", amount);
		session.setAttribute("coin", coin);
		
		obj.put("result", "success");
	
		return obj.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value = "/withdrawProcess.do" , method = RequestMethod.POST ,produces = "application/json; charset=utf8")
	public String withdrawProcess(HttpServletRequest request, ModelMap model) throws Exception {
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		HttpSession session = request.getSession();
		String useridx = ""+session.getAttribute("userIdx");
		String address = ""+request.getParameter("address");
		String amount = ""+request.getParameter("amount");
		String coin = ""+request.getParameter("coin");
		if(address.equals("")||amount.equals("")){
			obj.put("msg", "주소와 출금 코인 개수를 제대로 입력하세요.");
			return obj.toJSONString();
		}

		EgovMap in = new EgovMap();
		in.put("useridx", useridx);
		in.put("address", address);
		in.put("amount", amount);
		in.put("coin", coin);
		in.put("kind", "-");
		
		EgovMap checkMoneyStat = (EgovMap) sampleDAO.select("checkStat", in);
		if(checkMoneyStat==null){
			sampleDAO.insert("insertWithdrawMoney",in);
			sampleDAO.update("userCoinWithdrawUpdate",in);
			
			obj.put("result", "success");
			obj.put("msg", "출금신청이 완료되었습니다.");
			return obj.toJSONString();
		}
		
		
		obj.put("result", "fail");
		obj.put("msg", "이미 출금신청한 상태입니다.");
		return obj.toJSONString();
	}
	@ResponseBody
	@RequestMapping(value = "/coinWallet.do" , produces="application/json; charset=utf8")
    public String coinSise(HttpServletRequest request){
		
		JSONObject newObj = new JSONObject();
		newObj.put("protocol","coinWallet");
		HttpSession session = request.getSession();
		String idx = ""+session.getAttribute("userIdx");
		EgovMap in = new EgovMap();
		in.put("idx", idx);
		EgovMap ed = (EgovMap) sampleDAO.select("selectCoinWallet", in);
		
		newObj.put("BTC", ed.get("btc").toString());
		newObj.put("ETH", ed.get("eth").toString());
		newObj.put("XRP", ed.get("xrp").toString());
		
		return newObj.toJSONString();
    }
	@ResponseBody
	@RequestMapping(value = "/exchangeProcess.do" , method = RequestMethod.POST ,produces = "application/json; charset=utf8")
	public String exchangeProcess(HttpServletRequest request, ModelMap model) throws Exception {
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");

		HttpSession session = request.getSession();
		String idx = ""+session.getAttribute("userIdx");
		int userMoney = Integer.parseInt(""+request.getParameter("money"));
		EgovMap in = new EgovMap();
		in.put("idx", idx);
		int money = 0;
		
		EgovMap ed = (EgovMap) sampleDAO.select("selectMemberDetail", in);
		if(ed!=null){
			money =Integer.parseInt(ed.get("money").toString());
		}else{
			obj.put("result", "fail");
			obj.put("msg", "!코인전환 오류!");
			return obj.toJSONString();
		}
		
		if(userMoney>money){
			obj.put("result", "fail");
			obj.put("msg", "보유 잔액보다 많게 코인전환 신청 할 수 없습니다.");
			return obj.toJSONString();
		}
		
		ArrayList<Coin> useCoins = Coin.useCoins;
		String serverCoin = "";
		double serverCoinSise = 0.0;
		double serverUsdtSise = Double.parseDouble(""+SocketHandler.sh.exchangeRate);
		String selectCoin = ""+request.getParameter("coin");
		double coinSise = Double.parseDouble(""+request.getParameter("coinSise"));
		double usdtSise = Double.parseDouble(""+request.getParameter("usdtSise"));
		double amount = Double.parseDouble(""+request.getParameter("amount"));
		
		
		for(Coin coin : useCoins){
			if(coin.coinName.equals(selectCoin)){
				serverCoinSise = coin.getSise();
			}
		}
		if(serverCoinSise<=0 || serverUsdtSise<=0){
			obj.put("result", "fail");
			obj.put("msg", "잘못된 요청입니다.");
			return obj.toJSONString();
		}
		double usdt = ((userMoney / serverUsdtSise)*100)/100;
		double calc =  usdt/serverCoinSise;
		double calcNum = Math.floor(calc * 100000) / 100000;
		
		double epsilon = 0.1;
		if(Math.abs(amount - calcNum) <= epsilon){
			obj.put("result", "success");
			obj.put("msg", "코인전환 완료되었습니다.");
		}else{
			obj.put("result", "fail");
			obj.put("msg", "전환신청에 오류가 있습니다.");
			return obj.toJSONString();
		}
		//한화차감, 한화로그
		EgovMap in1 = new EgovMap();
		in1.put("idx", idx);
		in1.put("afPoint", money-userMoney);
		in1.put("kind", "-");
		sampleDAO.update("userMoneyUpdateKrw", in1);
		in1.put("lkind", "userCoinExchange");
		in1.put("userPoint", userMoney);
		in1.put("money", money);
		in1.put("adminIdx", "9999");
		sampleDAO.insert("insertMoneyLog", in1);
		String stringCoin = selectCoin.toLowerCase().toString();
		//코인 증가, 포인트 로그
		double bfPoint =  Double.parseDouble(ed.get(stringCoin).toString());
		EgovMap in2 = new EgovMap();
		in2.put("idx", idx);
		in2.put("amount", amount);
		in2.put("coin", selectCoin);
		in2.put("kind", "+");
		sampleDAO.update("userCoinUpdate", in2);
		in2.put("stat", "1");
		sampleDAO.update("updateUserCoinLockup", in2);
		in2.put("afPoint", bfPoint+amount);
		in2.put("bfPoint", bfPoint);
		in2.put("kind", "userExchange");
		in2.put("point", amount);
		in2.put("coinType", selectCoin);
		in2.put("pm", "+");
		sampleDAO.insert("insertPointLog", in2);
		
		EgovMap mem = (EgovMap) sampleDAO.select("selectMemberDetail", in2);
		String lockupDate = ""+mem.get("lockupDate");
		if(lockupDate.equals("null")){
			sampleDAO.update("updateUserLockupDate",in2);
		}
		
		return obj.toJSONString();
	}
	
}
