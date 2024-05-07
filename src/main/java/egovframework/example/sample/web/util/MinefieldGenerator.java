package egovframework.example.sample.web.util;
import java.util.ArrayList;
import java.util.Collections;

public class MinefieldGenerator {

	public static String generateMinefield(int mineCount) {
        // 1부터 25까지의 숫자를 담은 리스트 생성
        ArrayList<Integer> numbers = new ArrayList<>();
        for (int i = 1; i <= 25; i++) {
            numbers.add(i);
        }

        Collections.shuffle(numbers);
        ArrayList<Integer> mines = new ArrayList<>(numbers.subList(0, mineCount));

        Collections.sort(mines);

        StringBuilder result = new StringBuilder();
        for (int i = 0; i < mines.size(); i++) {
            result.append(mines.get(i));
            if (i < mines.size() - 1) {
                result.append("-");
            }
        }

        return result.toString();
    }
	 public static boolean checkMine(String minefield, int selectedNumber) {
	        String[] mineNumbers = minefield.split("-");

	        for (String mineNumber : mineNumbers) {
	            if (Integer.parseInt(mineNumber) == selectedNumber) {
	                return true;
	            }
	        }

	        return false;
    }
	 public static String replaceMine(String minefield, int selectedNumber) {
	        String[] mineNumbers = minefield.split("-");
	        ArrayList<Integer> mines = new ArrayList<>();

	        for (String mineNumber : mineNumbers) {
	            mines.add(Integer.parseInt(mineNumber));
	        }

	        mines.set(mines.size() - 1, selectedNumber);

	        Collections.sort(mines);

	        StringBuilder result = new StringBuilder();
	        for (int i = 0; i < mines.size(); i++) {
	            result.append(mines.get(i));
	            if (i < mines.size() - 1) {
	                result.append("-");
	            }
	        }

	        return result.toString();
	    }
	 public static String generateSerchfield(String serchfield,int serchInt) {
		  serchfield +=serchInt+"-";
		  
		  return serchfield;
    }
	 public static boolean checkSerch(String serchfield, int selectedNumber) {
		 	if(serchfield.equals("")||serchfield.equals("null")) return false;
	        String[] searchNumbers = serchfield.split("-");

	        for (String searchNumber : searchNumbers) {
	            if (Integer.parseInt(searchNumber) == selectedNumber) {
	                return true;
	            }
	        }

	        return false;
 }
}
