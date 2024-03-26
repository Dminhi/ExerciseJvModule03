package com.example.users.service;

import com.example.users.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static sun.rmi.transport.TransportConstants.Call;

public class UserServiceIMPL implements IUserServlet {
    private String jdbcURL = "jdbc:mysql://localhost:3306/demo";
    private String jdbcUsername = "root";
    private String jdbcPassword = "lananh62";

    private static final String INSERT_USER_SQL = "INSERT INTO user" + "(name,email,country) values(?,?,?)";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country from user where id =?";

    public UserServiceIMPL() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return connection;
    }


    @Override
    public void insertUser(User user) throws SQLException {
        System.out.println(INSERT_USER_SQL);
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }

    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }


    @Override
    public User selectUser(int id) throws SQLException {
        User user = null;
        try (
                Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        ;
        return user;
    }

    @Override
    public List<User> selectAllUsers() {
        String query = "{Call get_all_user()}";
        List<User> users = new ArrayList<>();
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(query)) {
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return users;
    }

    @Override
    public void deleteUser(int id) throws SQLException {
        String querry = "{Call delete_user(?)}";
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(querry)) {
            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
        }
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        String querry = "{Call edit_user(?,?,?,?)}";
        boolean rowUpdate;
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(querry)) {
            callableStatement.setString(2, user.getName());
            callableStatement.setString(3, user.getEmail());
            callableStatement.setString(4, user.getCountry());
            callableStatement.setInt(1, user.getId());
            rowUpdate = callableStatement.executeUpdate() > 0;
        }
        return rowUpdate;
    }

    public List<User> findByCountry(String country) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * from user where country like concat('%',?,'%')");
            {
                preparedStatement.setString(1, country);
                ResultSet Rs = preparedStatement.executeQuery();
                List<User> userList = new ArrayList<>();
                while (Rs.next()) {
                    int id = Rs.getInt("id");
                    String name = Rs.getString("name");
                    String email = Rs.getString("email");
                    userList.add(new User(id, name, email, country));
                }
                return userList;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<User> descByName() {
        List<User> users = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM user ORDER BY name DESC")) {
            ResultSet Rs = preparedStatement.executeQuery();
            System.out.println(Rs);
            while (Rs.next()) {
                int id = Rs.getInt("id");
                String name = Rs.getString("name");
                String email = Rs.getString("email");
                String country = Rs.getString("country");
                users.add(new User(id, name, email, country));

            }
            return users;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<User> escByName() {
        List<User> users = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM user ORDER BY name")) {
            ResultSet Rs = preparedStatement.executeQuery();
            System.out.println(Rs);
            while (Rs.next()) {
                int id = Rs.getInt("id");
                String name = Rs.getString("name");
                String email = Rs.getString("email");
                String country = Rs.getString("country");
                users.add(new User(id, name, email, country));

            }
            return users;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
