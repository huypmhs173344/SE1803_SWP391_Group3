<%-- 
    Document   : category-list
    Created on : Jun 28, 2024, 4:51:35 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Category List</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
    </head>
    <body>
        <div class="container">
            <h2>Category List</h2>
            <a href="manager-category?action=new" class="btn btn-primary">New Category</a>

            <c:if test="${not empty sessionScope.message}">
                <div class="alert alert-${sessionScope.messageType} alert-dismissible fade show" role="alert">
                    ${sessionScope.message}
                    <%
                        session.removeAttribute("message");
                    %>
                </div>
            </c:if>

            <table id="categoryTable" class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="category" items="${listCategory}">
                        <tr>
                            <td>${category.cid}</td>
                            <td>${category.cname}</td>
                            <td class="text-center">
                                <a href="manager-category?action=edit&cid=${category.cid}" class="btn btn-sm btn-info">Edit</a>
                                <a onclick="return confirm('Are you sure to delete?')" href="manager-category?action=delete&cid=${category.cid}" class="btn btn-sm btn-danger">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
        <script>
                $(document).ready(function () {
                    $('#categoryTable').DataTable({
                        "columnDefs": [
                            {"orderable": false, "targets": 2}
                        ]
                    });
                });
        </script>
    </body>
</html>
