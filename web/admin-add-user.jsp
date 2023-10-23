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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/styles1.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/login_1.css"/>
        <style>
            input {
                width: 64%;
            }
        </style>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="component/admin_header.jsp" %>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav" >
                <nav class="sb-sidenav accordion sb-sidenav-dark" style="background-color: #383838 !important" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav" style="padding-top: 12px">
                            <a class="nav-link" href="admin-user">
                                <div class="sb-nav-link-icon"><i class="fa fa-user"></i></div>
                                Users
                            </a>
                        </div>
                    </div>
                </nav>
            </div>

            <form action="admin-add-user" method="post">
                <h2 style="font-weight: bold; padding-bottom: 10px;">Thêm tài khoản mới</h2>
                <input required name="name" type="text" placeholder="Full Name" value="${name}"/>
                <input required name="username" type="text" placeholder="Username" value="${username}"/>
                <div style="display: flex; width: 83%;align-items: center; justify-content: center">
                    <input required name="password" type="password" placeholder="Password" id="myInput1" value="${password}"/>
                    <i style="background-color: #eee; padding: 16px;" onclick="myFunction1()" id="eye1" class="fa fa-eye-slash" aria-hidden="true"></i>
                </div>
                <div style="display: flex; width: 83%;align-items: center; justify-content: center">
                    <input required name="repassword" type="password" placeholder="Password" id="myInput2"value="${repassword}" />
                    <i style="background-color: #eee; padding: 16px;" onclick="myFunction2()" id="eye2" class="fa fa-eye-slash" aria-hidden="true"></i>
                </div>
                <input required name="phone" type="text" placeholder="Phone Number" value="${phone}"/>
                <input required name="email" type="text" placeholder="Email" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" value="${email}"/>
                <div style="padding-top: 10px"> <span style="font-size: 16px; font-weight: bold"> Select Role: </span>
                    <select name="is_admin">
                        <option value="1">Customer</option>
                        <option value="2">Seller</option>
                        <option value="3">Admin</option>
                    </select>
                </div>
                <p style="color: red; margin: 0">${err}</p>
                <button style="background-color: #0abbcb; margin:24px 0 16px" onclick="this.form.submit()" >Add</button>
            </form>
            
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
