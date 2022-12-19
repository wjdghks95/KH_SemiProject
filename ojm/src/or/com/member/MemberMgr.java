package or.com.member;

import java.sql.*;

import javax.servlet.http.HttpServletRequest;

import or.com.db.DBConnectionMgr;

public class MemberMgr {
	private DBConnectionMgr pool;
	
	
	public MemberMgr() {
		pool = DBConnectionMgr.getInstance();
	}

	// 회원가입
	public void insertMember(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			sql = "INSERT INTO member VALUES(SEQ_MEMBER.NEXTVAL, ?, ?, ?, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, req.getParameter("id"));
			pstmt.setString(2, req.getParameter("password"));
			pstmt.setString(3, req.getParameter("name"));
			pstmt.setString(4, req.getParameter("birthday"));
			pstmt.setString(5, req.getParameter("gender"));
			pstmt.setString(6, req.getParameter("email"));			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con,pstmt);
		}	
	}

	// 로그인
	public MemberBean loginMember(String email, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		MemberBean bean = null;
		
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM member WHERE email = ? and password = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bean = new MemberBean();
				bean.setMember_id(rs.getLong(1));
				bean.setId(rs.getString(2));
				bean.setPassword(rs.getString(3));
				bean.setName(rs.getString(4));
				bean.setBirthday(rs.getString(5).substring(0, 11));
				bean.setGender(rs.getString(6).charAt(0));
				bean.setEmail(rs.getString(7));
				bean.setVote_chk(rs.getString(8).charAt(0));
				bean.setBoard_chk(rs.getString(9).charAt(0));
				bean.setCreated_date(rs.getString(10).substring(0, rs.getString(10).length()-4));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con,pstmt, rs);
		}
		return bean;
	}

	public boolean existsByEmail(String email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean result = false;
		
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM member WHERE email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
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

	public boolean existsById(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean result = false;
		
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM member WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
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

}
