<%-- 
    Document   : edit
    Created on : Jun 3, 2024, 6:38:29 PM
    Author     : HP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edit Product</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
            <h1 class="my-4">Edit Product</h1>
            <form action="product?action=edit" method="post">
                <div class="form-group">
                    <label for="pname">Product Name</label>
                    <input type="text" class="form-control" id="pname" name="pname" required value="${product.pname}">
                </div>
                <div class="form-group">
                    <label for="cid">Category ID</label>
                    <select name="category" class="form-control">
                        <c:forEach items="${categories}" var="cate">
                            <option value="${cate.cid}" ${product.cid ==cate.cid ? "selected" : ""}>${cate.cname}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="price">Price</label>
                    <input type="number" class="form-control" id="price" name="price" required value="${product.price}">
                </div>
                <div class="form-group">
                    <label for="pdes">Description</label>
                    <textarea class="form-control" id="pdes" name="pdes" required>${product.pdes}</textarea>
                </div>
                <div class="form-group">
                    <label for="image">Image URL</label>
                    <input type="text" class="form-control" id="image" name="image" required value="${product.image}">
                    <img src="${product.image}" width="200px" height="100px"/>
                </div>
                <div class="form-group">
                    <label for="pdes">Status</label>
                    <select name="status" class="form-control">
                        <option value="True" ${product.status == "True" ? "selected" : ""}>True</option>
                        <option value="False"${product.status == "False" ? "selected" : ""}>False</option>
                    </select>
                </div>
                <input type="hidden" name="id" value="${product.pid}">
                <button type="submit" class="btn btn-primary">Update Product</button>
            </form>
        </div>
    </body>
</html>
