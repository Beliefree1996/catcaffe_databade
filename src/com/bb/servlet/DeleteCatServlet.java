package com.bb.servlet;

import com.bb.dao.CatDao;
import com.bb.dao.EmployeeDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/deleteCatServlet")
public class DeleteCatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteCatServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		Integer id = Integer.parseInt(request.getParameter("id"));
		CatDao catDao = new CatDao();//implement CatDao.java
		catDao.deleteCat(id);//to delete one cat information according to its id，according to CatDao.java
		response.sendRedirect(request.getContextPath()+"/cat-list.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
