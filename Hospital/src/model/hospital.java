package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.google.gson.JsonObject;

public class hospital {
	private Connection connect() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/helthcare?serverTimezone=UTC", "root", "");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}
	
public String addnewhospital(hospitalDeo hospitaldata) {
	
	String output = "";

	try {
		Connection con = connect();

		if (con == null) {
			return "Error while connecting to the database for readline";
		}

		String sql = "INSERT INTO `hospital`(`hospitalName`, `hospitalAddress`, `phone`, `hospitalEmail`, `password`) VALUES (?,?,?,?,?)";

		PreparedStatement statement = con.prepareStatement(sql);

		statement.setString(1,hospitaldata.getHospitalName());
		statement.setString(2, hospitaldata.getHospitalAddress());
		statement.setString(3, hospitaldata.getPhone());
		statement.setString(4, hospitaldata.getHospitalEmail());
		statement.setString(5, hospitaldata.getPassword());
		statement.execute();

		output = "Inserted successfully";

	} catch (SQLException e) {
		System.out.println(e.getMessage());
	} catch (Exception e) {
		System.out.println(e.getMessage());
	}
	String newRead = getHospitalDetails();
	JsonObject jsonObject = new JsonObject();
	jsonObject.addProperty("status", "success");
	jsonObject.addProperty("data", newRead);
	return jsonObject.toString();
	}

public String getHospitalDetails() {
	
	String output = "";
	 output = "<table class=\"table\">"
			+ "<thead>"
	 		+ "<tr>"
	 		+ "<th>hospital Id</th>"
	 		+ "<th>hospital Name</th>"
	 		+ "<th>Address</th>"
	 		+ "<th>phone</th>"
	 		+ "<th>E-mail</th>"
	 		+ "<th>Password</th>"
	 		+ "<th>Update</th>"
	 		+ "<th>Remove</th>"
	 		+ "</tr>"
	 		+ "</thead>";

	try {
		Connection con = connect();

		if (con == null) {
			return "Error while connecting database";
		}
		
		String query = "SELECT `hospitalId`, `hospitalName`, `hospitalAddress`, `phone`, `hospitalEmail`, `password` FROM `hospital` WHERE `Status`='active' ";
		PreparedStatement statement = con.prepareStatement(query);
		ResultSet set = statement.executeQuery();

		while (set.next()) {
			hospitalDeo deo = new hospitalDeo();
			int  HospitalId = set.getInt("hospitalId");
			String HospitalName = set.getString("hospitalName");
			String HospitalAddress =set.getString("hospitalAddress");
			String Phone =set.getString("phone");
			String HospitalEmail =set.getString("hospitalEmail");
			String Password=set.getString("password");
			
			output += "<tr><td><input id=\"hidItemIdUpdate\" value=\"" + HospitalId + "\" name=\"hidItemIdUpdate\" type=\"hidden\"> "+ HospitalId +" </td>";
			 output += "<td>" + HospitalName + "</td>";
			 output += "<td>" + HospitalAddress + "</td>";
			 output += "<td>" + Phone + "</td>";
			 output += "<td>" + HospitalEmail + "</td>";
			 output += "<td>" + Password + "</td>";
			 
			 output += "<td><input name=\"btnUpdate\" type=\"button\"value=\"Update\" class=\"btnUpdate btn btn-secondary\"></td>"
						+ "<td><button name=\"btnRemove\" data-appid='"+HospitalId+"'type=\"submit\" value=\""+HospitalId+"\"class=\"btnRemove btn btn-danger\">Remove</button></td></tr>";
			
		}
		con.close();
	} catch (Exception e) {
		System.out.println(e);
	}
	output += "</table>";
	return output;
	}

public String updateHospitalDetails(hospitalDeo hospitalDeo) {
	String output = "";

	try {
		Connection con = connect();

		if (con == null) {
			return "Error while connecting to the database for readline";
		}

		String sql = "UPDATE `hospital` SET `hospitalName`= ?,`hospitalAddress`= ?,`phone`= ?,`hospitalEmail`= ?,`password`= ? WHERE `hospitalId` = ? AND `Status`= 'active'";
		PreparedStatement statement = con.prepareStatement(sql);

		statement.setString(1,hospitalDeo.getHospitalName());
		statement.setString(2,hospitalDeo.getHospitalAddress());
		statement.setString(3,hospitalDeo.getPhone());
		statement.setString(4,hospitalDeo.getHospitalEmail());
		statement.setString(5,hospitalDeo.getPassword());
		statement.setInt(6,hospitalDeo.getHospitalId());
		statement.execute();

		output = "Updated successfully";
		con.close();

	} catch (SQLException e) {
		System.out.println(e.getMessage());
	} catch (Exception e) {
		System.out.println(e.getMessage());
	}
	String newRead = getHospitalDetails();
	JsonObject jsonObject = new JsonObject();
	jsonObject.addProperty("status", "success");
	jsonObject.addProperty("data", newRead);
	return jsonObject.toString();
	}

public String deletehospital(hospitalDeo hospitalDeo) {
	String output = "";

	try {
		Connection con = connect();

		if (con == null) {
			return "Error while connecting to the database for readline";
		}
		
		String sql = "UPDATE `hospital` SET `Status`= ? WHERE `hospitalId`= ?";

		PreparedStatement statement = con.prepareStatement(sql);
		statement.setString(1,"Deleted");
		statement.setInt(2, hospitalDeo.getHospitalId());
		statement.execute();

		output = "Deleted successfully";
		con.close();

	} catch (SQLException e) {
		System.out.println(e.getMessage());
	} catch (Exception e) {
		System.out.println(e.getMessage());
	}
	String newRead = getHospitalDetails();
	JsonObject jsonObject = new JsonObject();
	jsonObject.addProperty("status", "success");
	jsonObject.addProperty("data", newRead);
	return jsonObject.toString();
}
}
