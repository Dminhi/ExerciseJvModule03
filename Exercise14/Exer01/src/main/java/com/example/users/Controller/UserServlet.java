package com.example.users.Controller;

import com.example.users.model.User;
import com.example.users.service.UserServiceIMPL;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "user-Servlet", value = "/user")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserServiceIMPL userServlet;

    public void init() {
        userServlet = new UserServiceIMPL();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    showNewForm(req, resp);
                    break;
                case "edit":
                    showEditForm(req, resp);
                    break;
                case "delete":
                    deleteUser(req, resp);
                    break;
                case "desc":
                    descList(req, resp);
                case "esc":
                    escList(req, resp);
                default:
                    listUser(req, resp);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset = UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    insertUser(req, resp);
                    break;
                case "edit":
                    updateUser(req, resp);
                    break;
                case "search":
                    searchByCounTry(req, resp);

            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void descList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> descUserList = userServlet.descByName();
        req.setAttribute("listUser", descUserList);
        req.getRequestDispatcher("/WEB-INF/listUser.jsp").forward(req, resp);
    }
    private void escList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> escUserList = userServlet.escByName();
        req.setAttribute("listUser", escUserList);
        req.getRequestDispatcher("/WEB-INF/listUser.jsp").forward(req, resp);
    }
    private void searchByCounTry(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> userListByCounTry = new ArrayList<>();
        String country = req.getParameter("country");
        userListByCounTry = userServlet.findByCountry(country);
        req.setAttribute("listUser", userListByCounTry);
        req.getRequestDispatcher("/WEB-INF/listUser.jsp").forward(req, resp);
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        List<User> userList = userServlet.selectAllUsers();
        request.setAttribute("listUser", userList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/listUser.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        User existingUser = userServlet.selectUser(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/edit.jsp");
        request.setAttribute("user", existingUser);
        dispatcher.forward(request, response);
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User newUser = new User(name, email, country);
        userServlet.insertUser(newUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/create.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/create.jsp");
        dispatcher.forward(request, response);
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User book = new User(id, name, email, country);
        userServlet.updateUser(book);
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        userServlet.deleteUser(id);

        List<User> userList = userServlet.selectAllUsers();
        request.setAttribute("listUser", userList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/listUser.jsp");
        dispatcher.forward(request, response);
    }

    public void destroy() {
    }
}



