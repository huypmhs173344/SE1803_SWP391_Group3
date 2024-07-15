<%-- 
    Document   : add-category
    Created on : Jun 28, 2024, 4:52:45 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Category Form</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script>
            function validateForm() {
                var cname = document.forms["categoryForm"]["cname"].value;
                if (cname == "") {
                    alert("Name must be filled out");
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>
        <div class="container">
            <h2>Category Form</h2>
            <form name="categoryForm" action="manager-category" method="post" onsubmit="return validateForm()">
                <div class="form-group">
                    <label>Name</label>
                    <input type="text" name="cname" class="form-control" value="${category.cname}" required>
                </div>
                <input type="hidden" name="cid" class="form-control" value="${category.cid}" required>
                <input type="hidden" name="action" value="${category == null || category.cid == 0 ? 'insert' : 'update'}">
                <button type="submit" class="btn btn-primary">${category == null || category.cid == 0 ? 'Save' : 'Update'}</button>
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger" role="alert">
                        ${errorMessage}
                    </div>
                </c:if>
            </form>
        </div>
    </body>
</html>
