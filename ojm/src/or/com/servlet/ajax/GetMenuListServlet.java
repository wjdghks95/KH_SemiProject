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

@WebServlet("/getMenuList.do")
public class GetMenuListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String date = request.getParameter("date");
		month = month.length() < 2 ? "0" + month : month;
		date = date.length() < 2 ? "0" + date : date;
		
		String time = year + "-" + month + "-" + date;
		
		MenuMgr mMgr = new MenuMgr();
		String name = "";
		ArrayList<MenuBean> mList = mMgr.getMenuList();
		for(MenuBean bean : mList) {
			if(bean.getCreated_date().substring(0, 10).equals(time)) {
				name = bean.getName();
			}
		}
		
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(name);
	}

}
