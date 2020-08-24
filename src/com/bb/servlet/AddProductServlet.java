package com.bb.servlet;

import com.bb.dao.CatDao;
import com.bb.dao.ProductDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/addProductServlet")
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddProductServlet() {
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
		int sale = Integer.parseInt(request.getParameter("sale"));
		int cost = Integer.parseInt(request.getParameter("cost"));
		ProductDao productDao = new ProductDao();

		productDao.addProduct(name, sale, cost);
		response.sendRedirect("./product-list.jsp");
	}

}
