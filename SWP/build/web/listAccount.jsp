<%-- 
    Document   : listAccount
    Created on : Jun 4, 2024, 1:27:27 PM
    Author     : DUNGVT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Account Information</title> 
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                padding: 8px;
                text-align: left;
                border: 1px solid #ddd;
            }

            th {
                background-color: #42A5F5;
            }
        </style>
        <script>
            function deleteWarning(id,fname) {
                var selection = confirm("Are you sure to delete User " + fname + " ?");
                if (selection) {
                    window.location.href = "account?action=delete&id=" + id;
                }
            }
        </script>
    </head>
    <body>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Account Id</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.listA}" var="a">
                    <tr>
                        <td value="${a.id}" name="accid">${a.id}</td>
                        <td>${a.f_name}</td>
                        <td>${a.mail}</td>
                        <td>
                            <c:if test="${a.role == 0}">
                                Admin
                            </c:if>
                            <c:if test="${a.role == 1}">
                                Staff
                            </c:if>
                            <c:if test="${a.role == 2}">
                                Customer
                            </c:if>
                        </td>
                        <td>${a.addr}</td>
                        <td>${a.phone}</td>
                        <td>
                            <c:if test="${a.status == 1}">
                                Active
                            </c:if>
                            <c:if test="${a.status == 0}">
                                Suspended
                            </c:if>
                        </td>
                        <td>
                            <a href="account?action=update&id=${a.id}"><button class="btn btn-success">Edit</button></a>
                            &nbsp;
                            <a onclick="deleteWarning(${a.id},'${a.f_name}')"><button class="btn btn-danger">Delete</button></a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
