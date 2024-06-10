package com.reservation;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

public class VehicleDAO {

    private static VehicleDAO instance = null;

    private VehicleDAO() {}

    public static VehicleDAO getInstance() {
        if (instance == null) {
            synchronized (VehicleDAO.class) {
                if (instance == null) {
                    instance = new VehicleDAO();
                }
            }
        }
        return instance;
    }

    public void insertVehicle(VehicleVO vehicle) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = ConnUtil.getConnection();
            String sql = "INSERT INTO 'Vehicles' (vehicle_id, model, availability, price_per_day, image_url, regdate) VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, vehicle.getVehicleId());
            pstmt.setString(2, vehicle.getModel());
            pstmt.setString(3, vehicle.getAvailability());
            pstmt.setDouble(4, vehicle.getPricePerDay());
            pstmt.setString(5, vehicle.getImageUrl());
            pstmt.setTimestamp(6, vehicle.getRegdate());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}