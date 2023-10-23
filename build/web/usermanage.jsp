<%-- 
    Document   : admin
    Created on : Jul 7, 2023, 4:50:10 PM
    Author     : maidu
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Mia Cosmetics</title>
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="css/styles1.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <style>
            .datatable-pagination a {
                text-decoration: none;
                color: black !important;
            }

            th:last-child .datatable-sorter::before  {
                display: none;
            }

            th:last-child .datatable-sorter::after {
                display: none;
            }
            th:first-child {
                width: 6%;
            }
            th:last-child {
                width:10%;
            }
            td:last-child {
                text-align: center;
            }
        </style>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark" style="background: #0abbcb">
    <!-- Navbar Brand-->
    <a class="navbar-brand ps-3" href="admin-user">ADMIN</a>
    <!-- Sidebar Toggle-->
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
    <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0" style="background-color: #FF939C;">
    </form>
    <!-- Navbar-->
    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown"  role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="home">Home</a></li>
                <li><a class="dropdown-item" href="profile">Profile</a></li>
                <li><a class="dropdown-item" href="changepassword">Change password</a></li>
                <li><a class="dropdown-item" href="logout">Logout</a></li>
            </ul>
        </li>
    </ul>
</nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav" >
                <nav class="sb-sidenav accordion sb-sidenav-dark" style="background-color: #383838 !important" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav" style="padding-top: 16px">
                            <a class="nav-link" href="admin-user">
                                <div class="sb-nav-link-icon"><i class="fa fa-user"></i></div>
                                Users
                            </a>
                        </div>
                    </div>
                </nav>
            </div>

            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 style="padding-bottom: 20px" class="mt-4">Users</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Lits of users
                            </div>
                            <div class="card-body">
                                <button type="button" class="btn" style="float:right; background-color: #eee; margin-left: 20px;" 
                                        data-mdb-ripple-color="dark" onclick="window.location.href='admin-add-user'">Add new</button>
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>UserID</th>
                                            <th>Name</th>
                                            <th>Username</th>
                                            <th>Email</th>
                                            <th>Phone</th>
                                            <th>Role</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${users}" var="u">
                                            <tr>
                                                <td>${u.id}</td>
                                                <td>${u.name}</td>
                                                <td>${u.username}</td>
                                                <td>${u.email}</td>
                                                <td>${u.phone}</td>
                                                <td>
                                                    <c:if test="${u.is_admin==3}">Admin</c:if>
                                                    <c:if test="${u.is_admin==2}">Seller</c:if>
                                                    <c:if test="${u.is_admin==1}">Customer</c:if>
                                                </td>
                                                <td>
                                                    <form action="admin-disable-user" method="post">
                                                        <input type="hidden" name="id" value="${u.id}" />
                                                        <c:if test="${u.is_admin>0}">
                                                            <input type="hidden" name="action" value="0" />
                                                            <button class="btn" onclick="this.form.submit()" style="background-color: #61E002;margin: 0 auto; color: white" >Enabled</button>
                                                        </c:if>
                                                        <c:if test="${u.is_admin<0}">
                                                            <input type="hidden" name="action" value="1" />
                                                            <button class="btn" onclick="this.form.submit()" style="background-color: #FF4C4C;margin: 0 auto; color: white" >Disabled</button>
                                                        </c:if>
                                                    </form>
                                                    </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
