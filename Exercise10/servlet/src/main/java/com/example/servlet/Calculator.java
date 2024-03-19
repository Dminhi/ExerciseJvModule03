package com.example.servlet;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class Calculator extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productDescription = req.getParameter("discription");
        Double listPrice = Double.valueOf(req.getParameter("ListPrice"));
        Double discountPersent = Double.valueOf(req.getParameter("DiscountPercent"));
        Double result = listPrice/discountPersent;
        req.setAttribute("result",result);
        RequestDispatcher dispatcher= req.getRequestDispatcher("WEB-INF/Rerult.jsp");
        try {
            dispatcher.forward(req, resp);
        }catch (ServletException|IOException e){
            throw new RuntimeException(e);
        }
    }
    public void destroy() {}
}