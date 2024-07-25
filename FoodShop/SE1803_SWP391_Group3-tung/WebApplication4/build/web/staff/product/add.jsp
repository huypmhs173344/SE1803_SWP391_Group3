<%-- 
    Document   : add
    Created on : Jun 3, 2024, 6:15:54 PM
    Author     : HP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add New Product</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
            <h1 class="my-4">Add New Product</h1>
            <form action="product?action=add" method="post">
                <div class="form-group">
                    <label for="pname">Product Name</label>
                    <input type="text" class="form-control" id="pname" name="pname" required>
                </div>
                <div class="form-group">
                    <label for="cid">Category ID</label>
                    <select name="category" class="form-control">
                        <c:forEach items="${listC}" var="cate">
                            <option value="${cate.cid}">${cate.cname}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="price">Price</label>
                    <input type="number" class="form-control" id="price" name="price" required min="0">
                </div>
                <div class="form-group">
                    <label for="pdes">Description</label>
                    <textarea class="form-control" id="pdes" name="pdes" required></textarea>
                </div>
                <div class="form-group">
                    <label for="image">Image URL</label>
                    <input type="text" class="form-control" id="image" name="image" required>
                </div>
                <div class="form-group">
                    <label for="pdes">Status</label>
                    <select name="status" class="form-control">
                        <option value="True">True</option>
                        <option value="False">False</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Add Product</button>
            </form>
        </div>
    </body>
</html>
