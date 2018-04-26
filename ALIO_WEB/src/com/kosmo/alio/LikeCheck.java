package com.kosmo.alio;

import java.util.ArrayList;

public interface LikeCheck {
	public int likeCheckInsert(WrapperVO wvo);
	
	public int likeCheckCount(int bseq);
	
	public ArrayList<LikeCheckVO> likeCheckList(int bseq);
}
