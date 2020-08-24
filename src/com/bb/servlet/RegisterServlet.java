package com.bb.servlet;

import com.bb.dao.UserDao;
import com.bb.domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//实现用户注册操作
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {//继承HttpServlet
	private static final long serialVersionUID = 1L;

    public RegisterServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		//获取注册信息
		String password = request.getParameter("password");
		String name = request.getParameter("name");

		UserDao userdao = new UserDao();
		//将注册信息存入数据库，再返回登录
		userdao.Register(name,password);
        response.sendRedirect(request.getContextPath()+"/index.jsp");
	}
}
