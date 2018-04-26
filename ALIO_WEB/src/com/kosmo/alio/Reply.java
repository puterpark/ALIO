package com.kosmo.alio;

import java.util.ArrayList;

public interface Reply {
	//reply list 출력
	public ArrayList<WrapperVO> replyList(int bseq);
	
	//reply list 뽑을 때 page를 위한 
	//public int replyCount(int bseq);
	
	//reply 수정
	public int replyUpdate(ReplyVO rvo);
	
	//reply 삭제
	public int replyDelete(int rseq);
	
	//reply 생성
	public int replyInsert(WrapperVO wvo);
}
