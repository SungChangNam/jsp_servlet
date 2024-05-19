package com.reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ReservationDAO {

    private static ReservationDAO instance = null;

    private ReservationDAO() {}

    public static ReservationDAO getInstance() {
        if (instance == null) {
            synchronized (ReservationDAO.class) {
                if (instance == null) {
                    instance = new ReservationDAO();
                }
            }
        }
        return instance;
    }

    public void insertReservation(Reservation reservation) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            String sql = "INSERT INTO Reservations (reservation_id, user_id, vehicle_id, start_date, end_date, total_price, status) VALUES (RESERVATION_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, reservation.getUserId());
            pstmt.setInt(2, reservation.getVehicleId());
            pstmt.setDate(3, new java.sql.Date(reservation.getStartDate().getTime()));
            pstmt.setDate(4, new java.sql.Date(reservation.getEndDate().getTime()));
            pstmt.setDouble(5, reservation.getTotalPrice());
            pstmt.setString(6, reservation.getStatus());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
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
