package or.com.servlet.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import or.com.board.BoardMgr;
import or.com.member.MemberMgr;


@WebServlet("/menuDuplicateChk.do")
public class MenuDuplicateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String menu = request.getParameter("menu");
		BoardMgr bMgr = new BoardMgr();
		boolean result = bMgr.existsByMenu(menu);
		response.getWriter().print(result);
	}

}
