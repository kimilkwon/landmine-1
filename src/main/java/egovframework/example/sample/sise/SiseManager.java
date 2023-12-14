package egovframework.example.sample.sise;

import java.net.URI;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHttpHeaders;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.client.WebSocketClient;
import org.springframework.web.socket.client.standard.StandardWebSocketClient;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import egovframework.example.sample.service.impl.Log;
import egovframework.example.sample.web.SocketHandler;

public class SiseManager {
	
//	public static boolean _autoReconnect = false;//접속 끊기면 바로 재접속 요청 함
//	private ExecutorService reconnectExecutor = Executors.newSingleThreadExecutor();
//	private final int reconnectInterval = 5000; // 재연결 시도 간격 (5초)
//	
//	public WebSocketSession webSocketSession=null;
//	public String url="ws://localhost:8288/port8288";//8287이아니라 8288로 한건... 암튼 노드 보면 암.
//	public SiseManager(){
//		websocketConnect();
//	}
//	public void sendSiseServer(JSONObject tmpobj){
//        try {       
//        	Log.print("sendSiseServer json :"+tmpobj.toJSONString(),2,"sise" );
//        	synchronized(webSocketSession){
//        		webSocketSession.sendMessage(new TextMessage(tmpobj.toJSONString()));
//        	}
//        } catch (Exception ignored) {
//        	System.out.println("managerOne  send error ");
//        }
//	}	
//	public void reinit(){
//		try{
//			webSocketSession.close();
//		}catch(Exception e){}
//		websocketConnect();
//	}
//	WebSocketClient webSocketClient = null;
//	public WebSocketSession websocketConnect(){
//    	Log.print("connect start", 1, "log");
//		try {
//            webSocketClient = new StandardWebSocketClient();
// 
//            webSocketSession= webSocketClient.doHandshake(new TextWebSocketHandler() {
//                @Override public void handleTextMessage(WebSocketSession session, TextMessage message) {
//                	OnMessageManager(session,message.getPayload());
//                }
//                @Override public void afterConnectionEstablished(WebSocketSession session) {
//                	Log.print("connect ok", 1, "call_send");
//                	OnAfterConnect(session);
//                }
//                @Override public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
//                	Log.print("connect tsp error .", 1, "err");
//                }
//                @Override
//                public void afterConnectionClosed(WebSocketSession session,CloseStatus status) throws Exception {
//                	Log.print("connect tsp closed .", 1, "err_notsend");
//                	_autoReconnect = true;
//                	afterConnectionClosedManager(session);
//                }
//            }, new WebSocketHttpHeaders(), URI.create(url)).get();
//            return webSocketSession;
//        } catch (Exception e) {
//        	Log.print("connect start "+e.getMessage(), 1, "err_notsend");
//        	_autoReconnect = true;
//        	return null;
//        }
//	}
//	
//	public void afterConnectionClosedManager(WebSocketSession session){
//		try{			
//			Log.print("afterConnectionClosedManager 접속끊김 .", 1, "err");
//			webSocketSession = null;
//			webSocketClient = null;
//			reconnect();
//		}catch(Exception e){System.out.println("s err:"+e.toString() );}
//	}
//	public void OnAfterConnect(WebSocketSession session){
//		_autoReconnect = false;
//	}
//	
//	public void reconnect(){
//		if (_autoReconnect) {
//			reconnectExecutor.submit(new Runnable() {
//                @Override
//                public void run() {
//                    while (_autoReconnect) {
//                        try {
//                            Thread.sleep(reconnectInterval);
//                            websocketConnect();
//                        } catch (InterruptedException e) {
//                            Log.print("Reconnect attempt interrupted: " + e.getMessage(), 1, "err");
//                        }
//                    }
//                }
//            });
//        }
//	}
//		
//	public void OnMessageManager(WebSocketSession session, String msg){
//		try{
//			JSONParser p = new JSONParser();
//	        JSONObject msgObj = (JSONObject)p.parse(msg);
//	        getModuleSise(msgObj);
//		}catch(Exception e)
//		{
//			Log.print("OnMessageManager err "+e, 1, "err");
//		}
//	}
//	
//	void getModuleSise(JSONObject msgObj){
//		try	{
//	        String pr = "";
//	        if(msgObj.get("protocol") != null){
//	        	pr = ""+msgObj.get("protocol");
//		        if(pr.equals("startM")) {
//			    	SocketHandler.sh.sendMessageAll(msgObj);
//		        } 
//	        	Log.print("imok send---------" , 0 , "sise" );
//	        	JSONObject obj=new JSONObject();	        	
//	        	obj.put("protocol", "imok");
//	        	obj.put("userIdx", -1);
//	        	sendSiseServer(obj);
//	        	return;
//	        }
//
//	        String exchangeRate = (String)msgObj.get("exchangeRate");
//	        SocketHandler.exchangeRate = exchangeRate;
//	        
//	        String price = (String) msgObj.get("price");
//	        String symbol = ""+msgObj.get("symbol");
//	        if( msgObj.get("symbol") == null){
//	        	return;
//	        }
//	        Coin coin = Coin.getCoinInfo(symbol);
//	        
//	        if(!coin.isUse){
//	        	return;
//	        }
//			coin.packetCnt++;
//			coin.nowPrice = price;
//
//		}catch(Exception e)
//		{
//			Log.print("OnMessageManager err "+e, 1, "err");
//		}
//	}
	
}
