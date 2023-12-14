package egovframework.example.sample.web;

import org.springframework.web.socket.WebSocketSession;

public class UserMsg {
	public WebSocketSession session;
	public String msg;

	public UserMsg(WebSocketSession tsession,String msg) 
	{
		session = tsession;
		this.msg=msg;
	}
}
