package com.kosmo.alio;

import java.util.ArrayList;

public interface Info {
	public ArrayList<WrapperVO> infoList(int itseq);
	
	public int infoInsert(WrapperVO wvo);
	
	public int infoUpdate(InfoVO ivo);
	
	public int infoDelete(int iseq);
}
