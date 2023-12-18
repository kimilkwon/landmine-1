package egovframework.example.sample.web.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.sample.service.impl.SampleDAO;
import egovframework.example.sample.web.util.Utils;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping("/admin")
public class AdminLoginController {
	
	@Resource(name = "sampleDAO")
	private SampleDAO sampleDAO;

	@RequestMapping(value="/adsqwepmcvsdb.do")
	public String login(){
		return "admin/login";
	}
	
	@ResponseBody
	@RequestMapping(value="/loginProcess.do" , produces = "application/json; charset=utf8")
	public String loginProcess(HttpServletRequest request){
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		if(Utils.isNull(id)){
			obj.put("msg", "아이디 입력하세요");
			return obj.toJSONString();
		}
		if(Utils.isNull(pw)){
			obj.put("msg", "비밀번호 입력하세요");
			return obj.toJSONString();
		}
		EgovMap in = new EgovMap();
		in.put("id", id);
		in.put("pw", pw);
		EgovMap info = (EgovMap)sampleDAO.select("checkAdminLogin",in);
		if(info == null){ 
			obj.put("msg", "로그인 정보 없음");
			return obj.toJSONString();
		}else{ 
			HttpSession session = request.getSession();
			session.setAttribute("adminIdx", info.get("idx"));
			obj.put("result", "suc");
			return obj.toJSONString();
		}
	}
	
	@RequestMapping(value="/logout.do")
	public String logout(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.setAttribute("adminIdx", null);
		return "redirect:login.do";
	}
	
}
