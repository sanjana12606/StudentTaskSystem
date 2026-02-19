package com.studenttask.dao;

import com.studenttask.model.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    public boolean registerUser(User user) {
        boolean status = false;
        try {
            Connection con = DBConnection.getConnection();
            String query = "INSERT INTO users(name,email,password,role) VALUES(?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, "student");

            int row = ps.executeUpdate();
            if (row > 0) status = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public User loginUser(String email, String password) {

    User user = null;

    try {
        Connection con = DBConnection.getConnection();

        String query = "SELECT * FROM users WHERE email=? AND password=?";
        PreparedStatement ps = con.prepareStatement(query);

        ps.setString(1, email);
        ps.setString(2, password);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            user = new User();
            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setRole(rs.getString("role"));
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return user;
}
    public int getTotalUsers() {
    int count = 0;
    try {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT COUNT(*) FROM users";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) count = rs.getInt(1);
    } catch (Exception e) { e.printStackTrace(); }
    return count;
}
public List<User> getAllUsers() {
    List<User> list = new ArrayList<>();

    try {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM users ORDER BY id DESC";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            User u = new User();
            u.setId(rs.getInt("id"));
            u.setName(rs.getString("name"));
            u.setEmail(rs.getString("email"));
            u.setRole(rs.getString("role"));

            list.add(u);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return list;
}
public boolean deleteUser(int userId) {
    boolean status = false;

    try {
        Connection con = DBConnection.getConnection();
        String sql = "DELETE FROM users WHERE id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, userId);

        int row = ps.executeUpdate();
        if (row > 0) status = true;

    } catch (Exception e) {
        e.printStackTrace();
    }
    return status;
}

}
