package or.com.menu;

import java.sql.*;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import or.com.board.BoardBean;
import or.com.db.DBConnectionMgr;

public class MenuMgr {
	
	private DBConnectionMgr pool;
	
	public MenuMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public void insertMenu(Long id, String menu, String date) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			sql = "INSERT INTO menu VALUES(?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, id);
			pstmt.setString(2, menu);
			pstmt.setString(3, date);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	public boolean existsById(Long id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean result = false;
		
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM menu WHERE menu_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, id);
			if(pstmt.executeUpdate() != 0) {
				result = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return result;
	}
	
	public ArrayList<MenuBean> getMenuList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ArrayList<MenuBean> mList = new ArrayList<>();
		
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM menu";
			pstmt = con.prepareStatement(sql);	
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MenuBean bean = new MenuBean();
				bean.setMenu_id(rs.getLong(1));
				bean.setName(rs.getString(2));
				bean.setCreated_date(rs.getString(3));
				
				mList.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return mList;
	}
}
