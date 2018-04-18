package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;

/**
 * Servlet implementation class UserNewServlet
 */
@WebServlet("/UserNewServlet")
public class UserNewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserNewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/user new.jsp");
		dispatcher.forward(request, response);



	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {




		request.setCharacterEncoding("UTF-8"); //文字化け防止
		String loginId = request.getParameter("loginId");
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		String name = request.getParameter("name");
		String  birthDate = request.getParameter("birthDate");

		UserDao userDao = new UserDao();
		//パスワードが同じか、入力不十分
		if(password!=password2 || loginId==null || password==null || password2==null || name==null || birthDate==null) {
			request.setAttribute("errMsg", "入力された内容は正しくありません");
			response.sendRedirect("UserNewServlet");
			return;
			}

		//ログインIDが被っていたらエラー
		String test = userDao.testUserNew(loginId);
		if(test != null) {
			request.setAttribute("errMsg", "既に登録されています");
			response.sendRedirect("UserNewServlet");
			return;
			}




		userDao.insertUserNew(loginId, password2, name, birthDate);


		response.sendRedirect("UserServlet");






	}
}
