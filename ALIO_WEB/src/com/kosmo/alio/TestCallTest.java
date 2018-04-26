package com.kosmo.alio;

import java.util.ArrayList;

public class TestCallTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		LikeCheckImp mt = new LikeCheckImp();
		ReplyImp rp = new ReplyImp();
		WrapperVO wvo = new WrapperVO();
		CrewVO cvo = new CrewVO();
		BodVO bvo = new BodVO();
		ReplyVO rvo = new ReplyVO();
		//---------------likeCheckInsert-----------
//		cvo.setCseq(3);
//		bvo.setBseq(7);
//		wvo.setCvo(cvo);
//		wvo.setBvo(bvo);
//		
//		int res = mt.likeCheckInsert(wvo);
//		System.out.println(res);
		//------------------------------------------
		
		//--------replyUpdate----------------------
//		rvo.setRbody("댓글달기");
//		rvo.setRseq(1);
//		wvo.setRvo(rvo);
//		
//		int res = rp.replyUpdate(wvo);
		//-------------------------------------------
		
		//-----------likeCheckCount------------------
//		int cnt=0;
//		cnt = mt.likeCheckCount(7);
//		System.out.println(cnt);
		//-------------------------------------------
		
		//------------replyCount-----------------------
//		int cnt1 = 0;
//		cnt1 = rp.replyCount(3);
//		System.out.println(cnt1);
		//---------------------------------------------
		
		//----------replyInsert------------------------
//		cvo.setCseq(4);
//		rvo.setRbody("test댓글");
//		bvo.setBseq(2);
//		wvo.setCvo(cvo);
//		wvo.setRvo(rvo);
//		wvo.setBvo(bvo);
//		
//		int res = rp.replyInsert(wvo);
//		System.out.println(res);
		//-----------------------------------------------
		
		//----------replyDelete------------------------
//		int res = rp.replyDelete(21);
//		System.out.println(res);
		//-----------------------------------------------
		
		bvo.setBseq(2);
		wvo.setBvo(bvo);
		
		ArrayList<WrapperVO> list = new ArrayList<WrapperVO>();
		list = rp.replyList(wvo);
		for(int i=0;i<list.size();i++){
			System.out.println(list.get(i).getCvo().getCid());
			System.out.println(list.get(i).getRvo().getRbody());
			System.out.println(list.get(i).getRvo().getRregdate());
			System.out.println("------------------------------------------");
		}
	}
}