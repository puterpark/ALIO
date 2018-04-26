package com.kosmo.alio;

import java.util.ArrayList;

public interface Game {
	public ArrayList<GameVO> gameList();
	
	public int gameInsert(GameVO gvo);
	
	public int gameUpdate(GameVO gvo);
	
	public int gameDelete(int gseq);
}
