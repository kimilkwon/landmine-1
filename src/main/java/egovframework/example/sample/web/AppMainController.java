package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.impl.SampleDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@RequestMapping("/user")
@Controller
public class AppMainController {
	@Resource(name = "sampleDAO")
	private SampleDAO sampleDAO;
	
	@RequestMapping(value="/app_home.do")
	public String app_start(HttpServletRequest request , Model model){
		return "/app_home";
	}
	
}
