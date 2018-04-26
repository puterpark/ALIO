package com.kosmo.alio;

import java.util.ArrayList;

public interface Bod {
	//board 상세
	public ArrayList<WrapperVO> bodDetail(int bseq);
	
	//board list 출력
	public ArrayList<WrapperVO> bodList(int sseq, int eseq, int gseq, int btseq);
	
	//board list 뽑을 때 page를 위한 
	public int bodCount(int gseq, int btseq);
	
	//board 파일업로드 게시판
	public int bodNonFileUpdate(BodVO bvo);
	
	//board 수정
	public int bodUpdate(BodVO bvo);
	
	//board 삭제
	public int bodDelete(int bseq);
	
	//board 생성
	public int bodInsert(BodVO bvo);
}
