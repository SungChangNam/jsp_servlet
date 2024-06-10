function checkLogin(page) {
    // Simulate a login check
    const isLoggedIn = false; // Change this to true if the user is logged in

    if (!isLoggedIn) {
        window.location.href = 'login.html';
    } else {
        window.location.href = page;
    }
}
