
		package com.bloodbank;

		public class Main {

		    public static void main(String[] args) {

		        java.sql.Connection con = DBConnection.getConnection();

		        if (con != null) {
		            System.out.println("Aiven MySQL Connected Successfully!");
		        } else {
		            System.out.println("Connection Failed!");
		        }
		    
	}

}
