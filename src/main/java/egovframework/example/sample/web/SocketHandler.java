package egovframework.example.sample.web;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import egovframework.example.sample.service.impl.Log;
import egovframework.example.sample.service.impl.SampleDAO;
import egovframework.example.sample.sise.Coin;
import egovframework.example.sample.sise.SiseManager;
import egovframework.rte.psl.dataaccess.util.EgovMap;


public class SocketHandler extends TextWebSocketHandler implements InitializingBean {
    @Resource(name = "sampleDAO")
    private SampleDAO sampleDAO;

    private final Logger logger = LogManager.getLogger(getClass());

    private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();
    public static SiseManager sise = null;
    public static String exchangeRate = "";
    public static Queue<UserMsg> msgList = new LinkedList<>();
    public static EgovMap memberTokenMap =new EgovMap();
    
    public static SocketHandler sh;
    public SocketHandler() {  
    	super(); sh = this; 
    }
    
    public int getSessionSetSize(){
    	return this.sessionSet.size();
    }
            
    public SampleDAO getSampleDAO(){
    	return sampleDAO;
    }
  
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	System.out.println("웹소켓해제");
    	GameEndSocket(session);
        super.afterConnectionClosed(session, status);
        sessionSet.remove(session);
        this.logger.info("remove session!");
    }

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	System.out.println("웹소켓연결");
    	
        super.afterConnectionEstablished(session);
        userConnect(session);
        sessionSet.add(session);
        try {
		} catch (Exception e) {
			//Log.print("afterConnectionEstablished err! "+e, 0, "err");
		}
        
    }
    
    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
        super.handleMessage(session, message);

        this.logger.info("receive message:" + message.getPayload());

        String msg = "" + message.getPayload();
        synchronized(msgList) {
            msgList.add(new UserMsg(session,msg));
        }
        JSONParser p = new JSONParser();
        JSONObject obj = (JSONObject) p.parse(msg);
        
        
