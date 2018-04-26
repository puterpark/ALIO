package com.kosmo.alio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BodImp implements Bod {

	public ArrayList<WrapperVO> bodDetail(int bseq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		
		String sql = "select b.bseq, b.btitle, b.bbody, c.cid, to_char(b.bregdate, 'MM/DD') bregdate from bod b, crew c where b.cseq = c.cseq and b.bseq=?";
		ArrayList<WrapperVO> list = new ArrayList<WrapperVO>();
		try {
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bseq);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				WrapperVO wvo = new WrapperVO();
				BodVO bvo = new BodVO();
				CrewVO cvo = new CrewVO();
				
				bvo.setBseq(rs.getInt("bseq"));
				bvo.setBtitle(rs.getString("btitle"));
				bvo.setBbody(rs.getString("bbody"));
				cvo.setCid(rs.getString("cid"));
				bvo.setBregdate(rs.getString("bregdate"));
				
				wvo.setBvo(bvo);
				wvo.setCvo(cvo);
				list.add(wvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
	public WrapperVO bodView(int bseq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DBConnect db = new DBConnect();
		
		WrapperVO wvo = new WrapperVO();
		GameVO gvo = new GameVO();
		BodVO bvo = new BodVO();
		CrewVO cvo = new CrewVO();
		ReplyVO rvo = new ReplyVO();
		LikeCheckVO lvo = new LikeCheckVO();
		BodTypeVO btvo = new BodTypeVO();
		
		try {
			conn = db.dbConn();
			
			String sql = 	"select b.*"
					        +" , (select count(1) from reply where bseq = b.bseq) rcnt"
					        +" , (select count(1) from likecheck where bseq = b.bseq) lcnt"
					        +" from "
					        +" ("
					        +" select g.gseq, b.bseq, bt.btseq, b.btitle, b.bbody, c.cid, b.bfile, to_char(b.bregdate, 'yyyy-mm-dd hh24:mi:ss') as bregdate"
					        +" from game g inner join bod b on g.gseq = b.gseq"
					        +"             inner join bodtype bt on b.btseq = bt.btseq"
					        +"             inner join crew c on c.cseq = b.cseq"
					        +" where b.bseq = ?"
					        +" ) b"
					        +" order by b.bseq desc";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bseq);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				gvo.setGseq(rs.getInt("gseq"));
				bvo.setBseq(rs.getInt("bseq"));
				btvo.setBtseq(rs.getInt("btseq"));
				bvo.setBtitle(rs.getString("btitle"));
				bvo.setBbody(rs.getString("bbody"));
				cvo.setCid(rs.getString("cid"));
				bvo.setBfile(rs.getString("bfile"));
				bvo.setBregdate(rs.getString("bregdate"));
				rvo.setRcnt(rs.getInt("rcnt"));
				lvo.setLcnt(rs.getInt("lcnt"));
				
				wvo.setGvo(gvo);
				wvo.setBvo(bvo);
				wvo.setBtvo(btvo);
				wvo.setCvo(cvo);
				wvo.setRvo(rvo);
				wvo.setLcvo(lvo);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return wvo;
	}

	@Override
	public ArrayList<WrapperVO> bodList(int sseq, int eseq, int gseq, int btseq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DBConnect db = new DBConnect();
		
		ArrayList<WrapperVO> list = new ArrayList<WrapperVO>();
		
		try {
			conn = db.dbConn();
						
			String sql = "select pt.*"
						+" from"   
						+" ("
						+"    select rownum rnum, t.*" 
						+"    from ("
						+"        select b.*"
						+"        , (select count(1) from reply where  bseq = b.bseq) rcnt"
						+"        , (select count(1) from likecheck where  bseq = b.bseq) lcnt"
						+"        from" 
						+"        ("
						+"        select g.gseq, b.bseq, bt.btseq, b.btitle, b.bbody, c.cid, b.bfile, to_char(b.bregdate, 'MM/DD') as bregdate"
						+"        from game g inner join bod b on g.gseq = b.gseq"
						+"                    inner join bodtype bt on b.btseq = bt.btseq"
						+"                    inner join crew c on c.cseq = b.cseq";
			
			if(btseq > 0) {
				sql += 			" where g.gseq = ?"
				        		+" and bt.btseq = ?"
				        		+" ) b"
						        +" order by b.bseq desc"
						        +" ) t"
				        +" ) pt"
				+" where rnum between ? and ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, gseq);
				pstmt.setInt(2, btseq);
				pstmt.setInt(3, sseq);
				pstmt.setInt(4, eseq);
			} else{
				sql += 			" where g.gseq = ?"
								+" ) b" 
						        +" order by b.bseq desc"
						        +" ) t"
			        	+" ) pt"
	        	+" where rnum between ? and ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, gseq);
				pstmt.setInt(2, sseq);
				pstmt.setInt(3, eseq);
			}
					
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				WrapperVO wvo = new WrapperVO();
				GameVO gvo = new GameVO();
				BodVO bvo = new BodVO();
				CrewVO cvo = new CrewVO();
				ReplyVO rvo = new ReplyVO();
				LikeCheckVO lvo = new LikeCheckVO();
				BodTypeVO btvo = new BodTypeVO();
				
				gvo.setGseq(rs.getInt("gseq"));
				bvo.setBseq(rs.getInt("bseq"));
				btvo.setBtseq(rs.getInt("btseq"));
				bvo.setBtitle(rs.getString("btitle"));
				bvo.setBbody(rs.getString("bbody"));
				cvo.setCid(rs.getString("cid"));
				bvo.setBfile(rs.getString("bfile"));
				bvo.setBregdate(rs.getString("bregdate"));
				rvo.setRcnt(rs.getInt("rcnt"));
				lvo.setLcnt(rs.getInt("lcnt"));
				
				
				wvo.setGvo(gvo);
				wvo.setBvo(bvo);
				wvo.setBtvo(btvo);
				wvo.setCvo(cvo);
				wvo.setRvo(rvo);
				wvo.setLcvo(lvo);
				list.add(wvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}

	@Override
	public int bodCount(int gseq, int btseq) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DBConnect db = new DBConnect();
		
		try {
			conn = db.dbConn();
			
			String sql = "select count(*) as cnt from bod b, bodtype bt, game g where b.btseq(+) = bt.btseq and b.gseq = g.gseq(+)";
//			pstmt = conn.prepareStatement(sql);
			
			if(btseq > 0) {
				sql += "and g.gseq = ? and bt.btseq = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, gseq);
				pstmt.setInt(2, btseq);
			} else {
				pstmt = conn.prepareStatement(sql);
			}
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt  = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return cnt;
	}

	@Override
	public int bodNonFileUpdate(BodVO bvo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnect db = new DBConnect();
		String sql = "update bod set btseq=?, btitle=?, bbody=? where bseq=?";
		int bnfu = 0;
		try {
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bvo.getBtseq());
			pstmt.setString(2, bvo.getBtitle());
			pstmt.setString(3, bvo.getBbody());
			pstmt.setInt(4, bvo.getBseq());
			
			bnfu = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return bnfu;
	}

	@Override
	public int bodUpdate(BodVO bvo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		DBConnect db = new DBConnect();
		int bu = 0;
		
		try {
			conn = db.dbConn();
			String sql = "update bod set btitle=?, bbody=?, bfile=? where bseq=?";
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(1, bvo.getBtitle());
			pstmt.setString(2, bvo.getBbody());
			pstmt.setString(3, bvo.getBfile());
			pstmt.setInt(4, bvo.getBseq());
			
			bu = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return bu;
	}

	@Override
	public int bodDelete(int bseq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		DBConnect db = new DBConnect();
		int bd = 0;
		
		try {
			conn = db.dbConn();
			String sql = "delete from bod where bseq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bseq);
			
			bd = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return bd;
	}

	@Override
	public int bodInsert(BodVO bvo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int bi = 0;
		
		DBConnect db = new DBConnect();
		
		try{
			conn = db.dbConn();
			String sql = "insert into bod values (bod_seq.nextval, ?, ?, ?, ?, ?, sysdate, ?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bvo.getGseq());
			pstmt.setInt(2, bvo.getBtseq());
			pstmt.setInt(3, bvo.getCseq());
			pstmt.setString(4, bvo.getBtitle());
			pstmt.setString(5, bvo.getBbody());
			pstmt.setString(6, bvo.getBfile());
			
			bi = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
		return bi;
	}
	
	public ArrayList<BodVO> bodAllList() {
		String sql = "select * from bod";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;                                     
		DBConnect db = new DBConnect();
		ArrayList<BodVO> list = new ArrayList<BodVO>();
		try {
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BodVO bvo = new BodVO();
				
				bvo.setBseq(rs.getInt("bseq"));
				bvo.setGseq(rs.getInt("gseq"));
				bvo.setBtseq(rs.getInt("btseq"));
				bvo.setCseq(rs.getInt("cseq"));
				bvo.setBtitle(rs.getString("btitle"));
				bvo.setBbody(rs.getString("bbody"));
				bvo.setBregdate(rs.getString("bregdate"));
				bvo.setBfile(rs.getString("bfile"));

				list.add(bvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
	public int bodGoodUpdate(BodVO bvo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		DBConnect db = new DBConnect();
		int bu = 0;
		
		try {
			conn = db.dbConn();
			String sql = "update bod set btseq=? where bseq=?";
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setInt(1, bvo.getBtseq());
			pstmt.setInt(2, bvo.getBseq());
			
			bu = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return bu;
	}

}
