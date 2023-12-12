package egovframework.example.sample.web.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class Utils {
	public static boolean isNull(String str) {
		return str == null || str.trim().isEmpty() || str.equals("null") || str.equals("NaN") || str.equals("undefined");
	}

	public static boolean isNum(String str) {
		return Pattern.matches("^[0-9]*$", str);
	}

	public static boolean isPwChk(String str) {
		return Pattern.matches("^(?=.*[a-zA-Z])(?=.*[0-9]).{6,16}$", str);
	}

	public static boolean isValidEmail(String email) {
		return Pattern.matches("^[_a-zA-Z0-9-\\.]+@[\\.a-zA-Z0-9-]+\\.[a-zA-Z]+$", email);
	}

	public static boolean isValidPhone(String str) {
		return Pattern.matches("^\\d{2,3}\\d{3,4}\\d{4}$", str);
	}
	public static String randomHexGenerator() {
        int length = 40; // 문자열 길이
        Random random = new Random();
        StringBuilder sb = new StringBuilder("0x"); // 0x로 시작
        final String characters = "0123456789abcdef";
        for (int i = 2; i < length; i++) { // 0, 1은 0x가 있으므로 2부터 시작
            sb.append(characters.charAt(random.nextInt(characters.length())));
        }
        String randomHexString = sb.toString();
        System.out.println(randomHexString);
        return randomHexString;
        
    }
	public static String getTempNumber(int length) {
		int index = 0;
		char[] charArr = new char[] { '1', '2', '3', '4', '5','6','7','8','9'};
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < length; i++) {
			index = (int) (charArr.length * Math.random());
			sb.append(charArr[index]);
		}
		return sb.toString();
	}

	public static int getAmericanAge(String birthDate) {
		LocalDate now = LocalDate.now();
		LocalDate parsedBirthDate = LocalDate.parse(birthDate, DateTimeFormatter.ISO_DATE);
		int americanAge = now.minusYears(parsedBirthDate.getYear()).getYear(); // (1)
		// (2)
		// 생일이 지났는지 여부를 판단하기 위해 (1)을 입력받은 생년월일의 연도에 더한다.
		// 연도가 같아짐으로 생년월일만 판단할 수 있다!
		if (parsedBirthDate.plusYears(americanAge).isAfter(now)) {
			americanAge = americanAge - 1;
		}
		return americanAge;
	}

	public static String getTempCode(int length) {
		int index = 0;
		char[] charArr = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a',
				'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
				'w', 'x', 'y', 'z' };
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < length; i++) {
			index = (int) (charArr.length * Math.random());
			sb.append(charArr[index]);
		}
		return sb.toString();
	}

	public static JSONObject convertMapToJson(Map<String, Object> map) {
	    
        JSONObject json = new JSONObject();
        String key = "";
        Object value = null;
        for(Map.Entry<String, Object> entry : map.entrySet()) {
            key = entry.getKey();
            value = ""+entry.getValue();
            json.put(key, value);
        }
        return json;
    }
	
	public static String getClientIP(HttpServletRequest request) {
	    String ip = request.getHeader("X-Forwarded-For");

	    if (ip == null) {
	        ip = request.getHeader("Proxy-Client-IP");
	        //System.out.println("> Proxy-Client-IP : " + ip);
	    }
	    if (ip == null) {
	        ip = request.getHeader("WL-Proxy-Client-IP");
	        //System.out.println(">  WL-Proxy-Client-IP : " + ip);
	    }
	    if (ip == null) {
	        ip = request.getHeader("HTTP_CLIENT_IP");
	        //System.out.println("> HTTP_CLIENT_IP : " + ip);
	    }
	    if (ip == null) {
	        ip = request.getHeader("HTTP_X_FORWARDED_FOR");
	        //System.out.println("> HTTP_X_FORWARDED_FOR : " + ip);
	    }
	    if (ip == null) {
	        ip = request.getRemoteAddr();
	        //System.out.println("> getRemoteAddr : "+ip);
	    }
	    //System.out.println("> Result : IP Address : "+ip);

	    return ip;
	}
}
