document.addEventListener("DOMContentLoaded", function() {
    const isLoggedIn = false; // Change this to true if the user is logged in

    const submitReviewButton = document.getElementById("submitReviewButton");
    if (isLoggedIn) {
        submitReviewButton.disabled = false;
    }
});

function checkLoginSubmit() {
    const isLoggedIn = false; // Change this to true if the user is logged in

    if (!isLoggedIn) {
        alert("로그인이 필요합니다.");
        window.location.href = 'login.html';
        return false;
    }
    return true;
}
