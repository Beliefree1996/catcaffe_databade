package com.bb.servlet;

import com.bb.dao.CatDao;
import com.bb.dao.EmployeeDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/addCatServlet")
public class AddCatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddCatServlet() {
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
		int price = Integer.parseInt(request.getParameter("price"));
		int employeeID = Integer.parseInt(request.getParameter("employeeID"));
		String attendance = request.getParameter("attendance");
		CatDao catDao = new CatDao();

		catDao.addCat(name, gender, age, price, attendance,employeeID);
		response.sendRedirect("./cat-list.jsp");
	}

}
