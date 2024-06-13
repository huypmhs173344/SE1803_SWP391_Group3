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
    </head>
    <body>
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
                                               placeholder="Example: abc@gmail.com" oninput="validateEmail()">
                                        <span id="check_email_alert"></span>
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
                                                function validateEmail() {

                                                }
        </script>
    </body>
</html>
