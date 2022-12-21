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
import or.com.menu.MenuBean;
import or.com.menu.MenuMgr;

/*  
 * 타이머 종료시 메뉴를 저장
 */
@WebServlet("/end.do")
public class EndTimer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String menu = request.getParameter("menu");
		new MenuMgr().insertMenu(menu);
	}

}
