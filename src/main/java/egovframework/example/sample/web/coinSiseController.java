package egovframework.example.sample.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.sample.service.impl.SampleDAO;
import egovframework.example.sample.sise.Coin;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class coinSiseController {
	@Resource(name = "sampleDAO")
	private SampleDAO sampleDAO;

//	@ResponseBody
//	@RequestMapping(value = "/siseCheck.do" , produces="application/json; charset=utf8")
//    public String siseCheck(HttpServletRequest request){
//    	ArrayList<Coin> useCoins = Coin.useCoins;
//    	String text = "사용중 코인 : "+useCoins.size()+"개\n";
//    	text += "\n";
//		for(Coin coin : useCoins){
//			text += coin.coinName+ " 시세 : "+ coin.getSise()+"\n";
//		}
//		text += "////////////////////////////////////////////\n";
//		text += "한화 시세 : "+SocketHandler.exchangeRate+"\n";
//		
//    	return text+"ok";
//    }
//	@ResponseBody
//	@RequestMapping(value = "/coinSise.do" , produces="application/json; charset=utf8")
//    public String coinSise(HttpServletRequest request){
//		
//		JSONObject newObj = new JSONObject();
//		newObj.put("protocol","coinSise");
//		
//    	ArrayList<Coin> useCoins = Coin.useCoins;
//    	
//		for(Coin coin : useCoins){
//			newObj.put(coin.coinName,coin.getSise());
//		}
//		newObj.put("USDT",SocketHandler.exchangeRate);
//		return newObj.toJSONString();
//    }
//	
}
