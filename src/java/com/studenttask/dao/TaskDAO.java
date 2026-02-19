package com.studenttask.dao;

import com.studenttask.model.Task;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TaskDAO {

    // Insert new task
    public boolean addTask(Task task) {

        boolean status = false;

        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO tasks(user_id, title, description, deadline, status) VALUES(?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, task.getUserId());
            ps.setString(2, task.getTitle());
            ps.setString(3, task.getDescription());
            ps.setString(4, task.getDeadline());
            ps.setString(5, "Pending");

            int row = ps.executeUpdate();
            if (row > 0) status = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    // Get all tasks for a user
    public List<Task> getTasksByUser(int userId) {

        List<Task> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM tasks WHERE user_id=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Task t = new Task();
                t.setId(rs.getInt("id"));
                t.setUserId(rs.getInt("user_id"));
                t.setTitle(rs.getString("title"));
                t.setDescription(rs.getString("description"));
                t.setDeadline(rs.getString("deadline"));
                t.setStatus(rs.getString("status"));

                list.add(t);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    public boolean updateTask(Task task) {
    boolean status = false;

    try {
        Connection con = DBConnection.getConnection();
        String sql = "UPDATE tasks SET title=?, description=?, deadline=? WHERE id=? AND user_id=?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, task.getTitle());
        ps.setString(2, task.getDescription());
        ps.setString(3, task.getDeadline());
        ps.setInt(4, task.getId());
        ps.setInt(5, task.getUserId());

        int row = ps.executeUpdate();
        if (row > 0) status = true;

    } catch (Exception e) {
        e.printStackTrace();
    }
    return status;
}
public boolean deleteTask(int id, int userId) {
    boolean status = false;

    try {
        Connection con = DBConnection.getConnection();

        String sql = "DELETE FROM tasks WHERE id=? AND user_id=?";
        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, id);
        ps.setInt(2, userId);

        int row = ps.executeUpdate();
        if (row > 0) status = true;

    } catch (Exception e) {
        e.printStackTrace();
    }

    return status;
}
public boolean markAsCompleted(int id, int userId) {
    boolean status = false;

    try {
        Connection con = DBConnection.getConnection();

        String sql = "UPDATE tasks SET status='Completed' WHERE id=? AND user_id=?";
        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, id);
        ps.setInt(2, userId);

        int row = ps.executeUpdate();
        if (row > 0) status = true;

    } catch (Exception e) {
        e.printStackTrace();
    }

    return status;
}
public int getTotalTasks(int userId) {
    int count = 0;
    try {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT COUNT(*) FROM tasks WHERE user_id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) count = rs.getInt(1);
    } catch (Exception e) { e.printStackTrace(); }
    return count;
}

public int getCompletedTasks(int userId) {
    int count = 0;
    try {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT COUNT(*) FROM tasks WHERE user_id=? AND status='Completed'";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) count = rs.getInt(1);
    } catch (Exception e) { e.printStackTrace(); }
    return count;
}

public int getPendingTasks(int userId) {
    int count = 0;
    try {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT COUNT(*) FROM tasks WHERE user_id=? AND status='Pending'";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) count = rs.getInt(1);
    } catch (Exception e) { e.printStackTrace(); }
    return count;
}
public int getAdminTotalTasks() {
    int count = 0;
    try {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT COUNT(*) FROM tasks";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) count = rs.getInt(1);
    } catch (Exception e) { e.printStackTrace(); }
    return count;
}

public int getAdminCompletedTasks() {
    int count = 0;
    try {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT COUNT(*) FROM tasks WHERE status='Completed'";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) count = rs.getInt(1);
    } catch (Exception e) { e.printStackTrace(); }
    return count;
}

public int getAdminPendingTasks() {
    int count = 0;
    try {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT COUNT(*) FROM tasks WHERE status='Pending'";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) count = rs.getInt(1);
    } catch (Exception e) { e.printStackTrace(); }
    return count;
}
public List<Task> getAllTasks() {
    List<Task> list = new ArrayList<>();
    try {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT t.*, u.name AS userName FROM tasks t JOIN users u ON t.user_id = u.id ORDER BY t.id DESC";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Task t = new Task();
            t.setId(rs.getInt("id"));
            t.setUserId(rs.getInt("user_id"));
            t.setTitle(rs.getString("title"));
            t.setDescription(rs.getString("description"));
            t.setDeadline(rs.getString("deadline"));
            t.setStatus(rs.getString("status"));
            t.setUserName(rs.getString("userName")); // Add in Task model

            list.add(t);
        }
    } catch (Exception e) { e.printStackTrace(); }
    return list;
}
public List<Task> getTasksByUserAdmin(int userId) {
    List<Task> list = new ArrayList<>();
    try {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT t.*, u.name AS userName FROM tasks t JOIN users u ON t.user_id = u.id WHERE user_id=? ORDER BY id DESC";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Task t = new Task();
            t.setId(rs.getInt("id"));
            t.setUserId(rs.getInt("user_id"));
            t.setTitle(rs.getString("title"));
            t.setDescription(rs.getString("description"));
            t.setDeadline(rs.getString("deadline"));
            t.setStatus(rs.getString("status"));
            t.setUserName(rs.getString("userName"));
            list.add(t);
        }
    } catch (Exception e) { e.printStackTrace(); }
    return list;
}
public List<Task> getTasksByStatus(String status) {
    List<Task> list = new ArrayList<>();
    try {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT t.*, u.name AS userName FROM tasks t JOIN users u ON t.user_id = u.id WHERE status=? ORDER BY id DESC";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, status);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Task t = new Task();
            t.setId(rs.getInt("id"));
            t.setUserId(rs.getInt("user_id"));
            t.setTitle(rs.getString("title"));
            t.setDescription(rs.getString("description"));
            t.setDeadline(rs.getString("deadline"));
            t.setStatus(rs.getString("status"));
            t.setUserName(rs.getString("userName"));
            list.add(t);
        }
    } catch (Exception e) { e.printStackTrace(); }
    return list;
}

}
