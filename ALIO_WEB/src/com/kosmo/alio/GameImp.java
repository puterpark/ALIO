package com.kosmo.alio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GameImp implements Game {

	@Override
	public ArrayList<GameVO> gameList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		ArrayList<GameVO> list = new ArrayList<GameVO>();
		
		try{
			conn = db.dbConn();

			String sql = "select gseq, gtitle from game order by gseq";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()){
				GameVO gvo = new GameVO();
				gvo.setGseq(rs.getInt("gseq"));
				gvo.setGtitle(rs.getString("gtitle"));
				list.add(gvo);
			}

		} catch(SQLException e){
			e.printStackTrace();
		}
		finally {
			db.dbClose(rs, pstmt, conn);
		}

		return list;
	}

	@Override
	public int gameInsert(GameVO gvo) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnect db = new DBConnect();
		int rows = 0;
		
		try{
			conn = db.dbConn();
			
			String sql = "insert into game(gseq,gtitle) values(game_seq.nextval,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gvo.getGtitle());
			
			rows = pstmt.executeUpdate();
			
		} 
		catch(SQLException e){
			e.printStackTrace();
		}
		finally {
			db.dbClose(pstmt, conn);
		}
		return rows;
	}

	@Override
	public int gameUpdate(GameVO gvo) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnect db = new DBConnect();
		int rows = 0;
		
		try{
			conn = db.dbConn();

			String sql = "Update game set gtitle=? where gseq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gvo.getGtitle());
			pstmt.setInt(2, gvo.getGseq());

			rows = pstmt.executeUpdate();

		} 
		catch(SQLException e){
			e.printStackTrace();
		}
		finally {
			db.dbClose(pstmt, conn);
		}
		return rows;
	}

	@Override
	public int gameDelete(int gseq) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnect db = new DBConnect();
		int rows = 0;
		
		try{
			conn = db.dbConn();
			
			String sql = "delete from game where gseq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gseq);
			
			rows = pstmt.executeUpdate();
			
		} 
		catch(SQLException e){
			e.printStackTrace();
		}
		finally {
			db.dbClose(pstmt, conn);
		}
		return rows;
	}

	public GameVO gameDetail(int gseq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		GameVO gvo = new GameVO();
		
		try{
			conn = db.dbConn();
			
			String sql = "select * from game where gseq=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gseq);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				gvo.setGseq(rs.getInt("gseq"));
				gvo.setGtitle(rs.getString("gtitle"));
			}
			
		} catch(SQLException e){
			e.printStackTrace();
		}
		finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return gvo;
	}
	
}

