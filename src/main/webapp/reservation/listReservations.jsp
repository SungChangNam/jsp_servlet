<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.SimpleDateFormat"%>
<%@ page import="com.reservation.ReservationDAO, com.reservation.Reservation"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List of Reservations</title>
</head>
<body>
    <h1>Reservations</h1>
    <table border="1">
        <tr>
            <th>Reservation ID</th>
            <th>User ID</th>
            <th>Vehicle ID</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Total Price</th>
            <th>Status</th>
        </tr>
        <%
            ReservationDAO dao = new ReservationDAO();
            List<Reservation> reservations = dao.getAllReservations();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            for (Reservation reservation : reservations) {
        %>
        <tr>
            <td><%= reservation.getReservationId() %></td>
            <td><%= reservation.getUserId() %></td>
            <td><%= reservation.getVehicleId() %></td>
            <td><%= sdf.format(reservation.getStartDate()) %></td>
            <td><%= sdf.format(reservation.getEndDate()) %></td>
            <td><%= reservation.getTotalPrice() %></td>
            <td><%= reservation.getStatus() %></td>
        </tr>
        <% } %>
    </table>
    <a href="addReservation.jsp">Add Reservation</a>
</body>
</html>
