package com.kosmo.alio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.kosmo.db.DBConnect;

public class BodTypeImp implements BodType {

	public ArrayList<BodTypeVO> bodTypeList(int gseq) {
		//String sql = "select * from bodtype";

		String sql = "(select g.gseq, g.gtitle,  bt.btseq, bt.btname from game g"
				+ " left outer join BODTYPE bt on g.gseq=bt.gseq where g.gseq=?)" 
				+ " union"
				+ " (select g.gseq, g.gtitle,  it.itseq, it.itname "
				+ " from game g"
				+ " left outer join (select gseq, 0 as itseq, '에디터공략' itname from infotype group by gseq) it on  g.gseq=it.gseq"
				+ " where g.gseq=?"
				+ " )"
				+ " order by gseq, btseq";


		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		ArrayList<BodTypeVO> btlist = new ArrayList<BodTypeVO>();
		try {
			conn = db.dbConn();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gseq);
			pstmt.setInt(2, gseq);
			rs = pstmt.executeQuery();

			while(rs.next()){
				BodTypeVO btvo = new BodTypeVO();
				
				btvo.setGseq(rs.getInt("gseq"));
				btvo.setGtitle(rs.getString("gtitle"));
				
				btvo.setBtseq(rs.getInt("btseq"));
				btvo.setBtname(rs.getString("btname"));
				btlist.add(btvo);
			}
			
//			
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				BodTypeVO btvo = new BodTypeVO();
//
//				btvo.setBtname(rs.getString("btname"));
//
//				list.add(btvo);
//			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return btlist;
	}

	public BodTypeVO bodTypeView(int gseq) {

		String sql = "select * from bodtype where gseq=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		
		BodTypeVO btvo = new BodTypeVO();
		
		try {
			conn = db.dbConn();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gseq);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				btvo.setBtseq(rs.getInt("btseq"));
				btvo.setBtname(rs.getString("btname"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return btvo;
	}
	
	public ArrayList<BodTypeVO> bodTypeViewAll() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		
		ArrayList<BodTypeVO> btlist = new ArrayList<BodTypeVO>();
		
		String sql = "select g.gseq, bt.btseq, bt.btname from game g "
					+ "left outer join bodtype bt on g.gseq=bt.gseq order by bt.btseq";
		
		try {
			conn = db.dbConn();
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				BodTypeVO btvo = new BodTypeVO();
				btvo.setGseq(rs.getInt("gseq"));
				btvo.setBtseq(rs.getInt("btseq"));
				btvo.setBtname(rs.getString("btname"));
				btlist.add(btvo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return btlist;
	}
	
	public int bodTypeInsert1(int gseq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnect db = new DBConnect();
		int res = 0;
		
		try {
			conn = db.dbConn();
			String sql = "insert into bodtype values(bodtype_seq.nextval, ?, '추천 게시판')";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gseq);
			
			res = pstmt.executeUpdate();

		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return res;
	}
	
	public int bodTypeInsert2(int gseq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnect db = new DBConnect();
		int res = 0;
		
		try {
			conn = db.dbConn();
			String sql = "insert into bodtype values(bodtype_seq.nextval, ?, '유저공략 게시판')";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gseq);
			
			res = pstmt.executeUpdate();

		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return res;
	}
	
	public int bodTypeInsert3(int gseq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnect db = new DBConnect();
		int res = 0;
		
		try {
			conn = db.dbConn();
			String sql = "insert into bodtype values(bodtype_seq.nextval, ?, '자유 게시판')";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gseq);
			
			res = pstmt.executeUpdate();

		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return res;
	}
	
	public int bodTypeInsert4(int gseq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnect db = new DBConnect();
		int res = 0;
		
		try {
			conn = db.dbConn();
			String sql = "insert into bodtype values(bodtype_seq.nextval, ?, '익명 게시판')";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gseq);
			
			res = pstmt.executeUpdate();

		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return res;
	}
	
	public int bodTypeInsert5(int gseq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnect db = new DBConnect();
		int res = 0;
		
		try {
			conn = db.dbConn();
			String sql = "insert into bodtype values(bodtype_seq.nextval, ?, '야생 게시판')";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gseq);
			
			res = pstmt.executeUpdate();

		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return res;
	}
	
	public int bodTypeInsert6(int gseq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnect db = new DBConnect();
		int res = 0;
		
		try {
			conn = db.dbConn();
			String sql = "insert into bodtype values(bodtype_seq.nextval, ?, '첨부 게시판')";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gseq);
			
			res = pstmt.executeUpdate();

		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return res;
	}
}
