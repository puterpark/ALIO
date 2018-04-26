package com.kosmo.alio;

import java.util.ArrayList;

public class BodVO {
	
	int bseq;
	int gseq;
	int btseq;
	int cseq;
	String btitle;
	String bbody;
	String bregdate;
	String bfile;
	String blike;
	
	ArrayList<ReplyVO> list;
	
	public int getBseq() {
		return bseq;
	}
	public void setBseq(int bseq) {
		this.bseq = bseq;
	}
	public int getGseq() {
		return gseq;
	}
	public void setGseq(int gseq) {
		this.gseq = gseq;
	}
	public int getBtseq() {
		return btseq;
	}
	public void setBtseq(int btseq) {
		this.btseq = btseq;
	}
	public int getCseq() {
		return cseq;
	}
	public void setCseq(int cseq) {
		this.cseq = cseq;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBbody() {
		return bbody;
	}
	public void setBbody(String bbody) {
		this.bbody = bbody;
	}
	public String getBregdate() {
		return bregdate;
	}
	public void setBregdate(String bregdate) {
		this.bregdate = bregdate;
	}
	public String getBfile() {
		return bfile;
	}
	public void setBfile(String bfile) {
		this.bfile = bfile;
	}
	public String getBlike() {
		return blike;
	}
	public void setBlike(String blike) {
		this.blike = blike;
	}
	public ArrayList<ReplyVO> getList() {
		return list;
	}
	public void setList(ArrayList<ReplyVO> list) {
		this.list = list;
	}
	
}
