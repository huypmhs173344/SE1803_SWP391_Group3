<%-- 
    Document   : statistic
    Created on : Jul 10, 2024, 6:01:33 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags-->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="au theme template">
        <meta name="author" content="Hau Nguyen">
        <meta name="keywords" content="au theme template">

        <!-- Title Page-->
        <title>Management | Food Shop</title>

        <!-- Fontfaces CSS-->
        <link href="css/font-face.css" rel="stylesheet" media="all">
        <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
        <link href="vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
        <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

        <!-- Bootstrap CSS-->
        <link href="vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

        <!-- Vendor CSS-->
        <link href="vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
        <link href="vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
        <link href="vendor/wow/animate.css" rel="stylesheet" media="all">
        <link href="vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
        <link href="vendor/slick/slick.css" rel="stylesheet" media="all">
        <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
        <link href="vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

        <!-- Main CSS-->
        <link href="css/theme_1.css" rel="stylesheet" media="all">

        <style>

            formchart {
                background: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            label {
                display: block;
                margin-bottom: 10px;
                font-weight: bold;
            }
            input[type="date"] {
                padding: 10px;
                width: 100%;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 4px;
                margin-bottom: 20px;
            }
            input[type="submit"] {
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            input[type="submit"]:hover {
                background-color: #45a049;
            }
        </style>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
    </head>

    <body class="animsition">
        <div class="page-wrapper">
            <!-- MENU SIDEBAR-->
            <aside class="menu-sidebar d-none d-lg-block">
                <div class="logo">
                    <div class="col-lg-3">
                        <a href="#">
                            <h1 class="text-primary mb-0">Food Shop</h1>                               
                        </a>
                    </div>
                </div>
                <div class="menu-sidebar__content js-scrollbar1">
                    <nav class="navbar-sidebar">
                        <ul class="list-unstyled navbar__list">                           
                            <li >
                                <a href="statistic">
                                    <i class="fas fa-chart-bar"></i>Revenue Management</a>
                            </li>
                            <li >
                                <a href="table?index=1">
                                    <i class="fas fa-table"></i>Orders Management</a>
                            </li>
                            <li class="active">
                                <a href="manacate">
                                    <i class="far fa-check-square"></i>Category Management</a>
                            </li>       
                            <li>
                                <a href="product">
                                    <i class="far fa-check-square"></i>Product Management</a>
                            </li>  
                        </ul>
                    </nav>
                </div>
            </aside>
            <!-- END MENU SIDEBAR-->

            <!-- PAGE CONTAINER-->
            <div class="page-container">
                <!-- HEADER DESKTOP-->
                <header class="header-desktop">
                    <div class="section__content section__content--p30">
                        <div class="container-fluid">
                            <div class="header-wrap">
                                <div class="header-button">


                                    <div class="account-wrap">
                                        <div class="account-item clearfix js-item-menu">
                                            <div class="content">
                                                <a class="js-acc-btn" href="#">${name}</a>
                                            </div>
                                            <div class="account-dropdown js-dropdown">
                                                <div class="info clearfix">
                                                    <div class="content">
                                                        <h5 class="name">
                                                            <a href="#">${name}</a>
                                                        </h5>
                                                    </div>
                                                </div>
                                                <div class="account-dropdown__body">
                                                </div>
                                                <div class="account-dropdown__footer">
                                                    <a href="login">
                                                        <i class="zmdi zmdi-power"></i>Logout</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </header>
                <!-- END HEADER DESKTOP-->

                <!-- MAIN CONTENT-->

                <div class="main-content">
                    <div class="section__content section__content--p30">
                        <div class="container-fluid">
                            <a href="manacate?action=new" class="btn btn-primary">New Category</a>

                            <c:if test="${not empty sessionScope.message}">
                                <div class="alert alert-${sessionScope.messageType} alert-dismissible fade show" role="alert">
                                    ${sessionScope.message}
                                    <%
                                        session.removeAttribute("message");
                                    %>
                                </div>
                            </c:if>

                            <table id="categoryTable" class="table table-bordered" style="border: 2px solid #000">
                                <thead>
                                    <tr>
                                        <th style="border: 2px solid #000">ID</th>
                                        <th style="border: 2px solid #000">Name</th>
                                        <th style="border: 2px solid #000">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="category" items="${listCategory}">
                                        <tr>
                                            <td style="border: 2px solid #000">${category.cid}</td>
                                            <td style="border: 2px solid #000">${category.cname}</td>
                                            <td class="text-center" style="border: 2px solid #000">
                                                <a href="manacate?action=edit&cid=${category.cid}" class="btn btn-sm btn-info">Edit</a>
                                                <a onclick="return confirm('Are you sure to delete?')" href="manacate?action=delete&cid=${category.cid}" class="btn btn-sm btn-danger">Delete</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
                <!-- END MAIN CONTENT-->
            </div>
            <!-- END PAGE CONTAINER-->
        </div>
        <!-- Jquery JS-->
        <script src="vendorstaff/jquery-3.2.1.min.js"></script>
        <!-- Bootstrap JS-->
        <script src="vendorstaff/bootstrap-4.1/popper.min.js"></script>
        <script src="vendorstaff/bootstrap-4.1/bootstrap.min.js"></script>
        <!-- Vendor JS       -->
        <script src="vendorstaff/slick/slick.min.js">
        </script>
        <script src="vendorstaff/wow/wow.min.js"></script>
        <script src="vendorstaff/animsition/animsition.min.js"></script>
        <script src="vendorstaff/bootstrap-progressbar/bootstrap-progressbar.min.js">
        </script>
        <script src="vendorstaff/counter-up/jquery.waypoints.min.js"></script>
        <script src="vendorstaff/counter-up/jquery.counterup.min.js">
        </script>
        <script src="vendorstaff/circle-progress/circle-progress.min.js"></script>
        <script src="vendorstaff/perfect-scrollbar/perfect-scrollbar.js"></script>
        <script src="vendorstaff/chartjs/Chart.bundle.min.js"></script>
        <script src="vendorstaff/select2/select2.min.js">
        </script>

        <!-- Main JS-->
        <script src="jsstaff/main.js"></script>
        <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
        <script>
                                                            $(document).ready(function () {
                                                                $('#categoryTable').DataTable();
                                                            });
        </script>

    </body>

</html>
<!-- end document-->
