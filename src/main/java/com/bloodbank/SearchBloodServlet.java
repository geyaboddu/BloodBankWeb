
	package com.bloodbank;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/searchblood")
public class SearchBloodServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String bloodGroup = request.getParameter("blood_group");

        String sql = "SELECT units FROM blood_stock WHERE blood_group = ?";

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, bloodGroup);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                int units = rs.getInt("units");

                request.setAttribute("bloodGroup", bloodGroup);
                request.setAttribute("units", units);
                request.setAttribute("found", true);

            } else {

                request.setAttribute("bloodGroup", bloodGroup);
                request.setAttribute("found", false);

            }

            rs.close();
            ps.close();
            con.close();

            request.getRequestDispatcher("searchresult.jsp")
                   .forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute("error", "Database Error!");
            
            request.getRequestDispatcher("searchresult.jsp")
                   .forward(request, response);
        }
    }
}