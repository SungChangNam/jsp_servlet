<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"   %>    

<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="view/color.jsp" %>



<%@ page import="com.reservation.ReservationDAO"%>
<%@ page import="com.reservation.Reservation"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Reservation</title>
</head>
<body>
    <h1>Add Reservation</h1>
    <form action="addReservation.jsp" method="post">
        User ID: <input type="text" name="user_id"><br>
        Vehicle ID: <input type="text" name="vehicle_id"><br>
        Start Date: <input type="date" name="start_date"><br>
        End Date: <input type="date" name="end_date"><br>
        Total Price: <input type="text" name="total_price"><br>
        Status: <input type="text" name="status"><br>
        <input type="submit" value="Add">
    </form>

    <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            int userId = Integer.parseInt(request.getParameter("user_id"));
            int vehicleId = Integer.parseInt(request.getParameter("vehicle_id"));
            java.sql.Date startDate = java.sql.Date.valueOf(request.getParameter("start_date"));
            java.sql.Date endDate = java.sql.Date.valueOf(request.getParameter("end_date"));
            double totalPrice = Double.parseDouble(request.getParameter("total_price"));
            String status = request.getParameter("status");

            Reservation reservation = new Reservation();
            reservation.setUserId(userId);
            reservation.setVehicleId(vehicleId);
            reservation.setStartDate(startDate);
            reservation.setEndDate(endDate);
            reservation.setTotalPrice(totalPrice);
            reservation.setStatus(status);

            ReservationDAO dao = new ReservationDAO();
            dao.addReservation(reservation);

            out.println("Reservation added successfully!");
        }
    %>
    <a href="listReservations.jsp">Back to List</a>
</body>
</html>