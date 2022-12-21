package or.com.board;

import java.sql.*;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import or.com.db.DBConnectionMgr;

public class BoardMgr {

	private DBConnectionMgr pool;
	
	public BoardMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public void insertBoard(HttpServletRequest request, Long id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			sql = "INSERT INTO board VALUES(SEQ_BOARD.NEXTVAL, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("menu"));
			pstmt.setString(2, request.getParameter("content"));
			pstmt.setString(3, request.getParameter("address"));
			pstmt.setLong(4, id);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	public ArrayList<BoardBean> getBoardList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ArrayList<BoardBean> bList = new ArrayList<>();
		
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setBoard_id(rs.getLong(1));
				bean.setMenu(rs.getString(2));
				bean.setContent(rs.getString(3));
				bean.setAddress(rs.getString(4));
				bean.setViews(rs.getInt(5));
				bean.setCount(rs.getInt(6));
				bean.setCreated_date(rs.getString(7));
				bean.setMember_id(rs.getLong(8));
				
				bList.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bList;
	}
	
	public ArrayList<BoardBean> pagingBoardList(String keyword, int start, int end) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ArrayList<BoardBean> bList = new ArrayList<>();
		
		try {
			con = pool.getConnection();
			if(keyword.equals("null") || keyword.equals("")) {
				sql = "SELECT BT2.* FROM (SELECT ROWNUM R1, BT1.* "
						+ "FROM (SELECT * FROM board ORDER BY created_date DESC)BT1)BT2 "
						+ "WHERE R1 >= ? AND R1 <= ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else {
				sql = "SELECT BT2.* FROM (SELECT ROWNUM R1, BT1.* "
						+ "FROM (SELECT * FROM board ORDER BY created_date DESC)BT1 WHERE "
						+"menu like ?)BT2 WHERE R1 >= ? AND R1 <= ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+keyword+"%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setBoard_id(rs.getLong("board_id"));
				bean.setMenu(rs.getString("menu"));
				bean.setContent(rs.getString("content"));
				bean.setAddress(rs.getString("address"));
				bean.setViews(rs.getInt("views"));
				bean.setCount(rs.getInt("count"));
				bean.setCreated_date(rs.getString("created_date"));
				bean.setMember_id(rs.getLong("member_id"));
				
				bList.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bList;
	}
	
	public BoardBean getBoard(Long id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BoardBean bean = null;
		
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM board WHERE board_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bean = new BoardBean();
				bean.setBoard_id(rs.getLong(1));
				bean.setMenu(rs.getString(2));
				bean.setContent(rs.getString(3));
				bean.setAddress(rs.getString(4));
				bean.setViews(rs.getInt(5));
				bean.setCount(rs.getInt(6));
				bean.setCreated_date(rs.getString(7).substring(11, rs.getString(7).length()-3));
				bean.setBoard_id(rs.getLong(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}

	public int sumCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int result = 0;
		
		try {
			con = pool.getConnection();
			sql = "SELECT SUM(count) FROM board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return result;
	}
	
	public void updateCount(String menu) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			sql = "UPDATE board SET count = count + 1 WHERE menu = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, menu);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	public void updateViews(Long id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			sql = "UPDATE board SET views = views + 1 WHERE board_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, id);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	public boolean existsByMenu(String menu) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean result = false;
		
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM board WHERE menu = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, menu);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con,pstmt, rs);
		}
		return result;
	}
	
	public int getTotalCount(String keyword) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		int totalCount = 0;
		
		try {
			con = pool.getConnection();	
			if(keyword.equals("null") || keyword.equals("")) {
				sql = "SELECT count(*) FROM board";
				pstmt = con.prepareStatement(sql);
			} else {
				sql = "SELECT count(*) FROM board WHERE menu LIKE ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+keyword+"%");
			}
			rs = pstmt.executeQuery();
			if(rs.next())
				totalCount = rs.getInt(1);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return totalCount;
	}

	public void deleteAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			sql = "DELETE FROM board";
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
}
