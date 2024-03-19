package com.example.products;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "product-servlet", value = "/product")
public class ProductServlet extends HttpServlet {
    ProductServiceImpl service = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action) {
            case "displayProduct":
                displayProduct(req, resp);
                break;
            case "addProduct":
                req.getRequestDispatcher("AddProduct.jsp").forward(req, resp);
            case "delete":
                int id = Integer.parseInt(req.getParameter("id"));
                service.deleteProduct(id);
                displayProduct(req, resp);
                break;
            case "update":
                int idUpdate = Integer.parseInt(req.getParameter("id"));
                Product product = service.findById(idUpdate);
                req.setAttribute("product", product);
                req.getRequestDispatcher("UpdateProduct.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action) {
            case "addProduct":
                String nameProduct = req.getParameter("productName");
                String description = req.getParameter("description");
                String manufacturer = req.getParameter("manufacturer");
                double productPrice = Double.parseDouble(req.getParameter("productPrice"));
                Product product = new Product(getNewId(), nameProduct, description, manufacturer, productPrice);
                service.fillAllProduct().add(product);
                displayProduct(req, resp);
                break;
            case "editProduct":
                String nameEditProduct = req.getParameter("productName");
                String descriptionEdit = req.getParameter("description");
                String manufacturerEdit = req.getParameter("manufacturer");
                double productPriceEdit = Double.parseDouble(req.getParameter("productPrice"));
                int productId = Integer.parseInt(req.getParameter("id"));
                Product editProduct = new Product(productId,nameEditProduct,descriptionEdit,manufacturerEdit,productPriceEdit);
                service.saveProduct(editProduct);
                displayProduct(req,resp);
                break;
        }

    }

    private void displayProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("productList", service.fillAllProduct());
        RequestDispatcher dispatcher = req.getRequestDispatcher("DisplayProduct.jsp");
        dispatcher.forward(req, resp);
    }

    public int getNewId() {
        int maxId = 0;
        for (Product p : service.fillAllProduct()) {
            if (maxId < p.getIdProduct()) {
                maxId = p.getIdProduct();
            }
        }
        return maxId + 1;
    }
}
