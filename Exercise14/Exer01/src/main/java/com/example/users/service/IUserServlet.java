package com.example.users.service;

import com.example.users.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserServlet {
    public void insertUser(User user) throws SQLException;

    public User selectUser(int id) throws SQLException;

    public List<User> selectAllUsers();

    public void deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;


}
