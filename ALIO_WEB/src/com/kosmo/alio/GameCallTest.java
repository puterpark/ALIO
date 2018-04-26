package com.kosmo.alio;

import java.util.ArrayList;

public class GameCallTest {
	
	public static void plist() {
		GameImp i = new GameImp();
		GameVO gvo = new GameVO();
		ArrayList<GameVO> list = new ArrayList<GameVO>();
		
		list = i.gameList();
		
		for (int j = 0; j < list.size(); j++) {
			gvo = list.get(j);
			System.out.print(gvo.getGseq()+ "    ");
			System.out.println(gvo.getGtitle());
		}
	}

	public static void main(String[] args) {
		
		GameImp i = new GameImp();
		GameVO gvo = new GameVO();
		
		int res = 0;
		
		//------------------------삽입------------------------
//		gvo.setGseq(6);
		gvo.setGtitle("League of Legends");
//		
		res = i.gameInsert(gvo);
		//---------------------------------------------------
		
		//------------------------수정------------------------
//		gvo.setGtitle("lol");
//		gvo.setGseq(6);
//		res = i.gameUpdate(gvo);
		//---------------------------------------------------
		
		//------------------------삭제------------------------
//		res = i.gameDelete(6);
		//---------------------------------------------------
		plist();
		
	}

}
