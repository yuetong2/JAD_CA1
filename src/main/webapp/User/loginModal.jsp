<div class="modal" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="loginModalLabel">Login</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="closeModal('loginModal')"></button>
            </div>
            <div class="modal-body">
                <!-- Form now submits to verifyUser.jsp -->
                <form id="loginForm" action="../User/verifyUser.jsp" method="POST">
                    <div class="mb-3">
                        <label for="loginUsername" class="form-label">Username</label>
                        <input type="text" class="form-control" id="loginUsername" name="username" required>
                    </div>
                    <div class="mb-3">
                        <label for="loginPassword" class="form-label">Password</label>
                        <input type="password" class="form-control" id="loginPassword" name="password" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Login</button>
                    <p>Don't have an account? <a href="javascript:void(0)" onclick="switchToRegister()">Click here to register</a></p>
                </form>
            </div>
        </div>
    </div>
</div>
