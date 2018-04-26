package com.kosmo.alio;

import java.sql.Connection;
import java.util.ArrayList;

public class InfoCallTest {
	
	public static void plist() {
		
		InfoImp i = new InfoImp();
		WrapperVO wvo = new WrapperVO();
		ArrayList<WrapperVO> list = new ArrayList<WrapperVO>();
		
//		list = i.infoList();
		
		for (int j = 0; j<list.size() ; j++) {
			wvo = list.get(j);
			System.out.print(wvo.getIvo().getIseq()+ "    ");
			System.out.print(wvo.getItvo().getItseq()+ "    ");
			System.out.print(wvo.getIvo().getItitle()+ "    ");
			System.out.print(wvo.getIvo().getIbody()+ "    ");
			System.out.print(wvo.getGvo().getGseq()+ "    ");
			System.out.println(wvo.getIvo().getIregdate());
		}
	}

	public static void main(String[] args) {
		
		DBConnect c = new DBConnect();
		Connection conn = c.dbConn();
		
		int res = 0;
		
		InfoImp i = new InfoImp();
		WrapperVO wvo = new WrapperVO();
		InfoVO ivo = new InfoVO();
		InfoTypeVO itvo = new InfoTypeVO();
		GameVO gvo = new GameVO();
		
		//--------------------삽입--------------------------
//		itvo.setItseq(27);
//		ivo.setItitle("집에가자");
//		ivo.setIbody("시발");
//		gvo.setGseq(2);
//		
//		wvo.setItvo(itvo);
//		wvo.setIvo(ivo);
//		wvo.setGvo(gvo);
//		
//		res = i.infoInsert(wvo);
		//--------------------------------------------------
		
		//-----------------------수정------------------------
//		ivo.setItitle("집에가고싶다");
//		ivo.setIbody("빨리보내줘");
//		ivo.setIseq(101);
//		
//		res = i.infoUpdate(ivo);
		//--------------------------------------------------
		
		//----------------------삭제-------------------------
//		res = i.infoDelete(101);
//		System.out.println(res);
		//--------------------------------------------------
		plist();
		

	}

}
