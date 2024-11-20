// modal.js

// Function to open the login modal
function openLoginModal() {
	alert("Login Modal Opened!");
    const modal = document.getElementById("loginModal");
    if (modal) {
        modal.style.display = "block"; // Show the login modal
    }
}

// Function to open the register modal
function openRegisterModal() {
    const modal = document.getElementById("registerModal");
    if (modal) {
        modal.style.display = "block"; // Show the register modal
    }
}

// Function to close a modal by ID
function closeModal(modalId) {
    const modal = document.getElementById(modalId);
    if (modal) {
        modal.style.display = "none"; // Hide the modal
    }
}

// Close the modal if the user clicks outside of it
window.onclick = function(event) {
    var modal = document.getElementById("loginModal");
    if (event.target == modal) {
        closeModal('loginModal');
    }

    var registerModal = document.getElementById("registerModal");
    if (event.target == registerModal) {
        closeModal('registerModal');
    }
};
