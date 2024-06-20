<%-- 
    Document   : ListAccount
    Created on : Jun 18, 2024, 8:11:17 PM
    Author     : DUNGVT
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Account Manager</title>

        <!-- Custom fonts for this template-->
        <link href="viewAdmin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="viewAdmin/css_admin/sb-admin-2.min.css" rel="stylesheet">

        <!-- Custom styles for this page -->
        <link href="viewAdmin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

        <!-- Import jquery cdn -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
                integrity=
                "sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
                crossorigin="anonymous">
        </script>

        <script src=
                "https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
                integrity=
                "sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
                crossorigin="anonymous">
        </script>

        <script>
            function deleteWarning(id, fname) {
                var selection = confirm("Are you sure to delete User " + fname + " ?");
                if (selection) {
                    window.location.href = "account?action=delete&id=" + id;
                }
            }
        </script>
    </head>
    <body id="page-top">

        <!--Page Wrapper--> 
        <div id="wrapper"><!--

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                    <div class="sidebar-brand-icon">
                        <i class="fas fa-solid fa-user-tie"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">Admin Dashboard</div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Tables -->
                <li class="nav-item">
                    <a class="nav-link" href="tables.html">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Account Manager</span></a>
                </li>

                <!--Divider--> 
                <hr class="sidebar-divider">

                <!--Nav Item - Logout--> 
                <li class="nav-item">
                    <a class="nav-link" href="tables.html" data-toggle="modal" data-target="#logoutModal">
                        <i class="fas fa-fw fa-sign-out-alt "></i>
                        <span>Sign out</span></a>
                </li>


                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>


            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">
                    <div style="margin-top: 2%" class="container-fluid">

                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Account Information</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
                                                    <td value="${a.id}" name="accid" id="acc_id" >${a.id}</td>
                                                    <td value="${a.f_name}" id="acc_name">${a.f_name}</td>
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
                                                        <!--                                                        <button data-toggle="modal" data-target="#deleteAccModal" 
                                                                                                                        class="btn btn-danger" id="deleteAcc" >Delete</button>                                                       -->
                                                        <a onclick="deleteWarning(${a.id}, '${a.f_name}')"><button class="btn btn-danger">Delete</button></a>
                                                    </td>
                                                </tr>                                           
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="login">Logout</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Delete Account Modal (Not done yet)-->
        <div class="modal fade" id="deleteAccModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteModalLabel">Delete warning</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p id="modal_body"></p>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="account?action=delete&id=${a.id}">Delete</a>
                    </div>
                </div>
            </div>
        </div>

        <!--Delete Acc Modal JavaScript (Not done yet)-->
        <script type="text/javascript">
            $("#deleteAcc").click(function () {
                let id_acc = $("#acc_id").val();
                $("#modal_body").html("Are you sure to delete User id " + id_acc + "?");
            });
        </script>
        <script type="text/javascript">
            $("#deleteAcc").click(function () {
                let text = $("#acc_id").val();
                $("#modal_body").html(text);
            });
        </script>

        <!-- Bootstrap core JavaScript-->
        <script src="viewAdmin/vendor/jquery/jquery.min.js"></script>
        <script src="viewAdmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="viewAdmin/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="viewAdmin/js_admin/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="viewAdmin/vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="viewAdmin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="viewAdmin/js_admin/demo/datatables-demo.js"></script>
    </body>
</html>
