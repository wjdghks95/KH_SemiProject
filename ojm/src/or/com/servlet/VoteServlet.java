package or.com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import or.com.board.BoardMgr;
import or.com.member.MemberMgr;

/*  
 * 투표하기
 */
@WebServlet("/vote")
public class VoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String menuList = request.getParameter("menu");
		String[] menuArr = menuList.split(",");
		
		BoardMgr bMgr = new BoardMgr();
		for(String menu : menuArr) {
			bMgr.updateCount(menu);
		}
		
		HttpSession session = request.getSession();
		Long id = (Long) session.getAttribute("key");
		
		MemberMgr mMgr = new MemberMgr();
		mMgr.updateVoteChk(id);
		
		response.sendRedirect("index.jsp");
	}

}
