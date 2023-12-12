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
public class AdminUserController {
	
	@Resource(name = "sampleDAO")
	private SampleDAO sampleDAO;
	
	@RequestMapping(value="/member.do")
	public String member(HttpServletRequest request , Model model){
		String pageIndex = request.getParameter("pageIndex");
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
		in.put("search", search);
		in.put("searchSelect", searchSelect);
		pi.setTotalRecordCount((int)sampleDAO.select("selectMemberListCnt", in));
		model.addAttribute("list", sampleDAO.list("selectMemberList",in));
		model.addAttribute("pi", pi);
		model.addAttribute("searchSelect", searchSelect);
		model.addAttribute("search", search);
		return "admin/member";
	}
	
	@RequestMapping(value="/memberDetail.do")
	public String memberDetail(HttpServletRequest request, Model model){
		int idx = Integer.parseInt(""+request.getParameter("idx"));
		EgovMap info = (EgovMap)sampleDAO.select("selectMemberDetail", idx);
		model.addAttribute("info", info);
		return "admin/memberDetail";
	}
	@ResponseBody
	@RequestMapping(value="/changeIsApproval.do" , produces="application/json; charset=utf8")
	public String changeJstat(HttpServletRequest request){
		String idx = request.getParameter("idx");
		String aprroval = request.getParameter("aprroval");
		JSONObject obj = new JSONObject();
		EgovMap in = new EgovMap();
		in.put("idx", idx);
		in.put("isApproval", aprroval);
		sampleDAO.update("updateUserIsApproval" , in);
		obj.put("msg", "변경완료되었습니다.");
		return obj.toJSONString();
	}
	@ResponseBody
	@RequestMapping(value="/updatePointKRW.do" , produces = "application/json; charset=utf8")
	public String updatePointKRW(HttpServletRequest request){
		
		HttpSession session = request.getSession();
		String adminIdx = session.getAttribute("adminIdx").toString();
		String idxstring = request.getParameter("idx");
		String kind = request.getParameter("kind");
		String point = request.getParameter("point");
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		if(point == null || point.isEmpty() || point.equals("0")){
			obj.put("msg", "포인트를 입력해주세요.");
			return obj.toJSONString();
		}
		int idx = Integer.parseInt(""+request.getParameter("idx"));
		EgovMap info = (EgovMap)sampleDAO.select("selectMemberDetail", idx);
		
		double bfPoint = Double.parseDouble(info.get("money").toString());
		double afPoint = 0;
		double changeamount = Double.parseDouble(point);
		String k = "adDeposit";
		String t = "plus";
		if(kind.equals("+")){
			afPoint = bfPoint + Double.parseDouble(point);
			obj.put("msg", "유저 한화 금액을 추가했습니다.");
		}else{
			afPoint = bfPoint - Double.parseDouble(point);
			changeamount = changeamount*-1;
			k = "adWithdrawal";			
			t = "minus";
			if(Math.abs(afPoint) < 0.00000001){
				afPoint = 0;
			}
			if(afPoint < 0){
				obj.put("msg", "회수할 포인트가 부족합니다.");
				return obj.toJSONString();
			}
			obj.put("msg", "유저 한화 금액을 회수했습니다.");
		}
		EgovMap in = new EgovMap();
		in.put("idx", idxstring);
		in.put("bfPoint", bfPoint);
		in.put("afPoint", afPoint);
		in.put("kind", kind);
		sampleDAO.update("userMoneyUpdateKrw", in);
		in.put("lkind", "adminUpdateMoney"+t);
		in.put("userPoint", bfPoint);
		in.put("money", point);
		in.put("adminIdx", adminIdx);
		sampleDAO.insert("insertMoneyLog", in);
		
		EgovMap in2 = new EgovMap();
		in2.put("useridx", idxstring);
		in2.put("money", changeamount);
		in2.put("kind", "+");
		in2.put("stat", "99");
		in2.put("coin", "krw");
		sampleDAO.insert("insertMoney", in2);
		
		obj.put("result", "success");

		return obj.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value="/updateUserUpdate.do" , produces = "application/json; charset=utf8")
	public String updateUserUpdate(HttpServletRequest request){
		
		HttpSession session = request.getSession();
		
		String idx = request.getParameter("idx");
		String id = request.getParameter("id");
		String pw= request.getParameter("pw");
		String walletpw = request.getParameter("walletpw");
		String name = request.getParameter("name");
		
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		EgovMap in = new EgovMap();
		in.put("id", id);
		
		if(id == null || id.isEmpty()){
			obj.put("msg", "아이디를 입력해주세요.");
			return obj.toJSONString();
		}
		EgovMap idMem = (EgovMap)sampleDAO.select("selectMemberForId", in);
		if(idMem!=null){
			obj.put("msg", "이미 등록된 아이디입니다.");
			return obj.toJSONString();
		}
		
		if(pw == null || pw.isEmpty()){
			obj.put("msg", "비밀번호를 입력해주세요.");
			return obj.toJSONString();
		}
		if(pw.length()<4||pw.length()>15){
			obj.put("msg", "비밀번호는 4자리 이상 14자리 이하로 설정해야합니다.");
			return obj.toJSONString();
		}
		if(walletpw == null || walletpw.isEmpty()){
			obj.put("msg", "지갑비밀번호를 입력해주세요.");
			return obj.toJSONString();
		}
		if(walletpw.length()!=6){
			obj.put("msg", "지갑비밀번호는 6자리입니다. 다시 설정해주세요.");
			return obj.toJSONString();
		}
		if(name == null || name.isEmpty()){
			obj.put("msg", "이름을 입력해주세요.");
			return obj.toJSONString();
		}
		in.put("pw", pw);
		in.put("walletpw", walletpw);
		in.put("name", name);
		in.put("idx", idx);
		
		sampleDAO.update("updateUserInfo", in);
		
		obj.put("result", "success");
		obj.put("msg", "회원정보 변경 완료되었습니다.");
		return obj.toJSONString();
	}
	@ResponseBody
	@RequestMapping(value="/updateUserRemove.do" , produces = "application/json; charset=utf8")
	public String updateUserRemove(HttpServletRequest request){
		

		String idx = request.getParameter("idx");
		
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		EgovMap in = new EgovMap();
		in.put("idx", idx);
		
		sampleDAO.update("updateUserRemove", in);
		
		obj.put("result", "success");
		obj.put("msg", "회원삭제가 완료되었습니다.");
		return obj.toJSONString();
	}
	@ResponseBody
	@RequestMapping(value="/updatePoint.do" , produces = "application/json; charset=utf8")
	public String updatePoint(HttpServletRequest request){
		
		HttpSession session = request.getSession();
		String adminIdx = session.getAttribute("adminIdx").toString();
		String idxstring = request.getParameter("idx");
		String kind = request.getParameter("kind");
		String point = request.getParameter("point");
		String coin = request.getParameter("coin");
		String memo = request.getParameter("memo");
		
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		if(point == null || point.isEmpty() || point.equals("0")){
			obj.put("msg", "포인트를 입력해주세요.");
			return obj.toJSONString();
		}
		int idx = Integer.parseInt(""+request.getParameter("idx"));
		EgovMap info = (EgovMap)sampleDAO.select("selectMemberDetail", idx);
		
		double bfPoint = Double.parseDouble(info.get(coin).toString());
		double afPoint = 0;
		double changeamount = Double.parseDouble(point);
		String k = "adDeposit";
		String t = "plus";
		if(kind.equals("+")){
			afPoint = bfPoint + Double.parseDouble(point);
			obj.put("msg", "유저 "+coin+"코인을 추가했습니다.");
		}else{
			afPoint = bfPoint - Double.parseDouble(point);
			changeamount = changeamount*-1;
			k = "adWithdrawal";			
			t = "minus";
			if(Math.abs(afPoint) < 0.00000001){
				afPoint = 0;
			}
			if(afPoint < 0){
				obj.put("msg", "회수할 포인트가 부족합니다.");
				return obj.toJSONString();
			}
			obj.put("msg", "유저 "+coin+"코인을 추가했습니다.");
		}
		EgovMap in = new EgovMap();
		in.put("idx", idxstring);
		in.put("amount", point);
		in.put("coin", coin);
		in.put("kind", kind);
		sampleDAO.update("userCoinUpdate", in);
		in.put("stat", "1");
		sampleDAO.update("updateUserCoinLockup", in);
		in.put("afPoint", afPoint);
		in.put("bfPoint", bfPoint);
		in.put("kind", "adminUpdateCoin"+t);
		in.put("point", point);
		in.put("coinType", coin);
		in.put("pm", kind);
		sampleDAO.insert("insertPointLog", in);
		EgovMap in2 = new EgovMap();
		in2.put("useridx", idxstring);
		in2.put("address", "admin");
		in2.put("amount", changeamount);
		in2.put("coin", coin);
		in2.put("kind", kind);
		in2.put("stat", "99");
		in2.put("memo", memo);
		sampleDAO.insert("insertWithdrawMoney",in2);
		
		EgovMap mem = (EgovMap) sampleDAO.select("selectMemberDetail", in);
		String lockupDate = ""+mem.get("lockupDate");
		if(lockupDate.equals("null")){
			sampleDAO.update("updateUserLockupDate",in);
		}
		
		obj.put("result", "success");
		
		return obj.toJSONString();
	}
	@ResponseBody
	@RequestMapping(value="/updateUser.do" , produces = "application/json; charset=utf8")
	public String updateUser(HttpServletRequest request){
		
		HttpSession session = request.getSession();
		String adminIdx = session.getAttribute("adminIdx").toString();
		String idx = request.getParameter("idx");
		String stat = request.getParameter("stat");
		
		JSONObject obj = new JSONObject();

		EgovMap in = new EgovMap();
		in.put("idx", idx);
		in.put("stat", stat);
		if(stat.equals("1")){
			sampleDAO.update("updateUserLockupSet", in);
		}else{
			sampleDAO.update("updateUserLockupNotSet", in);
		}
		
	
		obj.put("result", "success");
		obj.put("msg", "락업 유저로 변경 되었습니다.");
		if(stat.equals("0")){
			obj.put("msg", "일반 유저로 변경 되었습니다.");
		}
		
		return obj.toJSONString();
	}
	@ResponseBody
	@RequestMapping(value="/updateCoinLockupSet.do" , produces = "application/json; charset=utf8")
	public String updateCoinLockupSet(HttpServletRequest request){
		
		HttpSession session = request.getSession();
		String adminIdx = session.getAttribute("adminIdx").toString();
		String idx = request.getParameter("idx");
		String coin = request.getParameter("coin");
		
		JSONObject obj = new JSONObject();

		EgovMap in = new EgovMap();
		in.put("idx", idx);
		in.put("coin", coin);
		in.put("stat", "0");
		sampleDAO.update("updateUserCoinLockup", in);
	
		obj.put("result", "success");
		obj.put("msg", coin+" 락업이 해제되었습니다.");

		return obj.toJSONString();
	}
	@ResponseBody
	@RequestMapping(value="/updateLockupDate.do" , produces = "application/json; charset=utf8")
	public String updateLockupDate(HttpServletRequest request){
		
		HttpSession session = request.getSession();
		String adminIdx = session.getAttribute("adminIdx").toString();
		String idx = request.getParameter("idx");
		String sdate = request.getParameter("sdate");
		
		JSONObject obj = new JSONObject();

		if(sdate.equals("")){

			obj.put("result", "success");
			obj.put("msg", "락업날짜를 제대로 설정해주세요");

			return obj.toJSONString();
		}
		EgovMap in = new EgovMap();
		in.put("idx", idx);
		in.put("sdate", sdate);
	
		sampleDAO.update("updateUserLockupDateSet", in);
	
		obj.put("result", "success");
		obj.put("msg", sdate+"로 락업날짜가 변경되었습니다.");

		return obj.toJSONString();
	}

}
