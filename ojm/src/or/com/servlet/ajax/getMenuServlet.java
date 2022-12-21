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
import or.com.menu.MenuMgr;

/*  
 * 시간 경과 후 득표수가 가장 큰 메뉴 반환
 */
@WebServlet("/getMenu.do")
public class getMenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardMgr bMgr = new BoardMgr();
		ArrayList<BoardBean> bList = bMgr.getBoardList();
		if(!bList.isEmpty()) {
			BoardBean bean = bList.stream().max((c1, c2) -> 
				Integer.compare(c1.getCount(), c2.getCount())).get();
			String menu = bean.getMenu();
						
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(menu);
		}
	}

}
