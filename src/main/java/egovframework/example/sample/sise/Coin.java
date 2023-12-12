package egovframework.example.sample.sise;
import java.util.ArrayList;

import egovframework.example.sample.service.impl.Log;
import egovframework.example.sample.service.impl.SampleDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public class Coin {
	
	public static ArrayList<Coin> fullCoins = new ArrayList<>();
	public static ArrayList<Coin> useCoins = new ArrayList<>();
    
	private static int tmpSisePacketCnt = 0;
	public static final int sisePacketCntMin = 1;
	public final int coinNum;
	public final String coinName;
	public final int qtyFixed;
	public final int priceFixed;
	public final boolean isUse;
	public final int siseAlarmCnt;
	public String nowPrice = null;
	public int packetCnt = 0;
	
	public Coin(int _coinNum, String _coinName, int _qtyFixed, int _priceFixed, boolean _isUse, int _siseAlarmCnt){
		this.coinNum = _coinNum;
		this.coinName = _coinName;
		this.qtyFixed = _qtyFixed;
		this.priceFixed = _priceFixed;
		this.isUse = _isUse;
		this.siseAlarmCnt = _siseAlarmCnt;
	}
	
	public Double getSise(){
		if(nowPrice == null) return null;
    	return Double.parseDouble(nowPrice);
    }
	
	public String getCoinRealName(){
		switch(coinName){
		case "BTC": return "bitcoin";
		case "ETH": return "ethereum";
		case "XRP": return "ripple";
		case "TRX": return "tron";
		case "DOGE": return "doge";
		case "LTC": return "litecoin";
		case "SAND": return "sandbox";
		case "ADA": return "cardano";
		case "GMT": return "greenwith";
		case "APE": return "apecoin";
		case "GALA": return "gala";
		case "ROSE": return "oasisnetwork";
		case "KSM": return "kusama";
		case "DYDX": return "dydx";
		case "RVN": return "ravencoin";
		case "ETC": return "ethereumclassic";
		}
		return "";
	}
	
	public static Coin getCoin(String coinname){
		switch(coinname.toUpperCase()){
		case "BTC":
		case "BITCOIN": 
			return fullCoins.get(0);
		case "ETH": 
		case "ETHEREUM": 
			return fullCoins.get(1);
		case "XRP": 
		case "RIPPLE": 
			return fullCoins.get(2);
		case "TRX": 
		case "TRON": 
			return fullCoins.get(3);
		case "DOGE": 
			return fullCoins.get(4);
		case "LTC": 
		case "LITECOIN": 
			return fullCoins.get(5);
		case "SAND": 
		case "SANDBOX": 
			return fullCoins.get(6);
		case "ADA":
		case "CARDANO": 
			return fullCoins.get(7);
		case "GMT": 
		case "GREENWITH": 
			return fullCoins.get(8);
		case "APE": 
		case "APECOIN": 
			return fullCoins.get(9);
		case "GALA": 
			return fullCoins.get(10);
		case "ROSE": 
		case "OASISNETWORK": 
			return fullCoins.get(11);
		case "KSM":
		case "KUSAMA": 
			return fullCoins.get(12);
		case "DYDX": 
			return fullCoins.get(13);
		case "RVN": 
		case "RAVENCOIN": 
			return fullCoins.get(14);
		case "ETC": 
		case "ETHEREUMCLASSIC": 
			return fullCoins.get(15);
		}
		return getCoinInfo(coinname);
	}
	
	public static int getCoinNum(String coinname){
		switch(coinname){
		case "BTC": return 0;
		case "ETH": return 1;
		case "XRP": return 2;
		case "TRX": return 3;
		case "DOGE": return 4; 
		case "LTC": return 5;
		case "SAND": return 6; 
		case "ADA": return 7;
		case "GMT": return 8;
		case "APE": return 9;
		case "GALA": return 10;
		case "ROSE": return 11;
		case "KSM": return 12;
		case "DYDX": return 13;
		case "RVN": return 14;
		case "ETC": return 15;
		}
		return -1;
	}
	
	public static Coin getCoinInfo(String symbol){
		if(symbol.startsWith("USDT") || symbol.equals("futures"))
			return null;
		
		for(Coin coin : fullCoins){
			if(symbol.contains(coin.coinName))
				return coin;
		}
		
		Log.print("getCoinInfo 코인정보 불러오기 에러. symbol = "+symbol, 1, "err");
		return null;
	}
	
	public static Coin getCoinInfo(int cnum){
		for(Coin coin : fullCoins){
			if(coin.coinNum == cnum)
				return coin;
		}
		Log.print("getCoinInfo 코인정보 불러오기 에러. cnum = "+cnum, 1, "err");
		return null;
	}
	
	public static void sisePacketLog(){
		tmpSisePacketCnt++;
		if(tmpSisePacketCnt >= sisePacketCntMin){
			tmpSisePacketCnt = 0;
			for(Coin coin : useCoins){
				Log.print("["+coin.coinName+"] , "+sisePacketCntMin+"분 packet : "+coin.packetCnt, 1, "sise");
				coin.packetCnt = 0;
			}
		}
	}
	
	public static void coinInit(SampleDAO sampleDAO){
		
		ArrayList<EgovMap> coinlist = (ArrayList<EgovMap>) sampleDAO.list("selectCoinList");
		
		fullCoins.clear();
		useCoins.clear();
		for(EgovMap coin : coinlist){
			Coin addCoin = new Coin(
					Integer.parseInt(coin.get("coinNum").toString()),
					coin.get("coinName").toString(),
					Integer.parseInt(coin.get("qtyFixed").toString()),
					Integer.parseInt(coin.get("priceFixed").toString()),
					Boolean.parseBoolean(coin.get("use").toString()),
					Integer.parseInt(coin.get("siseAlarmCnt").toString())
					);
			fullCoins.add(addCoin);
			if(addCoin.isUse)
				useCoins.add(addCoin);
		}
	}
}
