package com.example.product;

import java.io.*;
import java.time.LocalDateTime;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;


@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    LocalDateTime birthDay = LocalDateTime.of(1990, 1, 1, 0, 0);
    Users users = new Users("Nguyen Van a","day la anh",18,birthDay);
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
       request.setAttribute("user",users);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Custormers.jsp");
                try{dispatcher.forward(request,response);} catch (ServletException e) {
                    throw new RuntimeException(e);
                }
    }
}