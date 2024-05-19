<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.reservation.ReservationDAO"%>
<%@ page import="com.reservation.Reservation"%>
<%@ page import="java.util.Date"%>

<%
    String model = request.getParameter("model");
    String availability = request.getParameter("availability");
    double pricePerDay;
    String pricePerDayParam = request.getParameter("pricePerDay");
    if (pricePerDayParam != null && !pricePerDayParam.isEmpty()) {
        pricePerDay = Double.parseDouble(pricePerDayParam);
    } else {
        // 기본값 설정
        pricePerDay = 0.0;
    }
	
    
    String imageUrl = request.getParameter("imageUrl");
    
    

    ReservationDAO reservationDAO = ReservationDAO.getInstance();
    Reservation reservation = new Reservation();
    reservation.setUserId(1); // 사용자 ID를 설정하세요. (임시값으로 1로 설정)
    reservation.setVehicleId(1); // 차량 ID를 설정하세요. (임시값으로 1로 설정)
    reservation.setStartDate(new Date()); // 현재 날짜로 설정 (임시값)
    reservation.setEndDate(new Date()); // 현재 날짜로 설정 (임시값)
    reservation.setTotalPrice(pricePerDay); // 일일 가격으로 설정
    reservation.setStatus("Pending"); // 상태를 설정하세요. (임시값으로 "Pending"으로 설정)

    reservationDAO.insertReservation(reservation);

    response.sendRedirect("vehicleRegistration.jsp");
%>
