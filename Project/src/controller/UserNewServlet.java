package controller;

import java.io.IOException;

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

		HttpSession session = request.getSession();
		User u = (User)session.getAttribute("userInfo");
	     if(u == null)
	     {
	         response.sendRedirect("LoginServlet");
	         return;
	     }



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
		if (!(password.equals(password2))) {
			request.setAttribute("errMsg", "パスワードが一致しておりません");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/user new.jsp");
			dispatcher.forward(request, response);
			return;
			}

		if (loginId.equals("") || password.equals("") || password2.equals("") || name.equals("") || birthDate.equals("")) {
			request.setAttribute("errMsg", "入力されてない項目があります");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/user new.jsp");
			dispatcher.forward(request, response);
			return;
			}

		//ログインIDが被っていたらエラー
		boolean test = userDao.isLogiIdCheck(loginId);
		if(test) {
			request.setAttribute("errMsg", "既に登録されています");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/user new.jsp");
			dispatcher.forward(request, response);
			return;
			}




		userDao.insertUserNew(loginId, password, name, birthDate);


		response.sendRedirect("UserServlet");






	}
}
