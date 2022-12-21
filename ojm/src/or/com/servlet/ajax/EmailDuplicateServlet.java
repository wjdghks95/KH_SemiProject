package or.com.servlet.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import or.com.member.MemberMgr;

/*
 * 이메일 중복 체크 	
 */
@WebServlet("/emailDuplicateChk.do")
public class EmailDuplicateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		MemberMgr mMgr = new MemberMgr();
		boolean result = mMgr.existsByEmail(email);
		response.getWriter().print(result);
	}

}
