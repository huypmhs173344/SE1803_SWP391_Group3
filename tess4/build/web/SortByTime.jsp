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
        <title>Tables</title>

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
        <script type="text/javascript">
            function showPopup() {
                var popup = document.getElementById("myPopup");
                popup.style.display = "block";
            }

            function hidePopup() {
                var popup = document.getElementById("myPopup");
                popup.style.display = "none";
            }

            function submitForm() {
                document.getElementById("updateForm").submit();
            }
        </script>
        <style>
            /* Popup container */
            .popup {
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                width: 300px;
                padding: 20px;
                background-color: white;
                box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
                z-index: 1000;
            }

            /* Popup overlay */
            .overlay {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 999;
            }
        </style>

        <!-- Main CSS-->
        <link href="css/theme.css" rel="stylesheet" media="all">

    </head>

    <body class="animsition">
        <div class="page-wrapper">

            <!-- MENU SIDEBAR-->
            <aside class="menu-sidebar d-none d-lg-block">
                <div class="logo">
                    <div class="col-lg-3">
                        <a href="#">
                            <h1 class="text-primary mb-0">Fruitables</h1>                               
                        </a>
                    </div>
                </div>
                <div class="menu-sidebar__content js-scrollbar1">
                    <nav class="navbar-sidebar">
                        <ul class="list-unstyled navbar__list">                           
                            <li>
                                <a href="chart.html">
                                    <i class="fas fa-chart-bar"></i>Revenue Management</a>
                            </li>
                            <li class="active">
                                <a href="table">
                                    <i class="fas fa-table"></i>Orders Managerment</a>
                            </li>
                            <li>
                                <a href="form.html">
                                    <i class="far fa-check-square"></i>Category Management</a>
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
                                            <div class="image">
                                                <img src="images/icon/image 1.jpg" alt="John Doe" />
                                            </div>
                                            <div class="content">
                                                <a class="js-acc-btn" href="#">Danh</a>
                                            </div>
                                            <div class="account-dropdown js-dropdown">
                                                <div class="info clearfix">
                                                    <div class="image">
                                                        <a href="#">
                                                            <img src="images/icon/image 1.jpg" alt="John Doe" />
                                                        </a>
                                                    </div>
                                                    <div class="content">
                                                        <h5 class="name">
                                                            <a href="#">Danh</a>
                                                        </h5>
                                                        <span class="email">Danhmin53@example.com</span>
                                                    </div>
                                                </div>
                                                <div class="account-dropdown__body">
                                                    <div class="account-dropdown__item">
                                                        <a href="#">
                                                            <i class="zmdi zmdi-account"></i>Account</a>
                                                    </div>
                                                </div>
                                                <div class="account-dropdown__footer">
                                                    <a href="#">
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
                                                <!--                                                    <button type="submit" class="au-btn-filter" value="Filter">
                                                                                                        <i class="zmdi zmdi-filter-list"></i>Filter</button>-->
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
                                            <li class="page-item active"><a href="Sort?index=${i}&id=${id}" class="page-link">${i}</a></li>
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
    <script src="vendor/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap JS-->
    <script src="vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="vendor/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS       -->
    <script src="vendor/slick/slick.min.js">
    </script>
    <script src="vendor/wow/wow.min.js"></script>
    <script src="vendor/animsition/animsition.min.js"></script>
    <script src="vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
    </script>
    <script src="vendor/counter-up/jquery.waypoints.min.js"></script>
    <script src="vendor/counter-up/jquery.counterup.min.js">
    </script>
    <script src="vendor/circle-progress/circle-progress.min.js"></script>
    <script src="vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="vendor/chartjs/Chart.bundle.min.js"></script>
    <script src="vendor/select2/select2.min.js">
    </script>

    <!-- Main JS-->
    <script src="js/main.js"></script>

</body>

</html>
<!-- end document-->

