package egovframework.example.sample.web;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Locale;

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
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import egovframework.example.sample.service.impl.Log;
import egovframework.example.sample.service.impl.SampleDAO;
import egovframework.example.sample.web.util.Send;
import egovframework.example.sample.web.util.Utils;
import egovframework.example.sample.web.util.Validation;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class MainController {
	@Resource(name = "sampleDAO")
	private SampleDAO sampleDAO;
	
	
	@RequestMapping(value="/top.do")
	public String top(HttpServletRequest request , Model model){
		HttpSession session = request.getSession();
		String userIdx = ""+session.getAttribute("userIdx");
		
		model.addAttribute("userIdx", userIdx);
		
		return "top";
	}
	@RequestMapping(value="/flask.do")
	public String flask(HttpServletRequest request , Model model){
		HttpSession session = request.getSession();
		String userIdx = ""+session.getAttribute("userIdx");
		model.addAttribute("userIdx", userIdx);
		return "flask";
	}
	@RequestMapping(value="/login.do")
	public String login(HttpServletRequest request , Model model){
		HttpSession session = request.getSession();
		String userIdx = ""+session.getAttribute("userIdx");
		model.addAttribute("userIdx", userIdx);
		return "login";
	}
	@ResponseBody
	@RequestMapping(value="/loginProcess.do" , produces="application/json; charset=utf8")
	public String loginProcess(HttpServletRequest request) throws UnsupportedEncodingException{
		HttpSession session = request.getSession();
		String id = request.getParameter("id"); // 전화번호
		String pw = request.getParameter("pw"); // 비밀번호
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		
		if(id == null || id.equals("")){
		obj.put("msg", "id 입력하세요.");
		return obj.toJSONString();
		}
		if(id.length()>20){
			obj.put("msg", "아이디는 20자리 미만으로 입력하세요.");
			return obj.toJSONString();
		}
		if(pw == null || pw.equals("")){
			obj.put("msg","비밀번호를 입력하세요.");
			return obj.toJSONString();
		}
	
		if(pw.length()>30){
			obj.put("msg", "비밀번호가 너무 깁니다.");
			return obj.toJSONString();
		}
		
		EgovMap in = new EgovMap();
		in.put("id", id);
		in.put("pw", pw);
		EgovMap info = (EgovMap)sampleDAO.select("checkUserLogin" , in);
		if(info != null ){ 
			int jstat = Integer.parseInt(info.get("isApproval").toString());
			if(jstat != 1){
				switch(jstat){
				case 2:
					obj.put("msg", "회원 정보가 없습니다."); break;
				default:
					obj.put("msg","가입신청 승인대기중입니다.");						
				}
				return obj.toJSONString();
			}
			obj.put("result", "success");
			obj.put("msg", "로그인 성공하였습니다.");
			int userIdx = Integer.parseInt(info.get("idx").toString());
			session.setAttribute("userIdx", info.get("idx"));
			return obj.toJSONString();
		}
		else{			
			obj.put("msg", "회원 정보가 없습니다.");
			return obj.toJSONString();
		}
	}
	@ResponseBody
	@RequestMapping(value = "/logoutProcess.do", produces = "application/json; charset=utf8")
	public String logoutProcess(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("userIdx", null);
		
		JSONObject obj = new JSONObject();
		obj.put("msg", "로그아웃이 완료되었습니다.");
		obj.put("level", "1");
		obj.put("result", "success");
		return obj.toJSONString();
	}
	@RequestMapping(value = "/logout.do", produces = "application/json; charset=utf8")
	public String logout(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.setAttribute("userIdx", null);
		return "login";
	}
	@RequestMapping(value="/join.do")
	public String join(HttpServletRequest request , Model model){
		HttpSession session = request.getSession();
		String userIdx = ""+session.getAttribute("userIdx");
		model.addAttribute("userIdx", userIdx);
		return "join";
	}
	@ResponseBody
	@RequestMapping(value="/joinProcess.do" , produces="application/json; charset=utf8")
	public String joinProcess(HttpServletRequest request) throws UnsupportedEncodingException{
		
		HttpSession session = request.getSession();
		String id = request.getParameter("id"); // id
		String phone = request.getParameter("phone"); // 전화번호
		String phoneCode = request.getParameter("phoneCode"); // 전화번호
		String nickname = request.getParameter("nickName"); // 닉네임
		String mname = request.getParameter("mname"); // 예금주
		String pw = request.getParameter("pw"); // pw
		String pw2 = request.getParameter("pwConfirm"); // pw2
		String bank = request.getParameter("bank"); // 은행
		String account = request.getParameter("account"); // 계좌번호
		String changePw = request.getParameter("changePw"); // 환전비밀번호
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");

		if(phone == null || phone.equals("") || phone.length() > 20){
			obj.put("msg", "휴대폰번호를 입력하세요.");
			return obj.toJSONString();
		}
		if(nickname == null || nickname.equals("")){
			obj.put("msg", "닉네임을 입력하세요.");
			return obj.toJSONString();
		}
		if(pw == null || pw.equals("") || pw.length() > 30){
			obj.put("msg", "비밀번호를 입력하세요");
			return obj.toJSONString();
		}
		if(pw2 == null || pw2.equals("") || pw2.length() > 30){
			obj.put("msg", "두번째 비밀번호를 입력하세요");
			return obj.toJSONString();
		}
		if(changePw == null || changePw.equals("") || changePw.length() > 30){
			obj.put("msg", "환전 비밀번호를 입력하세요");
			return obj.toJSONString();
		}
		if(!pw2.equals(pw)){
			obj.put("msg", "비밀번호와 비밀번호확인이 맞지 않습니다. 다시 입력해주세요.");
			return obj.toJSONString();
		}
		if(account == null || account.equals("") || account.length() < 1){
			obj.put("msg", "계좌번호를 입력하세요.");
			return obj.toJSONString();
		}
		if(mname == null || mname.equals("") || mname.length() < 1){
			obj.put("msg", "예금주를 입력하세요.");
			return obj.toJSONString();
		}
		String checkPhone = session.getAttribute("phone").toString();
		String checkCode = session.getAttribute("phoneCode").toString();
		if(!phone.equals(checkPhone)){
			obj.put("msg", "인증한 핸드폰 번호가 아닙니다.");
			return obj.toJSONString();
		}
		if(!phoneCode.equals(checkCode)){
			obj.put("msg", "인증번호가 맞지 않습니다.");
			return obj.toJSONString();
		}
		try {
			EgovMap in = new EgovMap();
			in.put("nick", nickname);
			
			EgovMap info = (EgovMap)sampleDAO.select("selectMemberByNickName" , in);
			if(info != null){
				obj.put("msg", "이미 있는 닉네임입니다.");
				return obj.toJSONString();
			}
		}catch (Exception e) {
			obj.put("result", "fail");
			obj.put("msg", "닉네임 중복조회에 실패하였습니다.");
			return obj.toJSONString();
		}
		try {
			EgovMap in = new EgovMap();
			in.put("phone", phone);
			EgovMap info = (EgovMap)sampleDAO.select("selectMemberByPhone" , in);
			if(info != null){
				obj.put("msg", "이미 있는 휴대번호입니다.");
				return obj.toJSONString();
			}else{
				in.put("id", id);
				in.put("name", nickname);
				in.put("mname", mname);
				in.put("pw", pw);
				in.put("changePw", changePw);
				in.put("money", "0");
				in.put("bank", bank);
				in.put("account", account);
				
				int userIdx = (int)sampleDAO.insert("insertMember", in);
				
				obj.put("result", "success");
				obj.put("msg", "가입신청이 성공적으로 완료되었습니다");
				obj.put("login",false);
				obj.put("protocol", "newMember");
				SocketHandler.sh.newMember();
				return obj.toJSONString();
			}
		} catch (Exception e) {
			obj.put("result", "fail");
			obj.put("msg", "회원가입 실패하였습니다.");
			return obj.toJSONString();
		}
	}
	@ResponseBody
	@RequestMapping(value="/checkNickName.do" , produces="application/json; charset=utf8")
	public String nickNameCheck(HttpServletRequest request) throws UnsupportedEncodingException{
		String nickname = request.getParameter("name"); // 닉네임
		
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		try {
			EgovMap in = new EgovMap();
			in.put("nick", nickname);
			
			EgovMap info = (EgovMap)sampleDAO.select("selectMemberByNickName" , in);
			if(info != null){
				obj.put("msg", "이미 있는 닉네임입니다.");
				return obj.toJSONString();
			}
		}catch (Exception e) {
			obj.put("result", "fail");
			obj.put("msg", "닉네임 중복조회에 실패하였습니다.");
			return obj.toJSONString();
		}
		obj.put("result", "success");
		obj.put("msg", "해당닉네임은 사용가능합니다.");
		return obj.toJSONString();
	}
	@ResponseBody
	@RequestMapping(value="/checkId.do" , produces="application/json; charset=utf8")
	public String checkId(HttpServletRequest request) throws UnsupportedEncodingException{
		String id = request.getParameter("id"); // 닉네임
		
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		if(id == null || id.equals("") ){
			obj.put("msg", "id를 입력하세요.");
			return obj.toJSONString();
		}
		if(id.length()<4 || id.length()>16 ){
			obj.put("msg", "id는 4자리~16자리입니다.");
			return obj.toJSONString();
		}
		try {
			EgovMap in = new EgovMap();
			in.put("id", id);
			
			EgovMap info = (EgovMap)sampleDAO.select("selectMemberById" , in);
			if(info != null){
				obj.put("msg", "이미 있는 아이디입니다.");
				return obj.toJSONString();
			}
		}catch (Exception e) {
			obj.put("result", "fail");
			obj.put("msg", "아이디 중복조회에 실패하였습니다.");
			return obj.toJSONString();
		}
		obj.put("result", "success");
		obj.put("msg", "아이디는 사용가능합니다.");
		return obj.toJSONString();
	}
	@ResponseBody
	@RequestMapping(value="/checkPhone.do" , produces="application/json; charset=utf8")
	public String phoneCheck(HttpServletRequest request) throws UnsupportedEncodingException{
		String phone = request.getParameter("phone"); // 닉네임
		HttpSession session = request.getSession();
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		obj.put("msg", "휴대폰번호를 확인하세요.");
		String tempphone = phone.substring(1, phone.length());		
		
		if(phone.length()>30 || tempphone.length()>30){			
			return obj.toJSONString();
		}
		if(!Validation.isValidPhone(phone)){
			obj.put("msg", "휴대폰번호형식이 안맞습니다.");
			return obj.toJSONString();
		}
		
		try {
			EgovMap in = new EgovMap();
			in.put("phone", phone);
			
			EgovMap info = (EgovMap)sampleDAO.select("selectMemberByPhone" , in);
			if(info != null){
				obj.put("msg", "이미 가입된 휴대폰번호입니다.");
				return obj.toJSONString();
			}
		}catch (Exception e) {
			obj.put("result", "fail");
			obj.put("msg", "휴대폰 중복조회에 실패하였습니다.");
			return obj.toJSONString();
		}
		
		obj.put("result", "success");
		String code = Validation.getTempNumber(6);
		if(!Send.sendMexText(phone,code)){
			obj.put("msg", "문자 인증번호를 보내는 중에 오류가 났습니다.");
		}
		session.setAttribute("phone", phone);//회원폰	
		session.setAttribute("phoneCode", code);
		obj.put("msg", "문자 인증번호를 보냈습니다.");
		return obj.toJSONString();
	}
	@RequestMapping(value="/swarps.do")
	public String swarps(HttpServletRequest request , Model model){
		HttpSession session = request.getSession();
		String userIdx = ""+session.getAttribute("userIdx");
		model.addAttribute("userIdx", userIdx);
		return "swarps";
	}
	@RequestMapping(value="/buyCrypto.do")
	public String buyCrypto(HttpServletRequest request , Model model){
		HttpSession session = request.getSession();
		String userIdx = ""+session.getAttribute("userIdx");
		model.addAttribute("userIdx", userIdx);
		return "buyCrypto";
	}
	@ResponseBody
	@RequestMapping(value="/getWallet.do", produces = "application/json; charset=utf8")
	public String getCoinInfo(HttpServletRequest request) {
		JSONObject obj = new JSONObject();
		HttpSession session = request.getSession();
		String userIdx = ""+session.getAttribute("userIdx");
		if(!userIdx.equals("null")){
			EgovMap info = (EgovMap)sampleDAO.select("selectMemberDetail", userIdx);
			obj.put("money", info.get("money"));
		}
		return obj.toJSONString();
	}
	
	//언어
	@ResponseBody
	@RequestMapping(value="/changeLanguage.do")
	public String changeLanguage(HttpServletRequest request){
		HttpSession session = request.getSession();
		String lang = request.getParameter("lang");
		if(lang.length()>30){
			return "fail";
		}
		Locale locales = new Locale(lang);
		session.setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, locales);
		session.setAttribute("lang", lang.toUpperCase());
		return "ok";
	}
}
