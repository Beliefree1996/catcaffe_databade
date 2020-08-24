package com.bb.servlet;

import com.bb.dao.UserDao;
import com.bb.domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
//用来实现用户登录的操作

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {//需要继承HttpServlet
	private static final long serialVersionUID = 1L;
       

    public LoginServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		//我觉得这个和doPost实际上一样
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
		//登录的判断
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		//得到jsp页面传过来的参数，获取账号和密码
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		UserDao userdao = new UserDao();//to implement user login operation
		User user = userdao.getUserInfo(username, password);
		//对账号和密码进行判断
		boolean result = userdao.Login_verify(username, password);
		HttpSession session = request.getSession();
		//如果判断输入正确
		if(result){
			//将id存入session中
			session.setAttribute("id", ""+user.getId());
			//设置session的失效时间（failure time）
			session.setMaxInactiveInterval(6000);

			response.sendRedirect(request.getContextPath() + "/index2.jsp");
		}else{
			//没有找到对应的账号和密码，返回重新登录
			session.setAttribute("state", "密码错误");
			response.sendRedirect("./index.jsp");
		}
	}
}
