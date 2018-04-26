package com.kosmo.alio;

import java.util.ArrayList;

public interface InfoType {
	public ArrayList<InfoTypeVO> infoTypeList(int gseq);
	
	public int infoTypeInsert(WrapperVO wvo);
	
	public int infoTypeUpdate(InfoTypeVO itvo);
	
	public int infoTypeDelete(int itseq);
}
