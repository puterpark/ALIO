package com.kosmo.alio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class InfoImp implements Info {

	@Override
	public ArrayList<WrapperVO> infoList(int itseq) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		ArrayList<WrapperVO> list = new ArrayList<WrapperVO>();

		try{
			conn = db.dbConn();

			String sql = "select * from info where itseq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, itseq);
			rs = pstmt.executeQuery();

			while(rs.next()){
				WrapperVO wvo = new WrapperVO();
				InfoVO ivo = new InfoVO();
				InfoTypeVO itvo = new InfoTypeVO();
				GameVO gvo = new GameVO();

				ivo.setIseq(rs.getInt("iseq"));
				itvo.setItseq(rs.getInt("itseq"));
				ivo.setItitle(rs.getString("ititle"));
				ivo.setIbody(rs.getString("ibody"));
				ivo.setIregdate(rs.getString("iregdate"));
				gvo.setGseq(rs.getInt("gseq"));
				
				wvo.setIvo(ivo);
				wvo.setGvo(gvo);
				wvo.setItvo(itvo);
				
				list.add(wvo);
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
	public int infoInsert(WrapperVO wvo) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnect db = new DBConnect();
		int rows = 0;
		
		try{
			conn = db.dbConn();
			
			String sql = "insert into info values (info_seq.nextval, ?, ?, ?, sysdate, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, wvo.itvo.getItseq());
			pstmt.setString(2, wvo.ivo.getItitle());
			pstmt.setString(3, wvo.ivo.getIbody());
			pstmt.setInt(4, wvo.gvo.getGseq());
			
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
	public int infoUpdate(InfoVO ivo) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnect db = new DBConnect();
		int rows = 0;
		
		try{
			conn = db.dbConn();

			String sql = "update info set ititle=?, ibody=? where iseq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ivo.getItitle());
			pstmt.setString(2, ivo.getIbody());
			pstmt.setInt(3, ivo.getIseq());

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
	public int infoDelete(int iseq) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnect db = new DBConnect();
		int rows = 0;
		
		try{
			conn = db.dbConn();
			
			String sql = "delete from info where iseq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, iseq);
			
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
	
	
	public InfoVO infoView(int iseq) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnect db = new DBConnect();
		ResultSet rs = null;
		InfoVO ivo = new InfoVO();
		
		try{
			conn = db.dbConn();
			
			String sql = "select * from info where iseq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, iseq);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
			
			ivo.setItitle(rs.getString("ititle"));
			ivo.setIbody(rs.getString("ibody"));
			ivo.setIseq(rs.getInt("iseq"));
			
			}
			
		} 
		catch(SQLException e){
			e.printStackTrace();
		}
		finally {
			db.dbClose(pstmt, conn);
		}
		return ivo;
	}
	
}
