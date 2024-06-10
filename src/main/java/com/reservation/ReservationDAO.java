package com.reservation;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
        try (Connection conn = ConnUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(
                 "INSERT INTO Reservations (reservation_id, user_id, vehicle_id, start_date, end_date, total_price, status) VALUES (RESERVATION_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?)")) {

            pstmt.setInt(1, reservation.getUserId());
            pstmt.setInt(2, reservation.getVehicleId());
            pstmt.setDate(3, new java.sql.Date(reservation.getStartDate().getTime()));
            pstmt.setDate(4, new java.sql.Date(reservation.getEndDate().getTime()));
            pstmt.setDouble(5, reservation.getTotalPrice());
            pstmt.setString(6, reservation.getStatus());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Reservation> getAllReservations() {
        List<Reservation> reservations = new ArrayList<>();
        try (Connection conn = ConnUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM Reservations");
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Reservation reservation = new Reservation();
                reservation.setReservationId(rs.getInt("reservation_id"));
                reservation.setUserId(rs.getInt("user_id"));
                reservation.setVehicleId(rs.getInt("vehicle_id"));
                reservation.setStartDate(rs.getDate("start_date"));
                reservation.setEndDate(rs.getDate("end_date"));
                reservation.setTotalPrice(rs.getDouble("total_price"));
                reservation.setStatus(rs.getString("status"));
                reservations.add(reservation);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reservations;
    }
}
