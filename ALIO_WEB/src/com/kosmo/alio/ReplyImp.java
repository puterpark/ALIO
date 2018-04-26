package com.kosmo.alio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.kosmo.db.DBConnect;
import com.kosmo.member.MemberVO;

public class ReplyImp implements Reply {

	@Override
	//2018/02/14  04:25분 경 수정중....
	public ArrayList<WrapperVO> replyList(int bseq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DBConnect db = new DBConnect();
		
		ArrayList<WrapperVO> replyList = new ArrayList<WrapperVO>();
		
		try {
			conn = db.dbConn();
			
			String sql = "select b.bseq, r.rseq, c.cid, r.rbody, to_char(r.rregdate, 'yyyy-mm-dd hh24:mi:ss') as rregdate "
					+ "from reply r, crew c, bod b "
					+ "where r.cseq = c.cseq(+) "
					+ "and b.bseq(+) = r.bseq "
					+ "and b.bseq = ? "
					+ "order by r.rseq";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bseq);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				WrapperVO wvo = new WrapperVO();
				BodVO bvo = new BodVO();
				ReplyVO rvo = new ReplyVO();
				CrewVO cvo = new CrewVO();
				
				bvo.setBseq(rs.getInt("bseq"));
				rvo.setRseq(rs.getInt("rseq"));
				cvo.setCid(rs.getString("cid"));
				rvo.setRbody(rs.getString("rbody"));
				rvo.setRregdate(rs.getString("rregdate"));
				
				wvo.setBvo(bvo);
				wvo.setRvo(rvo);
				wvo.setCvo(cvo);
				replyList.add(wvo);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // 꼭 해줘
			// ------------------------------------
			db.dbClose(rs, pstmt, conn);
			// ------------------------------------
		}

		return replyList;
	}

//	public int replyCount(int bseq) {
//		//카운트 변수
//		int cnt = 0;
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		DBConnect db = new DBConnect();
//
//		try {
//			// ------------------------------------
//			conn = db.dbConn();
//			// ------------------------------------
//
//			String sql = "select count(*) cnt from reply r, bod b where r.bseq = b.bseq and r.bseq=?";
//			pstmt = conn.prepareStatement(sql);
//			//입력받은 파라미터값 박아넣기
//			pstmt.setInt(1, bseq);
//
//			rs = pstmt.executeQuery();
//
//			if (rs.next()) {
//				cnt = rs.getInt("cnt");
//			}
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally { // 꼭 해줘
//			// ------------------------------------
//			db.dbClose(rs, pstmt, conn);
//			// ------------------------------------
//		}
//		return cnt;
//	}

	public int replyUpdate(ReplyVO rvo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int row = 0;
		
		DBConnect db = new DBConnect();
		
		try {
			conn = db.dbConn();

			String sql = "update reply set rbody=? where rseq=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, rvo.getRbody());
			pstmt.setInt(2, rvo.getRseq());
			
			row = pstmt.executeUpdate();
			System.out.println(row + "건을 수정하였습니다!");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return row;
	}

	@Override
	public int replyDelete(int rseq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int row = 0;
		
		DBConnect db = new DBConnect();
		try {
			conn = db.dbConn();
			
			String sql = "delete from reply where rseq=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rseq);
			
			row = pstmt.executeUpdate();
			
			System.out.println(row + "건을 삭제하였습니다!");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return row;
	}

	@Override
	public int replyInsert(WrapperVO rvo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int row = 0;
		
		DBConnect db = new DBConnect();
		
		try {
			conn = db.dbConn();
			String sql = "insert into reply values (reply_seq.nextval, ?, ?, sysdate, ?)";
			pstmt = conn.prepareStatement(sql);
			//wvo.getCvo().getCseq()
			pstmt.setInt(1, rvo.getCvo().getCseq());
			pstmt.setString(2, rvo.getRvo().getRbody());
			pstmt.setInt(3, rvo.getBvo().getBseq());
			
			row = pstmt.executeUpdate();
			System.out.println(row + "건을 추가하였습니다!");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			db.dbClose(pstmt, conn);
		}
		return row;
	}
	
	public int replyInsert(ReplyVO rvo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int row = 0;
		
		DBConnect db = new DBConnect();
		
		try {
			conn = db.dbConn();
			String sql = "insert into reply values (reply_seq.nextval, ?, ?, sysdate, ?)";
			pstmt = conn.prepareStatement(sql);
			//wvo.getCvo().getCseq()
			pstmt.setInt(1, rvo.getCseq());
			pstmt.setString(2, rvo.getRbody());
			pstmt.setInt(3, rvo.getBseq());
			
			row = pstmt.executeUpdate();
			System.out.println(row + "건을 추가하였습니다!");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			db.dbClose(pstmt, conn);
		}
		return row;
	}
}
