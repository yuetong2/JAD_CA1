// Function to open the login modal
function openLoginModal() {
    document.getElementById("loginModal").style.display = "block";
    document.getElementById("loginForm").reset();
}

// Function to open the register modal
function openRegisterModal() {
    document.getElementById("registerModal").style.display = "block";
    document.getElementById("registerForm").reset();
}

// Function to close a modal by ID
function closeModal(modalId) {
    document.getElementById(modalId).style.display = "none";
}

// Function to switch from login to register modal
function switchToRegister() {
    closeModal('loginModal');
    openRegisterModal();
}

// Function to switch from register to login modal
function switchToLogin() {
    closeModal('registerModal');
    openLoginModal();
}

// Close the modal if the user clicks outside of it
window.onclick = function(event) {
    var loginModal = document.getElementById("loginModal");
    var registerModal = document.getElementById("registerModal");
    if (event.target == loginModal) {
        closeModal('loginModal');
    } else if (event.target == registerModal) {
        closeModal('registerModal');
    }
};
