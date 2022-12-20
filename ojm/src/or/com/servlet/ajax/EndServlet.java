package or.com.servlet.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import or.com.board.BoardBean;
import or.com.board.BoardMgr;
import or.com.member.MemberMgr;
import or.com.menu.MenuMgr;

@WebServlet("/end.do")
public class EndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardMgr bMgr = new BoardMgr();
		ArrayList<BoardBean> bList = bMgr.getBoardList();
		if(!bList.isEmpty()) {
			BoardBean bean = bList.stream().max((c1, c2) -> 
				Integer.compare(c1.getCount(), c2.getCount())).get();
			Long id = bean.getBoard_id();
			String menu = bean.getMenu();
			String date = bean.getCreated_date().substring(0, 11);
			
			MenuMgr mMgr = new MenuMgr();
			if(!mMgr.existsById(id)) {
				mMgr.insertMenu(id, menu, date);
			}
			
			MemberMgr memMgr = new MemberMgr();
			memMgr.initVoteAndBoard();
			
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(menu);
		}
	}

}
