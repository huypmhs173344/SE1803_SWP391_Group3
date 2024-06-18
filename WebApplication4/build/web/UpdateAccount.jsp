<%-- 
    Document   : UpdateAccount
    Created on : Jun 4, 2024, 6:28:46 PM
    Author     : DUNGVT
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Account</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
        <style>
            .row{
                margin-top: 2%;
            }
            .submit{
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-12 col-xs-12 edit_information">
                <form action="account"  method="POST">	
                    <h3 class="text-center"><strong>UPDATE ACCOUNT SETTING</strong></h3>
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <label class="profile_details_text">Account ID</label>
                                <input type="text" name="id" value="${u.id}" class="form-control"readonly="readonly" />
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <label class="profile_details_text">Full Name</label>
                                <input type="text" name="fname" value="${u.f_name}" class="form-control" readonly="readonly" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="form-group">
                                <label class="profile_details_text">Email Address</label>
                                <input type="text" name="mail" value="${u.mail}" class="form-control" readonly="readonly" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="form-group">
                                <label class="profile_details_text">Mobile Number</label>
                                <input type="text" name="phone" value="${u.phone}" class="form-control" readonly="readonly" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="form-group">
                                <label class="profile_details_text">Address Details</label>
                                <input type="text" name="address" value="${u.addr}" class="form-control" readonly="readonly" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <label class="profile_details_text">Role</label>
                                <select name="role" class="form-control">
                                    <option value="0" ${u.role == 0 ? "selected":""}>Admin</option>
                                    <option value="1"${u.role == 1 ? "selected":""}>Staff</option>
                                    <option value="2"${u.role == 2 ? "selected":""}>Customer</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <label class="profile_details_text">Status</label>
                                <select name="status" class="form-control">
                                    <option value="0" ${u.role == 0 ? "selected":""}>Suspended</option>
                                    <option value="1"${u.role == 1 ? "selected":""}>Active</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 submit">
                            <div class="form-group">
                                <input type="submit" class="btn btn-success" value="Update">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!--        <form action="account" method="POST">
                    <table>
                        <tbody>
                            <tr>
                                <td>Account ID</td>
                                <td>
                                    <input type="text" name="id" value="${u.id}" readonly="readonly" />
                                </td>
                            </tr>
                            <tr>
                                <td>Full Name</td>
                                <td>
                                    <input type="text" name="fname" value="${u.f_name}" class="form-control" readonly="readonly" />
                                </td>
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td>
                                    <input type="text" name="mail" value="${u.mail}" class="form-control" readonly="readonly" />
                                </td>
                            </tr>
                            <tr>
                                <td>Role</td>
                                <td>
                                    <select name="role" class="form-control">
                                        <option value="0" ${u.role == 0 ? "selected":""}>Admin</option>
                                        <option value="1"${u.role == 1 ? "selected":""}>Staff</option>
                                        <option value="2"${u.role == 2 ? "selected":""}>Customer</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Address</td>
                                <td>
                                    <input type="text" name="address" value="${u.addr}" class="form-control" readonly="readonly" />
                                </td>
                            </tr>
                            <tr>
                                <td>Phone number</td>
                                <td>
                                    <input type="text" name="phone" value="${u.phone}" class="form-control" readonly="readonly" />
                                </td>
                            </tr>
                            <tr>
                                <td>Account Status</td>
                                <td>
                                    <input type="radio" name="status" class="form-control" value="1" ${u.status == 1 ? "checked":""}/>
                                    <input type="radio" name="status" class="form-control" value="0" ${u.status == 0 ? "checked":""}/>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><input type="submit" value="Update"/></td>
                            </tr>
                        </tbody>
                    </table>
                </form>-->
    </body>
</html>
