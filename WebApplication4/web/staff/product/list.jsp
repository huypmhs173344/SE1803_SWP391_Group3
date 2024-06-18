<%-- 
    Document   : list
    Created on : Jun 3, 2024, 5:43:37 PM
    Author     : HP
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>All Products</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css"/>
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    </head>
    <body>
        <div class="container">
            <h1 class="my-4">All Products</h1>
            <a class="btn btn-success" href="product?action=add">Add New</a>
            <script>
                $(document).ready(function () {
                    $("#data-table").DataTable({
                        "columnDefs": [
                            {"searchable": false, "targets": [2, 3, 4, 5, 6]}
                        ],
                    });
                });
            </script>
            <span style="color: green">${param.message}</span>
            <table class="table table-striped" id="data-table">
                <thead>
                    <tr>
                        <th scope="col">NO.</th>
                        <th scope="col">Product Name</th>
                        <th scope="col">Image</th>
                        <th scope="col">Price</th>
                        <th scope="col">Description</th>
                        <th scope="col">Status</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="product" items="${products}" varStatus="status">
                        <tr>
                            <td>${status.index + 1}</td>
                            <td>${product.pname}</td>
                            <td>
                                <img src="${product.image}" alt="${product.pname}" class="img-thumbnail" style="width: 100px;">
                            </td>
                            <td>${product.price}</td>
                            <td>${product.pdes}</td>
                            <td>${product.status}</td>
                            <td>
                                <a href="product?action=edit&id=${product.pid}" class="btn btn-warning">Edit</a>
                                <a href="product?action=hidden&id=${product.pid}&isHidden=${product.status=="True" ? "False" : "True"}" class="btn ${product.status=="True" ? "btn-primary" : "btn-info"}">
                                    ${product.status=="True" ? "Hidden" : "Active"}
                                </a>
                                <a onclick="return confirm('Are you sure to delete this product?')" href="product?action=delete&id=${product.pid}" class="btn btn-danger">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
