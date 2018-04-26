package com.kosmo.alio;

import java.util.ArrayList;

public class GameVO {
	
	int gseq;
	String gtitle;
	
	
	//----------------------lkh
	ArrayList<BodTypeVO> btlist;
	public ArrayList<BodTypeVO> getBtlist() {
		return btlist;
	}
	public void setBtlist(ArrayList<BodTypeVO> btlist) {
		this.btlist = btlist;
	}
	
	
	
	public int getGseq() {
		return gseq;
	}
	public void setGseq(int gseq) {
		this.gseq = gseq;
	}
	public String getGtitle() {
		return gtitle;
	}
	public void setGtitle(String gtitle) {
		this.gtitle = gtitle;
	}
}
