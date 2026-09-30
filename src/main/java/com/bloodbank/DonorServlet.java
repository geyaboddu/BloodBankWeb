
	package com.bloodbank;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/donor")
public class DonorServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String ageText = request.getParameter("age");
        String gender = request.getParameter("gender");
        String bloodGroup = request.getParameter("blood_group");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String lastDonationDate = request.getParameter("last_donation_date");

        // Basic validation
        if (name == null || name.trim().isEmpty()) {
            response.sendRedirect("donorfailed.jsp?reason=Name is required");
            return;
        }

        if (ageText == null || ageText.trim().isEmpty()) {
            response.sendRedirect("donorfailed.jsp?reason=Age is required");
            return;
        }

        if (gender == null || gender.trim().isEmpty()) {
            response.sendRedirect("donorfailed.jsp?reason=Gender is required");
            return;
        }

        if (bloodGroup == null || bloodGroup.trim().isEmpty()) {
            response.sendRedirect("donorfailed.jsp?reason=Blood group is required");
            return;
        }

        if (phone == null || phone.trim().isEmpty()) {
            response.sendRedirect("donorfailed.jsp?reason=Phone number is required");
            return;
        }

        try {

            int age = Integer.parseInt(ageText);

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO donors "
                    + "(name, age, gender, blood_group, phone, email, address, last_donation_date) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setInt(2, age);
            ps.setString(3, gender);
            ps.setString(4, bloodGroup);
            ps.setString(5, phone);
            ps.setString(6, email);
            ps.setString(7, address);

            // Last donation date can be empty
            if (lastDonationDate == null || lastDonationDate.trim().isEmpty()) {
                ps.setNull(8, java.sql.Types.DATE);
            } else {
                ps.setDate(8, Date.valueOf(lastDonationDate));
            }

            int result = ps.executeUpdate();

            ps.close();
            con.close();

            if (result > 0) {
                response.sendRedirect("donorsuccess.jsp");
            } else {
                response.sendRedirect("donorfailed.jsp?reason=Donor registration could not be completed");
            }

        } catch (NumberFormatException e) {

            response.sendRedirect("donorfailed.jsp?reason=Age must be a valid number");

        } catch (IllegalArgumentException e) {

            response.sendRedirect("donorfailed.jsp?reason=Invalid donation date");

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                "donorfailed.jsp?reason=Database error while registering donor"
            );
        }
    }
}