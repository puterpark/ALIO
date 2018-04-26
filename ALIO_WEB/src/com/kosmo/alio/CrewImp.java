package com.kosmo.alio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CrewImp implements Crew {

	@Override
	public CrewVO login(CrewVO cvo) {
		// TODO Auto-generated method stub
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DBConnect db = new DBConnect();
		
		try {
			conn = db.dbConn();
			String sql = "select ctype, cname, cseq from crew where cid=? and cpw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cvo.getCid());
			pstmt.setString(2, cvo.getCpw());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cvo.setCname(rs.getString("cname"));
				cvo.setCtype(rs.getString("ctype"));
				cvo.setCseq(rs.getInt("cseq"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
			
		return cvo;
	
	}

	@Override
	public ArrayList<CrewVO> crewList(int sseq, int mseq) {
		// TODO Auto-generated method stub

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select rnum, cseq, cid, cpw, cname, ctype, cphone, cregdate "
				   + "from (select rownum as rnum,cseq,cid,cpw,cname,ctype,cphone,cregdate from crew order by cseq asc)t "
				   + "where rnum >= ? and rnum <=? order by rnum asc";
		DBConnect db = new DBConnect();
		ArrayList<CrewVO> list = new ArrayList<CrewVO>();
		
		try {
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sseq);
			pstmt.setInt(2, mseq);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				CrewVO cvo = new CrewVO();
				cvo.setCseq(rs.getInt("cseq"));
				cvo.setCid(rs.getString("cid"));
				cvo.setCpw(rs.getString("cpw"));
				cvo.setCtype(rs.getString("ctype"));
				cvo.setCname(rs.getString("cname"));
				cvo.setCphone(rs.getString("cphone"));
				cvo.setCregdate(rs.getString("cregdate"));
				
//				wvo.setCvo(cvo);
				list.add(cvo);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return list;
	}
	
	
	public ArrayList<CrewVO> crewList() {
		// TODO Auto-generated method stub

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * "
				   + "from crew "
				   + "order by cseq";
		DBConnect db = new DBConnect();
		ArrayList<CrewVO> list = new ArrayList<CrewVO>();
		
		try {
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				CrewVO cvo = new CrewVO();
				cvo.setCseq(rs.getInt("cseq"));
				cvo.setCid(rs.getString("cid"));
				cvo.setCpw(rs.getString("cpw"));
				cvo.setCtype(rs.getString("ctype"));
				cvo.setCname(rs.getString("cname"));
				cvo.setCphone(rs.getString("cphone"));
				cvo.setCregdate(rs.getString("cregdate"));
				
//				wvo.setCvo(cvo);
				list.add(cvo);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return list;
	}

	@Override
	public int crewCount() {
		// TODO Auto-generated method stub
		
		int cnt = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select count(*) cnt from crew";

		DBConnect db = new DBConnect();

		try {
			conn = db.dbConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
				cnt = rs.getInt("cnt");
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return cnt;
		
	}

	@Override
	public int crewUpdate(CrewVO cvo) {
		// TODO Auto-generated method stub
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnect db = new DBConnect();
		
		int res=0;
		try {
			conn = db.dbConn();
			String sql = "Update crew set cpw=?, cphone=? where cseq=?";
			pstmt = conn.prepareStatement(sql);
			
			System.out.println(cvo.getCpw());
			System.out.println(cvo.getCname());
			
			pstmt.setString(1, cvo.getCpw());
			pstmt.setString(2, cvo.getCphone());
			pstmt.setInt(3, cvo.getCseq());
			
			res = pstmt.executeUpdate();

		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
		return res;
		
	}
	
	public int crewTypeUpdate(CrewVO cvo) {
		// TODO Auto-generated method stub
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnect db = new DBConnect();
		
		int res=0;
		try {
			conn = db.dbConn();
			String sql = "Update crew set ctype=? where cseq=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cvo.getCtype());
			pstmt.setInt(2, cvo.getCseq());
			
			res = pstmt.executeUpdate();

		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
		return res;
		
	}
	
	@Override
	public int crewDeleteForAjax(int cseq, String cpw) {
		// TODO Auto-generated method stub
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnect db = new DBConnect();

		int res=0;
		
		try {
			
			conn = db.dbConn();
			String sql = "delete from crew where cseq=? and cpw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cseq);		
			pstmt.setString(2, cpw);		
			res = pstmt.executeUpdate();

		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
		return res;
	}

	
	@Override
	public int crewDelete(int cseq) {
		// TODO Auto-generated method stub
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnect db = new DBConnect();

		int res=0;
		
		try {
			
			conn = db.dbConn();
			String sql = "delete from crew where cseq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cseq);		

			res = pstmt.executeUpdate();

		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
		return res;
	}

	@Override
	public int crewInsert(CrewVO cvo) {
		// TODO Auto-generated method stub
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnect db = new DBConnect();
		int res = 0;
		try {
			conn = db.dbConn();
			String sql = "insert into crew "
					   + "values(crew_seq.nextval,?,?,?,?,'u', sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cvo.getCid());
			pstmt.setString(2, cvo.getCpw());
			pstmt.setString(3, cvo.getCname());
			pstmt.setString(4, cvo.getCphone());
			res = pstmt.executeUpdate();


		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return res;
	}

	@Override
	public CrewVO crewDetail(int cseq) {
		// TODO Auto-generated method stub

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		CrewVO cvo = new CrewVO();
		
		try {
			
			conn = db.dbConn();
			String sql = "select cseq,cid,cname,cphone,ctype,cregdate from crew where cseq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cseq);
			rs = pstmt.executeQuery();
			
			if (rs.next()){
				cvo.setCseq(rs.getInt("cseq"));
				cvo.setCid(rs.getString("cid"));
				cvo.setCname(rs.getString("cname"));
				cvo.setCphone(rs.getString("cphone"));
				cvo.setCtype(rs.getString("ctype"));
				cvo.setCregdate(rs.getString("cregdate"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return cvo;
	}

}
