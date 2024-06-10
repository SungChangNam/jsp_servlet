<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>차량 등록</title>
</head>
<body>
    <h2>차량 등록</h2>
    <form action="registerVehicleAction.jsp" method="post">
        <label for="model">차량 모델:</label>
        <input type="text" id="model" name="model" required><br>
        <label for="availability">가용 여부:</label>
        <select id="availability" name="availability">
            <option value="Y">가용</option>
            <option value="N">비가용</option>
        </select><br>
        <label for="pricePerDay">일일 가격:</label>
        <input type="number" id="pricePerDay" name="pricePerDay" required><br>
        <label for="imageUrl">이미지 URL:</label>
        <input type="text" id="imageUrl" name="imageUrl"><br>
        <input type="submit" value="등록">
    </form>
</body>
</html>