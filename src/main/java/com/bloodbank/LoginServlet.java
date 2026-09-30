package com.bloodbank;

import java.io.IOException;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username != null) {
            username = username.trim();
        }

        try {

            // Hash the password before checking database
            String hashedPassword = hashPassword(password);

            String sql =
                    "SELECT * FROM users WHERE username = ? AND password = ?";

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, hashedPassword);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                // Login successful
                response.sendRedirect("dashboard.jsp");

            } else {

                // Login failed
                response.sendRedirect(
                    "login.jsp?error=Invalid%20Username%20or%20Password"
                );
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                "login.jsp?error=Database%20Error"
            );
        }
    }

    private String hashPassword(String password) throws Exception {

        MessageDigest md =
                MessageDigest.getInstance("SHA-256");

        byte[] hash =
                md.digest(password.getBytes("UTF-8"));

        StringBuilder hex = new StringBuilder();

        for (byte b : hash) {

            String h =
                    Integer.toHexString(0xff & b);

            if (h.length() == 1) {
                hex.append('0');
            }

            hex.append(h);
        }

        return hex.toString();
    }
}