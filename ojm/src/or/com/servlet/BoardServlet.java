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
 * 게시글 작성 	
 */
@WebServlet("/newBoard")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Long id = (Long) session.getAttribute("key");
		
		BoardMgr bMgr = new BoardMgr();
		bMgr.insertBoard(request, id);			
		
		MemberMgr mMgr = new MemberMgr();
		mMgr.updateBoardChk(id);
		
		response.sendRedirect("index.jsp");
	}

}
