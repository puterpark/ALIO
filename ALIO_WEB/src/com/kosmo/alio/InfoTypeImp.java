package com.kosmo.alio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class InfoTypeImp implements InfoType {

	@Override
	public ArrayList<InfoTypeVO> infoTypeList(int gseq) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		ArrayList<InfoTypeVO> list = new ArrayList<InfoTypeVO>();

		try{
			conn = db.dbConn();
			
			
			String sql = "select it.itseq, it.itname "
					+ "from infotype it, game g "
					+ "where it.gseq = g.gseq(+) "
					+ "and g.gseq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gseq);
			
			rs = pstmt.executeQuery();

			while(rs.next()){
				InfoTypeVO itvo = new InfoTypeVO();
				itvo.setItseq(rs.getInt("itseq"));
				itvo.setItname(rs.getString("itname"));
				//itvo.setGseq(rs.getInt("gseq"));
				list.add(itvo);
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
	public int infoTypeInsert(WrapperVO wvo) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnect db = new DBConnect();
		int rows = 0;
		
		try{
			conn = db.dbConn();
			
			String sql = "insert into infotype values(infotype_seq.nextval,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, wvo.getItvo().getItname());
			pstmt.setInt(2, wvo.getItvo().getGseq());
			
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
	public int infoTypeUpdate(InfoTypeVO itvo) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnect db = new DBConnect();
		int rows = 0;
		
		try{
			conn = db.dbConn();

			String sql = "Update infotype set itname=? where itseq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, itvo.getItname());
			pstmt.setInt(2, itvo.getItseq());

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
	public int infoTypeDelete(int itseq) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnect db = new DBConnect();
		int rows = 0;
		
		try{
			conn = db.dbConn();
			
			String sql = "delete from infotype where itseq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, itseq);
			
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

	public ArrayList<InfoTypeVO> infoTypeView(int gseq) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		ArrayList<InfoTypeVO> list = new ArrayList<InfoTypeVO>();

		try{
			conn = db.dbConn();
			
			String sql = "select * from infotype where gseq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gseq);
			
			rs = pstmt.executeQuery();

			while(rs.next()){
				InfoTypeVO itvo = new InfoTypeVO();
				itvo.setItseq(rs.getInt("itseq"));
				itvo.setItname(rs.getString("itname"));
				list.add(itvo);
			}

		} catch(SQLException e){
			e.printStackTrace();
		}
		finally {
			db.dbClose(rs, pstmt, conn);
		}

		return list;
	}
	
	public ArrayList<InfoTypeVO> infoTypeListAll(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		
		ArrayList<InfoTypeVO> list = new ArrayList<InfoTypeVO>();
				
		String sql = "select * from infotype";
		try {

			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				InfoTypeVO itvo = new InfoTypeVO();
				itvo.setGseq(rs.getInt("gseq"));
				itvo.setItname(rs.getString("itname"));
				itvo.setItseq(rs.getInt("itseq"));
				list.add(itvo);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
}
