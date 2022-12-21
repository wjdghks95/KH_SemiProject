package or.com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import or.com.member.MemberBean;
import or.com.member.MemberMgr;

/*  
 * 로그인
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		String pwd = request.getParameter("password");
		
		MemberMgr mMgr = new MemberMgr();
		MemberBean bean = mMgr.loginMember(email, pwd);
		
		if(bean == null) {
			response.sendRedirect("login.jsp?error=true");			
		} else {
			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(1800);
			session.setAttribute("key", bean.getMember_id());
			response.sendRedirect("index.jsp");
		}
	}
}
