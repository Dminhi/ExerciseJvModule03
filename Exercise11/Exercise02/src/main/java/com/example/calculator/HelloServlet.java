package com.example.calculator;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/Calculator-servlet")
public class HelloServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstOperand = req.getParameter("firstOperand");
        String secondOperand = req.getParameter("secondOperand");
        String operator = req.getParameter("operator");
        double result = 0;
        switch (operator) {
            case "+":
                result = Double.parseDouble(firstOperand) + Double.parseDouble(secondOperand);
                break;
            case "-":
                result = Double.parseDouble(firstOperand) - Double.parseDouble(secondOperand);
                break;
            case "*":
                result = Double.parseDouble(firstOperand) * Double.parseDouble(secondOperand);
                break;
            case "/":
                try {
                    result = Double.parseDouble(firstOperand) / Double.parseDouble(secondOperand);
                } catch (Exception e){
                    e.printStackTrace();
                }
                break;
            default:
                break;
        }
        req.setAttribute("secondOperand",secondOperand);
        req.setAttribute("firstOperand",firstOperand);
        req.setAttribute("operator",operator);
        req.setAttribute("result",result);
        RequestDispatcher dispatcher = req.getRequestDispatcher("WEB-INF/Result.jsp");
        dispatcher.forward(req,resp);
    }
}