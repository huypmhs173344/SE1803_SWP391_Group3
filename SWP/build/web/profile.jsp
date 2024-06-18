<%-- 
    Document   : profile
    Created on : Jun 12, 2024, 11:00:33 PM
    Author     : DUNGVT
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!--Customized Bootstrap Stylesheet--> 
        <link href="css/bootstrap_ver1.min.css" rel="stylesheet">

        <!--Template Stylesheet--> 
        <link href="css/style_ver1.css" rel="stylesheet">
    </head>
    <body>
        <!-- Navbar start -->
        <div class="container-fluid fixed-top">
            <div class="container topbar bg-primary d-none d-lg-block">
                <div class="d-flex justify-content-between">
                    <div class="top-info ps-2">
                        <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i> <a href="#" class="text-white">123 Street, New York</a></small>
                        <small class="me-3"><i class="fas fa-envelope me-2 text-secondary"></i><a href="#" class="text-white">Email@Example.com</a></small>
                    </div>
                    <div class="top-link pe-2">
                        <a href="#" class="text-white"><small class="text-white mx-2">Privacy Policy</small>/</a>
                        <a href="#" class="text-white"><small class="text-white mx-2">Terms of Use</small>/</a>
                        <a href="#" class="text-white"><small class="text-white ms-2">Sales and Refunds</small></a>
                    </div>
                </div>
            </div>
            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">
                    <a href="index.html" class="navbar-brand"><h1 class="text-primary display-6">Fruitables</h1></a>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                        <div class="navbar-nav mx-auto">
                            <a href="index.html" class="nav-item nav-link active">Home</a>
                            <a href="shop.html" class="nav-item nav-link">Shop</a>
                            <a href="shop-detail.html" class="nav-item nav-link">Shop Detail</a>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                                <div class="dropdown-menu m-0 bg-secondary rounded-0">
                                    <a href="cart.html" class="dropdown-item">Cart</a>
                                    <a href="chackout.html" class="dropdown-item">Chackout</a>
                                    <a href="testimonial.html" class="dropdown-item">Testimonial</a>
                                    <a href="404.html" class="dropdown-item">404 Page</a>
                                </div>
                            </div>
                            <a href="contact.html" class="nav-item nav-link">Contact</a>
                        </div>
                        <div class="d-flex m-3 me-0">
                            <button class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4" data-bs-toggle="modal" data-bs-target="#searchModal"><i class="fas fa-search text-primary"></i></button>
                            <a href="#" class="position-relative me-4 my-auto">
                                <i class="fa fa-shopping-bag fa-2x"></i>
                                <span class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1" style="top: -5px; left: 15px; height: 20px; min-width: 20px;">3</span>
                            </a>
                            <a href="#" class="my-auto">
                                <i class="fas fa-user fa-2x"></i>
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->

        <section class="bg-light py-3 py-md-5 py-xl-8">
            <div class="container">
                <div class="row justify-content-md-center">
                    <div class="col-12 col-md-10 col-lg-8 col-xl-7 col-xxl-6">
                        <h2 class="mb-4 display-5 text-center">Profile</h2>
                        <hr class="w-50 mx-auto mb-5 mb-xl-9 border-dark-subtle">
                    </div>
                </div>
            </div>
            <div style="margin-left: 15%" class="col-12 col-lg-8 col-xl-9">
                <div class="card widget-card border-light shadow-sm">
                    <div class="card-body p-2">
                        <ul class="nav nav-tabs" id="profileTab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link ${requestScope.active_nav_profile}" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" 
                                        aria-selected="${requestScope.active_nav_profile == "active" ? "true" : "false"}">Profile</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link ${requestScope.active_nav_pass}" id="password-tab" data-bs-toggle="tab" data-bs-target="#password-tab-pane" type="button" role="tab" aria-controls="password-tab-pane" 
                                        aria-selected="${requestScope.active_nav_pass == "active" ? "true" : "false"}">Password</button>
                            </li>
                        </ul>
                        <div class="tab-content pt-2" id="profileTabContent">
                            <div class="tab-pane fade ${requestScope.active_nav_profile == "active" ? "show active" : ""}" 
                                 id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
                                <form action="updateProfile?id=${u.id}&action=profile" method="POST" class="row gy-3 gy-xxl-4">
                                    <div class="col-12 col-md-6">
                                        <label for="inputFirstName" class="form-label">Full Name</label>
                                        <input type="text" class="form-control" id="inputFirstName" name="fname" value="${u.f_name}"
                                               placeholder="Example: Edward Johny">
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <label for="inputPhone" class="form-label">Phone</label>
                                        <input type="tel" class="form-control" id="inputPhone" name="phone" value="${u.phone}"
                                               placeholder="Example: 123-456-7890" oninput="validatePhone()">
                                        <span id="check_phone_alert"></span>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <label for="inputEmail" class="form-label">Email</label>
                                        <input type="email" class="form-control" id="inputEmail" name="mail" value="${u.mail}"
                                               placeholder="Example: abc@gmail.com" oninput="validateEmail()" readonly="">
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <label for="inputAddress" class="form-label">Address</label>
                                        <input type="text" class="form-control" id="inputAddress" name="addr" value="${u.addr}">
                                    </div>                             
                                    <div class="col-12">
                                        <button type="submit" class="btn btn-primary" id="updateProflie">Save Changes</button>
                                    </div>
                                </form>
                            </div>
                            <div class="tab-pane fade ${requestScope.active_nav_pass == "active" ? "show active" : ""}" 
                                 id="password-tab-pane" role="tabpanel" aria-labelledby="password-tab" tabindex="0">
                                <form action="updateProfile?id=${u.id}&action=pass" method="POST">
                                    <div class="row gy-3 gy-xxl-4">
                                        <div class="col-12">
                                            <label for="currentPassword" class="form-label">Current Password</label>
                                            <input type="password" class="form-control" id="currentPassword" name="cpass" required=""
                                                   placeholder="Input your old password here" value="${requestScope.cpass}">
                                        </div>
                                        <div style="margin-left: 1%"class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" onclick="Toggle('currentPassword')">
                                            <label class="form-check-label">
                                                Show password
                                            </label>
                                        </div>
                                        <c:if test="${requestScope.alert_false_cpass != null}">
                                            <div class="alert alert-danger" role="alert">
                                                ${requestScope.alert_false_cpass}
                                            </div>
                                        </c:if>
                                        <div class="col-12">
                                            <label for="newPassword" class="form-label">New Password</label>
                                            <input type="password" class="form-control" id="newPassword" name="npass" required=""
                                                   placeholder="Input your new password you want to change here" value="${requestScope.npass}">
                                        </div>
                                        <div style="margin-left: 1%"class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" onclick="Toggle('newPassword')">
                                            <label class="form-check-label">
                                                Show password
                                            </label>
                                        </div>
                                        <c:if test="${requestScope.alert_false_npass != null}">
                                            <div class="alert alert-warning" role="alert">
                                                ${requestScope.alert_false_npass}
                                            </div>
                                        </c:if>
                                        <div class="col-12">
                                            <label for="confirmPassword" class="form-label">Confirm Password</label>
                                            <input type="password" class="form-control" id="confirmPassword" name="cnpass" oninput="checkMatchPass()" required=""
                                                   placeholder="Reinput your new password here" value="${requestScope.cnpass}">
                                            <span id="check_pass_alert"></span>
                                        </div>
                                        <div style="margin-left: 1%"class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" onclick="Toggle('confirmPassword')">
                                            <label class="form-check-label">
                                                Show password
                                            </label>
                                        </div>
                                        <div class="col-12">
                                            <button type="submit"  class="btn btn-primary" id="changePass">Change Password</button>
                                        </div>
                                        <c:if test="${requestScope.alert_true != null}">
                                            <div class="alert alert-success" role="alert">
                                                ${requestScope.alert_true}
                                            </div>
                                        </c:if>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://unpkg.com/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                                                function checkMatchPass() {
                                                    let npass = document.getElementById("newPassword").value;
                                                    let cnpass = document.getElementById("confirmPassword").value;

                                                    if (npass !== cnpass) {
                                                        document.getElementById('check_pass_alert').style.color = 'red';
                                                        document.getElementById('check_pass_alert').innerHTML = 'Not match with new pass';
                                                        document.getElementById("changePass").disabled = true;
                                                        document.getElementById("changePass").style.opacity = 0.3;
                                                    } else {
                                                        document.getElementById('check_pass_alert').style.color = 'green';
                                                        document.getElementById('check_pass_alert').innerHTML = 'Pass matched';
                                                        document.getElementById("changePass").disabled = false;
                                                        document.getElementById("changePass").style.opacity = 1;
                                                    }
                                                }
                                                function Toggle(id) {
                                                    let temp = document.getElementById(id);

                                                    if (temp.type === "password") {
                                                        temp.type = "text";
                                                    } else {
                                                        temp.type = "password";
                                                    }
                                                }
                                                
                                                function validatePhone() {
                                                    let inputNum = document.getElementById("inputPhone");
                                                    var phonePartern = /^\d{10}$/;
                                                    if (inputNum.value.match(phonePartern))
                                                    {
                                                        document.getElementById('check_phone_alert').style.color = 'red';
                                                        document.getElementById('check_phone_alert').innerHTML = 'Phone is not match with format';
                                                        document.getElementById("updateProflie").disabled = true;
                                                        document.getElementById("updateProflie").style.opacity = 0.3;
                                                    }
                                                }
                                                
                                                function phonenumber(inputtxt)
                                                {
                                                    var phoneno = /^\d{10}$/;
                                                    if ((inputtxt.value.match(phoneno))
                                                    {
                                                        return true;
                                                    } else
                                                    {
                                                        alert("message");
                                                        return false;
                                                    }
                                                }
        </script>
    </body>
</html>
