package com.kosmo.alio;

import java.util.ArrayList;

public class InfoTypeCallTest {
	
	public static void plist() {
		InfoTypeImp iti = new InfoTypeImp();
		InfoTypeVO itvo = new InfoTypeVO();
		
		ArrayList<InfoTypeVO> list = new ArrayList<InfoTypeVO>();
		
		list = iti.infoTypeList(7);
		
		for (int i = 0; i < list.size(); i++) {
			itvo = list.get(i);
			System.out.print(itvo.getItseq()+ "    ");
			System.out.println(itvo.getItname());
		}
	}
	
	public static void main(String[] args) {
		
		InfoTypeImp iti = new InfoTypeImp();
		InfoTypeVO itvo = new InfoTypeVO();
		GameVO gvo = new GameVO();
		WrapperVO wvo = new WrapperVO();
		
		
		int res = 0;
		
		//------------------------삽입------------------------
//		itvo.setItname("가나다라");
//		gvo.setGseq(7);
//
//		wvo.setItvo(itvo);
//		wvo.setGvo(gvo);
//
//		res = iti.infoTypeInsert(wvo);
		//---------------------------------------------------
		
		//------------------------수정------------------------
//		itvo.setItname("맵");
//		itvo.setItseq(60);
//		res = iti.infoTypeUpdate(itvo);
		//---------------------------------------------------
		
		//------------------------삭제------------------------
		res = iti.infoTypeDelete(57);
		
		//---------------------------------------------------
		plist();
		
	}

}
