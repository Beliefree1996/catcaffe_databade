package com.bb.servlet;

import com.bb.dao.EmployeeDao;
import com.bb.dao.ProductDao;
import com.bb.domain.Employee;
import com.bb.domain.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/selectProductServlet")
public class selectProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public selectProductServlet() {
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
		ProductDao productDao = new ProductDao();
		ArrayList<Product> data = productDao.getLikeList(name);
		//将获取的结果存入请求中
		request.setAttribute("data", data);
		String url = "";
			url = response.encodeURL("product-list.jsp");

		//将请求转发
	    request.getRequestDispatcher(url).forward(request, response);
	}
}
