package or.com.servlet.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import or.com.board.BoardMgr;
import or.com.member.MemberMgr;

/*  
 * 타이머 시작시 게시글 전체 삭제
 */
@WebServlet("/start.do")
public class StartTimer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		new BoardMgr().deleteAll();
		new MemberMgr().initVoteAndBoard();
	}

}
