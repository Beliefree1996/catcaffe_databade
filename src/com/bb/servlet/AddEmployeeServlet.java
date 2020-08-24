package com.bb.servlet;

import com.bb.dao.EmployeeDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/addEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddEmployeeServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//		doGet(request, response);
		//设置编码类型
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		int age = Integer.parseInt(request.getParameter("age"));
		String technicalTitle = request.getParameter("technicalTitle");
		String monthSalary = request.getParameter("monthSalary");
		String homeAddress = request.getParameter("homeAddress");
		EmployeeDao employeeDao = new EmployeeDao();

		employeeDao.addEmployee(name, gender, age, technicalTitle, monthSalary, homeAddress);
		response.sendRedirect("./employee-list.jsp");
	}

}
