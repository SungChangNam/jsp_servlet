<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String loginId =(String)session.getAttribute("loginId"); %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="/real/css/register.css">
    <script type="text/javascript" src="script.js"></script>
</head>
<body>
    <header>
        <nav>
            <div class="logo">
                <a href="main.html">curumaster</a>
            </div>
            <ul class="menu center-menu">
                <li class="menu-item">
                    <a href="main.html">홈</a>
                    <ul class="submenu">
                        <li><a href="history.html">회사연혁</a></li>
                        <li><a href="business.html">사업소개</a></li>
                        <li><a href="directions.html">오시는길</a></li>
                    </ul>
                </li>
                <li class="menu-item">
                    <a href="car-info.html">차량 정보</a>
                    <ul class="submenu">
                        <li><a href="car-info.html">차량 정보</a></li>
                    </ul>
                </li>
                <li class="menu-item">
                    <a href="reviews.html">리뷰</a>
                </li>
                <li class="menu-item">
                    <a href="mypage.html">마이페이지</a>
                    <ul class="submenu">
                        <li><a href="booking-details.html" onclick="checkLogin('예약확인.html')">예약확인</a></li>
                        <li><a href="mypage.html" onclick="checkLogin('마이페이지.html')">마이페이지</a></li>
                        <li><a href="mypage.html" onclick="checkLogin('정보수정.html')">정보수정</a></li>
                        <li><a href="withdrawal.html" onclick="checkLogin('회원탈퇴.html')">회원탈퇴</a></li>
                    </ul>
                </li>
                <li class="menu-item">
                    <a href="#">고객지원</a>
                    <ul class="submenu">
                        <li><a href="notice.html">공지사항</a></li>
                        <li><a href="faq.html">FAQ</a></li>
                        <li><a href="guide.html">이용수칙</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="menu right-menu">
                <li class="menu-item"><a href="login.html">로그인</a></li>
                <li class="menu-item"><a href="register.html">회원가입</a></li>
            </ul>
        </nav>
    </header>

    <section class="signup-section">
        <div class="signup-container">
            <h1>Register</h1>
            <form class="signup-form" action="regProc.jsp" name="regForm" method="post" onsubmit="return inputCheck();">
                <label for="id">아이디</label>
                <input type="text" id="id" name="id" required>&nbsp;
                <input type="button" value="중복확인" onclick="idCheck(this.form.id.value)">
					
                <label for="pass">비밀번호</label>
                <input type="password" id="pass" name="pass" required>
                
                <label for="repass">비밀번호 확인</label>
                <input type="password" id="repass" name="repass" required>
                
                <label for="name">이름</label>
                <input type="text" id="name" name="name" required>

                <label for="phone1">전화번호</label>
                <select id="phone1" name="phone1">
                    <option value="02">02</option>
                    <option value="063">063</option>
                    <option value="033">033</option>
                    <option value="010">010</option>
                    <option value="070">070</option>
                </select> -
                <input type="text" name="phone2" size="5"> -
                <input type="text" name="phone3" size="5">

                <label for="email">이메일</label>
                <input type="email" id="email" name="email" required>

                <label for="zipcode">우편번호</label>
                <input type="text" id="zipcode" name="zipcode">&nbsp;
                <input type="button" value="찾기" onclick="zipCheck()">

                <label for="address1">주소</label>
                <input type="text" id="address1" name="address1" size="50">

                <label for="address2">상세 주소</label>
                <input type="text" id="address2" name="address2" size="50">

                <button type="submit">REGISTER</button>
            </form>
        </div>
    </section>

    <footer>
        <div class="footer-content">
            <div class="company-info">
                <h2>CURUMASTER</h2>
                <p>국내 가장 믿고 맡길 수 있는 서비스 제공 및 비용 절감</p>
                <p>현지화 해외에서도 현지 만큼 안심</p>
                <p>빠른 예약처리와 편리한 이용 여행 만족도를 한층 높여드립니다</p>
                <p>간편한 보험 및 계약 갱신 지원</p>
            </div>
            <div class="office-info">
                <h3>회사 정보</h3>
                <p>본사 주소: 서울특별시 영등포구 양평로123번지 32 센트럴 빌딩 4층 홍길동</p>
                <p>Other Office Locations</p>
                <p>Email: zeushacker@gmail.com</p>
                <p>Phone: 010-1234-5678</p>
            </div>
            <div class="office-hours">
                <h3>영업 시간</h3>
                <p>Sunday: 10:00 - 17:00</p>
                <p>Monday: 10:00 - 17:00</p>
                <p>Tuesday: 10:00 - 17:00</p>
                <p>Wednesday: 10:00 - 17:00</p>
                <p>Thursday: 10:00 - 17:00</p>
                <p>Friday: 10:00 - 17:00</p>
                <p>Saturday: 10:00 - 17:00</p>
            </div>
        </div>
    </footer>

    <script src="/real/js/main.js"></script>
</body>
</html>
