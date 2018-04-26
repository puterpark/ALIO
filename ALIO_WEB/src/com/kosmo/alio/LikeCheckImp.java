package com.kosmo.alio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.kosmo.db.DBConnect;

public class LikeCheckImp implements LikeCheck {

	
	public ArrayList<LikeCheckVO> likeCheckList(int bseq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DBConnect db = new DBConnect();
		
		ArrayList<LikeCheckVO> likeCheckList = new ArrayList<LikeCheckVO>();
		
		try {
			conn = db.dbConn();
			
			String sql = "select * from likecheck where bseq=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bseq);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				WrapperVO wvo = new WrapperVO();
				BodVO bvo = new BodVO();
				CrewVO cvo = new CrewVO();
				LikeCheckVO lvo = new LikeCheckVO();
				
				lvo.setBseq(rs.getInt("bseq"));
				lvo.setCseq(rs.getInt("cseq"));
				lvo.setLcheck(rs.getString("lcheck"));
				
				likeCheckList.add(lvo);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // 꼭 해줘
			// ------------------------------------
			db.dbClose(rs, pstmt, conn);
			// ------------------------------------
		}

		return likeCheckList;
	}
	
	@Override
	//좋아요 입력 매서드
	public int likeCheckInsert(WrapperVO wvo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		
		DBConnect db = new DBConnect();

		try {
			conn = db.dbConn();
			
			//cid,bseq값은 가져옴
			String sql = "insert into likecheck values (?, ?, 'y')";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,	 wvo.getCvo().getCseq());
			pstmt.setInt(2, wvo.getBvo().getBseq());
			//pstmt.setString(3, vo.getMname());
			
//			wvo.getCvo(cvo);
//			wvo.getBvo();

			rows = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return rows;
	}

	@Override
	//좋아요 카운트 매서드
	public int likeCheckCount(int bseq){
		
		//카운트 변수
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnect db = new DBConnect();
		int cnt = 0;

		String sql = "select count(*) as cnt from likecheck l, bod b where l.bseq = b.bseq and l.bseq=?";
		
		try {
			// ------------------------------------
			conn = db.dbConn();
			// ------------------------------------
			
			pstmt = conn.prepareStatement(sql);
			//입력받은 파라미터값 박아넣기
			pstmt.setInt(1, bseq);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt("cnt");
				System.out.println(cnt);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // 꼭 해줘
			// ------------------------------------
			db.dbClose(rs, pstmt, conn);
			// ------------------------------------
		}
		return cnt;
	}

	
}
