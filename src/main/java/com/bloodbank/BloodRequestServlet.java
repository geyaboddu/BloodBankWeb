package com.bloodbank;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/bloodrequest")
public class BloodRequestServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String patientName = request.getParameter("patient_name");
        String hospital = request.getParameter("hospital");
        String bloodGroup = request.getParameter("blood_group");
        String quantityText = request.getParameter("quantity");
        String phone = request.getParameter("phone");

        HttpSession session = request.getSession();

        // Remove old messages
        session.removeAttribute("requestError");

        try {

            // -----------------------------------------
            // 1. Validate input
            // -----------------------------------------

            if (patientName == null || patientName.trim().isEmpty()) {
                fail(session, response, "Patient name is required.");
                return;
            }

            if (hospital == null || hospital.trim().isEmpty()) {
                fail(session, response, "Hospital or location is required.");
                return;
            }

            if (bloodGroup == null || bloodGroup.trim().isEmpty()) {
                fail(session, response, "Please select a blood group.");
                return;
            }

            if (quantityText == null || quantityText.trim().isEmpty()) {
                fail(session, response, "Please enter the required blood units.");
                return;
            }

            if (phone == null || phone.trim().isEmpty()) {
                fail(session, response, "Phone number is required.");
                return;
            }

            // -----------------------------------------
            // 2. Convert quantity
            // -----------------------------------------

            int quantity;

            try {
                quantity = Integer.parseInt(quantityText.trim());
            } catch (NumberFormatException e) {
                fail(session, response,
                        "Please enter a valid number for blood units.");
                return;
            }

            if (quantity <= 0) {
                fail(session, response,
                        "Blood units must be greater than 0.");
                return;
            }

            // -----------------------------------------
            // 3. Check phone number
            // -----------------------------------------

            if (!phone.trim().matches("[0-9]{10,15}")) {
                fail(session, response,
                        "Please enter a valid phone number.");
                return;
            }

            // -----------------------------------------
            // 4. Connect to database
            // -----------------------------------------

            Connection con = DBConnection.getConnection();

            if (con == null) {
                fail(session, response,
                        "Unable to connect to the database.");
                return;
            }

            try {

                // -----------------------------------------
                // 5. Check blood stock
                // -----------------------------------------

                String stockSQL =
                        "SELECT units FROM blood_stock "
                      + "WHERE blood_group = ?";

                PreparedStatement stockPS =
                        con.prepareStatement(stockSQL);

                stockPS.setString(1, bloodGroup.trim());

                ResultSet rs = stockPS.executeQuery();

                if (!rs.next()) {

                    rs.close();
                    stockPS.close();

                    fail(session, response,
                            "No stock record found for blood group "
                            + bloodGroup + ".");

                    return;
                }

                int availableUnits = rs.getInt("units");

                rs.close();
                stockPS.close();

                // -----------------------------------------
                // 6. Check requested quantity
                // -----------------------------------------

                if (availableUnits <= 0) {

                    fail(session, response,
                            "Currently there are no units available for "
                            + bloodGroup + ".");

                    return;
                }

                if (quantity > availableUnits) {

                    fail(session, response,
                            "Only " + availableUnits
                            + " unit(s) of " + bloodGroup
                            + " are currently available. "
                            + "You requested " + quantity + " unit(s).");

                    return;
                }

                // -----------------------------------------
                // 7. Insert blood request
                // -----------------------------------------

                String insertSQL =
                        "INSERT INTO blood_requests "
                      + "(patient_name, hospital, blood_group, "
                      + "quantity, status, units, phone) "
                      + "VALUES (?, ?, ?, ?, ?, ?, ?)";

                PreparedStatement ps =
                        con.prepareStatement(insertSQL);

                ps.setString(1, patientName.trim());
                ps.setString(2, hospital.trim());
                ps.setString(3, bloodGroup.trim());
                ps.setInt(4, quantity);
                ps.setString(5, "Pending");
                ps.setInt(6, quantity);
                ps.setString(7, phone.trim());

                int result = ps.executeUpdate();

                ps.close();

                // -----------------------------------------
                // 8. SUCCESS ONLY IF INSERT SUCCEEDED
                // -----------------------------------------

                if (result == 1) {

                    session.setAttribute("requestPatient",
                            patientName.trim());

                    session.setAttribute("requestHospital",
                            hospital.trim());

                    session.setAttribute("requestBloodGroup",
                            bloodGroup.trim());

                    session.setAttribute("requestQuantity",
                            quantity);

                    session.setAttribute("requestPhone",
                            phone.trim());

                    session.setAttribute("requestStatus",
                            "Pending");

                    response.sendRedirect("requestsuccess.jsp");

                } else {

                    fail(session, response,
                            "The blood request could not be saved. "
                            + "Please try again.");

                }

            } finally {

                con.close();
            }

        } catch (SQLException e) {

            e.printStackTrace();

            String message = e.getMessage();

            if (message == null || message.trim().isEmpty()) {
                message = "A database error occurred while processing your request.";
            }

            fail(session, response,
                    "Database error: " + message);

        } catch (Exception e) {

            e.printStackTrace();

            fail(session, response,
                    "An unexpected error occurred. "
                    + "Please try again.");

        }
    }

    // -----------------------------------------
    // Common failure method
    // -----------------------------------------

    private void fail(HttpSession session,
                      HttpServletResponse response,
                      String reason)
            throws IOException {

        session.setAttribute("requestError", reason);

        response.sendRedirect("requestfailed.jsp");
    }
}