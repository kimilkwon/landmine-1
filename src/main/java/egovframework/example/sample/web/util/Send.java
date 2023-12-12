package egovframework.example.sample.web.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import egovframework.example.sample.service.impl.Log;

public class Send {
	public static boolean sendMexText(String phone, String text) {				
		try {
			Log.print("sendMexText "+phone+" "+ text, 1, "sendcheck");
			
			phone = phone.substring(1);
			text = "<TouchKeep> 문자인증번호:"+text;
			
			int textLength = text.length();
			for (int i = 0; i < textLength; i += 70) {
	            String partMsg = text.substring(i, Math.min(i + 70, textLength));
	            // Construct data
	            String data = URLEncoder.encode("gw-username", "UTF-8") + "=" + URLEncoder.encode("newwave0101", "UTF-8");
	            data += "&" + URLEncoder.encode("gw-password", "UTF-8") + "=" + URLEncoder.encode("Choi958100@", "UTF-8");
	            data += "&" + URLEncoder.encode("gw-to", "UTF-8") + "=" + URLEncoder.encode(82+phone, "UTF-8");
	            data += "&" + URLEncoder.encode("gw-from", "UTF-8") + "=" + URLEncoder.encode("9999999999", "UTF-8"); // 10자리
	            data += "&" + URLEncoder.encode("gw-text", "UTF-8") + "=" + URLEncoder.encode(partMsg, "UTF-8");
	            // Send data
	            URL url = new URL("http://mexkr.sms-service.com.my:29143/cgi-bin/sendsms");// api 주소 
	            URLConnection conn = url.openConnection();
	            conn.setDoOutput(true);
	            OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
	            wr.write(data);
	            wr.flush();
	            // Get the response
	            BufferedReader resp = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	            // Display the string.
	            resp.close();
	        }
			
			return true;
		} catch (Exception e) {
			System.out.println(e.toString());
			return false;
		}
	}
}
