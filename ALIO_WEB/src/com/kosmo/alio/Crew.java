package com.kosmo.alio;

import java.util.ArrayList;

public interface Crew {
	//crew 로그인
	public CrewVO login(CrewVO cvo);
	
	//crew list 출력
	public ArrayList<CrewVO> crewList(int sseq, int mseq);
	
	//crew list 뽑을 때 page를 위한 
	public int crewCount();
	
	//crew 수정
	public int crewUpdate(CrewVO cvo);
	
	//crew 삭제
	public int crewDelete(int cseq);
	
	//crew 삭제 : 회원탈퇴용 비번확인(AJAX)
	public int crewDeleteForAjax(int cseq, String cpw);
	
	//crew 생성
	public int crewInsert(CrewVO cvo);
	
	//crew 상세
	public CrewVO crewDetail(int cseq);
}
