<div class="modal" id="registerModal" tabindex="-1" aria-labelledby="registerModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="registerModalLabel">Register</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="closeModal('registerModal')"></button>
            </div>
            <div class="modal-body">
                <!-- Form will now submit directly to registerUser.jsp -->
                <form id="registerForm" action="../User/registerUser.jsp" method="POST">
                    <div class="mb-3">
                        <label for="registerUsername" class="form-label">Username</label>
                        <input type="text" class="form-control" id="registerUsername" name="username" required>
                    </div>
                    <div class="mb-3">
                        <label for="registerPassword" class="form-label">Password</label>
                        <input type="password" class="form-control" id="registerPassword" name="password" required>
                    </div>
                    <div class="mb-3">
                        <label for="registerConfirmPassword" class="form-label">Confirm Password</label>
                        <input type="password" class="form-control" id="registerConfirmPassword" name="confirmPassword" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Register</button>
                    <p>Already have an account? <a href="javascript:void(0)" onclick="switchToLogin()">Click here to login</a></p>
                </form>
            </div>
        </div>
    </div>
</div>
