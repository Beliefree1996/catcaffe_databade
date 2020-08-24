package com.bb.servlet;

import com.bb.dao.EmployeeDao;
import com.bb.domain.Employee;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/selectEmployeeServlet")
public class selectEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public selectEmployeeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String name = request.getParameter("name");
		EmployeeDao employeeDao = new EmployeeDao();
		ArrayList<Employee> data = employeeDao.getLikeList(name);
		//将获取的结果存入请求中
		request.setAttribute("data", data);
		String url = "";
			url = response.encodeURL("employee-list.jsp");

		//将请求转发
	    request.getRequestDispatcher(url).forward(request, response);
	}
}
