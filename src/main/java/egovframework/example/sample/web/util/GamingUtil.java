package egovframework.example.sample.web.util;

public class GamingUtil {

	public static int countNumbers(String str) {
        int count = 0;
        boolean inNumber = false;

        for (int i = 0; i < str.length(); i++) {
            char c = str.charAt(i);
            if (Character.isDigit(c)) {
                inNumber = true;
            } else {
                // 현재 문자가 숫자가 아닌 경우
                if (inNumber) {
                    count++;
                    inNumber = false;
                }
            }
        }
        if (inNumber) {
            count++;
        }
        return count;
    }
	public static double getNextStake(int count,int betMoney) {
		
		double nextStaek = 0;
		nextStaek = betMoney * 0.12;
		
		if(count>0){
			for(int i=0;i<count;i++){
				nextStaek = nextStaek*1.2;
			}
		}
		return nextStaek;
        
    }
	public static double getTotalStake(int count,int betMoney) {
		
		double nextStaek = 0;
		double totalStaek = betMoney;
		nextStaek = betMoney * 0.12;
		
		if(count>0){
			for(int i=0;i<count;i++){
				totalStaek += nextStaek;
				nextStaek = nextStaek*1.2;
			}
		}
		return totalStaek;
        
    }
	
}
