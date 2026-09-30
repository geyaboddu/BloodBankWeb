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

	@WebServlet("/userregister")
	public class UserRegisterServlet extends HttpServlet {

	    private static final long serialVersionUID = 1L;

	    protected void doPost(HttpServletRequest request,
	                          HttpServletResponse response)
	            throws ServletException, IOException {

	        request.setCharacterEncoding("UTF-8");

	        String fullName = request.getParameter("full_name");
	        String username = request.getParameter("username");
	        String email = request.getParameter("email");
	        String phone = request.getParameter("phone");
	        String password = request.getParameter("password");
	        String confirmPassword = request.getParameter("confirm_password");

	        // Remove accidental spaces
	        if (fullName != null) fullName = fullName.trim();
	        if (username != null) username = username.trim();
	        if (email != null) email = email.trim();
	        if (phone != null) phone = phone.trim();

	        // Validation
	        if (fullName == null || fullName.isEmpty()) {
	            fail(response, "Full name is required.");
	            return;
	        }

	        if (username == null || username.isEmpty()) {
	            fail(response, "Username is required.");
	            return;
	        }

	        if (email == null || email.isEmpty()) {
	            fail(response, "Email is required.");
	            return;
	        }

	        if (phone == null || phone.isEmpty()) {
	            fail(response, "Phone number is required.");
	            return;
	        }

	        if (password == null || password.isEmpty()) {
	            fail(response, "Password is required.");
	            return;
	        }

	        if (password.length() < 6) {
	            fail(response, "Password must contain at least 6 characters.");
	            return;
	        }

	        if (!password.equals(confirmPassword)) {
	            fail(response, "Passwords do not match.");
	            return;
	        }

	        try {

	            Connection con = DBConnection.getConnection();

	            // Check username/email
	            String checkSql =
	                    "SELECT id FROM users WHERE username = ? OR email = ?";

	            PreparedStatement checkPs =
	                    con.prepareStatement(checkSql);

	            checkPs.setString(1, username);
	            checkPs.setString(2, email);

	            ResultSet rs = checkPs.executeQuery();

	            if (rs.next()) {

	                rs.close();
	                checkPs.close();
	                con.close();

	                fail(response,
	                     "Username or email already exists. Please use another one.");
	                return;
	            }

	            rs.close();
	            checkPs.close();

	            // Hash password
	            String hashedPassword = hashPassword(password);

	            String sql =
	                    "INSERT INTO users "
	                  + "(full_name, username, email, phone, password) "
	                  + "VALUES (?, ?, ?, ?, ?)";

	            PreparedStatement ps = con.prepareStatement(sql);

	            ps.setString(1, fullName);
	            ps.setString(2, username);
	            ps.setString(3, email);
	            ps.setString(4, phone);
	            ps.setString(5, hashedPassword);

	            int result = ps.executeUpdate();

	            ps.close();
	            con.close();

	            if (result > 0) {

	                response.sendRedirect("userregistersuccess.jsp");

	            } else {

	                fail(response,
	                     "Registration could not be completed. Please try again.");
	            }

	        } catch (Exception e) {

	            e.printStackTrace();

	            String errorMessage = e.getMessage();

	            if (errorMessage == null || errorMessage.trim().isEmpty()) {
	                errorMessage = "Unknown database/server error.";
	            }

	            fail(response, "Registration failed: " + errorMessage);
	        }
	    }

	    private void fail(HttpServletResponse response, String reason)
	            throws IOException {

	        response.sendRedirect(
	            "userregister.jsp?error="
	            + java.net.URLEncoder.encode(reason, "UTF-8")
	        );
	    }

	    private String hashPassword(String password) throws Exception {

	        MessageDigest md =
	                MessageDigest.getInstance("SHA-256");

	        byte[] hash = md.digest(password.getBytes("UTF-8"));

	        StringBuilder hex = new StringBuilder();

	        for (byte b : hash) {
	            String h = Integer.toHexString(0xff & b);

	            if (h.length() == 1) {
	                hex.append('0');
	            }

	            hex.append(h);
	        }

	        return hex.toString();
	    }
	
}