//        if (("" + obj.get("protocol")).compareTo("onOpen") == 0){ 
//			Map<String, Object> m = session.getAttributes();
//			m.put("userIdx", ""+obj.get("userIdx"));
//        }
//        else if (("" + obj.get("protocol")).compareTo("adminLogin") == 0) { 
//        	System.out.println("adminLogin"); 
//			Map<String, Object> m = session.getAttributes();
//			m.put("adUserIdx", ""+obj.get("adUserIdx"));
//		} // 로그인
    }
    void cmdProcess(){
        UserMsg um = null;
        synchronized (msgList) {
            if (msgList.size() > 0) {
                um = msgList.poll();
            }
        }
        if (um == null)
            return;
        WebSocketSession session = um.session;
        String msg = um.msg;
        // =================================================} msg
        JSONParser p = new JSONParser();
        JSONObject obj = null;
        
        try {
            obj = (JSONObject) p.parse(msg);
        } catch (Exception e) {
            return;
        }
        String protocol = obj.get("protocol").toString();    
        switch(protocol){
            case "login":OnLogin(session, obj); break;
            case "gameStartUser": GameStart(session, obj); break;
            case "AdminMineBoom":AdminMineBoom(obj);break;
        }
    }
    public void init(){
//    	Coin.coinInit(sampleDAO);
//    	sise = new SiseManager();
    }
    
	@Override
	public void afterPropertiesSet() throws Exception {
    	
		Log.print("call afterPropertiesSet", 5, "call");
		try {
			init();			
			// MiddlewareManager.getHandle().startThread();
			
		} catch (Exception e) {
			Log.print("afterPropertiesSet init err! " + e, 0, "err");
		}
		Thread thread = new Thread() {
			@Override
			public void run() {
				while (true) {
					try {
						Thread.sleep(10);
						
						int msize = msgList.size();
						if(msize > 0){
							for(int i=0;i<3000;i++)
								cmdProcess();
						}
					
					} catch (InterruptedException e) {
						e.printStackTrace();
						break;
					}
				}
			}
		};
		thread.start();
	}

    private void userConnect(WebSocketSession session){
        System.out.println("유저 접속");
        JSONObject obj=new JSONObject();
        obj.put("protocol", "doLogin");
        this.sendMessageToMe(session, obj);
    }
    public void sendMessageToMe(WebSocketSession session, JSONObject obj) {
        if(session == null)
            return;
        
        if (session.isOpen() ) {
            try {
                synchronized(session){
                    session.sendMessage(new TextMessage(obj.toString()));
                }
            } catch (Exception e) {
                System.out.println("패킷전송 중 에러");
            }
        }
    }
	public void sendMessageForMe(JSONObject obj) {
		String midx = "" + obj.get("userIdx");
		for (WebSocketSession session : this.sessionSet) {
			if (session.isOpen()) {
				Map<String, Object> m = session.getAttributes();
				String userIdx = "" + m.get("userIdx");
				if (midx.compareTo(userIdx) == 0){
					try {
						synchronized (session) {
							session.sendMessage(new TextMessage(obj.toString()));
						}
					} catch (Exception ignored) {
						this.logger.error("fail to send message!", ignored);
					}
				}
			}
			
		}
	}
	
	public void sendMessageAll(JSONObject obj) {
		for (WebSocketSession session : this.sessionSet) {
			if (session.isOpen()) {
				try {
					synchronized (session) {
						session.sendMessage(new TextMessage(obj.toString()));
					}
				} catch (Exception ignored) {
					this.logger.error("fail to send message!", ignored);
				}
			}
		}
	}
	private void OnLogin(WebSocketSession session, JSONObject obj){
        try {
            String userIdx = obj.get("userIdx").toString();
            String game = "gem";	
            Map<String, Object> m = session.getAttributes();
            m.put("userIdx", userIdx);
            m.put("game", game);
            
            String token =""+( (System.currentTimeMillis()+Integer.parseInt(userIdx))%10000);
            memberTokenMap.put(userIdx, token);
            JSONObject toObj = new JSONObject();
            toObj.put("protocol", "requestLoginResult");
            toObj.put("token", token);
            toObj.put("userIdx", userIdx);
            sendMessageToMe(session,toObj);
        } catch (Exception e) {
        }
    }
	private void GameStart(WebSocketSession session, JSONObject obj){
        try {
            JSONObject toObj = new JSONObject();
            toObj.put("protocol", "gameStart");
            toObj.put("result", "fail");
            toObj.put("msg", "요청에 실패했습니다.");
            Map<String, Object> m = session.getAttributes();
            m.put("isGame", "gameStart");
            String userIdx = obj.get("userIdx").toString();
            String token = obj.get("token").toString();
            
            String tokenCheckStr = ""+memberTokenMap.get(userIdx);

            if(!tokenCheckStr.equals(token)){
            	
	        	toObj.put("msg", "잘못된 접근입니다.");
	        	sendMessageToMe(session,toObj);
	        	
	        	return;
            }
            toObj.put("result", "suc");
            sendMessageToMe(session,toObj);
            toObj.put("protocol", "gamelist");
        	sendMessageAll(toObj);
        } catch (Exception e) {
        }
    }
	private void GameEnd(WebSocketSession session, JSONObject obj){
        try {
            JSONObject toObj = new JSONObject();
            toObj.put("protocol", "gameStart");
            toObj.put("result", "fail");
            toObj.put("msg", "요청에 실패했습니다.");
         
            Map<String, Object> m = session.getAttributes();
            m.put("isGame", "gameEnd");
            
            String userIdx = obj.get("userIdx").toString();
            String token = obj.get("token").toString();
            
            String tokenCheckStr = ""+memberTokenMap.get(userIdx);

            if(!tokenCheckStr.equals(token)){
            	
	        	toObj.put("msg", "잘못된 접근입니다.");
	        	sendMessageToMe(session,toObj);
	        	return;
            }
            toObj.put("result", "suc");
            sendMessageToMe(session,toObj);
        } catch (Exception e) {
        }
    }
	private void GameEndSocket(WebSocketSession session){
        try {
           
            Map<String, Object> m = session.getAttributes();
            
            String userIdx = "" + m.get("userIdx");
            String isGame = "" + m.get("isGame");
            if(isGame.equals("gameStart")){
	            EgovMap in = new EgovMap();
				in.put("midx", userIdx);
				sampleDAO.update("updateBetlogEndGame", in);
            }
           
        } catch (Exception e) {
        }
    }

	private void AdminMineBoom(JSONObject obj){
        try {
        	String userIdx = obj.get("userIdx").toString();
        	String betIdx = obj.get("betIdx").toString();
        	EgovMap in = new EgovMap();
			in.put("midx", userIdx);
			in.put("betIdx", betIdx);
			sampleDAO.update("updateBetlogAdminBoom", in);
        	
        } catch (Exception e) {
        }
    }
	
}