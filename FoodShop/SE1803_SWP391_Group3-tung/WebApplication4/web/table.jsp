<%-- 
    Document   : table
    Created on : Jun 13, 2024, 1:38:26 PM
    Author     : LAPTOP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags-->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="au theme template">
        <meta name="author" content="Hau Nguyen">
        <meta name="keywords" content="au theme template">

        <!-- Title Page-->
        <title>Management Order</title>

        <!-- Fontfaces CSS-->
        <link href="cssstaff/font-face.css" rel="stylesheet" media="all">
        <link href="vendorstaff/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
        <link href="vendorstaff/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
        <link href="vendorstaff/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

        <!-- Bootstrap CSS-->
        <link href="vendorstaff/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

        <!-- Vendor CSS-->
        <link href="vendorstaff/animsition/animsition.min.css" rel="stylesheet" media="all">
        <link href="vendorstaff/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
        <link href="vendorstaff/wow/animate.css" rel="stylesheet" media="all">
        <link href="vendorstaff/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
        <link href="vendorstaff/slick/slick.css" rel="stylesheet" media="all">
        <link href="vendorstaff/select2/select2.min.css" rel="stylesheet" media="all">
        <link href="vendorstaff/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

        <!-- Main CSS-->
        <link href="cssstaff/theme.css" rel="stylesheet" media="all">

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
                            <li>
                                <a href="statistic">
                                    <i class="fas fa-chart-bar"></i>Revenue Management</a>
                            </li>
                            <li class="active">
                                <a href="table?index=1">
                                    <i class="fas fa-table"></i>Orders Management</a>
                            </li>
                            <li>
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
                            <div class="row">
                                <div class="col-lg-6">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <!-- DATA TABLE -->
                                    <h3 class="title-5 m-b-35">Order Table</h3>
                                    <div class="table-data__tool">
                                        <div class="table-data__tool-left">
                                            <div class="rs-select2--light rs-select2--md">
                                                <form class="form-header" action="SearchOrder?index=1" method="POST">
                                                    <input class="au-input au-input--xl" type="text" name="search" placeholder="Search for datas &amp; reports..." />
                                                    <button class="au-btn--submit" type="submit">
                                                        <i class="zmdi zmdi-search"></i>
                                                    </button>
                                                </form>  
                                            </div>

                                            <div class="table-data__tool-right">
                                                <div class="rs-select2--light rs-select2--sm">
                                                    <select class="js-select2" name="Time" onchange="window.location.href = this.value;" style="width: max-content;">
                                                        <option selected="selected">Time</option>
                                                        <option value="Sort?id=o&index=1">Old</option>
                                                        <option value="Sort?id=n&index=1">New</option>
                                                    </select>
                                                    <div class="dropDownSelect2"></div>
                                                </div> </form> 
                                                <div class="rs-select2--light rs-select2--sm">
                                                    <select class="js-select2" name="Price" onchange="window.location.href = this.value;" style="width: max-content;">
                                                        <option selected="selected">Price</option>
                                                        <option value="SortByPrice?id=e&index=1">Expensive</option>
                                                        <option value="SortByPrice?id=c&index=1">Cheapest</option>
                                                    </select>
                                                    <div class="dropDownSelect2"></div>
                                                </div>
                                            </div>                                               
                                        </div>

                                    </div>
                                </div>
                                <div class="table-responsive table-responsive-data2">
                                    <table class="table table-data2">
                                        <thead>
                                            <tr>
                                                <th>Order ID</th>
                                                <th>Name</th>
                                                <th>Phone</th>
                                                <th>Address</th>
                                                <th>Total Money</th>
                                                <th>Date</th>
                                                <th>Status</th>
                                                <th>Note</th>
                                                <th>iPay</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listO}" var="x">
                                                <tr class="tr-shadow"> 
                                                    <td>${x.order_id}</td>
                                                    <td>${x.name}</td>
                                                    <td>${x.phone}</td>
                                                    <td>${x.address}</td>
                                                    <td class="desc">${x.total_money}</td>
                                                    <td>${x.date}</td>
                                                    <td class="status--process">
                                                        <c:if test="${x.status_id==0}">
                                                            Delivering
                                                        </c:if>
                                                        <c:if test="${x.status_id==1}">
                                                            Complete
                                                        </c:if>
                                                    </td>
                                                    <td>${x.note}</td>
                                                    <td class="status--process">
                                                        <c:if test="${x.iPay==0}">
                                                            Payment on delivery
                                                        </c:if>
                                                        <c:if test="${x.iPay==1}">
                                                            Online Banking
                                                        </c:if>
                                                    </td>
                                                    <td>
                                                        <div class="table-data-feature">
                                                            <a href ="OrderDetail?order_id=${x.order_id}" >
                                                                <button class="item" data-toggle="tooltip" data-placement="top" title="view">
                                                                    <i class="zmdi zmdi-mail-send"></i>
                                                                </button>
                                                            </a>
                                                            <a href ="updateOrder?order_id=${x.order_id}" >
                                                                <button  class="item" data-toggle="tooltip" data-placement="top" title="Update">
                                                                    <i class="zmdi zmdi-edit"></i>
                                                                </button>
                                                            </a>                                                            
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr class="spacer"></tr>
                                            </c:forEach>        
                                    </table>
                                </div>
                                <!-- END DATA TABLE -->
                            </div>
                        </div>                           
                        <div class="clearfix">
                            <ul class="pagination">
                                <ul class="pagination">
                                    <c:forEach begin="1" end="${end}" var="i">
                                        <li class="page-item active"><a href="table?index=${i}" class="page-link">${i}</a></li>
                                        </c:forEach>                           

                                </ul>
                            </ul>
                        </div>
                        <!-- END DATA TABLE-->
                    </div>
                </div>

            </div>
        </div>
    </div>


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

</body>

</html>
<!-- end document-->

