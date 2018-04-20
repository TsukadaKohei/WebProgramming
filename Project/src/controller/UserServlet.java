package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import model.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
    }

	/**

	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				HttpSession session = request.getSession();
				User u = (User)session.getAttribute("userInfo");
			     if(u == null)
			     {
			         response.sendRedirect("LoginServlet");
			         return;
			     }




				UserDao userDao = new UserDao();
				List<User> userList = userDao.findAll();


				request.setAttribute("userList", userList);




				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/user.jsp");
				dispatcher.forward(request, response);
	}
	/**
	 *
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8"); //文字化け防止
		String loginId = request.getParameter("loginId");
		String name = request.getParameter("name");
		String  birthDate1 = request.getParameter("birthDate1");
		String  birthDate2 = request.getParameter("birthDate2");

				UserDao userDao = new UserDao();
				List<User> userList = userDao.findSearch(loginId,name,birthDate1,birthDate2);
				request.setAttribute("userList", userList);

				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/user.jsp");
				dispatcher.forward(request, response);
	}
}