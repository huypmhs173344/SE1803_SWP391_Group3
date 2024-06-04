<%-- 
    Document   : login
    Created on : May 26, 2024, 10:31:39 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Login</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            .login-form {
                width: 340px;
                margin: 50px auto;
                font-size: 15px;
            }
            .login-form form {
                margin-bottom: 15px;
                background: #f7f7f7;
                box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
                padding: 30px;
            }
            .login-form h2 {
                margin: 0 0 15px;
            }
            .form-control, .btn {
                min-height: 38px;
                border-radius: 2px;
            }
            .btn {
                font-size: 15px;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div class="login-form">
            <form action="login" method="post" id="form">
                <h2 class="text-center">Log in</h2>       
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Username" required="required" name="id">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="Password" required="required" name="pass">
                </div>
                <div class="g-recaptcha" data-sitekey="6LeTQfApAAAAAIG0u1xXfUJHt66INRmu2IxiehDR"></div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block">Log in</button
                </div>           
                <div id="error" style="color: red"></div>
                <div style="color: red">${f}</div>
                <div class="clearfix">
                    <label class="float-left form-check-label"><input type="checkbox"> Remember me</label>
                    <a href="#" class="float-right">Forgot Password?</a>
                </div>  
            </form>
            <p class="text-center"><a href="signup">Create an Account</a></p>
        </div>
        <script src="https://www.google.com/recaptcha/api.js"></script>
        <script>
            window.onload = function() {
                const form = document.getElementById("form");
                const error = document.getElementById("error");

                form.addEventListener("submit", function(event) {
                    event.preventDefault();
                    const response = grecaptcha.getResponse();

                    if (response.length === 0) {
                        error.innerHTML = "Please check the reCAPTCHA.";
                    } else {
                        form.submit();
                    }
                });
            }
        </script>
    </body>
</html>

