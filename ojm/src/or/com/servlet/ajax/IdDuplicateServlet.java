package or.com.servlet.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import or.com.member.MemberMgr;

/*  
 * 아이디 중복 체크
 */
@WebServlet("/idDuplicateChk.do")
public class IdDuplicateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		MemberMgr mMgr = new MemberMgr();
		boolean result = mMgr.existsById(id);
		response.getWriter().print(result);
	}

}
